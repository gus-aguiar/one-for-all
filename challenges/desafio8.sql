SELECT 
    a.album AS album, b.artista AS artista
FROM
    SpotifyClone.albums AS a
        INNER JOIN
    SpotifyClone.artistas AS b ON a.artista_id = b.artista_id
WHERE
    b.artista = 'Elis Regina';
