    <script setup lang="ts">
    import { ref } from "vue";
    import AppLayout from "@/layouts/AppLayout.vue";
    import axios from 'axios';
    import { nextTick } from "vue";

    const messages = ref([
        {
            role: "assistant",
            content: "Hello! How can I help you with your assets today?"
        }
    ]);

    const userMessage = ref("");

    const loading = ref(false);

    const sendMessage = async () => {

        if (!userMessage.value.trim()) return;

        const question = userMessage.value;

        // Show user's message immediately
        messages.value.push({
            role: "user",
            content: question
        });

        userMessage.value = "";

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

            messages.value.push({
                role: "assistant",
                content: "Sorry, something went wrong."
            });
            await nextTick();
            console.error(error);

        }

        loading.value = false;
    };

    </script>

    <template>

    <AppLayout>

    <div class="flex flex-col h-[85vh]">

        <div class="border-b p-4">
            <h1 class="text-2xl font-bold">
                AI Assistant
            </h1>
        </div>

        <div class="flex-1 overflow-y-auto p-6">

            <div
                v-for="(message,index) in messages"
                :key="index"
                class="mb-4"
            >

                <div
                    :class="[
                        message.role === 'user'
                        ? 'text-right'
                        : 'text-left'
                    ]"
                >

                    {{ message.content }}

                </div>

            </div>

            <div
                v-if="loading"
                class="text-left italic text-gray-500"
            >
                🤖 Thinking...
            </div>

        </div>

        <div class="border-t p-4 flex gap-3">

            <input
                v-model="userMessage"
                @keyup.enter="sendMessage"
                :disabled="loading"
                class="border rounded-lg flex-1 px-4 py-3"
                placeholder="Ask something..."
            >

            <button  @click="sendMessage"
                    :disabled="loading"
                    class="bg-black text-white px-5 rounded-lg disabled:opacity-50"
                >
                    {{ loading ? "Thinking..." : "Send" }}

            </button>

        </div>

    </div>

    </AppLayout>

    </template>