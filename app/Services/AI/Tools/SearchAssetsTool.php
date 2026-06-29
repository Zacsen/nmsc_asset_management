<?php

namespace App\Services\AI\Tools;

use App\Models\Asset;

class SearchAssetsTool implements AITool
{
    public function name(): string
    {
        return 'search_assets';
    }

    public function description(): string
    {
        return 'Search assets by asset name, asset tag, category, manufacturer, location, assigned user, or status.';
    }

    public function execute(array $arguments = []): mixed
    {
        $query = Asset::query()
            ->with([
                'category',
                'manufacturer',
                'location',
                'assignedTo'
            ]);

        // Asset Name
        if (!empty($arguments['name'])) {
            $query->where('name', 'like', "%{$arguments['name']}%");
        }

        // Asset Tag
        if (!empty($arguments['asset_tag'])) {
            $query->where('asset_tag', $arguments['asset_tag']);
        }

        // Category
        if (!empty($arguments['category'])) {
            $query->whereHas('category', function ($q) use ($arguments) {
                $q->where('name', 'like', "%{$arguments['category']}%");
            });
        }

        // Manufacturer
        if (!empty($arguments['manufacturer'])) {
            $query->whereHas('manufacturer', function ($q) use ($arguments) {
                $q->where('name', 'like', "%{$arguments['manufacturer']}%");
            });
        }

        // Location
        if (!empty($arguments['location'])) {
            $query->whereHas('location', function ($q) use ($arguments) {
                $q->where('name', 'like', "%{$arguments['location']}%");
            });
        }

        // Assigned User
        if (!empty($arguments['assigned_to'])) {
            $query->whereHas('assignedTo', function ($q) use ($arguments) {
                $q->where('name', 'like', "%{$arguments['assigned_to']}%");
            });
        }

        // Status
        if (!empty($arguments['status'])) {
            $query->where('status', $arguments['status']);
        }

        $assets = $query->limit(50)->get();

        return [
            'type' => 'assets',
            'metric' => 'search',
            'summary' => "Found {$assets->count()} matching asset(s).",
            'data' => $assets,
        ];
    }
}