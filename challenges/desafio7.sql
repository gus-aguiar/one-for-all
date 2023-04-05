SELECT 
    art.artista AS artista,
    alb.album AS album,
    COUNT(seg.usuario_id) AS pessoas_seguidoras
FROM
    SpotifyClone.seguidores AS seg
        INNER JOIN
    SpotifyClone.artistas AS art ON seg.artista_id = art.artista_id
        INNER JOIN
    SpotifyClone.albums AS alb ON art.artista_id = alb.artista_id
GROUP BY artista , album
ORDER BY pessoas_seguidoras DESC , artista ASC , album ASC;