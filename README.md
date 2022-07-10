# Postgres migrations

For the Papetier's PostgreSQL database

Migrations are contained inside the `/migrations` folder, intended to be ran with the [golang-migrate](https://github.com/golang-migrate/migrate) tool.

## Installing the CLI tool

Here are the installation instructions: https://github.com/golang-migrate/migrate/tree/master/cmd/migrate#installation.

## Running the CLI tool

```bash
migrate -source file://migrations -database "postgres://postgres:postgres@localhost:5432/postgres?sslmode=disable" up
```

More information about the arguments can be found [here](https://github.com/golang-migrate/migrate/tree/master/cmd/migrate#usage).

## Database schema

```mermaid
erDiagram
          CUSTOMER }|..|{ DELIVERY-ADDRESS : has
          CUSTOMER {
              string test PK
              string other
          }
          CUSTOMER ||--o{ ORDER : places
          CUSTOMER ||--o{ INVOICE : "liable for"
          DELIVERY-ADDRESS ||--o{ ORDER : receives
          INVOICE ||--|{ ORDER : covers
          ORDER ||--|{ ORDER-ITEM : includes
          PRODUCT-CATEGORY ||--|{ PRODUCT : contains
          PRODUCT ||--o{ ORDER-ITEM : "ordered in"
            
```
