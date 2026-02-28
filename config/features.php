<?php

declare(strict_types=1);

return [
    'checkout_v2' => (bool) env('FEATURE_CHECKOUT_V2', false),
    'new_pricing_engine' => (bool) env('FEATURE_NEW_PRICING_ENGINE', false),
];
