create table departments (
    department_id serial PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    manager_id INT,
    location_id INT
);
INSERT INTO departments (department_name, manager_id, location_id)
VALUES ('Human Resources', 101, 1),
    ('Information Technology', 102, 2),
    ('Finance', 103, 3),
    ('Marketing', 104, 4),
    ('Sales', 105, 5),
    ('Supply Chain Management', 106, 6),
    ('Research and Development', 107, 7),
    ('Customer Support', 108, 8),
    ('Operations', 109, 9),
    ('Legal', 110, 10);
select *
from departments;
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    bio TEXT,
    job_title VARCHAR(100) NOT NULL,
    salary INT NOT NULL CHECK (salary > 0),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    hire_date DATE NOT NULL,
    last_login TIMESTAMP,
    emp_status VARCHAR(20) NOT NULL DEFAULT 'active' CHECK (
        emp_status IN ('active', 'inactive', 'terminated')
    ),
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    department_id INT REFERENCES departments(department_id),
    manager_id INT REFERENCES employees(employee_id)
);
INSERT INTO employees (
        first_name,
        last_name,
        email,
        phone_number,
        bio,
        job_title,
        salary,
        hire_date,
        department_id
    )
VALUES (
        'Alice',
        'Smith',
        'alice.smith@example.com',
        '123-456-7891',
        'Specialist in database management',
        'Database Administrator',
        82000,
        '2022-06-10',
        2
    ),
    (
        'Robert',
        'Brown',
        'robert.brown@example.com',
        '123-456-7892',
        'Works on frontend applications',
        'Frontend Developer',
        68000,
        '2024-02-20',
        1
    ),
    (
        'Emily',
        'Davis',
        'emily.davis@example.com',
        '123-456-7893',
        'Experienced in employee relations',
        'HR Manager',
        70000,
        '2021-11-05',
        3
    ),
    (
        'Michael',
        'Wilson',
        'michael.wilson@example.com',
        '123-456-7894',
        'Manages financial reporting',
        'Accountant',
        65000,
        '2023-07-12',
        4
    ),
    (
        'Sophia',
        'Taylor',
        'sophia.taylor@example.com',
        '123-456-7895',
        'Specialist in data analytics',
        'Data Analyst',
        72000,
        '2024-04-01',
        2
    ),
    (
        'David',
        'Anderson',
        'david.anderson@example.com',
        '123-456-7896',
        'Leads cloud infrastructure projects',
        'Cloud Engineer',
        90000,
        '2020-09-18',
        1
    ),
    (
        'Olivia',
        'Thomas',
        'olivia.thomas@example.com',
        '123-456-7897',
        'Coordinates supply chain operations',
        'SCM Analyst',
        62000,
        '2023-03-25',
        5
    ),
    (
        'James',
        'Jackson',
        'james.jackson@example.com',
        '123-456-7898',
        'Manages recruitment and onboarding',
        'HR Executive',
        48000,
        '2024-08-14',
        3
    ),
    (
        'Isabella',
        'White',
        'isabella.white@example.com',
        '123-456-7899',
        'Specialist in business intelligence',
        'BI Developer',
        85000,
        '2022-12-01',
        2
    );
select *
from employees;
select *
from departments;
ALTER TABLE employees
ADD COLUMN internal_node varchar(100) NOT NULL DEFAULT 'N/A';
alter table employees
    rename column internal_node to hr_node;
alter table employees drop column hr_node;
create table categories (
    category_id serial PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);
insert into categories (category_name, description)
values ('Electronics', 'Devices and gadgets'),
    ('Books', 'Printed and digital books'),
    (
        'Clothing',
        'Apparel for men, women, and children'
    ),
    (
        'Home & Kitchen',
        'Household items and kitchenware'
    ),
    (
        'Sports & Outdoors',
        'Equipment and gear for sports and outdoor activities'
    );
select *
from categories;
create table products (
    product_id serial PRIMARY KEY,
    category_id INT REFERENCES categories(category_id),
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    stock_quantity INT NOT NULL DEFAULT 0 CHECK (stock_quantity >= 0),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);
select *
from products;
insert into products (category_id, product_name, price, stock_quantity)
values (1, 'Smartphone', 699.99, 50),
    (1, 'Laptop', 999.99, 30),
    (2, 'Novel', 19.99, 100),
    (2, 'Textbook', 59.99, 40),
    (3, 'T-shirt', 14.99, 200),
    (3, 'Jeans', 39.99, 150),
    (4, 'Blender', 49.99, 80),
    (4, 'Cookware Set', 129.99, 60),
    (5, 'Tent', 149.99, 25),
    (5, 'Bicycle', 299.99, 15);
