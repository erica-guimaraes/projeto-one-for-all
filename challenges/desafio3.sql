SELECT
  pu.name_pessoa_usuaria AS pessoa_usuaria,
  COUNT(hr.cancao_id) AS musicas_ouvidas,
  ROUND(SUM(c.duracao_segundos) / 60, 2) AS total_minutos
FROM
  pessoas_usuarias pu
  INNER JOIN historico_de_reproducao hr ON pu.pessoa_usuaria_id = hr.pessoa_usuaria_id
  INNER JOIN cancoes c ON hr.cancao_id = c.cancao_id
GROUP BY
  pu.name_pessoa_usuaria
ORDER BY
  pu.name_pessoa_usuaria;