# Solutions for Practice Dataset Questions

## Basic Filtering

1. **Select all users.**

```sql
SELECT * FROM ecommerce.users;
```

2. **Return only user `name` and `email`.**

```sql
SELECT name, email FROM ecommerce.users;
```

3. **Find users whose email ends with `@gmail.com`.**

```sql
SELECT * FROM ecommerce.users WHERE email LIKE '%@gmail.com';
```

4. **Find users older than 30.**

```sql
SELECT * FROM ecommerce.users WHERE age > 30;
```

5. **Show users created in 2025.**

```sql
SELECT * FROM ecommerce.users WHERE EXTRACT(YEAR FROM created_at) = 2025;
```

6. **Find users between ages 25 and 35.**

```sql
SELECT * FROM ecommerce.users WHERE age BETWEEN 25 AND 35;
```

7. **List users created before `2025-01-01`.**

```sql
SELECT * FROM ecommerce.users WHERE created_at < '2025-01-01';
```

8. **Find users with Yahoo emails.**

```sql
SELECT * FROM ecommerce.users WHERE email LIKE '%@yahoo.com';
```

9. **List users whose names start with `A` or `B`.**

```sql
SELECT * FROM ecommerce.users WHERE name ILIKE 'A%' OR name ILIKE 'B%';
```

10. **Find users with age equal to 29.**

```sql
SELECT * FROM ecommerce.users WHERE age = 29;
```

11. **Show users not using Gmail.**

```sql
SELECT * FROM ecommerce.users WHERE email NOT LIKE '%@gmail.com';
```

12. **Find users created in March 2025.**

```sql
SELECT * FROM ecommerce.users WHERE EXTRACT(YEAR FROM created_at) = 2025 AND EXTRACT(MONTH FROM created_at) = 3;
```

13. **List users with names containing `son`.**

```sql
SELECT * FROM ecommerce.users WHERE name ILIKE '%son%';
```

14. **Find users older than 40.**

```sql
SELECT * FROM ecommerce.users WHERE age > 40;
```

15. **Show users whose email domain is `hotmail.com`.**

```sql
SELECT * FROM ecommerce.users WHERE email LIKE '%@hotmail.com';
```

# (Continue with solutions for Sorting, Aggregations, and Joins as needed)

## Sorting and Limits

16. **List users by age ascending.**

```sql
SELECT * FROM ecommerce.users ORDER BY age ASC;
```

17. **Get the top 3 highest-paid employees.**

```sql
SELECT * FROM ecommerce.employees ORDER BY salary DESC LIMIT 3;
```

18. **List products by price descending.**

```sql
SELECT * FROM ecommerce.products ORDER BY price DESC;
```

19. **Get the 5 most recently created users.**

```sql
SELECT * FROM ecommerce.users ORDER BY created_at DESC LIMIT 5;
```

20. **Show employees sorted by salary ascending.**

```sql
SELECT * FROM ecommerce.employees ORDER BY salary ASC;
```

21. **Show employees sorted by age descending.**

```sql
SELECT * FROM ecommerce.employees ORDER BY age DESC;
```

22. **Return the 5 cheapest products.**

```sql
SELECT * FROM ecommerce.products ORDER BY price ASC LIMIT 5;
```

23. **Return the 3 most expensive products.**

```sql
SELECT * FROM ecommerce.products ORDER BY price DESC LIMIT 3;
```

24. **List users ordered by `created_at` ascending.**

```sql
SELECT * FROM ecommerce.users ORDER BY created_at ASC;
```

25. **Show the second highest salary from employees.**

```sql
SELECT DISTINCT salary FROM ecommerce.employees ORDER BY salary DESC OFFSET 1 LIMIT 1;
```

26. **Get products ranked 6 to 10 by price.**

```sql
SELECT * FROM ecommerce.products ORDER BY price DESC OFFSET 5 LIMIT 5;
```

27. **Return 7 most recent orders.**

```sql
SELECT * FROM ecommerce.orders ORDER BY order_date DESC LIMIT 7;
```

