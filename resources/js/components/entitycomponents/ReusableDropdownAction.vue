<script setup lang="ts">
import { Button } from '@/components/ui/button';
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuLabel, DropdownMenuTrigger } from '@/components/ui/dropdown-menu';
import { MoreHorizontal } from 'lucide-vue-next';

const props = defineProps({
    rowitem: Object,
    onEdit: Function,
    onDelete: Function,
});

// function copy(id: string) {
//   navigator.clipboard.writeText(id)
// }
const editItem = (id: number) => {
    console.log(id);
    if (props.onEdit) {
        props.onEdit(id);
    } else {
        console.warn('onEdit function is not provided');
    }
};
const deleteItem = (id: number) => {
    if (props.onDelete) {
        props.onDelete(id);
    } else {
        console.warn('onDelete function is not provided');
    }
};
</script>

<template>
    <DropdownMenu>
        <DropdownMenuTrigger as-child>
            <Button variant="ghost" class="h-8 w-8 p-0">
                <span class="sr-only">Open menu</span>
                <MoreHorizontal class="h-4 w-4" />
            </Button>
        </DropdownMenuTrigger>

        <DropdownMenuContent align="end" class="space-y-2">
            <DropdownMenuLabel>Actions</DropdownMenuLabel>

            <!-- Edit Button -->
            <DropdownMenuItem as-child>
                <button
                    class="w-full text-left px-3 py-2 
                           bg-yellow-200 text-yellow-900
                           border-2 border-yellow-600 
                           rounded-full
                           hover:bg-yellow-300 hover:border-yellow-700 
                           hover:text-yellow-950
                           transition-all"
                    @click="editItem(rowitem?.id)"
                >
                    Edit
                </button>
            </DropdownMenuItem>

            <!-- Delete Button -->
            <DropdownMenuItem as-child>
                <button
                    class="w-full text-left px-3 py-2 
                           bg-red-200 text-red-900
                           border-2 border-red-600 
                           rounded-full
                           hover:bg-red-300 hover:border-red-700 
                           hover:text-red-950
                           transition-all"
                    @click="deleteItem(rowitem?.id)"
                >
                    Delete
                </button>
            </DropdownMenuItem>

        </DropdownMenuContent>
    </DropdownMenu>
</template>
