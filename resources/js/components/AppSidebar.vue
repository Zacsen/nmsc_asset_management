<script setup lang="ts">
import NavFooter from '@/components/NavFooter.vue';
import NavMain from '@/components/NavMain.vue';
import NavUser from '@/components/NavUser.vue';
import {
    Sidebar,
    SidebarContent,
    SidebarFooter,
    SidebarHeader,
    SidebarMenu,
    SidebarMenuButton,
    SidebarMenuItem,
} from '@/components/ui/sidebar';
import { dashboard } from '@/routes';
import { type NavItem } from '@/types';
import { Link, usePage } from '@inertiajs/vue3';
import { BookOpen, ChartColumnStacked, Compass, Folder, LaptopMinimalCheck, LayoutGrid, MapPin, Wrench } from 'lucide-vue-next';
import AppLogo from './AppLogo.vue';
import { computed } from 'vue';

const mainNavItems: NavItem[] = [
    {
        title: 'Dashboard',
        href: '/dashboard',
        icon: LayoutGrid,
        roles: ['admin', 'inventory_user', 'inventory_manager'],

    },

    {
        title: 'Assets',
        href: '/assets',
        icon: LaptopMinimalCheck,
        roles: ['admin', 'inventory_user'],
    },

    {
        title: 'Categories',
        href: '/categories',
        icon: ChartColumnStacked,
        roles: ['admin'],
    },

    {
        title: 'Locations',
        href: '/locations',
        icon: MapPin,
        roles: ['admin', 'inventory_manager'],
    },

    {
        title: 'Manufacturers',
        href: '/manufacturers',
        icon: Wrench,
        roles: ['admin', 'inventory_manager'],
    },

    {
        title: 'Navigation',
        href: '/navigation',
        icon: Compass,
        roles: ['admin', 'inventory_user', 'inventory_manager'],
    },

];

const page = usePage();
const userRole = computed(() => page.props.auth?.user?.role || null);

const filteredMainNavItems = computed(() => {
    return mainNavItems.filter((item) => {
        if (!item.roles) return true; // No role restriction
        return item.roles.includes(userRole.value);
    });
}); 

const footerNavItems: NavItem[] = [
    {
        title: 'Github Repo',
        href: 'https://github.com/laravel/vue-starter-kit',
        icon: Folder,
    },
    {
        title: 'Documentation',
        href: 'https://laravel.com/docs/starter-kits#vue',
        icon: BookOpen,
    },
];
</script>

<template>
    <Sidebar collapsible="icon" variant="inset">
        <SidebarHeader>
            <SidebarMenu>
                <SidebarMenuItem>
                    <SidebarMenuButton size="lg" as-child>
                        <Link :href="dashboard()">
                            <AppLogo />
                        </Link>
                    </SidebarMenuButton>
                </SidebarMenuItem>
            </SidebarMenu>
        </SidebarHeader>

        <SidebarContent>
            <NavMain :items="filteredMainNavItems" />
        </SidebarContent>

        <SidebarFooter>
            <NavFooter :items="footerNavItems" />
            <NavUser />
        </SidebarFooter>
    </Sidebar>
    <slot />
</template>