create table customers (
    customer_id serial PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    city VARCHAR(100),
    country VARCHAR(100),
    signnup_date DATE NOT NULL DEFAULT CURRENT_DATE,
    loyality_points INT NOT NULL DEFAULT 0,
    reffered_by INT REFERENCES customers(customer_id)
);
insert into customers (
        first_name,
        last_name,
        email,
        phone_number,
        city,
        country,
        loyality_points
    )
values (
        'Alice',
        'Johnson',
        'alice.johnson@example.com',
        '123-456-7890',
        'New York',
        'USA',
        100
    ),
    (
        'Bob',
        'Smith',
        'bob.smith@example.com',
        '123-456-7891',
        'Los Angeles',
        'USA',
        50
    ),
    insert into customers (
        first_name,
        last_name,
        email,
        phone_number,
        city,
        country,
        loyality_points
    )
values (
        'Charlie',
        'Brown',
        'charlie.brown@example.com',
        '123-456-7892',
        'Chicago',
        'USA',
        75
    );
INSERT INTO customers (
        first_name,
        last_name,
        email,
        phone_number,
        city,
        country,
        loyality_points
    )
VALUES(
        'Robert',
        'Brown',
        'robert.brown@example.com',
        '9876543212',
        'Chicago',
        'USA',
        80
    ),
    (
        'Emily',
        'Davis',
        'emily.davis@example.com',
        '9876543213',
        'Houston',
        'USA',
        300
    ),
    (
        'Michael',
        'Wilson',
        'michael.wilson@example.com',
        '9876543214',
        'Phoenix',
        'USA',
        175
    ),
    (
        'Sophia',
        'Taylor',
        'sophia.taylor@example.com',
        '9876543215',
        'Boston',
        'USA',
        90
    ),
    (
        'David',
        'Anderson',
        'david.anderson@example.com',
        '9876543216',
        'Seattle',
        'USA',
        400
    ),
    (
        'Olivia',
        'Thomas',
        'olivia.thomas@example.com',
        '9876543217',
        'Denver',
        'USA',
        150
    ),
    (
        'James',
        'Jackson',
        'james.jackson@example.com',
        '9876543218',
        'Austin',
        'USA',
        220
    ),
    (
        'Isabella',
        'White',
        'isabella.white@example.com',
        '9876543219',
        'Miami',
        'USA',
        350
    );
select *
FROM customers;
create table orders (
    order_id serial PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    employee_id INT REFERENCES employees(employee_id),
    order_date DATE NOT NULL DEFAULT CURRENT_DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'pending' CHECK (
        status IN ('pending', 'shipped', 'delivered', 'cancelled')
    ),
    shipping_city VARCHAR(50),
    notes TEXT
);
INSERT INTO orders (
        customer_id,
        employee_id,
        order_date,
        status,
        shipping_city,
        notes
    )
VALUES (
        34,
        3,
        '2024-08-02',
        'shipped',
        'Los Angeles',
        'Leave package at the front door'
    ),
    (
        35,
        4,
        '2024-08-03',
        'delivered',
        'Chicago',
        'Gift wrap the items'
    ),
    (
        37,
        1,
        '2024-08-04',
        'cancelled',
        'Houston',
        'Customer requested cancellation'
    ),
    (
        38,
        5,
        '2024-08-05',
        'pending',
        'Phoenix',
        'Priority delivery'
    ),
    (
        39,
        6,
        '2024-08-06',
        'shipped',
        'Boston',
        'Handle with care'
    ),
    (
        40,
        7,
        '2024-08-07',
        'delivered',
        'Seattle',
        'Delivery completed'
    ),
    (
        41,
        8,
        '2024-08-08',
        'pending',
        'Denver',
        'Call before delivery'
    ),
    (
        42,
        9,
        '2024-08-09',
        'shipped',
        'Austin',
        'Express shipment'
    ),
    (
        43,
        10,
        '2024-08-10',
        'delivered',
        'Miami',
        'Customer received order'
    ),
    (
        44,
        11,
        '2024-08-11',
        'pending',
        'Dallas',
        'Awaiting dispatch'
    ),
    (
        45,
        3,
        '2024-08-12',
        'shipped',
        'San Diego',
        'Shipment in transit'
    );
select *
from orders;
create table order_items (
    order_item_id serial PRIMARY KEY,
    order_id INT REFERENCES orders(order_id) on delete cascade,
    product_id INT REFERENCES products(product_id),
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price numeric(10, 2) NOT NULL CHECK (unit_price >= 0)
);
INSERT INTO order_items (
        order_id,
        product_id,
        quantity,
        unit_price
    )
