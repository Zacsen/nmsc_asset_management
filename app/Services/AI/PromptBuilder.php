<?php

namespace App\Services\AI;

class PromptBuilder
{
    public function build(string $question, array $result): string
    {
        switch ($result['type']) {

            /*
            |--------------------------------------------------------------------------
            | Count Tools
            |--------------------------------------------------------------------------
            */
            case 'count':

                $metric = ucfirst(str_replace('_', ' ', $result['metric']));
                $count = $result['data']['count'];

                return "
You are an AI assistant for an Asset Management System.

Information:

The total number of {$metric} is {$count}.

User Question:

{$question}

Answer naturally and professionally.
";

            /*
            |--------------------------------------------------------------------------
            | Asset Search
            |--------------------------------------------------------------------------
            */
            case 'assets':

                if (empty($result['data']) || count($result['data']) === 0) {

                    return "
You are an AI assistant for an Asset Management System.

No matching assets were found.

Question:

{$question}

Answer politely.
";
                }

                $assetText = "";

                foreach ($result['data'] as $asset) {

                    $assetText .= "
Asset Name: {$asset->name}
Asset Tag: {$asset->asset_tag}
Category: ".($asset->category?->name ?? 'N/A')."
Manufacturer: ".($asset->manufacturer?->name ?? 'N/A')."
Location: ".($asset->location?->name ?? 'N/A')."
Assigned To: ".($asset->assignedTo?->name ?? 'Unassigned')."
Status: {$asset->status}

-----------------------------------------
";
                }

                return "
You are an AI assistant for an Asset Management System.

{$result['summary']}

Assets:

{$assetText}

User Question:

{$question}

Answer using ONLY the information above.
";

            /*
            |--------------------------------------------------------------------------
            | Statistics Tools
            |--------------------------------------------------------------------------
            */
            case 'statistics':

                switch ($result['metric']) {

                    case 'overview':

                        $stats = $result['data'];

                        return "
You are an AI assistant for an Asset Management System.

Overall Statistics

Total Assets: {$stats['total_assets']}
Total Categories: {$stats['total_categories']}
Total Manufacturers: {$stats['total_manufacturers']}
Total Locations: {$stats['total_locations']}

Asset Status

Deployed: {$stats['status']['deployed']}
In Storage: {$stats['status']['in_storage']}
Maintenance: {$stats['status']['maintenance']}
Broken: {$stats['status']['broken']}
Retired: {$stats['status']['retired']}

User Question:

{$question}

Answer naturally.
";

                    case 'manufacturer':

                        $text = "";

                        foreach ($result['data'] as $manufacturer) {

                            $text .= "{$manufacturer['manufacturer']}: {$manufacturer['asset_count']} assets\n";
                        }

                        return "
You are an AI assistant.

Manufacturers:

{$text}

Question:

{$question}

Answer naturally.
";

                    case 'location':

                        $text = "";

                        foreach ($result['data'] as $location) {

                            $text .= "{$location['location']}: {$location['asset_count']} assets\n";
                        }

                        return "
You are an AI assistant.

Locations:

{$text}

Question:

{$question}

Answer naturally.
";
                }

                break;
        }

        return "No information available.";
    }
}