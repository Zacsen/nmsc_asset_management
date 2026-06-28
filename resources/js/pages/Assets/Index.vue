<script setup lang="ts">
import ReusableDropDownAction from '@/components/entitycomponents/ReusableDropDownAction.vue'; // Dropdown for row actions (edit/delete)
import ReusableTable from '@/components/entitycomponents/ReusableTable.vue'; // Table component for displaying data
// import ReusableAlertDialog from '@/components/entitycomponents/ReusableAlertDialog.vue';
import { AutoForm } from '@/components/ui/auto-form'; // AutoForm component for form handling
import { Button } from '@/components/ui/button'; // Button component
import { Checkbox } from '@/components/ui/checkbox'; // Checkbox component for row selection
import { Dialog, DialogContent, DialogDescription, DialogFooter, DialogHeader, DialogTitle } from '@/components/ui/dialog'; // Dialog components for forms
import AppLayout from '@/layouts/AppLayout.vue'; // Layout component for the page
import { Head } from '@inertiajs/vue3'; // Head component for setting the page title
import { parseDate } from '@internationalized/date';

/* Import Utilities */
import { toTypedSchema } from '@vee-validate/zod'; // Utility for converting Zod schemas to Vee-Validate schemas
import axios from 'axios'; // HTTP client for API requests
import { ArrowUpDown, Plus } from 'lucide-vue-next'; // Icons for UI
import { useForm } from 'vee-validate'; // Form validation library
import { h, ref } from 'vue'; // Vue composition API utilities
import { toast } from 'vue-sonner'; // Toast notifications
import * as z from 'zod'; // Zod library for schema validation
import ReusableAlertDialog from '@/components/entitycomponents/ReusableAlertDialog.vue';

/* Import Table Utilities */
import type { ColumnDef } from '@tanstack/vue-table'; // Type definitions for table columns

/* Import Types */
import { BreadcrumbItem } from '@/types'; // Type definition for breadcrumbs
import { ca } from 'zod/v4/locales';
import { components } from 'reka-ui/constant';
import manufacturers from '@/routes/manufacturers';

/* Base Entity Configuration */
const baseentityurl = '/assets'; // API endpoint for the entity
const baseentityname = 'Assets'; // Name of the entity

/* Breadcrumbs */
const breadcrumbs: BreadcrumbItem[] = [
    {
        title: baseentityname,
        href: baseentityurl,
    },
];

/* Define Props */
export interface Assets {
    id: number;
    category: any;
    category_id: string;
    location: any;
    location_id: string;
    manufacturer: any;
    manufacturer_id: string;
    assigned_to: any;
    assigned_to_user_id: string;
    asset_tag: string;
    name: string;
    serial_number: string;
    model_name: string;
    purchase_date: string;
    purchase_price: any;
    status: string;
    notes: string;
}

