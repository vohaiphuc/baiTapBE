CREATE TABLE orders(
    user_id INT,
    food_id INT,
    amount INT,
    code VARCHAR(255),
    arr_sub_id VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (food_id) REFERENCES food(food_id)
);

CREATE TABLE user(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);

CREATE TABLE rate_res(
    user_id INT,
    res_id INT,
    amount INT,
    date_rate DATETIME,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

CREATE TABLE restaurant(
    res_id INT PRIMARY KEY AUTO_INCREMENT,
    res_name VARCHAR(255),
    image VARCHAR(255),
    description VARCHAR(255)
);

CREATE TABLE like_res(
    user_id INT,
    res_id INT,
    date_like DATETIME,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

CREATE TABLE food(
    food_id INT PRIMARY KEY AUTO_INCREMENT,
    food_name VARCHAR(255),
    image VARCHAR(255),
    price FLOAT,
    description VARCHAR(255),
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);

CREATE TABLE food_type(
    type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(255)
);

CREATE TABLE sub_food(
    sub_id INT PRIMARY KEY AUTO_INCREMENT,
    sub_name VARCHAR(255),
    price FLOAT,
    food_id INT,
    FOREIGN KEY (food_id) REFERENCES food(food_id)
);

-- Thêm dữ liệu
INSERT INTO
    user (full_name, email, password)
VALUES
    ('Alice Johnson', 'alice@example.com', 'pass123'),
    ('Bob Smith', 'bob@example.com', 'securepass'),
    (
        'Charlie Brown',
        'charlie@example.com',
        'p@ssw0rd'
    ),
    ('David Miller', 'david@example.com', 'mysecret'),
    ('Eva Davis', 'eva@example.com', 'strongpassword');

('Hai Phuc', 'haiphuc@example.com', 'nope');

INSERT INTO
    food_type (type_name)
VALUES
    ('Italian'),
    ('American'),
    ('Mexican'),
    ('Chinese'),
    ('Japanese');

INSERT INTO
    restaurant (res_name, image, description)
VALUES
    (
        'Pizza Palace',
        'pizza.jpg',
        'A cozy place for pizza lovers'
    ),
    (
        'Burger Barn',
        'burger.jpg',
        'Serving the best burgers in town'
    ),
    (
        'Taco Town',
        'taco.jpg',
        'Authentic Mexican flavors'
    ),
    (
        'Chopsticks',
        'chinese.jpg',
        'Experience Chinese cuisine'
    ),
    (
        'Sushi House',
        'sushi.jpg',
        'Fresh and delicious sushi'
    );

INSERT INTO
    food (food_name, image, price, description, type_id)
VALUES
    (
        'Margherita Pizza',
        'margherita.jpg',
        12.99,
        'Classic tomato and mozzarella',
        1
    ),
    (
        'Cheeseburger',
        'cheeseburger.jpg',
        8.99,
        'Juicy beef patty with cheese',
        2
    ),
    (
        'Taco Supreme',
        'taco_supreme.jpg',
        10.99,
        'Loaded with toppings',
        3
    ),
    (
        'General Tso Chicken',
        'general_tso.jpg',
        13.99,
        'Spicy and flavorful',
        4
    ),
    (
        'Sashimi Platter',
        'sashimi.jpg',
        20.99,
        'Assorted fresh sashimi',
        5
    );

INSERT INTO
    sub_food (sub_name, price, food_id)
VALUES
    ('Extra Cheese', 1.5, 1),
    ('Bacon', 2.0, 2),
    ('Guacamole', 1.75, 3),
    ('Hot and Sour Soup', 3.5, 4),
    ('Miso Soup', 2.5, 5);

INSERT INTO
    orders (user_id, food_id, amount, code, arr_sub_id)
VALUES
    (1, 1, 2, 'ABC123', 'sub123'),
    (2, 2, 1, 'DEF456', 'sub456'),
    (3, 3, 3, 'GHI789', 'sub789'),
    (4, 4, 2, 'JKL101', 'sub101'),
    (5, 5, 1, 'MNO112', 'sub112'),
    (1, 1, 2, 'ABC123', 'sub123'),
    (2, 2, 1, 'DEF456', 'sub456'),
    (3, 3, 3, 'GHI789', 'sub789'),
    (4, 4, 2, 'JKL101', 'sub101'),
    (5, 5, 1, 'MNO112', 'sub112');

(3, 2, 7, 'GHI790', 'sub78910'),
INSERT INTO
    rate_res (user_id, res_id, amount, date_rate)
VALUES
    (1, 1, 4, '2023-01-01 12:30:00'),
    (2, 2, 5, '2023-02-15 14:45:00'),
    (3, 3, 3, '2023-03-20 18:00:00'),
    (4, 4, 4, '2023-04-05 10:15:00'),
    (5, 5, 5, '2023-05-10 22:00:00');

INSERT INTO
    like_res (user_id, res_id, date_like)
VALUES
    (1, 1, '2023-01-02 08:00:00'),
    (2, 2, '2023-02-16 10:30:00'),
    (3, 3, '2023-03-21 12:45:00'),
    (4, 4, '2023-04-06 15:20:00'),
    (5, 5, '2023-05-11 18:40:00'),
    (1, 2, '2023-06-15 08:30:00'),
    (2, 3, '2023-07-20 10:45:00'),
    (3, 4, '2023-08-25 12:00:00'),
    (4, 5, '2023-09-30 14:15:00'),
    (5, 1, '2023-10-05 16:30:00'),
    (1, 3, '2023-11-10 18:45:00'),
    (2, 4, '2023-12-15 21:00:00'),
    (3, 5, '2024-01-20 23:15:00'),
    (4, 1, '2024-02-25 01:30:00'),
    (5, 2, '2024-03-01 03:45:00'),
    (1, 4, '2024-04-05 06:00:00'),
    (2, 5, '2024-05-10 08:15:00'),
    (3, 1, '2024-06-15 10:30:00'),
    (4, 2, '2024-07-20 12:45:00'),
    (5, 3, '2024-08-25 15:00:00');

-- 5 người like nhiều nhất
SELECT
    user_id,
    COUNT(*) AS like_count
FROM
    like_res
GROUP BY
    user_id
ORDER BY
    like_count DESC
LIMIT
    5;

-- 2 nhà hàng nhiều like nhất
SELECT
    res_id,
    COUNT(*) AS like_count
FROM
    like_res
GROUP BY
    res_id
ORDER BY
    like_count DESC
LIMIT
    2;

-- 1 user order với số lượng nhiều nhất
SELECT
    user_id,
    SUM(amount) AS amount_count
FROM
    orders
GROUP BY
    user_id
ORDER BY
    amount_count DESC
LIMIT
    1;

-- Các user không like, không order, không rate
SELECT
    u.*
FROM
    user u
    LEFT JOIN orders o ON u.user_id = o.user_id
    LEFT JOIN like_res lr ON u.user_id = lr.user_id
    LEFT JOIN rate_res rr ON u.user_id = rr.user_id
WHERE
    o.user_id IS NULL
    AND lr.user_id IS NULL
    AND rr.user_id IS NULL;