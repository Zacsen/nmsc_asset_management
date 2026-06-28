<script setup lang="ts">

import BarChart from '@/components/chartcomponents/BarChart.vue';
import PieChart from '@/components/chartcomponents/PieChart.vue';
import DoughnutChart from '@/components/chartcomponents/DoughnutChart.vue';


import { dashboard } from '@/routes';
import AppLayout from '@/layouts/AppLayout.vue';
import { type BreadcrumbItem } from '@/types';
import { Head } from '@inertiajs/vue3';
import axios from 'axios';
import { onMounted, ref } from 'vue';
import { LaptopMinimalCheck,Bot, Package, PackageCheck, TableProperties, Factory, MapPinHouse } from 'lucide-vue-next';


const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Dashboard',
        href: dashboard().url,
    },
];


interface Totals {
    total_assets: number;
    total_categories: number;
    total_manufacturers: number;
    total_locations: number;
    total_users: number;
}

const totals = ref<Totals>({
    total_assets: 0,
    total_categories: 0,
    total_manufacturers: 0,
    total_locations: 0,
    total_users: 0,
});
const charts = ref({} as any);
const loading = ref(true);


const fetchStats = async () => {
    try {
        const response = await axios.get('/dashboard/stats');
        totals.value = response.data.totals;
        charts.value = response.data.charts;
    } catch (error) {
        console.error('Error fetching dashboard stats:', error);
    }
};

const generateRandomColor = () => {
    const randomColor = `#${Math.floor(Math.random() * 16777215).toString(16)}`;
    return randomColor.padEnd(7, '0'); // Ensure the color is always 6 characters long
};


let chartData: any;
let chartOptions: any;

let piechartData: any;
let piechartOptions: any;

let doughnutData: any;
let doughnutOptions: any;

let chart2Data: any;
let chart2Options: any;

const statusChartColors: Record<string, string> = {
    Deployed: '#bbf7d0',      // Tailwind bg-green-100
    InStorage: '#dbeafe',     // Tailwind bg-blue-100
    Maintenance: '#fef9c3',   // Tailwind bg-yellow-100
    Retired: '#f3f4f6',       // Tailwind bg-gray-100
    Broken: '#fee2e2',        // Tailwind bg-red-100
};