28. **Show first 10 users ordered by name.**

```sql
SELECT * FROM ecommerce.users ORDER BY name ASC LIMIT 10;
```

29. **List departments alphabetically with employees.**

```sql
SELECT department, name FROM ecommerce.employees ORDER BY department ASC, name ASC;
```

## Aggregations

30. **Count total users.**

```sql
SELECT COUNT(*) FROM ecommerce.users;
```

31. **Count employees per department.**

```sql
SELECT department, COUNT(*) FROM ecommerce.employees GROUP BY department;
```

32. **Find average salary across employees.**

```sql
SELECT AVG(salary) FROM ecommerce.employees;
```

33. **Find max and min product prices.**

```sql
SELECT MAX(price) AS max_price, MIN(price) AS min_price FROM ecommerce.products;
```

34. **Count orders per user.**

```sql
SELECT user_id, COUNT(*) FROM ecommerce.orders GROUP BY user_id;
```

35. **Find total quantity ordered per product.**

```sql
SELECT product_id, SUM(quantity) FROM ecommerce.orders GROUP BY product_id;
```

36. **Find total salary expense by department.**

```sql
SELECT department, SUM(salary) FROM ecommerce.employees GROUP BY department;
```

37. **Find average user age.**

```sql
SELECT AVG(age) FROM ecommerce.users;
```

38. **Count users per email domain.**

```sql
SELECT SPLIT_PART(email, '@', 2) AS domain, COUNT(*) FROM ecommerce.users GROUP BY domain;
```

39. **Count orders per month.**

```sql
SELECT DATE_TRUNC('month', order_date) AS month, COUNT(*) FROM ecommerce.orders GROUP BY month ORDER BY month;
```

40. **Find average order quantity.**

```sql
SELECT AVG(quantity) FROM ecommerce.orders;
```

41. **Find highest order quantity.**

```sql
SELECT MAX(quantity) FROM ecommerce.orders;
```

42. **Count products priced above 100.**

```sql
SELECT COUNT(*) FROM ecommerce.products WHERE price > 100;
```

43. **Find total sales amount from all orders.**

```sql
SELECT SUM(p.price * o.quantity) AS total_sales
FROM ecommerce.orders o
JOIN ecommerce.products p ON o.product_id = p.product_id;
```

44. **Count distinct products ordered.**

```sql
SELECT COUNT(DISTINCT product_id) FROM ecommerce.orders;
```

45. **Find departments with employee count greater than 3.**

```sql
SELECT department, COUNT(*)
FROM ecommerce.employees
GROUP BY department
HAVING COUNT(*) > 3;
```

## Dataset Joins (users, orders, products)

46. **List all orders with user names.**

```sql
SELECT o.*, u.name FROM ecommerce.orders o JOIN ecommerce.users u ON o.user_id = u.user_id;
```

47. **Show orders with product names and prices.**

```sql
SELECT o.*, p.name AS product_name, p.price FROM ecommerce.orders o JOIN ecommerce.products p ON o.product_id = p.product_id;
```

48. **Show user name, product name, and order date.**

```sql
SELECT u.name, p.name AS product_name, o.order_date
FROM ecommerce.orders o
JOIN ecommerce.users u ON o.user_id = u.id
JOIN ecommerce.products p ON o.product_id = p.id;
```

49. **Find users who have never placed an order.**

```sql
SELECT u.* FROM ecommerce.users u LEFT JOIN ecommerce.orders o ON u.id = o.user_id WHERE o.id IS NULL;
```

50. **Find products that have never been ordered.**

```sql
SELECT p.* FROM ecommerce.products p LEFT JOIN ecommerce.orders o ON p.id = o.product_id WHERE o.id IS NULL;
```

51. **Show total amount spent per user (`price * quantity`).**

```sql
SELECT u.id, u.name, SUM(p.price * o.quantity) AS total_spent
FROM ecommerce.users u
JOIN ecommerce.orders o ON u.id = o.user_id
JOIN ecommerce.products p ON o.product_id = p.id
GROUP BY u.id, u.name;
```

