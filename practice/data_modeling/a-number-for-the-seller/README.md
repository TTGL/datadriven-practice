# A Number for the Seller

*They want a total. Give them the right schema first.*

[Data Modeling · Easy · on DataDriven](https://datadriven.io/problems/a_number_for_the_seller)

## How it went

| | |
|---|---|
| Solved | 2026-11-20 |
| Accepted | on the first submission |
| Hints | none |
| Concepts | Attributes, Dimension Tables, Fact Tables, Foreign Keys, Grain Definition, Metric Additivity, One-to-Many, Pre-Aggregation, Primary Keys, Star Schema, Surrogate Keys |

## The design

```mermaid
erDiagram
    sellers {
        UUID seller_id PK
        VARCHAR email
        VARCHAR name
        UUID status_id FK
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }
    products {
        UUID product_id PK
        VARCHAR product_name
        UUID seller_id FK
        UUID status_id FK
        unspecified created_at
        unspecified updated_at
    }
    product_status {
        UUID status_id PK
        VARCHAR name
    }
    seller_status {
        UUID status_id PK
        VARCHAR name
    }
    sales {
        UUID sale_id
        UUID product_id FK
        INT amount
        DECIMAL cost
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }
    sellers only one optionally to zero or more products : "seller_id"
    seller_status only one optionally to zero or more sellers : "status_id"
    product_status only one optionally to zero or more products : "status_id"
    products only one optionally to zero or more sales : "product_id"
```

The accepted design is in [`schema.sql`](./schema.sql) as DDL and in [`schema.json`](./schema.json) as JSON.
