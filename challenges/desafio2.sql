SELECT 
    COUNT(*) AS cancoes,
    COUNT(DISTINCT artista_id) AS artistas,
    COUNT(DISTINCT album_id) AS albuns
FROM
    SpotifyClone.cancoes;