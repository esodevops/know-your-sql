# Practice Dataset Questions

Dataset: `datasets/ecommerce.sql`
Database: `ecommercedb`

## Basic Filtering

1. Select all users.
2. Return only user `name` and `email`.
3. Find users whose email ends with `@gmail.com`.
4. Find users older than 30.
5. Show users created in 2025.
6. Find users between ages 25 and 35.
7. List users created before `2025-01-01`.
8. Find users with Yahoo emails.
9. List users whose names start with `A` or `B`.
10. Find users with age equal to 29.
11. Show users not using Gmail.
12. Find users created in March 2025.
13. List users with names containing `son`.
14. Find users older than 40.
15. Show users whose email domain is `hotmail.com`.

## Sorting and Limits

16. List users by age ascending.
17. Get the top 3 highest-paid employees.
18. List products by price descending.
19. Get the 5 most recently created users.
20. Show employees sorted by salary ascending.
21. Show employees sorted by age descending.
22. Return the 5 cheapest products.
23. Return the 3 most expensive products.
24. List users ordered by `created_at` ascending.
25. Show the second highest salary from employees.
26. Get products ranked 6 to 10 by price.
27. Return 7 most recent orders.
28. Show first 10 users ordered by name.
29. List departments alphabetically with employees.

## Aggregations

30. Count total users.
31. Count employees per department.
32. Find average salary across employees.
33. Find max and min product prices.
34. Count orders per user.
35. Find total quantity ordered per product.
36. Find total salary expense by department.
37. Find average user age.
38. Count users per email domain.
39. Count orders per month.
40. Find average order quantity.
41. Find highest order quantity.
42. Count products priced above 100.
43. Find total sales amount from all orders.
44. Count distinct products ordered.
45. Find departments with employee count greater than 3.

## Dataset Joins (users, orders, products)

46. List all orders with user names.
47. Show orders with product names and prices.
48. Show user name, product name, and order date.
49. Find users who have never placed an order.
50. Find products that have never been ordered.
51. Show total amount spent per user (`price * quantity`).
52. Show total sales per product.
53. Find users who ordered `Laptop`.
54. Show orders made by Gmail users.
55. Show users and their total order count including zero.
56. Find products bought by more than one user.
57. Show latest order date per user.
58. Show users who bought more than 2 total items.
59. List users with total spending above 500.
60. Show products never bought by users younger than 30.
61. Find users who ordered both `Laptop` and `Mouse`.
62. Show order details with user email and product price.
63. Find top 5 users by spending.
64. Show monthly revenue (`SUM(price * quantity)`) from orders.