52. **Show total sales per product.**

```sql
SELECT p.id, p.name, SUM(o.quantity) AS total_sold
FROM ecommerce.products p
JOIN ecommerce.orders o ON p.id = o.product_id
GROUP BY p.id, p.name;
```

53. **Find users who ordered `Laptop`.**

```sql
SELECT DISTINCT u.*
FROM ecommerce.users u
JOIN ecommerce.orders o ON u.id = o.user_id
JOIN ecommerce.products p ON o.product_id = p.id
WHERE p.name = 'Laptop';
```

54. **Show orders made by Gmail users.**

```sql
SELECT o.*
FROM ecommerce.orders o
JOIN ecommerce.users u ON o.user_id = u.id
WHERE u.email LIKE '%@gmail.com';
```

55. **Show users and their total order count including zero.**

```sql
SELECT u.id, u.name, COUNT(o.id) AS order_count
FROM ecommerce.users u
LEFT JOIN ecommerce.orders o ON u.id = o.user_id
GROUP BY u.id, u.name;
```

56. **Find products bought by more than one user.**

```sql
SELECT product_id
FROM ecommerce.orders
GROUP BY product_id
HAVING COUNT(DISTINCT user_id) > 1;
```

57. **Show latest order date per user.**

```sql
SELECT user_id, MAX(order_date) AS latest_order
FROM ecommerce.orders
GROUP BY user_id;
```

58. **Show users who bought more than 2 total items.**

```sql
SELECT u.id, u.name, SUM(o.quantity) AS total_items
FROM ecommerce.users u
JOIN ecommerce.orders o ON u.id = o.user_id
GROUP BY u.id, u.name
HAVING SUM(o.quantity) > 2;
```

59. **List users with total spending above 500.**

```sql
SELECT u.id, u.name, SUM(p.price * o.quantity) AS total_spent
FROM ecommerce.users u
JOIN ecommerce.orders o ON u.id = o.user_id
JOIN ecommerce.products p ON o.product_id = p.id
GROUP BY u.id, u.name
HAVING SUM(p.price * o.quantity) > 500;
```

60. **Show products never bought by users younger than 30.**

```sql
SELECT p.*
FROM ecommerce.products p
WHERE p.id NOT IN (
  SELECT o.product_id
  FROM ecommerce.orders o
  JOIN ecommerce.users u ON o.user_id = u.id
  WHERE u.age < 30
);
```

61. **Find users who ordered both `Laptop` and `Mouse`.**

```sql
SELECT u.*
FROM ecommerce.users u
WHERE u.id IN (
  SELECT o1.user_id
  FROM ecommerce.orders o1
  JOIN ecommerce.products p1 ON o1.product_id = p1.id
  WHERE p1.name = 'Laptop'
)
AND u.id IN (
  SELECT o2.user_id
  FROM ecommerce.orders o2
  JOIN ecommerce.products p2 ON o2.product_id = p2.id
  WHERE p2.name = 'Mouse'
);
```

62. **Show order details with user email and product price.**

```sql
SELECT o.*, u.email, p.price
FROM ecommerce.orders o
JOIN ecommerce.users u ON o.user_id = u.id
JOIN ecommerce.products p ON o.product_id = p.id;
```

63. **Find top 5 users by spending.**

```sql
SELECT u.id, u.name, SUM(p.price * o.quantity) AS total_spent
FROM ecommerce.users u
JOIN ecommerce.orders o ON u.id = o.user_id
JOIN ecommerce.products p ON o.product_id = p.id
GROUP BY u.id, u.name
ORDER BY total_spent DESC
LIMIT 5;
```

64. **Show monthly revenue (`SUM(price * quantity)`) from orders.**

```sql
SELECT DATE_TRUNC('month', o.order_date) AS month, SUM(p.price * o.quantity) AS revenue
FROM ecommerce.orders o
JOIN ecommerce.products p ON o.product_id = p.id
GROUP BY month
ORDER BY month;
```
