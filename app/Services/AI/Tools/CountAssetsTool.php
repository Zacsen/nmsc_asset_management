<?php

namespace App\Services\AI\Tools;

use App\Models\Asset;

class CountAssetsTool implements AITool
{
    public function name(): string
    {
        return 'count_assets';
    }

    public function description(): string
    {
        return 'Returns the total number of assets.';
    }

    public function execute(array $arguments = []): mixed
    {
        return [
            'type' => 'count',
            'metric' => 'assets',
            'summary' => 'Total Assets',
            'data' => [
                'count' => Asset::count(),
            ],
        ];
    }
}