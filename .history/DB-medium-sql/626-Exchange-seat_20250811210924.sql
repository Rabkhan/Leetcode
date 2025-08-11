-- Write your PostgreSQL query statement below
-- If total student no is odd then last id shouldn't be swapped
-- ORDER BY ID ASCENDING
WITH numbered AS (
    SELECT 
        id,
        student,
        ROW_NUMBER() OVER (ORDER BY id) AS rn,
        COUNT(*) OVER () AS total_students
    FROM seat
),
swapped AS (
    SELECT
        CASE
            -- Even position swaps with the one before it (rn - 1)
            WHEN rn % 2 = 0 THEN rn - 1
            -- Odd position swaps with the next one, unless it's the last when count is odd
            WHEN rn % 2 = 1 AND rn != total_students THEN rn + 1
            ELSE rn
        END AS swap_rn,
        student
    FROM numbered
)

SELECT n.id, s.student
FROM swapped s
JOIN numbered n ON n.rn = s.swap_rn
ORDER BY n.id;

-- Time took to solve 40 mins