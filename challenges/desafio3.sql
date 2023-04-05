SELECT 
    a.usuario_nome AS pessoa_usuaria,
    COUNT(b.usuario_id) AS musicas_ouvidas,
    ROUND(SUM(c.duracao_segundos) / 60, 2) AS total_minutos
FROM
    SpotifyClone.usuarios AS a
        JOIN
    SpotifyClone.reproducoes AS b ON a.usuario_id = b.usuario_id
        JOIN
    SpotifyClone.cancoes AS c ON b.cancao_id = c.cancao_id
GROUP BY a.usuario_nome
ORDER BY pessoa_usuaria ASC;