SELECT
  a.nome_artista AS artista,
  al.nome_album AS album,
  COUNT(s.pessoa_usuaria_id) AS pessoas_seguidoras
FROM
  artistas a
  INNER JOIN albuns al ON a.artista_id = al.artista_id
  LEFT JOIN seguidores s ON a.artista_id = s.artista_id
GROUP BY
  a.nome_artista,
  al.nome_album
ORDER BY
  pessoas_seguidoras DESC,
  a.nome_artista,
  al.nome_album;
