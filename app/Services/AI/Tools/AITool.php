<?php

namespace App\Services\AI\Tools;

interface AITool
{
    /**
     * Name used by the AI when requesting this tool.
     */
    public function name(): string;

    /**
     * Description shown to the AI.
     */
    public function description(): string;

    /**
     * Execute the tool.
     */
    public function execute(array $arguments = []): mixed;
}
