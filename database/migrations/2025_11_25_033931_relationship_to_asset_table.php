<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('asset', function (Blueprint $table) {
            $table->foreignId('category_id')
                    ->nullable()    
                    ->constrained('categories', 'id')
                    ->onDelete('set null')
                    ->after('asset_id');
        });

        Schema::table('asset', function (Blueprint $table) {
            $table->foreignId('location_id')
                    ->nullable()
                    ->constrained('location', 'id')
                    ->onDelete('set null')
                    ->after('category_id');
        });

        Schema::table('asset', function (Blueprint $table) {
            $table->foreignId('manufacturer_id')
                    ->nullable()
                    ->constrained('manufacturer', 'id')
                    ->onDelete('set null')
                    ->after('location_id');
        });

        Schema::table('asset', function (Blueprint $table) {
            $table->foreignId('assigned_to_user_id')
                    ->nullable()    
                    ->constrained('users')
                    ->onDelete('set null')
                    ->after('manufacturer_id');
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('asset', function (Blueprint $table) {
            $table->dropForeign(['category_id']);
            $table->dropForeign(['location_id']);
            $table->dropForeign(['manufacturer_id']);
            $table->dropForeign(['assigned_to_user_id']);

            $table->dropColumn(['category_id', 'location_id', 'manufacturer_id', 'assigned_to_user_id']);
        });
    }
};
