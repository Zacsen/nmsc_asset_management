<?php

namespace App\Services\AI\Tools;

use App\Models\Category;

class CountCategoriesTool implements AITool
{
    public function name(): string
    {
        return 'count_categories';
    }

    public function description(): string
    {
        return 'Returns the total number of asset categories.';
    }
    
    public function execute(array $arguments = []): mixed
    {
       return [
            'type' => 'count',
            'metric' => 'categories',
            'summary' => 'Total Categories',
            'data' => [
                'count' => Category::count(),
            ],
        ];
    }
}