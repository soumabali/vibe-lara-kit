<?php

declare(strict_types=1);

namespace App\Providers;

use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        //
    }

    public function boot(): void
    {
        Model::preventLazyLoading(! app()->isProduction());
        Model::shouldBeStrict(! app()->isProduction());

        RateLimiter::for('api', function (Request $request): Limit {
            return Limit::perMinute(120)->by((string) ($request->user()?->id ?: $request->ip()));
        });

        RateLimiter::for('login', function (Request $request): Limit {
            $email = (string) $request->input('email');

            return Limit::perMinute(5)->by($email.'|'.$request->ip());
        });

        Gate::before(fn ($user): ?bool => $user->hasRole('super-admin') ? true : null);
    }
}
