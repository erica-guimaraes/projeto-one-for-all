SELECT
  a.nome_artista AS artista,
  al.nome_album AS album
FROM
  artistas a
  INNER JOIN albuns al ON a.artista_id = al.artista_id
WHERE
  a.nome_artista = 'Elis Regina'
ORDER BY
  al.nome_album;
