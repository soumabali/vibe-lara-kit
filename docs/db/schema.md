# Database Schema (PostgreSQL)

## Tables

### users
- id (PK)
- name
- email (unique)
- password
- is_admin (bool)
- timestamps

### categories
- id (PK)
- name
- slug (unique)
- timestamps

### products
- id (PK)
- category_id (FK -> categories.id)
- name, slug (unique)
- description
- price numeric(12,2)
- stock int
- is_active bool
- timestamps
- index(category_id, is_active)

### carts
- id (PK)
- user_id (FK -> users.id, unique)
- timestamps

### cart_items
- id (PK)
- cart_id (FK -> carts.id)
- product_id (FK -> products.id)
- quantity
- unit_price numeric(12,2)
- unique(cart_id, product_id)
- timestamps

### orders
- id (PK)
- user_id (FK -> users.id)
- order_number (unique)
- status
- subtotal numeric(12,2)
- total numeric(12,2)
- timestamps
- index(user_id, created_at)

### order_items
- id (PK)
- order_id (FK -> orders.id)
- product_id (FK -> products.id)
- quantity
- unit_price numeric(12,2)
- line_total numeric(12,2)
- timestamps

## Notes
- Monetary amounts stored as fixed decimal.
- FK constraints explicitly defined.
- Soft deletes are not yet enabled (future enhancement).
