SELECT 
    FORMAT(MIN(a.valor_plano), 2) AS faturamento_minimo,
    FORMAT(MAX(a.valor_plano), 2) AS faturamento_maximo,
    FORMAT(AVG(a.valor_plano), 2) AS faturamento_medio,
    FORMAT(SUM(a.valor_plano), 2) AS faturamento_total
FROM
    SpotifyClone.planos AS a
        INNER JOIN
    SpotifyClone.usuarios AS b ON a.plano_id = b.plano_id;