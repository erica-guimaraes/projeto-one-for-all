SELECT
  c.nome_cancoes AS cancao,
  COUNT(hr.pessoa_usuaria_id) AS reproducoes
FROM
  cancoes c
  INNER JOIN historico_de_reproducao hr ON c.cancao_id = hr.cancao_id
GROUP BY
  c.nome_cancoes
ORDER BY
  reproducoes DESC, c.nome_cancoes ASC
LIMIT 2;