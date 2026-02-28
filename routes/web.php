<?php

declare(strict_types=1);

use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Route;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/health', function (): JsonResponse {
    return response()->json([
        'status' => 'ok',
        'app' => config('app.name'),
        'time' => now()->toIso8601String(),
    ]);
});

Route::get('/docs/{version}', function (string $version) {
    abort_unless(in_array($version, ['v1'], true), 404);

    return view('swagger', [
        'version' => $version,
        'specUrl' => url("/docs/{$version}/openapi.yaml"),
    ]);
});

Route::get('/docs/{version}/openapi.yaml', function (string $version): BinaryFileResponse {
    abort_unless(in_array($version, ['v1'], true), 404);

    return response()->file(base_path('docs/api/openapi.yaml'), [
        'Content-Type' => 'application/yaml',
    ]);
});

Route::get('/docs/{version}/dbml', function (string $version): BinaryFileResponse {
    abort_unless(in_array($version, ['v1'], true), 404);

    return response()->file(base_path('docs/db/schema.dbml'), [
        'Content-Type' => 'text/plain',
    ]);
});

Route::get('/docs/{version}/business-flow', function (string $version): BinaryFileResponse {
    abort_unless(in_array($version, ['v1'], true), 404);

    return response()->file(base_path('docs/BUSINESS_FLOW.md'), [
        'Content-Type' => 'text/markdown',
    ]);
});