/* Define Table Columns */
const columns: ColumnDef<Assets>[] = [
    {
        id: 'select', // Column for row selection
        header: ({ table }) =>
            h(Checkbox, {
                modelValue: table.getIsAllPageRowsSelected() || (table.getIsSomePageRowsSelected() && 'indeterminate'),
                'onUpdate:modelValue': (value) => table.toggleAllPageRowsSelected(!!value),
                ariaLabel: 'Select all',
            }),
        cell: ({ row }) =>
            h(Checkbox, {
                modelValue: row.getIsSelected(),
                'onUpdate:modelValue': (value) => row.toggleSelected(!!value),
                ariaLabel: 'Select row',
            }),
        enableSorting: false, // Disable sorting for this column
        enableHiding: false, // Disable hiding for this column
    },
    {
        accessorKey: 'name', // Column name
        header: ({ column }) => {
            return h(
                Button,
                {
                    variant: 'ghost',
                    onClick: () => column.toggleSorting(column.getIsSorted() === 'asc'),
                },
                () => ['Name', h(ArrowUpDown, { class: 'ml-2 h-4 w-4' })],
            );
        },
        cell: ({ row }) => h('div', { class: 'break-words whitespace-normal' }, row.getValue('name')),
    },
    {
        accessorKey: 'asset_tag', // Column description
        header: 'Asset_Tag',
        cell: ({ row }) => h('div', { class: 'break-words whitespace-normal' }, row.getValue('asset_tag')),
    },

    {
        accessorKey: 'serial_number', // Column description
        header: 'Serial_Number',
        cell: ({ row }) => h('div', { class: 'break-words whitespace-normal' }, row.getValue('serial_number')),
    },

    {
        accessorKey: 'model_name', // Column description
        header: 'Model_Name',
        cell: ({ row }) => h('div', { class: 'break-words whitespace-normal' }, row.getValue('model_name')),
    },

    {
        accessorKey: 'purchase_price', // Column description
        header: 'Purchase_Price',
        cell: ({ row }) => h('div', { class: 'break-words whitespace-normal' }, row.getValue('purchase_price')),
    },

    {
        accessorKey: 'purchase_date',
        header: 'Purchase Date',
        cell: ({ row }) => {
            const raw = row.getValue('purchase_date');
            const date = new Date(raw);

            const formatted =
                date.toLocaleDateString('en-CA') + // 2023-02-27
                ' ' +
                date.toLocaleTimeString('en-US', {
                    hour: 'numeric',
                    minute: '2-digit',
                    hour12: true,
                });

            return h('div', { class: 'break-words whitespace-normal' }, formatted);
        },
    },

    {
        accessorKey: 'status',
        header: 'Status',
        cell: ({ row }) => {
            const status = row.original.status;

            // Background + text color pairs
            const statusColors = {
                [statusEnum.Deployed]:  'bg-green-100 text-green-800',
                [statusEnum.InStorage]: 'bg-blue-100 text-blue-800',
                [statusEnum.Maintenance]: 'bg-yellow-100 text-yellow-800',
                [statusEnum.Retired]: 'bg-gray-100 text-gray-800',
                [statusEnum.Broken]: 'bg-red-100 text-red-800',
            };

            const colorClass = statusColors[status] || 'bg-gray-100 text-gray-800';

            return h(
                'div',
                {
                    class: `
                        inline-block px-2 py-1 rounded-full text-sm font-medium
                        whitespace-nowrap overflow-hidden text-ellipsis ${colorClass}
                    `
                },
                status
            );
        },
    },

    {
        accessorKey: 'notes', // Column description
        header: 'Notes',
        cell: ({ row }) => h('div', { class: 'break-words whitespace-normal' }, row.getValue('notes')),
    },


    { 
        id: 'actions', // Column for row actions (edit/delete)
        enableHiding: false, // Disable hiding for this column
        cell: ({ row }) => {
            const rowitem = row.original;

            return h(
                'div',
                { class: 'relative' },
                h(ReusableDropDownAction, {
                    rowitem,
                    onEdit: handleEdit, // Edit handler
                    onDelete: openDeleteDialog, // Delete handler
                }),
            );
        },
    },
];

const showDialogForm = ref(false); // State for showing/hiding the form dialog
const mode = ref('create'); // Mode for the form (create/edit)
const itemID = ref<number | null>(null); // ID of the item being edited

const handleOpenDialogForm = () => {
    showDialogForm.value = true; // Show the form dialog
    mode.value = 'create'; // Set mode to create
};

const props = defineProps({ 
    // items: {
    //     type: Object,
    //     required: true,
    // },

    categories: {
        type: Object,
        required: true,
    },

    locations: {
        type: Object,
        required: true,
    },

    manufacturers: {
        type: Object,
        required: true,
    },

    users: {
        type: Object,
        required: true,
    },

});

const statusEnum = {
  Deployed: "Deployed",
  InStorage: "In Storage",
  Maintenance: "Maintenance",
  Retired: "Retired",
  Broken: "Broken",
};

