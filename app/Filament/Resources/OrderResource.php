<?php

namespace App\Filament\Resources;

use App\Models\Order;
use Filament\Resources\Resource;

class OrderResource extends Resource
{
    protected static ?string $model = Order::class;
}
