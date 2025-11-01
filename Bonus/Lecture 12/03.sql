-- Use tinymovie

-- List all movie that have never been watched
SELECT mid, title
FROM boxofficemovie
WHERE mid NOT IN (
    SELECT mid
    FROM watch_log
);

-- Example of Final Exam
-- List all movies that earned more than the minimum gross of the year 2019
SELECT mid, title
FROM boxofficemovie
WHERE gross > (
    SELECT MIN(gross) -- minimum firstttt
    FROM boxofficemovie
    WHERE year = 2019
);

