<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Inertia\Inertia;
use Illuminate\Validation\Rules;


class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Rules\Password::defaults(function () {
            return Rules\Password::min(12)
                ->mixedCase()
                ->letters()
                ->numbers()
                ->symbols();
        });
            Inertia::share([
                'auth.user' => function () {
                    return [
                        'user' => auth()->check() ? [
                        'id' =>  auth()->user()->name,
                        'name' =>  auth()->user()->email,
                        'role' =>  auth()->user()->role->value,
                    ] : null,
                ];
            },
        ]);
    }
}       