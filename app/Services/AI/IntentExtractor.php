<?php

namespace App\Services\AI;

class IntentExtractor
{
     public function __construct(
        protected OllamaService $ollama
    ) {}

    public function extract(string $message): array
    {
        $prompt = <<<PROMPT
            You are an AI that extracts search filters.

            Return ONLY valid JSON.

            Possible intents:
            - greeting
            - search_assets
            - count_assets
            - asset_details

            JSON format:

            {
            "intent":"",
            "category":"",
            "manufacturer":"",
            "location":"",
            "assigned_to":"",
            "status":"",
            "asset_tag":""
            }

            User:

            $message
            PROMPT;

        $response = trim($this->ollama->chat($prompt));

        $data = json_decode($response, true);

        if (json_last_error() !== JSON_ERROR_NONE) {
            return [
                'intent' => 'search_assets'
            ];
        }

        return $data;
    }
}
