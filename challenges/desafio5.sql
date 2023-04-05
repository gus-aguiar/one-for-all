SELECT 
    a.cancao AS cancao, COUNT(b.cancao_id) AS reproducoes
FROM
    SpotifyClone.cancoes AS a
        INNER JOIN
    SpotifyClone.reproducoes AS b ON a.cancao_id = b.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC , cancao ASC
LIMIT 2;