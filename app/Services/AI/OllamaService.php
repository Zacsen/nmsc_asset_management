<?php

namespace App\Services\AI;

use Illuminate\Support\Facades\Http;

class OllamaService
{
    protected string $url = 'http://localhost:11434/api/generate';

    public function chat(string $prompt): string
    {
        $response = Http::timeout(120)
            ->post($this->url, [
                'model' => 'llama3.1:8b',
                'prompt' => $prompt,
                'stream' => false
            ]);

        return $response->json()['response'] ?? 'No response.';
    }

    public function __construct()
    {
        //
    }
}
