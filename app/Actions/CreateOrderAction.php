<?php

declare(strict_types=1);

namespace App\Actions;

use App\Models\Cart;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class CreateOrderAction
{
    public function handle(User $user): Order
    {
        return DB::transaction(function () use ($user): Order {
            $cart = Cart::with('items.product')->firstOrCreate(['user_id' => $user->id]);
            abort_if($cart->items->isEmpty(), 422, 'Cart is empty');

            $subtotal = $cart->items->sum(fn ($item) => $item->quantity * (float) $item->unit_price);

            $order = Order::create([
                'user_id' => $user->id,
                'order_number' => 'ORD-'.Str::upper(Str::random(10)),
                'status' => 'pending',
                'subtotal' => $subtotal,
                'total' => $subtotal,
            ]);

            foreach ($cart->items as $item) {
                OrderItem::create([
                    'order_id' => $order->id,
                    'product_id' => $item->product_id,
                    'quantity' => $item->quantity,
                    'unit_price' => $item->unit_price,
                    'line_total' => $item->quantity * (float) $item->unit_price,
                ]);
            }

            $cart->items()->delete();

            return $order;
        });
    }
}
