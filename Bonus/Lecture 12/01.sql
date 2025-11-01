-- Bonus 1 (INNER JOIN; Default)

SELECT
    u.username,
    m.title
FROM watch_log w
JOIN users u
    ON w.uid = u.uid
JOIN boxofficemovie m
    ON w.mid = m.mid;


SELECT
    u.username,
    COUNT(*) AS countmovie
FROM watch_log w
JOIN users u
ON w.uid = u.uid
WHERE DATE(w.watch_datetime) = '2020-10-13'
GROUP BY u.username;