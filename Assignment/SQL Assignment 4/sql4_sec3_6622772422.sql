USE tinymovies;

-- Q1: List all movies that have never been watched (Use Subquery)
SELECT mid, title FROM boxofficemovie
WHERE mid NOT IN (
    SELECT mid
    FROM watch_log
);

-- Q2: Create a view named 'vw_minGrossMovie' for showing all movies
-- that earned more than the minimum gross of the year 2019
CREATE VIEW vm_minGrossMovie AS
SELECT mid, title FROM boxofficemovie
WHERE gross > (
    SELECT MIN(gross) FROM boxofficemovie
    WHERE YEAR(datereleased) = 2019
);

SELECT * FROM vm_mingrossmovie;

-- Q3: Create a view name 'vw_cntMovie' for counting all movies
-- of each studio that had been watched for each day, each month, and each year.
-- Example of Most Difficult Question of Final Exam
CREATE VIEW vw_cntMovie AS
SELECT
    DAY(w.watch_datetime) AS dd,
    MONTH(w.watch_datetime) AS mm,
    YEAR(w.watch_datetime) AS yy,
    b.studio,
    COUNT(*) AS cntMovie
FROM watch_log w
LEFT JOIN boxofficemovie b ON w.mid = b.mid
GROUP BY yy, mm, dd, b.studio;
