<?php

use Database\Seeders\DatabaseSeeder;

it('registers a user', function () {
    $response = $this->postJson('/api/v1/auth/register', [
        'name' => 'Test User',
        'email' => 'test@example.com',
        'password' => 'password123',
    ]);

    $response->assertStatus(201)
        ->assertJsonPath('data.user.email', 'test@example.com')
        ->assertJsonStructure(['data' => ['user', 'token']]);
});

it('returns current user on auth me endpoint', function () {
    $this->seed(DatabaseSeeder::class);

    $login = $this->postJson('/api/v1/auth/login', [
        'email' => 'admin@example.com',
        'password' => 'password123',
    ])->assertOk();

    $token = $login->json('data.token');

    $this->withHeader('Authorization', 'Bearer '.$token)
        ->getJson('/api/v1/auth/me')
        ->assertOk()
        ->assertJsonPath('data.email', 'admin@example.com');
});