const rendercharts = () => {

    // Assets by Status Chart ---------------------
    const labels = charts.value.assets_by_status?.map((item: any) => item.status) || [];
    const data = charts.value.assets_by_status?.map((item: any) => item.total) || [];

    const backgroundColors = labels.map((status: string) => statusChartColors[status] || '#f3f4f6');

    chartData = {
        labels,
        datasets: [
            {
                label: 'Assets by Status',
                backgroundColor: backgroundColors,
                data,
                borderRadius: 12,
                borderWidth: 0,
            },
        ],
    };

    chartOptions = {
        responsive: true,
        maintainAspectRatio: false,
        animation: {
            duration: 900,
            easing: 'easeOutQuart',
        },
        plugins: {
            legend: {
                display: true,
                position: 'top',
                labels: {
                    usePointStyle: true,
                    pointStyle: "circle",
                    font: {
                        size: 14,
                        family: 'Inter, sans-serif',
                    },
                },
            },
            title: {
                display: true,
                text: 'Total Assets by Status',
                font: {
                    size: 18,
                    weight: '600',
                    family: 'Inter, sans-serif'
                },
                padding: { bottom: 20 },
            },
            datalabels: {
                display: true,
                color: '#374151',
                font: {
                    size: 13,
                    weight: '600',
                    family: 'Inter, sans-serif',
                },
                formatter: (value: any) => `${value}`,
            },
        },
    };


    // Pie Chart by Category ---------------------
    piechartData = {
        labels: charts.value.assets_by_category?.map((item: any) => item.category?.name || "NO CATEGORY") || [],
        datasets: [
            {
                label: 'Assets by Category',
                backgroundColor: charts.value.assets_by_category?.map(() => generateRandomColor()) || [],
                data: charts.value.assets_by_category?.map((item: any) => item.total) || [],
                borderWidth: 0,
            },
        ],
    };

    piechartOptions = {
        responsive: true,
        maintainAspectRatio: false,
        animation: {
            duration: 900,
            easing: 'easeOutQuart',
        },
        plugins: {
            legend: {
                display: true,
                position: 'left',
                labels: {
                    usePointStyle: true,
                    pointStyle: "circle",
                    font: { family: 'Inter, sans-serif' },
                },
            },
            title: {
                display: true,
                text: 'Total Assets by Category',
                font: {
                    size: 18,
                    weight: '600',
                    family: 'Inter, sans-serif',
                },
            },
            datalabels: {
                display: true,
                color: '#374151',
                font: { size: 12, family: 'Inter, sans-serif' },
            },
        },
    };


    // Doughnut Chart by Location ---------------------
    doughnutData = {
        labels: charts.value.assets_by_location?.map((item: any) => item.location?.name || "NO LOCATION") || [],
        datasets: [
            {
                label: 'Assets by Location',
                backgroundColor: charts.value.assets_by_location?.map(() => generateRandomColor()) || [],
                data: charts.value.assets_by_location?.map((item: any) => item.total) || [],
                borderWidth: 0,
            },
        ],
    };

    doughnutOptions = {
        responsive: true,
        maintainAspectRatio: false,
        animation: {
            duration: 900,
            easing: 'easeOutQuart',
        },
        plugins: {
            legend: {
                display: true,
                position: 'left',
                labels: {
                    usePointStyle: true,
                    pointStyle: "circle",
                    font: { family: 'Inter, sans-serif' },
                },
            },
            title: {
                display: true,
                text: 'Total Assets by Location',
                font: {
                    size: 18,
                    weight: '600',
                    family: 'Inter, sans-serif',
                },
            },
            datalabels: {
                display: true,
                color: '#374151',
                font: { size: 12, family: 'Inter, sans-serif' },
            },
        },
    };


    // Bar Chart by User ---------------------
    chart2Data = {
        labels: charts.value.assets_by_assigned_user?.map((item: any) => item.assigned_to?.name || "NOT ASSIGNED") || [],
        datasets: [
            {
                label: 'Assets by User',
                backgroundColor: charts.value.assets_by_assigned_user?.map(() => generateRandomColor()) || [],
                data: charts.value.assets_by_assigned_user?.map((item: any) => item.total) || [],
                borderRadius: 12,
                borderWidth: 0,
            },
        ],
    };

    chart2Options = {
        responsive: true,
        animation: {
            duration: 900,
            easing: 'easeOutQuart',
        },
        plugins: {
            legend: {
                display: true,
                position: 'top',
                labels: {
                    usePointStyle: true,
                    pointStyle: "circle",
                    font: { family: 'Inter, sans-serif' },
                },
            },
            title: {
                display: true,
                text: 'Total Assets by User',
                font: {
                    size: 18,
                    weight: '600',
                    family: 'Inter, sans-serif',
                },
                padding: { bottom: 20 },
            },
            datalabels: {
                display: true,
                color: '#374151',
                font: {
                    size: 13,
                    weight: '600',
                    family: 'Inter, sans-serif'
                },
                formatter: (value: any) => `${value}`,
            },
        },
    };
};



onMounted(async () => {
    loading.value = true; // Set loading state to true
    await fetchStats(); // Fetch stats from the server
    rendercharts();
    loading.value = false; // Set loading state to false
});
</script>

