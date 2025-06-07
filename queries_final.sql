-- Query --

-- Query 1: Listar as EPCS organizadas por ULS e grupo
SELECT e.*, u.nome AS uls_nome, u.grupo
FROM epcs e
JOIN uls u ON e.uls = u.idULS
ORDER BY u.grupo, u.idULS;

-- Query 2: Listar as EPCS com localidade, emails e telefones
SELECT 
  e.nif,
  e.nome,
  e.morada,
  e.codigo_postal,
  cod.Localidade,
  GROUP_CONCAT(DISTINCT email.email ORDER BY email.email SEPARATOR '; ') AS emails,
  GROUP_CONCAT(DISTINCT tel.telefone ORDER BY tel.telefone SEPARATOR '; ') AS telefones
FROM epcs e
JOIN codigo_postal cod ON e.codigo_postal = cod.codigo_postal
LEFT JOIN email_epcs email ON e.nif = email.epcs
LEFT JOIN telefone tel ON e.nif = tel.epcs
GROUP BY e.nif, e.nome, e.morada, e.codigo_postal, cod.Localidade
ORDER BY e.nif;

-- Query 3: Viaturas com status de inspeção e estado de missão por EPCS
SELECT 
  v.matricula,  v.marca, v.tipo, v.data_matricula,
  v.data_inspecao_anterior, v.data_inspecao_proxima,
  e.nome AS epcs_nome,
  CASE WHEN v.data_inspecao_proxima >= CURRENT_DATE THEN 'Inspecao em dia' ELSE 'Inspecao atrasada' END AS status_inspecao,
  CASE WHEN v.em_missao = 1 THEN 'Em missão' ELSE 'Disponível' END AS estado_missao
FROM viatura v
JOIN epcs e ON v.epcs = e.nif
ORDER BY e.nif;

-- Query 4: Equipamentos por viatura, com tipo de equipamento, intervalo de inspeção e validação
SELECT 
  v.matricula, v.marca, 
  eq.numero_serie, eq.descricao, eq.quantidade,
  tipo_eq.tipo AS tipo_equipamento,
  DATEDIFF(eq.data_inspecao_proxima, eq.data_inspecao_anterior) AS intervalo_inspecoes_marcadas,
  tipo_eq.intervalo_inspecao,
  CASE WHEN DATEDIFF(eq.data_inspecao_proxima, eq.data_inspecao_anterior) > tipo_eq.intervalo_inspecao THEN 'Inspecao atrasada' ELSE 'Inspecao ok' END AS status_inspecao
FROM equipamento eq
JOIN viatura v ON eq.viatura = v.matricula
JOIN tipo_equipamento tipo_eq ON eq.tipo = tipo_eq.idTipo
ORDER BY v.matricula;

-- Query 5: Missões com tipo de missão, profissionais e pacientes assistidos
SELECT 
  m.id_missao, 
  tipo_m.tipo AS tipo_missao, 
  v.matricula,
  COUNT(DISTINCT p.profissional) AS numero_profissionais,
  GROUP_CONCAT(DISTINCT p.profissional ORDER BY p.profissional SEPARATOR ', ') AS profissionais,
  COUNT(DISTINCT a.paciente) AS numero_pacientes_assistidos,
  GROUP_CONCAT(DISTINCT a.paciente ORDER BY a.paciente SEPARATOR ', ') AS pacientes_assistidos
FROM missao m
JOIN tipo_missao tipo_m ON m.tipo = tipo_m.idtipo
JOIN viatura v ON m.viatura = v.matricula
LEFT JOIN pertence p ON p.missao = m.id_missao 
LEFT JOIN assistencia a ON a.missao = m.id_missao
GROUP BY m.id_missao, tipo_m.tipo, v.matricula
ORDER BY m.id_missao;

-- Query 6: Profissionais por categoria com localidade, contacto e estado ativo em missões
SELECT 
  prof.nif, 
  prof.cc, 
  prof.cedula_profissional, 
  prof.nome, 
  prof.morada, 
  prof.cod_postal, 
  cod.localidade, 
  prof.data_nascimento,
  c.descricao AS categoria,
  GROUP_CONCAT(DISTINCT tel.telefone ORDER BY tel.telefone SEPARATOR '; ') AS telefones,
  CASE 
    WHEN EXISTS (
      SELECT 1 
      FROM pertence p 
      WHERE p.profissional = prof.nif AND p.ativo = 1
    ) THEN 'Ativo em missão' 
    ELSE 'Inativo' 
  END AS estado_missao
FROM profissionais prof
JOIN categoria c ON prof.categoria = c.idCategoria
JOIN telefone tel ON prof.nif = tel.profissional
JOIN codigo_postal cod ON prof.cod_postal = cod.codigo_postal
GROUP BY 
  prof.nif, prof.cc, prof.cedula_profissional, prof.nome, prof.morada, prof.cod_postal, 
  cod.localidade, prof.data_nascimento, c.descricao
ORDER BY prof.categoria;

-- Query 7: Pacientes com localidade e telefone
SELECT 
  p.idpaciente, p.cc, p.nif,  p.nome, p.morada, p.cod_postal, cod.Localidade, p.data_nascimento, 
  GROUP_CONCAT(DISTINCT tel.telefone ORDER BY tel.telefone SEPARATOR '; ') AS telefones
FROM pacientes p
LEFT JOIN telefone tel ON p.nif = tel.paciente
LEFT JOIN codigo_postal cod ON p.cod_postal = cod.codigo_postal
GROUP BY 
  p.idpaciente, p.cc, p.nif,  p.nome, p.morada, p.cod_postal, cod.Localidade, p.data_nascimento
ORDER BY p.idpaciente;







