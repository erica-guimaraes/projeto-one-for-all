SELECT
	(SELECT COUNT(cancao_id) FROM cancoes) AS cancoes,
    (SELECT COUNT(artista_id) FROM artistas) AS artistas,
	(SELECT COUNT(album_id) FROM albuns) AS albuns;