<template>
    <Head title="Dashboard" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div
            class="flex h-full flex-1 flex-col gap-4 overflow-x-auto rounded-xl p-4"
        >
        <div class="grid grid-cols-1 gap-4 sm:grid-cols-2 md:gap-6 xl:grid-cols-4">


                <!-- Metric Item Start -->
                <div class="rounded-2xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-white/[0.03]">
                     <div class="flex items-center">
                        <!-- Icon -->
                        <PackageCheck class="h-6 w-6 text-gray-500 dark:text-gray-400" />
                        <!-- Text -->
                        <p class="ml-2 text-theme-sm text-gray-500 dark:text-gray-400">Total Assets</p>
                    </div>
                    <div class="mt-3 flex items-end justify-between">
                        <div>
                            
                            <h4 class="text-2xl font-bold text-gray-800 dark:text-white/90">{{ totals.total_assets }}</h4>
                        </div>
                    </div>
                </div>
                <!-- Metric Item End -->

                <!-- Metric Item Start -->
                <div class="rounded-2xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-white/[0.03]">
                    <div class="flex items-center">
                        <!-- Icon -->
                        <TableProperties class="h-6 w-6 text-gray-500 dark:text-gray-400" />
                        <!-- Text -->
                        <p class="ml-2 text-theme-sm text-gray-500 dark:text-gray-400">Total Categories</p>
                    </div>

                    <div class="mt-3 flex items-end justify-between">
                        <div>
                            <h4 class="text-2xl font-bold text-gray-800 dark:text-white/90">{{ totals.total_categories }}</h4>
                        </div>
                    </div>
                </div>
                <!-- Metric Item End -->

                <!-- Metric Item Start -->
                <div class="rounded-2xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-white/[0.03]">
                    <div class="flex items-center">
                        <!-- Icon -->
                        <Factory class="h-6 w-6 text-gray-500 dark:text-gray-400" />
                        <!-- Text -->
                        <p class="ml-2 text-theme-sm text-gray-500 dark:text-gray-400">Total Manufacturers</p>
                    </div>

                    <div class="mt-3 flex items-end justify-between">
                        <div>
                            <h4 class="text-2xl font-bold text-gray-800 dark:text-white/90">{{ totals.total_manufacturers }}</h4>
                        </div>
                    </div>
                </div>
                <!-- Metric Item End -->

                <!-- Metric Item Start -->
                <div class="rounded-2xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-white/[0.03]">
                    <div class="flex items-center">
                        <!-- Icon -->
                        <MapPinHouse class="h-6 w-6 text-gray-500 dark:text-gray-400" />
                        <!-- Text -->
                        <p class="ml-2 text-theme-sm text-gray-500 dark:text-gray-400">Total Locations</p>
                    </div>

                    <div class="mt-3 flex items-end justify-between">
                        <div>
                            <h4 class="text-2xl font-bold text-gray-800 dark:text-white/90">{{ totals.total_locations }}</h4>
                        </div>
                    </div>
                </div>
                <!-- Metric Item End -->
            </div>
            <div class="grid grid-cols-1 gap-4 md:grid-cols-2">
                <div class="rounded-2xl border border-gray-200 bg-white p-5 md:p-6 dark:border-gray-800 dark:bg-white/[0.03]">
                    <div v-if="loading" class="flex h-full items-center justify-center">
                        <div class="spinner-border inline-block h-8 w-8 animate-spin rounded-full border-4" role="status"></div>
                    </div>
                    <div v-else>
                        <BarChart :chart-data="chartData" :chart-options="chartOptions" />
                    </div>
                </div>
                <div class="rounded-2xl border border-gray-200 bg-white p-5 md:p-6 dark:border-gray-800 dark:bg-white/[0.03]">
                    <div v-if="loading" class="flex h-full items-center justify-center">
                        <div class="spinner-border inline-block h-8 w-8 animate-spin rounded-full border-4" role="status"></div>
                    </div>
                    <div v-else>
                        <PieChart :chart-data="piechartData" :chart-options="piechartOptions" />
                    </div>
                </div>
                <div class="rounded-2xl border border-gray-200 bg-white p-5 md:p-6 dark:border-gray-800 dark:bg-white/[0.03]">
                    <div v-if="loading" class="flex h-full items-center justify-center">
                        <div class="spinner-border inline-block h-8 w-8 animate-spin rounded-full border-4" role="status"></div>
                    </div>
                    <div v-else>
                        <DoughnutChart :chart-data="doughnutData" :chart-options="doughnutOptions" />
                    </div>
                </div>
                <div class="rounded-2xl border border-gray-200 bg-white p-5 md:p-6 dark:border-gray-800 dark:bg-white/[0.03]">
                    <div v-if="loading" class="flex h-full items-center justify-center">
                        <div class="spinner-border inline-block h-8 w-8 animate-spin rounded-full border-4" role="status"></div>
                    </div>
                    <div v-else>
                        <BarChart :chart-data="chart2Data" :chart-options="chart2Options" />
                    </div>
                </div>
            </div>
        </div>
    </AppLayout>
</template>