VALUES (71, 1, 2, 499.00),
    (71, 3, 1, 1299.00),
    (72, 2, 3, 250.00),
    (72, 4, 1, 899.00),
    (73, 5, 2, 1499.00),
    (73, 6, 1, 799.00),
    (74, 1, 4, 499.00),
    (74, 7, 2, 599.00),
    (75, 8, 1, 2499.00),
    (75, 9, 2, 999.00),
    (76, 10, 3, 349.00),
    (77, 2, 2, 250.00),
    (78, 4, 3, 899.00),
    (80, 6, 2, 799.00),
    (81, 10, 1, 349.00);
select *
from order_items;
create table payments (
    payment_id serial PRIMARY KEY,
    order_id INT REFERENCES orders(order_id) on delete cascade,
    payment_date date not null,
    amount numeric(10, 2) NOT NULL CHECK (amount > 0),
    payment_method VARCHAR(50) not NULL check (
        payment_method in ('credit_card', 'paypal', 'bank_transfer', 'cash')
    ),
    status VARCHAR(20) NOT NULL DEFAULT 'pending' CHECK (
        status IN ('pending', 'completed', 'failed', 'refunded')
    )
);
INSERT INTO payments (
        order_id,
        payment_date,
        amount,
        payment_method,
        status
    )
VALUES (
        71,
        '2024-08-02',
        2297.00,
        'credit_card',
        'completed'
    ),
    (
        72,
        '2024-08-03',
        1649.00,
        'paypal',
        'completed'
    ),
    (
        73,
        '2024-08-04',
        3797.00,
        'bank_transfer',
        'completed'
    ),
    (
        74,
        '2024-08-05',
        2496.00,
        'cash',
        'completed'
    ),
    (
        75,
        '2024-08-06',
        4497.00,
        'credit_card',
        'pending'
    ),
    (
        76,
        '2024-08-07',
        1047.00,
        'paypal',
        'completed'
    ),
    (
        77,
        '2024-08-08',
        500.00,
        'bank_transfer',
        'failed'
    ),
    (
        78,
        '2024-08-09',
        2697.00,
        'credit_card',
        'completed'
    ),
    (
        79,
        '2024-08-10',
        1598.00,
        'cash',
        'refunded'
    ),
    (
        80,
        '2024-08-11',
        1598.00,
        'paypal',
        'completed'
    ),
    (
        81,
        '2024-08-12',
        349.00,
        'credit_card',
        'pending'
    );
select *
from payments;
select 'employees' AS table_name,
    COUNT(*) AS total_rows
FROM employees
UNION ALL
select 'categories' AS table_name,
    COUNT(*) AS total_rows
FROM categories
UNION ALL
select 'products' AS table_name,
    COUNT(*) AS total_rows
FROM products
UNION ALL
select 'customers' AS table_name,
    COUNT(*) AS total_rows
FROM customers
UNION ALL
select 'orders' AS table_name,
    COUNT(*) AS total_rows
FROM orders
UNION ALL
select 'order_items' AS table_name,
    COUNT(*) AS total_rows
FROM order_items
UNION ALL
select 'payments' AS table_name,
    COUNT(*) AS total_rows
FROM payments;
select *
from customers;
select *
from categories;
select *
from products;
update products
set stock_quantity = stock_quantity - 5
where product_id = 2;
update products
set is_active = false
where product_id = 1;
update products
set price = 249.99
where product_id = 3;
select *
from departments;
delete from departments
where department_id = 11;
select *
from order_items
where order_id = 71;
select *
from products
    FULL OUTER JOIN
where category_id = 1;
select *
from categories
where category_id in (1, 2, 3);
select first_name,
    last_name,
    email,
    loyality_points,
    COALESCE(phone_number, 'N/A') AS phone_number,
    coalesce(city, 'no city') AS city
from customers
where loyality_points > 100;
select *
from products
order by category_id asc,
    price desc;
select *
FROM orders
where order_date >= '2024-08-01'
    AND order_date <= '2024-08-31' offset 4
fetch first 4 rows only;
-- pagination
-- backend use this formula to calculate the offset for pagination:
offset = (page - 1) *
limit -- give me all customers who did not place any order BY using a LEFT JOIN to find customers without corresponding orders:
select c.customer_id,
    c.first_name,
    c.last_name,
    c.email
from customers c
    left join orders o on c.customer_id = o.customer_id
where o.customer_id is null;
-- give me order whose payments have not done yet by using a LEFT JOIN to find orders without corresponding payments:
select *
from PAyments p
    left join orders o on p.order_id = o.order_id
