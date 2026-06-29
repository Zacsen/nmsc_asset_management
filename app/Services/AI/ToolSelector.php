<?php

namespace App\Services\AI;

class ToolSelector
{
    public function __construct(
        protected OllamaService $ollama,
        protected ToolRegistry $toolRegistry
    ) {
    }

    public function select(string $message): array
    {
        $toolList = "";

        foreach ($this->toolRegistry->all() as $tool) {
            $toolList .=
                "- {$tool->name()}: {$tool->description()}\n";
        }

        $prompt = <<<PROMPT
You are an AI assistant for an Asset Management System.

Your job is NOT to answer the user's question.

Your ONLY job is to choose the correct tool.

Available tools:

{$toolList}

Return ONLY valid JSON.

Example:

{
    "tool": "search_assets",
    "arguments": {
        "category": "Desktop PC"
    }
}

User Request:

{$message}
PROMPT;

        $response = $this->ollama->chat($prompt);

        $selection = json_decode($response, true);

        if (!is_array($selection)) {

            return [
                'tool' => null,
                'arguments' => [],
            ];

        }

        return $selection;
    }
}