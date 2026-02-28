# Architecture - Simple Ecommerce

## Style
Modular monolith, API-first, with admin UI through Filament.

## Bounded contexts
- Identity: user registration/login/logout via Sanctum.
- Catalog: categories and products.
- Cart: user cart and items.
- Ordering: checkout creates order + order items.
- Admin: Filament resources for management.

## Layering
- Controllers: input/output only.
- Actions: business use-cases (`CreateOrderAction`).
- Models: persistence + relationships.

## Request lifecycle
`Route -> Controller -> Action (if needed) -> Model/DB -> JSON response`

## Security model
- Bearer token auth via Sanctum.
- Ownership checks on cart item deletion and order listing.
- Admin access intended via Filament auth/policies (expand in roadmap).

## Roadmap
1. Add FormRequest classes per endpoint.
2. Add idempotency-key middleware for `POST /orders`.
3. Add queued order confirmation and stock decrement with optimistic locking.
4. Enforce admin-only policies for Filament resources.