WHERE p.Payment_id is not null;
-- give me information about all orders that are there in the order and payments table by using an INNER JOIN to find orders with corresponding payments:
select o.order_id,
    o.customer_id,
    o.employee_id,
    o.order_date,
    o.status
from orders o
    inner join payments p on o.order_id = p.order_id;
-- i want to get info about employee and manager information by using a self join on the employees table to find employees along with their managers:
select e.first_name AS employee_first_name,
    e.last_name AS employee_last_name,
    m.employee_id AS manager_id
from employees e
    left join employees m on e.manager_id = m.employee_id;
-- give me sales on category level
-- electronics - 3000
-- clothing - 4000
-- give me categories having sales > 5000
-- return category name in the result 
-- derived table or subquery to calculate total sales for each category, and then join it with the categories table to get the category names. Finally, filter the results to include only those categories with total sales greater than 500.
SELECT c.category_name,
    category_stats.total_sales AS category_sales
FROM (
        SELECT p.category_id AS stat_id,
            SUM(oi.quantity * oi.unit_price) AS total_sales
        FROM order_items oi
            LEFT JOIN products p ON oi.product_id = p.product_id
        GROUP BY p.category_id
    ) category_stats
    LEFT JOIN categories c ON category_stats.stat_id = c.category_id
WHERE category_stats.total_sales > 500;
-- ! cte improve readability and performance by breaking down complex queries into smaller, manageable parts. Common Table Expressions (CTEs) allow you to define temporary result sets that can be referenced within the main query, making it easier to understand and maintain.
with category_stats as (
    SELECT p.category_id AS stat_id,
        SUM(oi.quantity * oi.unit_price) AS total_sales
    FROM order_items oi
        LEFT JOIN products p ON oi.product_id = p.product_id
    GROUP BY p.category_id
)
select *
FROM category_stats cs
    left join categories c on cs.stat_id = c.category_id
where cs.total_sales > 500;
-- with multiple cte all posible cte can be used in a single query to break down complex logic into smaller, manageable parts. Each CTE can reference the previous CTEs, allowing for a step-by-step approach to building the final result set. This improves readability and maintainability of the SQL code.  
with category_stats as (
    SELECT p.category_id AS stat_id,
        SUM(oi.quantity * oi.unit_price) AS total_sales
    FROM order_items oi
        LEFT JOIN products p ON oi.product_id = p.product_id
    GROUP BY p.category_id
),
highest_sales_category as (
    SELECT stat_id,
        total_sales
    FROM category_stats
    ORDER BY total_sales DESC
    LIMIT 3
)
select *
FROM highest_sales_category hsc
    left join categories c on hsc.stat_id = c.category_id;
-- reusablity of cte can be achieved by defining the CTE once and then referencing it multiple times within the same query. This allows for consistent calculations and avoids redundancy, making the SQL code more efficient and easier to maintain.
-- give me total spend of a customer 
-- also give me average of all customer 
-- also give me flag true or false basis of if the customer have average spending more than 
WITH customer_total AS (
    SELECT o.customer_id,
        SUM(oi.quantity * oi.unit_price) AS customer_spend
    FROM orders AS o
        LEFT JOIN order_items AS oi ON o.order_id = oi.order_id
    WHERE o.status = 'delivered'
    GROUP BY o.customer_id
)
SELECT ct.customer_id,
    ct.customer_spend,
    ROUND(
        (
            SELECT AVG(customer_spend)
            FROM customer_total
        ),
        2
    ) AS average_spend,
    ct.customer_spend > (
        SELECT AVG(customer_spend)
        FROM customer_total
    ) AS above_average_flag
FROM customer_total AS ct;
-- ques number 5
SELECT *
FROM (
        SELECT o.customer_id,
            SUM(oi.quantity * oi.unit_price) AS customer_spend
        FROM orders AS o
            LEFT JOIN order_items AS oi ON o.order_id = oi.order_id
        WHERE o.status = 'delivered'
        GROUP BY o.customer_id
    ) AS customer_total 
    
-- window function 
select category_id,
    sum (price) as product_sum
from products
group by category_id;

-- shortcut of window function

select *,
    sum(price) over (partition by category_id) as product_sum
from products;


select 
    *,
    avg(price) over () as product_avg
from products
where is_active <> FALSE;



-- rank A

-- give rank ofa product based on the peice 

select 
    product_name,
    price,
    dense_rank() over (order by price desc) as product_rank
from products;


-- union and union all 

select first_name, last_name, 'employee' as role  from employees
UNION
SELECT first_name, last_name, 'customer' as role from customers;



-- indexes
create index idx_customer_email on customers(email);

select * from customers;