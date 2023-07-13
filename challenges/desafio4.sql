SELECT
  pu.name_pessoa_usuaria AS pessoa_usuaria,
  CASE
    WHEN MAX(hr.data_reproducao) >= '2021-01-01' THEN 'Ativa'
    ELSE 'Inativa'
  END AS status_pessoa_usuaria
FROM
  pessoas_usuarias pu
  LEFT JOIN historico_de_reproducao hr ON pu.pessoa_usuaria_id = hr.pessoa_usuaria_id
GROUP BY
  pu.name_pessoa_usuaria
ORDER BY
  pu.name_pessoa_usuaria;