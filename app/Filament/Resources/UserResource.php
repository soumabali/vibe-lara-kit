<?php

namespace App\Filament\Resources;

use App\Models\User;
use Filament\Resources\Resource;

class UserResource extends Resource
{
    protected static ?string $model = User::class;
}
