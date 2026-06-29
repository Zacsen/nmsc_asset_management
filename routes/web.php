<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use Laravel\Fortify\Features;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\LocationController;
use App\Http\Controllers\ManufacturerController;
use App\Http\Controllers\NavigationController;
use App\Http\Controllers\AssetController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\AIChatController;

/*
|--------------------------------------------------------------------------
| Public Routes
|--------------------------------------------------------------------------
*/

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canRegister' => Features::enabled(Features::registration()),
    ]);
})->name('home');

Route::get('/welcome', function () {
    return Inertia::render('Welcome');
});

Route::get('/main', function () {
    return 'Hello World';
});

/*
|--------------------------------------------------------------------------
| AI Routes
|--------------------------------------------------------------------------
*/

Route::middleware([
    'auth',
    'verified',
    'role:admin,inventory_user,inventory_manager'
])->group(function () {

    Route::get('/ai-assistant', [AIChatController::class, 'index'])
        ->name('ai-assistant.index');

    Route::post('/ai-assistant/chat', [AIChatController::class, 'chat'])
        ->name('ai-assistant.chat');

});

/*
|--------------------------------------------------------------------------
| Dashboard Routes
|--------------------------------------------------------------------------
*/

// Route::get('/dashboard', function () {
//     return Inertia::render('Dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::get('dashboard/stats', [DashboardController::class, 'stats'])->name('dashboard.stats');
});

/*
|--------------------------------------------------------------------------
| Admin Routes
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'verified', 'role:admin'])->group(function () {
    // Categories
    Route::post('categories/list', [CategoryController::class, 'list'])->name('categories.list');
    Route::resource('categories', CategoryController::class)->except(['create', 'edit']);

    // Navigation
    Route::post('navigation/list', [NavigationController::class, 'list'])->name('navigation.list');
    Route::resource('navigation', NavigationController::class)->except(['create', 'edit']);
});

/*
|--------------------------------------------------------------------------
| Admin + Inventory Manager Routes
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'verified', 'role:admin, inventory_manager'])->group(function () {
    // Manufacturers
    Route::post('manufacturers/list', [ManufacturerController::class, 'list'])->name('manufacturers.list');
    Route::resource('manufacturers', ManufacturerController::class)->except(['create', 'edit']);

    // Locations
    Route::post('locations/list', [LocationController::class, 'list'])->name('locations.list');
    Route::resource('locations', LocationController::class)->except(['create', 'edit']);
});

/*
|--------------------------------------------------------------------------
| Admin + Inventory User Routes
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'verified', 'role:admin,inventory_user'])->group(function () {
    // Assets
    Route::post('assets/list', [AssetController::class, 'list'])->name('assets.list');
    Route::resource('assets', AssetController::class)->except(['create', 'edit']);
});

/*
|--------------------------------------------------------------------------
| Shared Authenticated Routes
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'verified'])->group(function () {
    // Navigation list (any authenticated user)
    Route::post('navigation/list', [NavigationController::class, 'list'])->name('navigation.list');
});


// Route::resource('categories', CategoryController::class)->except(['create', 'edit']);
// Route::resource('navigation',NavigationController::class)->except(['create', 'edit']);
// Route::resource('assets', AssetController::class)->except(['create', 'edit']);
// Route::resource('locations',LocationController::class)->except(['create', 'edit']);
// Route::resource('manufacturers',ManufacturerController::class)->except(['create', 'edit']);

// Route::post('/login', [LoginController::class, 'login'])
//    ->withoutMiddleware([\Illuminate\Foundation\Http\Middleware\VerifyCsrfToken::class]);

require __DIR__.'/settings.php';

