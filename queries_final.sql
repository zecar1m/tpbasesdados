use hospitais;

-- Querie 1: Listar as EPCS organizadas por ULS e grupo
SELECT e.nif, e.nregisto, e.nome, e.morada, e.codigo_postal, u.nome AS uls_nome, u.grupo
FROM epcs e
JOIN uls u ON e.uls = u.idULS
ORDER BY u.grupo, u.idULS;

-- Querie 2: Visualizar a localidade de uma determinada EPCS (ex: '501234567')
SELECT e.nif, e.nome, cod.localidade
FROM epcs e
JOIN codigo_postal cod ON e.codigo_postal = cod.codigo_postal
WHERE e.nif='501234567';

-- Querie 3: Visualizar a existência de pelo menos uma EPCS por localidade
SELECT cod.localidade, COUNT(*) AS quantidade_epcs
FROM epcs e
JOIN codigo_postal cod ON e.codigo_postal = cod.codigo_postal
GROUP BY cod.localidade
ORDER BY quantidade_epcs DESC;

-- Querie 4: Visualizar os emails de uma determinada EPCS (ex: '501234567')
SELECT email.*, e.nome as nome_epcs
FROM epcs e 
JOIN email_epcs email ON e.nif = email.epcs
WHERE e.nif = '501234567';

-- Querie 5: Visualizar os telefones de uma determinada EPCS (ex: '501234567')
SELECT tel.telefone, tel.epcs, e.nome as nome_epcs
FROM epcs e
JOIN telefone tel ON e.nif = tel.epcs
WHERE e.nif = '501234567';

-- Querie 6: Visualizar todas as viaturas de uma determinada EPCS (ex:'501234567')
SELECT v.*, e.nome as epcs_nome
FROM viatura v
JOIN epcs e ON e.nif = v.epcs
WHERE e.nif='501234567';

-- Querie 7: Visualizar viaturas ativas de uma determinada EPCS (ex:'501234567')
SELECT v.*, e.nome as nome_epcs
FROM viatura v
JOIN epcs e ON e.nif = v.epcs
WHERE e.nif = '501234567' AND v.em_missao = 1;

-- Querie 8: Verificar que as datas marcadas para as inspeções se encontram no intervalo de inspeção específico para cada equipamento
SELECT eq.numero_serie, DATEDIFF(eq.data_inspecao_proxima, data_inspecao_anterior) as intervalo_inspecoes_marcadas, tipo_eq.intervalo_inspecao
FROM equipamento eq
JOIN tipo_equipamento tipo_eq ON eq.tipo=tipo_eq.idTipo
ORDER BY eq.numero_serie;

-- Querie 9: Visualizar missões se encontram ativas
SELECT m.*
FROM missao m
JOIN pertence p ON p.missao=m.id_missao
WHERE p.ativo=1;

-- Querie 10: Visualizar o paciente assistido a uma determinada hora e missão (ex: 2021-01-10 08:30:00 e missão 1)
SELECT p.*
FROM assistencia a
JOIN pacientes p ON p.idpaciente=a.paciente
WHERE a.missao= 1 AND a.data_hora_assist='2021-01-10 08:30:00';

-- Querie 11: Visualizar os profissionais que participaram numa determinada missão (ex: missão 1)
SELECT prof.*
FROM pertence p
JOIN profissionais prof ON p.profissional = prof.nif
WHERE p.missao=1;

-- Querie 12: Visualizar a quantidade de profissionais, por categoria e missão 
SELECT p.missao, c.descricao, COUNT(*) as quantidade
FROM pertence p
JOIN profissionais prof ON p.profissional=prof.nif
JOIN categoria c ON prof.categoria=c.idCategoria
GROUP BY p.missao, c.descricao
ORDER BY p.missao;






