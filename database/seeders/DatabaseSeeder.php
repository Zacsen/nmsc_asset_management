<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Asset;
use App\Models\Manufacturer;
use App\Models\Category;
use App\Models\Location;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\UserRoleEnum;
use Database\Seeders\UserSeeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        User::factory(10)->create();

        Manufacturer::factory(10)->create();

        Category::factory(10)->create();    

        Location::factory(10)->create();

        Asset::factory(100)->create();


        // User::create([
        //     'name' => 'Admin User',
        //     'email' => 'admin@example.com',
        //     'password' => Hash::make('password'),
        //     'role' => UserRoleEnum::SUPER_ADMIN,
        // ]);

        // User::create([
        //     'name' => 'Manager User',
        //     'email' => 'manager@example.com',
        //     'password' => Hash::make('password'),
        //     'role' => UserRoleEnum::INVENTORY_MANAGER,
        // ]);

        // User::create([
        //     'name' => 'Basic User',
        //     'email' => 'user@example.com',
        //     'password' => Hash::make('password'),
        //     'role' => UserRoleEnum::INVENTORY_USER,

        // ]);
    }
}
