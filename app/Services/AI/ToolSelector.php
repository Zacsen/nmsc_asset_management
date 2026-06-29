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
            $toolList .= "- {$tool->name()}: {$tool->description()}\n";
        }

        $prompt = <<<PROMPT
You are a tool selection AI for an Asset Management System.

Your ONLY job is to choose the SINGLE best tool.

DO NOT answer the user's question.

Return ONLY valid JSON.

Available tools:

{$toolList}

Tool Selection Rules:

- greeting
  Use when the user is greeting the assistant.
  Examples:
  - Hello
  - Hi
  - Hey
  - Good morning
  - Good afternoon
  - Good evening
  - How are you?
  - Who are you?

- count_assets
  Use when the user asks for the total number of assets.

- count_categories
  Use when the user asks for the total number of categories.

- search_assets
  Use when the user wants assets matching filters such as:
  - category
  - manufacturer
  - location
  - status
  - asset tag
  - asset name

- manufacturer_statistics
  Use when the user asks:
  - Which manufacturer has the most assets?
  - Which manufacturer has the least assets?
  - Manufacturer statistics

- search_locations
  Use when the user asks:
  - Which location has the most assets?
  - Which location has the least assets?
  - Location statistics

- statistics
  Use when the user asks for an overall summary or dashboard statistics.

Return ONLY JSON.

Example 1

{
    "tool": "greeting",
    "arguments": {}
}

Example 2

{
    "tool": "count_assets",
    "arguments": {}
}

Example 3

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