<?php

namespace App\Services\AI\Tools;

use App\Models\Manufacturer;

class ManufacturerTool implements AITool
{
    public function name(): string
    {
        return 'manufacturer_statistics';
    }

    public function description(): string
    {
        return 'Returns all manufacturers and their asset counts.';
    }

    public function execute(array $arguments = []): mixed
    {
        $manufacturers = Manufacturer::withCount('assets')
            ->orderByDesc('assets_count')
            ->get()
            ->map(function ($manufacturer) {
                return [
                    'manufacturer' => $manufacturer->name,
                    'asset_count' => $manufacturer->assets_count,
                ];
            });

        return [
            'type' => 'statistics',
            'metric' => 'manufacturer',
            'summary' => 'Assets grouped by manufacturer',
            'data' => $manufacturers,
        ];
    }
}