/* Form Schema and Configuration */
const schema = z.object({
    name: z
        .string({
            required_error: 'Name is required',
            invalid_type_error: 'Name must be a string',
        })
        .min(3, 'Name must be at least 3 characters long')
        .max(255, 'Name must be at most 255 characters long'),

    serial_number: z
        .string({
            required_error: 'Serial number is required',
            invalid_type_error: 'Serial Number must be a string',
        })
        .max(255, 'Serial Number must be at most 255 characters long'),

    model_name: z
        .string({
            required_error: 'Model Name is required',
            invalid_type_error: 'Model Name must be a string',
        })
        .max(255, 'Model Name must be at most 255 characters long')
        .optional(),

    category_id: z.enum(
        props.categories.map((item: any) => item.name),
        {
            required_error: 'Category is required',
            invalid_type_error: 'Invalid category selected',
        }
    ),

    location_id: z.enum(
        props.locations.map((item: any) => item.name),
        {
            required_error: 'Location is required',
            invalid_type_error: 'Invalid location selected',
        }
    ),

    manufacturer_id: z.enum(
        props.manufacturers.map((item: any) => item.name),
        {
            required_error: 'Manufacturer is required',
            invalid_type_error: 'Invalid manufacturer selected',
        }
    ),

    assigned_to_user_id: z.enum(
        props.users.map((item: any) => item.name),
        {
            required_error: 'Assigned User is required',
            invalid_type_error: 'Invalid user selected',
        }
    ),

    asset_tag: z
        .string({
            required_error: 'Asset Tag is required',
            invalid_type_error: 'Asset Tag must be a string',
        })
        .max(255, 'Asset Tag must be at most 255 characters long')
        .optional(),

    purchase_date: z.coerce.date().optional(),
    purchase_price: z.coerce.number({
        invalid_type_error: 'Purchase Price must be a number',
    }).nonnegative('Purchase Price must be a non-negative number').optional(),

    status: z.enum(Object.values(statusEnum) as [string, ...string[]], {
        required_error: 'Status is required',
        invalid_type_error: 'Invalid status selected',
    }),

    notes: z
        .string({
            invalid_type_error: 'Notes must be a string',
        })
        .max(1000, 'Notes must be at most 1000 characters long')
        .nullable()
        .optional(),
});

const fieldconfig: any = {
    name: {
        label: 'Name',
        inputProps: {
            type: 'text',
            placeholder: 'Enter Asset name',

        },
        description: 'Name of the Asset',
    },
    serial_number: {
        label: 'Serial Number',
        inputProps: {
            type: 'text',
            placeholder: 'Enter Asset Serial Number',
        },
        description: 'Asset Serial Number',
    },

    model_name: {
        label: 'Model Name',
        inputProps: {
            type: 'text',
            placeholder: 'Enter Model Name',
        },
        description: 'Asset Model Name',
    },

    category_id: {
        label: 'Select Category',
        component: 'select',
        inputProps: {
            placeholder: 'Choose a Category',
        },
        description: 'Assign Category',
    },

    location_id: {
        label: 'Select Location',
        component: 'select',
        inputProps: {
            placeholder: 'Choose a Location',
        },
        description: 'Assign Location',
    },

    manufacturer_id: {
        label: 'Select Manufacturer',
        component: 'select',
        inputProps: {
            placeholder: 'Choose a Manufacturer',
        },
        description: 'Assign Manufacturer',
    },

    assigned_to_user_id: {
        label: 'Select Assigned User',
        component: 'select',
        inputProps: {
            placeholder: 'Choose a User',
        },
        description: 'Assign User',
    },

    asset_tag: {
        label: 'Asset Tag',
        inputProps: {
            type: 'text',
            placeholder: 'Enter Asset Tag',
        },
        description: 'Asset Tag',
    },

    purchase_date: {
        label: 'Purchase Date',
        inputProps: {
            type: 'date',
            placeholder: 'Enter Purchase Date',
        },
        description: 'Date When the Asset was Purchased',
    },

    purchase_price: {
        label: 'Purchase Price',
        inputProps: {
            type: 'text',
            inputMode: 'decimal',
            placeholder: 'Enter Purchase Price',
            onInput: (e) => {
                e.target.value = e.target.value
                    .replace(/[^0-9.]/g, '')      // remove all non-numeric
                    .replace(/(\..*)\./g, '$1'); // prevent multiple decimals
            },
        },
        description: 'Asset Purchase Price',
    },

    status: {
        label: 'Status',
        component: 'select',
        inputProps: {
            placeholder: 'Select Status',
        },
        description: 'Asset Status',
    },
    
    notes: {
        label: 'Notes',
        component: 'textarea',
        inputProps: {
            placeholder: 'Enter Additional Notes',
        },
        description: 'Asset Notes',
    },

};

