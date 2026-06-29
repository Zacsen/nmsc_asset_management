<?php

namespace App\Services\AI;
use Illuminate\Support\Facades\Log;

class ChatService
{
    // protected IntentExtractor $intentExtractor;
    // protected AssetRetriever $assetRetriever;

    protected ToolSelector $toolSelector;
    protected ToolRegistry $toolRegistry;

    protected PromptBuilder $promptBuilder;
    protected OllamaService $ollama;

    public function __construct(
        ToolSelector $toolSelector,
        ToolRegistry $toolRegistry,
        PromptBuilder $promptBuilder,
        OllamaService $ollama
    ) {
        $this->toolSelector = $toolSelector;
        $this->toolRegistry = $toolRegistry;
        $this->promptBuilder = $promptBuilder;
        $this->ollama = $ollama;
    }

    public function ask(string $message): string
{
    $selection = $this->toolSelector->select($message);

    $toolName = $selection['tool'] ?? null;

    if (!$toolName) {
        return "I couldn't determine how to handle your request.";
    }

    $tool = $this->toolRegistry->get($toolName);

    if (!$tool) {
        return "The requested operation is not supported.";
    }

    try {
        $result = $tool->execute(
            $selection['arguments'] ?? []
        );

        Log::info('Tool execution completed', [
            'tool' => $tool->name(),
            'result' => $result,
        ]);

    } catch (\Throwable $e) {
        logger()->error('Tool execution failed', [
            'tool' => $toolName,
            'error' => $e->getMessage(),
        ]);

        return "An error occurred while processing your request.";
    }

    $prompt = $this->promptBuilder->build(
        $message,
        $result
    );

    return $this->ollama->chat($prompt);
}
}