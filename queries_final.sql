-- Queries

-- Querie 1: Listar as EPCS organizadas por ULS e grupo
SELECT e.*, u.nome AS uls_nome, u.grupo
FROM epcs e
JOIN uls u ON e.uls = u.idULS
ORDER BY u.idULS, u.grupo;

-- Querie 2: Lista as epcs por localidade
SELECT e.*, cod.Localidade
FROM epcs e
JOIN codigo_postal cod ON e.codigo_postal = cod.codigo_postal
ORDER BY cod.localidade;

-- Querie 3: Lista os emails por epcs
SELECT email.*, e.nome as nome_epcs
FROM epcs e 
JOIN email_epcs email ON e.nif = email.epcs
ORDER BY e.nif;

-- Querie 4: Listar os telefones por epcs 
SELECT tel.telefone, tel.epcs, e.nome as nome_epcs
FROM epcs e
JOIN telefone tel ON e.nif = tel.epcs;

-- Querie 5: Listar as viaturas por epcs e tipos de viaturas
SELECT v.*, tipo_v.tipo as tipo_viatura, e.nome as epcs_nome
FROM viatura v
JOIN epcs e ON e.nif = v.epcs
JOIN tipo_viatura tipo_v ON v.tipo= tipo_v.idTipo
ORDER BY v.epcs, tipo_v.tipo;

-- Querie 6: Lista todas as viaturas em missão por epcs
SELECT v.*, e.nome as nome_epcs
FROM viatura v
JOIN epcs e ON e.nif = v.epcs
WHERE v.em_missao = 1
ORDER BY v.epcs;

-- Querie 7: Determinar o intervalo entre as inspecoes marcadas e comparar com o intervalo de inspecao especido para cada equipamento
SELECT eq.numero_serie, eq.descricao, eq.quantidade, eq.tipo, DATEDIFF(eq.data_inspecao_proxima, data_inspecao_anterior) as intervalo_inspecoes_marcadas, eq.viatura, tipo_eq.intervalo_inspecao
FROM equipamento eq
JOIN tipo_equipamento tipo_eq ON eq.tipo=tipo_eq.idTipo
ORDER BY eq.numero_serie;

-- Querie 8: Listar as viaturas com os tipos de equipamentos e quantidades existentes
SELECT v.*, eq.tipo,  tipo_eq.tipo as tipo_equipamentos,  eq.quantidade as quantidade_equipamentos
FROM equipamento eq 
JOIN viatura v ON v.matricula = eq.viatura
JOIN tipo_equipamento tipo_eq ON eq.tipo = tipo_eq.idTipo
ORDER BY v.matricula, tipo_eq.tipo, eq.quantidade;

-- Querie 9: Listar todas as viaturas por tipos de missao
SELECT v.*, tipo_m.idtipo as idtipo_missao, tipo_m.tipo as tipo_missao
FROM missao m
JOIN tipo_missao tipo_m ON m.tipo=tipo_m.idtipo
JOIN viatura v ON m.viatura=v.matricula
ORDER BY tipo_m.idtipo;

-- Querie 10: Visualizar os profissionais por categoria e atividade
SELECT prof.*, c.descricao as descricao_categoria, p.ativo
FROM pertence p
JOIN profissionais prof ON prof.nif=p.profissional
JOIN categoria c ON c.idCategoria= prof.categoria
ORDER BY prof.categoria, p.ativo;

-- Querie 11: Visualizar os pacientes assistidos por tipo de missão
SELECT p.*, tipo_m.tipo as tipo_missao
FROM assistencia a
JOIN pacientes p ON a.paciente=p.idpaciente
JOIN missao m ON a.missao = m.id_missao
JOIN tipo_missao tipo_m ON m.tipo=tipo_m.idtipo
ORDER BY tipo_m.idtipo;

-- Querie 12: Listar missões por tipo de missao e atividade
SELECT m.*, tipo_m.tipo as tipo_missao, p.ativo
FROM missao m
JOIN tipo_missao tipo_m ON m.tipo=tipo_m.idtipo
JOIN pertence p ON p.missao= m.id_missao
ORDER BY tipo_m.idtipo, p.ativo;

-- Querie 13: Determinar a quantidade de profissionais, por missao e categoria 
SELECT p.missao, c.descricao, COUNT(*) as quantidade
FROM pertence p
JOIN profissionais prof ON p.profissional=prof.nif
JOIN categoria c ON prof.categoria=c.idCategoria
GROUP BY p.missao, c.descricao
ORDER BY p.missao;






