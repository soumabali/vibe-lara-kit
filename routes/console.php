<?php

declare(strict_types=1);

use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;
use Symfony\Component\Process\Process;

Artisan::command('inspire', function (): void {
    $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote');

Artisan::command('starter:docs-guard', function (): int {
    $process = Process::fromShellCommandline('./scripts/docs-guard.sh', base_path());
    $process->setTimeout(300);
    $process->run(function ($type, $output): void {
        echo $output;
    });

    return $process->isSuccessful() ? 0 : 1;
})->purpose('Run docs guard (OpenAPI + DBML + Business Flow checks)');

Artisan::command('starter:docs-regenerate {version=v1}', function (string $version): int {
    $safeVersion = escapeshellarg($version);
    $process = Process::fromShellCommandline("./scripts/regenerate-docs.sh {$safeVersion}", base_path());
    $process->setTimeout(300);
    $process->run(function ($type, $output): void {
        echo $output;
    });

    return $process->isSuccessful() ? 0 : 1;
})->purpose('Regenerate docs bundle into docs/build/{version}');

Artisan::command('starter:quality-gate', function (): int {
    $process = Process::fromShellCommandline('./scripts/quality-gate.sh', base_path());
    $process->setTimeout(1200);
    $process->run(function ($type, $output): void {
        echo $output;
    });

    return $process->isSuccessful() ? 0 : 1;
})->purpose('Run full quality gate');

Artisan::command('starter:smoke-test', function (): int {
    $process = Process::fromShellCommandline('./scripts/smoke-test.sh', base_path());
    $process->setTimeout(180);
    $process->run(function ($type, $output): void {
        echo $output;
    });

    return $process->isSuccessful() ? 0 : 1;
})->purpose('Run smoke test against current base URL');
