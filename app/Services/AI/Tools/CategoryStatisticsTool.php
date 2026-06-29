<?php

namespace App\Services\AI\Tools;

use App\Models\Category;

class CategoryStatisticsTool
{
     public function name(): string
    {
        return 'category_statistics';
    }

    public function description(): string
    {
        return 'Returns all categories and their asset counts.';
    }

    public function execute(array $arguments = []): mixed
    {
        $categories = Category::withCount('assets')
            ->orderByDesc('assets_count')
            ->get()
            ->map(function ($category) {
                return [
                    'category' => $category->name,
                    'asset_count' => $category->assets_count,
                ];
            });

        return [
            'type' => 'statistics',
            'metric' => 'category',
            'summary' => 'Assets grouped by category',
            'data' => $categories,
        ];
    }
}