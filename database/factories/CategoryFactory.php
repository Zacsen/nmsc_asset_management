<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Model>
 */
class CategoryFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {

        $deviceCategories = ['Laptop', 
        'Desktop PC', 
        'Monitor', 
        'Printer', 
        'Networking Switch', 
        'Router',
        'Server', 
        'Mobile Phone', 
        'Tablet', 
        'Projector', 
        'Servers',
        'IP Camera',
        'Firewall',
        'UPS (Uninterruptible Power Supply)',
        'Storage Device',
        'Software License',
        'Peripheral Device'
    ];
        return [
            'name' => $this->faker->unique()->randomElement($deviceCategories),
            'description' => $this->faker->sentence(),  
        ];
    }
}
