<?php

use Database\Seeders\DatabaseSeeder;

it('uses sanctum guard on protected routes', function () {
    $this->getJson('/api/v1/auth/me')->assertUnauthorized();
});

it('seeds admin role and permission baseline', function () {
    $this->seed(DatabaseSeeder::class);

    $admin = \App\Models\User::where('email', 'admin@example.com')->firstOrFail();

    expect($admin->hasRole('super-admin'))->toBeTrue();
    expect($admin->can('access admin panel'))->toBeTrue();
});
