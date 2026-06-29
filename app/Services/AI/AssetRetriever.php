<?php

namespace App\Services\AI;
use App\Models\Asset;


class AssetRetriever
{
    public function search(array $filters)
    {
        $query = Asset::with([
            'category',
            'manufacturer',
            'location',
            'assignedTo'
        ]);

        if (!empty($filters['asset_tag'])) {

            $query->where('asset_tag', $filters['asset_tag']);

        }

        if (!empty($filters['status'])) {

            $query->where('status', $filters['status']);

        }

        if (!empty($filters['category'])) {

            $query->whereHas('category', function ($q) use ($filters) {

                $q->where('name', 'like', "%{$filters['category']}%");

            });

        }

        if (!empty($filters['manufacturer'])) {

            $query->whereHas('manufacturer', function ($q) use ($filters) {

                $q->where('name', 'like', "%{$filters['manufacturer']}%");

            });

        }

        if (!empty($filters['location'])) {

            $query->whereHas('location', function ($q) use ($filters) {

                $q->where('name', 'like', "%{$filters['location']}%");

            });

        }

        if (!empty($filters['assigned_to'])) {

            $query->whereHas('assignedTo', function ($q) use ($filters) {

                $q->where('name', 'like', "%{$filters['assigned_to']}%");

            });

        }

        return $query->limit(20)->get();
    }

    public function __construct()
    {
        //
    }
}
