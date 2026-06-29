<?php

namespace App\Services\AI\Tools;

class GreetingTool implements AITool
{
    public function name(): string
    {
        return 'greeting';
    }

    public function description(): string
    {
        return 'Responds to greetings and introductions.';
    }

    public function execute(array $arguments = []): mixed
    {
        return [
            'type' => 'greeting',
            'metric' => 'general',
            'summary' => 'Greeting detected.',
            'data' => [
                'message' => 'Hello! I am your Asset Management AI assistant. How can I help you today?',
            ],
        ];
    }
}