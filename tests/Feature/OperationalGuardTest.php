<?php

it('exposes health endpoint', function () {
    $this->getJson('/health')
        ->assertOk()
        ->assertJsonStructure(['status', 'app', 'time'])
        ->assertJsonPath('status', 'ok');
});

it('adds request id header on responses', function () {
    $this->getJson('/health')
        ->assertOk()
        ->assertHeader('X-Request-Id');
});
