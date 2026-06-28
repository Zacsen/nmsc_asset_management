<script setup lang="ts">
import AppLogoIcon from '@/components/AppLogoIcon.vue';
</script>

<template>
    <div
        class="flex aspect-square size-8 items-center justify-center rounded-md bg-sidebar-primary text-sidebar-primary-foreground"
    >
        <!-- <AppLogoIcon class="size-5 fill-current text-white dark:text-black" />
          -->
          <img src="https://www.nmsc.edu.ph/application/files/cache/thumbnails/8567dc07e29a13a13cb4011f00e15d32.png" alt="App Logo" class="size-7 fill-current text-white dark:text-black w-7" />
    </div>
    <div class="ml-1 grid flex-1 text-left text-sm">
        <span class="mb-0.5 truncate leading-tight font-semibold"
            >NMSCST Assets</span
        >
    </div>
</template>