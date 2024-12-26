# Motorcycle Parts Sales Analysis

## Project Overview
This project aims to analyze sales data for a motorcycle parts company that operates three warehouses (`North`, `Central`, and `West`). The focus is on understanding **wholesale revenue** by **product line**, grouped by **month** and **warehouse**. The analysis includes calculating **net revenue** after deducting payment fees.

---

## Objectives
1. Calculate net revenue for each product line.
2. Group results by month and warehouse.
3. Filter the results to include only **wholesale** orders.
4. Present the output in the following format:

| `product_line` | `month` | `warehouse` | `net_revenue` |
|----------------|---------|-------------|---------------|
| product_one    | ---     | ---         | ---           |
| ...            | ...     | ...         | ...           |

---

## Database Table: `sales`

### Table Schema
| Column         | Data Type | Description                                                            |
|----------------|-----------|------------------------------------------------------------------------|
| `order_number` | `VARCHAR` | Unique order number.                                                  |
| `date`         | `DATE`    | Date of the order (June to August 2021).                              |
| `warehouse`    | `VARCHAR` | Warehouse from which the order was made (`North`, `Central`, `West`). |
| `client_type`  | `VARCHAR` | Type of order (`Retail`, `Wholesale`).                                |
| `product_line` | `VARCHAR` | Type of product ordered.                                              |
| `quantity`     | `INT`     | Number of products ordered.                                           |
| `unit_price`   | `FLOAT`   | Price per product in dollars.                                         |
| `total`        | `FLOAT`   | Total price of the order in dollars.                                  |
| `payment`      | `VARCHAR` | Payment method (`Credit card`, `Transfer`, `Cash`).                  |
| `payment_fee`  | `FLOAT`   | Percentage of `total` charged as a payment fee.                      |


