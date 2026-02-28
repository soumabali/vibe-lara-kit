<?php

namespace App\Filament\Resources;

use App\Models\Category;
use Filament\Resources\Resource;

class CategoryResource extends Resource
{
    protected static ?string $model = Category::class;
}
