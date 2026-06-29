<script setup lang="ts">
import { ref, nextTick } from "vue";
import axios from "axios";

import AppLayout from "@/layouts/AppLayout.vue";

import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Avatar, AvatarFallback } from "@/components/ui/avatar";
import { ScrollArea } from "@/components/ui/scroll-area";
import { Separator } from "@/components/ui/separator";

interface ChatMessage {
    role: "assistant" | "user";
    content: string;
}

const messages = ref<ChatMessage[]>([
    {
        role: "assistant",
        content: "Hello! 👋 How can I help you with your assets today?"
    }
]);

const userMessage = ref("");

const loading = ref(false);

const chatContainer = ref<any>(null);

const scrollToBottom = async () => {
    await nextTick();

    const viewport =
        chatContainer.value?.$el?.querySelector(
            "[data-radix-scroll-area-viewport]"
        );

    if (viewport) {
        viewport.scrollTop = viewport.scrollHeight;
    }
};

const sendMessage = async () => {

    if (!userMessage.value.trim()) return;

    const question = userMessage.value;

    messages.value.push({
        role: "user",
        content: question
    });

    userMessage.value = "";

    await scrollToBottom();

    loading.value = true;

    try {

        const response = await axios.post("/ai-assistant/chat", {
            message: question
        });

        messages.value.push({
            role: "assistant",
            content: response.data.reply
        });

    } catch (error) {

        console.error(error);

        messages.value.push({
            role: "assistant",
            content: "Sorry, something went wrong."
        });

    } finally {

        loading.value = false;

        await scrollToBottom();

    }

};
</script>

<template>

<AppLayout>

<div class="flex justify-center">

<Card class="w-full h-[85vh] flex flex-col">

    <!-- Header -->

    <CardHeader>

        <CardTitle class="flex items-center gap-2">

            🤖 AI Assistant

        </CardTitle>

        <p class="text-sm text-muted-foreground">

            Ask anything about your asset inventory.

        </p>

    </CardHeader>

    <Separator />

    <!-- Chat -->

    <CardContent class="flex-1 overflow-hidden p-0">

        <ScrollArea
            ref="chatContainer"
            class="h-full px-6 py-5"
        >

            <div
                v-for="(message,index) in messages"
                :key="index"
                class="flex mb-5"
                :class="message.role === 'user'
                    ? 'justify-end'
                    : 'justify-start'"
            >

                <div
                    class="flex gap-3 items-start max-w-[80%]"
                    :class="message.role === 'user'
                        ? 'flex-row-reverse'
                        : ''"
                >

                    <!-- Avatar -->

                    <Avatar>

                        <AvatarFallback>

                            {{ message.role === 'assistant' ? '🤖' : 'You' }}

                        </AvatarFallback>

                    </Avatar>

                    <!-- Bubble -->

                    <div

                        class="rounded-2xl px-4 py-3 whitespace-pre-wrap break-words shadow-sm"

                        :class="message.role === 'user'

                            ? 'bg-primary text-primary-foreground rounded-br-md'

                            : 'bg-muted border border-border rounded-bl-md'"

                    >

                        <div
                            class="text-xs font-semibold opacity-70 mb-2"
                        >

                            {{ message.role === 'assistant'
                                ? 'AI Assistant'
                                : 'You'
                            }}

                        </div>

                        {{ message.content }}

                    </div>

                </div>

            </div>

            <!-- Thinking -->

            <div
                v-if="loading"
                class="flex justify-start"
            >

                <div class="flex gap-3">

                    <Avatar>

                        <AvatarFallback>

                            🤖

                        </AvatarFallback>

                    </Avatar>

                    <div
                        class="bg-muted border border-border rounded-2xl rounded-bl-md px-4 py-3 italic animate-pulse"
                    >

                        Thinking...

                    </div>

                </div>

            </div>

        </ScrollArea>

    </CardContent>

    <Separator />

    <!-- Input -->

    <div class="p-4">

        <div class="flex gap-3">

            <Input

                v-model="userMessage"

                @keyup.enter="sendMessage"

                :disabled="loading"

                placeholder="Ask about assets, categories, locations..."

            />

            <Button

                @click="sendMessage"

                :disabled="loading"

            >

                {{ loading ? "Thinking..." : "Send" }}

            </Button>

        </div>

        <p class="mt-3 text-xs text-muted-foreground">

            Try asking:
            <strong>"How many assets are there?"</strong>,
            <strong>"Show all Desktop PCs"</strong>,
            <strong>"Which manufacturer has the most assets?"</strong>

        </p>

    </div>

</Card>

</div>

</AppLayout>

</template>