const form = useForm({
    validationSchema: toTypedSchema(schema), // Validation schema
    initialValues: {
        category_id: null,
        location_id: null,
        manufacturer_id: null,
        assigned_to_user_id: null,
        asset_tag: '', 
        name: '',
        serial_number: '',
        model_name: '',
        purchase_date: null,
        purchase_price: 0,
        status: '',
        notes: '',
    },
});

/* Form Handlers */
const resetForm = () => {
    form.resetForm(); // Reset the form
    itemID.value = null; // Clear the item ID
};

const tableRef = ref<InstanceType<typeof ReusableTable> | null>(null); // Reference to the table component

const onSubmit = async (values: any) => {
    try {
        // const result = schema.safeParse(values);
        // console.log(result);
        // if (!result.success) {
        //     form.setErrors(result.error.flatten().fieldErrors); // Set validation errors
        //     toast.error('Validation failed. Please check your input.');
        //     return;
        // }

        const mappedValues = {
            ...values,
            category_id: props.categories.find((category: any) => category.name === values.category_id)?.id || null,
            location_id: props.locations.find((location: any) => location.name === values.location_id)?.id || null,
            manufacturer_id: props.manufacturers.find((manufacturer: any) => manufacturer.name === values.manufacturer_id)?.id || null,
            assigned_to_user_id: props.users.find((user: any) => user.name === values.assigned_to_user_id)?.id || null,

        };

        if (mode.value === 'create') {
            await axios.post(`${baseentityurl}`, mappedValues); // Create a new category
            toast.success(`${baseentityname} created successfully.`);
        } else if (mode.value === 'edit') {
            await axios.put(`${baseentityurl}/${itemID.value}`, mappedValues); // Update an existing category
            toast.success(`${baseentityname} updated successfully.`);
        }

        resetForm(); // Reset the form
        await tableRef.value?.fetchRows(); // Refresh the table data
        showDialogForm.value = false; // Hide the form dialog
    } catch (error: any) {
        if (error.response && error.response.status === 422) {
            form.setErrors(error.response.data.errors); // Set validation errors
            toast.error('Validation failed. Please check your input.');
        } else {
            toast.error('An unexpected error occurred.');
        }
    }
};

    const handleEdit = async (id: number) => {
        try {
            mode.value = 'edit'; // Set mode to edit
            itemID.value = id; // Set the item ID
            const response = await axios.get(`${baseentityurl}/${id}`); // Fetch the item data
            const data = response.data;
            const mappedData = {
                ...data,
                category_id: data.category?.name,
                location_id: data.location?.name,
                manufacturer_id: data.manufacturer?.name,
                assigned_to_user_id: data.assigned_to?.name,
                purchase_date: data.purchase_date ? parseDate(data.purchase_date.slice(0, 10)) : null, 

            }
            form.setValues(mappedData); // Populate the form with the item data
            showDialogForm.value = true; // Show the form dialog
        } catch (error) {
            console.log(`Error fetching ${baseentityname} data:`, error);
            
            toast.error(`Failed to fetch ${baseentityname} data.`);
        }
    };
    

    

/* Delete Dialog State */
const showDeleteDialog = ref(false); // State for showing/hiding the delete confirmation dialog
const itemIDToDelete = ref<number | null>(null); // ID of the item to be deleted

