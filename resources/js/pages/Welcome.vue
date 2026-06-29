<script setup lang="ts">
import { dashboard, login, register } from "@/routes";
import { Head, Link } from "@inertiajs/vue3";

withDefaults(
    defineProps<{
        canRegister: boolean;
    }>(),
    {
        canRegister: true,
    }
);
</script>

<template>
    <Head title="Asset Management System" />

    <div class="min-h-screen bg-slate-50 dark:bg-slate-950">
        <!-- Navbar -->
        <header class="border-b border-slate-200 bg-white dark:border-slate-800 dark:bg-slate-950">
            <div class="mx-auto flex max-w-7xl items-center justify-between px-8 py-5">
                <div>
                    <h1 class="text-xl font-bold text-blue-600">
                        NMSCST Asset Management System
                    </h1>
                    <p class="text-sm text-slate-500 dark:text-slate-400">
                        Manage assets with ease.
                    </p>
                </div>

                <nav class="flex items-center gap-3">
                    <template v-if="$page.props.auth.user">
                        <Link
                            :href="dashboard()"
                            class="rounded-lg bg-blue-600 px-5 py-2 text-white transition hover:bg-blue-700"
                        >
                            Dashboard
                        </Link>
                    </template>

                    <template v-else>
                        <Link
                            :href="login()"
                            class="rounded-lg px-5 py-2 text-slate-700 transition hover:bg-slate-100 dark:text-slate-300 dark:hover:bg-slate-800"
                        >
                            Login
                        </Link>

                        <Link
                            v-if="canRegister"
                            :href="register()"
                            class="rounded-lg bg-blue-600 px-5 py-2 text-white transition hover:bg-blue-700"
                        >
                            Register
                        </Link>
                    </template>
                </nav>
            </div>
        </header>

        <!-- Hero -->
        <main class="mx-auto flex max-w-7xl items-center px-8 py-20">

            <div class="grid w-full items-center gap-16 lg:grid-cols-2">

                <!-- Left -->
                <div>

                    <span
                        class="rounded-full bg-blue-100 px-4 py-2 text-sm font-medium text-blue-700 dark:bg-blue-900/40 dark:text-blue-300"
                    >
                        Welcome
                    </span>

                    <h1
                        class="mt-6 text-5xl font-bold leading-tight text-slate-900 dark:text-white"
                    >
                        NMSCST Asset
                        <span class="text-blue-600">
                            Management
                        </span>
                    </h1>

                    <p
                        class="mt-6 max-w-xl text-lg leading-8 text-slate-600 dark:text-slate-400"
                    >
                        A centralized platform for managing organizational assets,
                        tracking inventory, monitoring maintenance, generating
                        reports, and utilizing an integrated AI Assistant to
                        quickly retrieve information.
                    </p>

                    <div class="mt-10 flex gap-4">
                        <template v-if="$page.props.auth.user">
                            <Link
                                :href="dashboard()"
                                class="rounded-lg bg-blue-600 px-7 py-3 text-white transition hover:bg-blue-700"
                            >
                                Go to Dashboard
                            </Link>
                        </template>

                    </div>

                </div>

                <!-- Right -->
                <div>

                    <div
                        class="rounded-3xl border border-slate-200 bg-white p-8 shadow-lg dark:border-slate-800 dark:bg-slate-900"
                    >

                        <h2 class="mb-6 text-xl font-semibold text-slate-900 dark:text-white">
                            System Modules
                        </h2>

                        <div class="space-y-4">

                            <div class="flex items-center gap-4 rounded-xl bg-slate-50 p-4 dark:bg-slate-800">
                                <div class="text-3xl">📦</div>
                                <div>
                                    <h3 class="font-semibold text-slate-900 dark:text-white">
                                        Asset Management
                                    </h3>
                                    <p class="text-sm text-slate-500">
                                        Store and manage all assets.
                                    </p>
                                </div>
                            </div>

                            <div class="flex items-center gap-4 rounded-xl bg-slate-50 p-4 dark:bg-slate-800">
                                <div class="text-3xl">🏢</div>
                                <div>
                                    <h3 class="font-semibold text-slate-900 dark:text-white">
                                        Locations
                                    </h3>
                                    <p class="text-sm text-slate-500">
                                        Organize assets by office or building.
                                    </p>
                                </div>
                            </div>

                            <div class="flex items-center gap-4 rounded-xl bg-slate-50 p-4 dark:bg-slate-800">
                                <div class="text-3xl">📊</div>
                                <div>
                                    <h3 class="font-semibold text-slate-900 dark:text-white">
                                        Reports
                                    </h3>
                                    <p class="text-sm text-slate-500">
                                        Generate inventory and asset reports.
                                    </p>
                                </div>
                            </div>

                            <div class="flex items-center gap-4 rounded-xl bg-slate-50 p-4 dark:bg-slate-800">
                                <div class="text-3xl">🤖</div>
                                <div>
                                    <h3 class="font-semibold text-slate-900 dark:text-white">
                                        AI Assistant
                                    </h3>
                                    <p class="text-sm text-slate-500">
                                        Ask questions using natural language.
                                    </p>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </main>

        <!-- Footer -->
        <footer
            class="border-t border-slate-200 py-6 text-center text-sm text-slate-500 dark:border-slate-800 dark:text-slate-400"
        >
            © {{ new Date().getFullYear() }} Asset Management System.
            Built with Laravel, Vue, Inertia & Tailwind CSS.
        </footer>

    </div>
</template>