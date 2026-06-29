<?php

namespace App\Services\AI\Tools;

use App\Models\Asset;
use App\Models\Category;
use App\Models\Manufacturer;
use App\Models\Location;

class StatisticsTool implements AITool
{
    public function name(): string
    {
        return 'statistics';
    }

    public function description(): string
    {
        return 'Returns overall statistics about the asset management system.';
    }

    public function execute(array $arguments = []): mixed
    {
        $statusCounts = Asset::selectRaw('status, COUNT(*) as total')
            ->groupBy('status')
            ->pluck('total', 'status');

        return [
            'type' => 'statistics',
            'metric' => 'overview',
            'summary' => 'Overall asset management system statistics.',
            'data' => [
                'total_assets' => Asset::count(),

                'total_categories' => Category::count(),

                'total_manufacturers' => Manufacturer::count(),

                'total_locations' => Location::count(),

                'status' => [
                    'deployed' => $statusCounts['Deployed'] ?? 0,
                    'in_storage' => $statusCounts['In Storage'] ?? 0,
                    'maintenance' => $statusCounts['Maintenance'] ?? 0,
                    'broken' => $statusCounts['Broken'] ?? 0,
                    'retired' => $statusCounts['Retired'] ?? 0,
                ],
            ],
        ];
    }
}