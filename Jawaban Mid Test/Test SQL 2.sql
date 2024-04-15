CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
);

INSERT INTO item_bought (buyer, item) VALUES
('A', 'Asus'),
('B', 'Lenovo'),
('C', 'Lenovo'),
('D', 'Acer'),
('E', 'Acer'),
('F', 'Acer');

SELECT * FROM public.item_bought

WITH item_counts AS (
    SELECT item, COUNT(*) AS num_bought
    FROM item_bought
    GROUP BY item
), min_max_counts AS (
    SELECT MIN(num_bought) AS min_count, MAX(num_bought) AS max_count
    FROM item_counts
)
SELECT item, num_bought
FROM item_counts
CROSS JOIN min_max_counts
WHERE num_bought != min_count AND num_bought != max_count;
