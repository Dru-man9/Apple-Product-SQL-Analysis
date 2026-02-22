# Apple Product SQL Analysis

A SQL-based data analysis project that explores Apple's product lineup using DuckDB. This repository contains SQL queries and a dataset that analyze Apple products across different categories, price points, and launch dates.

## 📁 Project Structure

- **Analysis-2.SQL** - Main SQL analysis file containing 10 detailed queries
- **products-3.csv** - Apple product dataset with Product ID, Name, Category, Launch Date, and Price
- **README.md** - This file

## 📊 What's Inside

This project demonstrates various SQL techniques applied to real Apple product data:

### SQL Queries Included (10 Total)

1. **View All Products** - Lists all products sorted by price (highest to lowest)
2. **Count by Category** - Shows how many products Apple has in each category
3. **Average Price Analysis** - Calculates min, max, and average prices by category
4. **Most Expensive Per Category** - Finds the premium product in each category using subqueries
5. **2024 Launches** - Filters recently launched products
6. **Price Tier Classification** - Groups products into Budget, Mid-Range, and Premium tiers
7. **Price Tier Summary** - Counts products and average price per tier
8. **Launch Volume by Year** - Tracks Apple's product launches over time
9. **Top 10 Most Expensive** - Rankings of Apple's priciest products
10. **Top 10 Cheapest** - Lists the most affordable products in the lineup

## 🛠️ Technologies

- **SQL Engine**: DuckDB (lightweight, embedded SQL database)
- **Data Format**: CSV
- **Language**: SQL

## 🚀 How to Run

### Prerequisites
- [DuckDB](https://duckdb.org/) installed on your system

### Steps

1. Clone or download this repository
2. Open a terminal and navigate to the project folder:
   ```bash
   cd Apple-Product-SQL-Analysis
   ```
3. Run the SQL analysis:
   ```bash
   duckdb < Analysis-2.SQL
   ```

**Note**: Make sure `products-3.csv` is in the same directory as `Analysis-2.SQL` when running the queries.

## 📈 Key Insights You'll Get

- Distribution of Apple products across different price ranges
- Category analysis showing product counts and pricing trends
- Historical launch patterns to understand Apple's product cycle
- Price tier breakdown to understand market segmentation

## 💡 Learning Outcomes

This project is great for learning:
- ✅ SELECT statements and filtering with WHERE clauses
- ✅ Aggregation functions (COUNT, AVG, MIN, MAX)
- ✅ GROUP BY and ORDER BY for data organization
- ✅ CASE statements for conditional logic
- ✅ Subqueries for complex filtering
- ✅ Date functions (YEAR extraction)
- ✅ LIMIT clause for result pagination

## 📝 Notes

- The CSV file uses product data structured with columns: Product_ID, Product_Name, Category_ID, Launch_Date, Price
- All prices are assumed to be in USD
- Launch dates follow YYYY-MM-DD format
- The analysis uses DuckDB's `read_csv_auto()` function for automatic CSV schema detection

## 🤝 Contributing

Feel free to extend this project by:
- Adding more complex queries
- Exploring additional product attributes
- Creating aggregate views
- Adding performance benchmarks

## 📄 License

This project is open source and available for educational purposes.

---

**Last Updated**: 2026-02-22 03:12:21