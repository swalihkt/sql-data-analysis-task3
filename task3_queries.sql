SELECT * FROM ecommerce_data LIMIT 10;
PRAGMA table_info(ecommerce_data);
SELECT field2 AS Warehouse_block, COUNT(*) AS Total_Orders
FROM ecommerce_data
WHERE CAST(field5 AS INTEGER) >= 4
GROUP BY field2
ORDER BY Total_Orders DESC
LIMIT 10;
DROP TABLE IF EXISTS warehouse_info;

CREATE TABLE warehouse_info (
    Warehouse_block TEXT,
    Region TEXT
);

INSERT INTO warehouse_info (Warehouse_block, Region) VALUES
('A', 'North'),
('B', 'South'),
('C', 'East'),
('D', 'West'),
('E', 'Central'),
('F', 'North-East');
SELECT w.Region, ed.field2 AS Warehouse_block, COUNT(*) AS Total_Orders
FROM ecommerce_data ed
INNER JOIN warehouse_info w ON ed.field2 = w.Warehouse_block
GROUP BY w.Region, ed.field2
ORDER BY Total_Orders DESC;
