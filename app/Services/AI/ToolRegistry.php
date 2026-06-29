<?php

namespace App\Services\AI;

use App\Services\AI\Tools\CountAssetsTool;
use App\Services\AI\Tools\CountCategoriesTool;
use App\Services\AI\Tools\ManufacturerTool;
use App\Services\AI\Tools\SearchAssetsTool;
use App\Services\AI\Tools\SearchLocationTool;
use App\Services\AI\Tools\StatisticsTool;
use App\Services\AI\Tools\AITool;

class ToolRegistry
{
    protected array $tools;

    public function __construct(
        CountAssetsTool $countAssets,
        CountCategoriesTool $countCategories,
        ManufacturerTool $manufacturer,
        SearchAssetsTool $searchAssets,
        SearchLocationTool $searchLocation,
        StatisticsTool $statistics
    ) {
        $this->tools = [
            $countAssets->name() => $countAssets,
            $countCategories->name() => $countCategories,
            $manufacturer->name() => $manufacturer,
            $searchAssets->name() => $searchAssets,
            $searchLocation->name() => $searchLocation,
            $statistics->name() => $statistics,
        ];
    }

    public function get(string $name): ?AITool
    {
        return $this->tools[$name] ?? null;
    }

    public function all(): array
    {
        return $this->tools;
    }
}