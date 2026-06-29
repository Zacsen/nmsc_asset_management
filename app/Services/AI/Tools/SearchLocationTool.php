<?php

namespace App\Services\AI\Tools;

use App\Models\Location;

class SearchLocationTool implements AITool
{
    public function name(): string
    {
        return 'search_locations';
    }

    public function description(): string
    {
        return 'Returns locations together with their asset counts.';
    }

    public function execute(array $arguments = []): mixed
    {
        $locations = Location::withCount('assets')
            ->orderByDesc('assets_count')
            ->get()
            ->map(function ($location) {
                return [
                    'location'    => $location->name,
                    'asset_count' => $location->assets_count,
                ];
            });

        return [
            'type' => 'statistics',
            'metric' => 'location',
            'summary' => "Found {$locations->count()} location(s).",
            'data' => $locations,
        ];
    }
}