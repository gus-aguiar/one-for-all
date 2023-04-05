SELECT 
    u.usuario_nome AS pessoa_usuaria,
    IF(MAX(YEAR(r.data_reproducao)) >= '2021',
        'Ativa',
        'Inativa') AS status_pessoa_usuaria
FROM
    SpotifyClone.usuarios AS u
        INNER JOIN
    SpotifyClone.reproducoes AS r ON u.usuario_id = r.usuario_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria ASC;