<script setup lang="ts">
    import AppLayout from '@/layouts/AppLayout.vue';
    import {defineProps} from 'vue';
    defineProps({
        message: String,
        testing: String,
    })
</script>
<template>
    <AppLayout>
        <h1 >{{message}}</h1>
        <h2 >{{testing}}</h2>
    </AppLayout>
</template>
    