const openDeleteDialog = (id: number) => {
    itemIDToDelete.value = id; // Set the item ID to delete
    showDeleteDialog.value = true; // Show the delete confirmation dialog
};

const handleDelete = async () => {
    try {
        if (!itemIDToDelete.value) return;

        await axios.delete(`${baseentityurl}/${itemIDToDelete.value}`); // Delete the item
        toast.success(`${baseentityname} deleted successfully.`);
        await tableRef.value?.fetchRows(); // Refresh the table data
        showDeleteDialog.value = false; // Hide the delete confirmation dialog
    } catch (error) {
        console.log(`Error deleting ${baseentityname}:`, error);
        toast.error(`Failed to delete ${baseentityname}. Please try again.`);
    }
};

</script>

<template>
    <Head :title="baseentityname" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex h-full flex-1 flex-col gap-2 rounded-xl p-4">

            <!-- Create Button -->
            <div class="flex items-center gap-2 py-2">
                <div class="ml-auto flex items-center gap-2">
                    <Button 
                        class="bg-green-100 text-green-800 hover:bg-green-200 rounded-md px-4 py-2" 
                        @click="handleOpenDialogForm"
                    >
                        <Plus class="h-4" /> Create {{ baseentityname }}
                    </Button>
                </div>
            </div>

            <!-- Table -->
            <ReusableTable 
                ref="tableRef"
                :columns="columns"
                :baseentityname="baseentityname"
                :baseentityurl="baseentityurl"
            />


            <Dialog v-model:open="showDialogForm">
                <DialogContent class="w-full sm:max-w-[700px] max-h-[90vh] overflow-y-auto p-6">
                    <DialogHeader>
                    <DialogTitle>
                        {{ mode === 'create' ? 'Create' : 'Update' }} {{ baseentityname }}
                    </DialogTitle>
                    </DialogHeader>
                    <DialogDescription>
                    Use this form to edit the {{ baseentityname }} details.
                    </DialogDescription>

                    <AutoForm
                    class="grid grid-cols-1 sm:grid-cols-2 gap-6 mt-4"
                    :form="form"
                    :schema="schema"
                    :field-config="fieldconfig"
                    @submit="onSubmit"
                    >
                    <DialogFooter class="col-span-2 flex justify-end mt-4">
                        <Button
                        type="submit"
                        class="bg-green-100 text-green-800 hover:bg-green-200 rounded-md px-4 py-2"
                        >
                        {{ mode === 'create' ? 'Create' : 'Update' }}
                        </Button>
                    </DialogFooter>
                    </AutoForm>
                </DialogContent>
                </Dialog>


            

      
            <!-- <Dialog v-model:open="showDialogForm">
                <DialogContent class="sm:max-w-[600px] p-0">

        
                    <div class="max-h-[80vh] overflow-y-auto p-6">

                        <DialogHeader>
                            <DialogTitle>
                                {{ mode === 'create' ? 'Create' : 'Update' }} {{ baseentityname }}
                            </DialogTitle>
                            <DialogDescription>
                                Use this form to edit the {{ baseentityname }} details.
                            </DialogDescription>
                        </DialogHeader>

                        <AutoForm
                            class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-4"
                            :form="form"
                            :schema="schema"
                            :field-config="fieldconfig"
                            @submit="onSubmit"
                        />

                    </div>

                
                    <DialogFooter class="p-4 border-t flex justify-end">
                        <Button
                            type="submit"
                            form="auto-form"
                            class="bg-green-100 text-green-800 hover:bg-green-200 rounded-md px-4 py-2"
                        >
                            {{ mode === 'create' ? 'Create' : 'Update' }}
                        </Button>
                    </DialogFooter>

                </DialogContent>
            </Dialog> -->
            
            <ReusableAlertDialog
                :open="showDeleteDialog"
                :title="`Delete ${baseentityname}`"
                :description="`Are you sure you want to delete this ${baseentityname}? This action cannot be undone.`"
                @confirm="handleDelete"
                @cancel="showDeleteDialog = false"
            />
        </div>
    </AppLayout>
</template>
