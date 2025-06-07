use hospitais;
-- -----------------------------POVOAR TABELA CODIGO_POSTAL-------------------------------------------------------------------------
INSERT INTO Codigo_postal (codigo_postal, Localidade) VALUES 
('1000-001', 'Lisboa'),
('8000-002', 'Faro'),
('4000-003', 'Porto'),
('3000-004', 'Coimbra'),
('4700-005', 'Braga'),
('7000-006', 'Évora'),
('8200-007', 'Albufeira'),
('3500-008', 'Viseu'),
('2900-009', 'Setúbal'),
('2400-010', 'Leiria'),
('3800-011', 'Aveiro'),
('2000-012', 'Santarém'),
('5000-013', 'Vila Real'),
('4800-014', 'Guimarães'),
('9000-015', 'Funchal'),
('6200-016', 'Covilhã'),
('7800-017', 'Beja'),
('7300-018', 'Portalegre'),
('6300-019', 'Guarda'),
('2300-020', 'Tomar'),
('4900-021', 'Viana do Castelo'),
('2500-022', 'Caldas da Rainha'),
('5100-023', 'Lamego'),
('5300-024', 'Bragança'),
('8700-025', 'Olhão'),
('5000-027', 'Vila Franca de Xira'),
('5400-028', 'Chaves'),
('2560-029', 'Torres Vedras'),
('9500-030', 'Ponta Delgada');

-- ---------------------------------POVOAR TABELA ULS--------------------------------------------------------------------------------

INSERT INTO ULS (nome, grupo) VALUES
  -- Grupo B: ULS de menor dimensão e complexidade
  ('ULS Baixo Mondego', 'B'),
  ('ULS Barcelos/Esposende', 'B'),
  ('ULS Castelo Branco', 'B'),
  ('ULS Guarda', 'B'),
  ('ULS Litoral Alentejano', 'B'),
  ('ULS Médio Ave', 'B'),
  ('ULS Nordeste', 'B'),
  ('ULS Oeste', 'B'),
  ('ULS Póvoa de Varzim/Vila do Conde', 'B'),

  -- Grupo C: ULS de dimensão e complexidade intermédias
  ('ULS Alto Alentejo', 'C'),
  ('ULS Alto Ave', 'C'),
  ('ULS Alto Minho', 'C'),
  ('ULS Arco Ribeirinho', 'C'),
  ('ULS Arrábida', 'C'),
  ('ULS Aveiro', 'C'),
  ('ULS Baixo Alentejo', 'C'),
  ('ULS Cova da Beira', 'C'),
  ('ULS Entre Douro e Vouga', 'C'),
  ('ULS Estuário do Tejo', 'C'),
  ('ULS Leiria', 'C'),
  ('ULS Lezíria', 'C'),
  ('ULS Loures-Odivelas', 'C'),
  ('ULS Matosinhos', 'C'),
  ('ULS Médio Tejo', 'C'),
  ('ULS Tâmega e Sousa', 'C'),
  ('Hospital de Cascais (PPP)', 'C'),

  -- Grupo D: ULS de maior dimensão e complexidade
  ('ULS Alentejo Central', 'D'),
  ('ULS Algarve', 'D'),
  ('ULS Almada-Seixal', 'D'),
  ('ULS Amadora/Sintra', 'D'),
  ('ULS Braga', 'D'),
  ('ULS Dão-Lafões', 'D'),
  ('ULS Trás-os-Montes e Alto Douro', 'D'),
  ('ULS Vila Nova de Gaia/Espinho', 'D'),

  -- Grupo E: ULS com hospitais universitários e de alta diferenciação
  ('ULS Coimbra', 'E'),
  ('ULS Lisboa Ocidental', 'E'),
  ('ULS Santa Maria (Lisboa Norte)', 'E'),
  ('ULS Santo António', 'E'),
  ('ULS São João', 'E'),
  ('ULS São José', 'E'),

  -- Grupo F: Institutos Portugueses de Oncologia (IPO)
  ('IPO Coimbra', 'F'),
  ('IPO Lisboa', 'F'),
  ('IPO Porto', 'F');

-- -------------------------------------------------POVOAR TIPO_EQUIPAMENTO---------------------------------------------------------
INSERT INTO Tipo_equipamento (idTipo, tipo, intervalo_inspecao) VALUES
('AMB001', 'Maca para transporte de pacientes', 365),
('AMB002', 'Desfibrilhador externo automático (DEA)', 365),
('AMB003', 'Monitor de sinais vitais', 180),
('AMB004', 'Respirador portátil', 180),
('AMB005', 'Kit de primeiros socorros', 180),
('AMB006', 'Dispositivos de imobilização', 365),
('AMB007', 'Material de higiene e desinfeção', 180),
('AMB008', 'Equipamento de comunicação (rádio)', 365),
('AMB009', 'Sistema de oxigénio portátil', 365),
('AMB010', 'Bomba de infusão intravenosa', 180),
('AMB011', 'Ventilador portátil de emergência', 180),
('AMB012', 'Cadeira de rodas', 365);

-- -------------------------------------POVOAR TIPO_VIATURA---------------------------------------------------------------------------
INSERT INTO Tipo_viatura (idTipo, tipo) VALUES
('V001', 'Ambulância de Emergência'),
('V002', 'Ambulância de Transporte de doentes'),
('V003', 'Carro de Emergência médica'),
('V004', 'Mota de Emergência médica'),
('V005', 'Ambulância especializada'),
('V006', 'Helicoptero'),
('V007', 'Barco de emergência');

-- -----------------------------------------POVOAR CATEGORIA-----------------------------------------------------------------
INSERT INTO Categoria (idCategoria, descricao) VALUES
('C001', 'Médico'),
('C002', 'Enfermeiro'),
('C003', 'Paramédico'),
('C004', 'Motorista'),
('C005', 'Assistente Social'),
('C006', 'Psicólogo'),
('C007', 'Técnico de Ambulância'),
('C008', 'Coordenador'),
('C009', 'Diretor Clínico'),
('C010', 'Médico Especialista'),
('C011', 'Auxiliar de Saúde'),
('C012', 'Enfermeiro Auxiliar'),
('C013', 'Médico Interno'),
('C014', 'Médico Chefe'),
('C015', 'Enfermeiro Chefe');

-- -------------------------------------------POVOAR TIPO_MISSAO---------------------------------------------------------------
INSERT INTO Tipo_missao (idtipo, tipo) VALUES
('TM001', 'Transporte de Paciente'),
('TM002', 'Intervenção Rápida'),
('TM003', 'Suporte Avançado'),
('TM004', 'Transferência Hospitalar'),
('TM005', 'Atendimento Domiciliário'),
('TM006', 'Formação de treino'),
('TM007', 'Transporte de Órgãos'),
('TM008', 'Suporte Psicológico');

-- -----------------------------------------POVOAR EPCS-----------------------------------------------------------------
INSERT INTO EPCS (nif, nregisto, nome, morada, codigo_postal, uls) VALUES
(501234567, 17834, 'Hospital de Braga', 'Rua das Oliveiras, 123', '4700-005', 5),
(502345678, 19217, 'Centro de Saúde de Faro', 'Av. da Liberdade, 456', '8000-002', 2),
(503456789, 18590, 'Hospital de Coimbra', 'Praça da República, 789', '3000-004', 4),
(504567890, 16381, 'Centro de Saúde de Évora', 'Rua do Alentejo, 101', '7000-006', 6),
(505678901, 14923, 'Hospital de Viseu', 'Av. Central, 202', '3500-008', 8),
(506789012, 17468, 'Centro de Saúde de Setúbal', 'Rua das Flores, 303', '2900-009', 9),
(507890123, 19802, 'Hospital de Leiria', 'Largo do Hospital, 404', '2400-010', 10),
(508901234, 15577, 'Centro de Saúde de Aveiro', 'Av. das Pontes, 505', '3800-011', 11),
(509012345, 18245, 'Hospital de Santarém', 'Rua da Saúde, 606', '2000-012', 12),
(510123456, 16739, 'Centro de Saúde de Guimarães', 'Tv. do Castelo, 707', '4800-014', 14),
(511234567, 19456, 'Hospital de Funchal', 'Av. do Mar, 12', '9000-015', 31),
(512345678, 17328, 'Centro de Saúde da Covilhã', 'Rua Serra da Estrela, 33', '6200-016', 17),
(513456789, 18774, 'Hospital de Beja', 'Av. do Hospital, 81', '7800-017', 16),
(514567890, 19965, 'Centro de Saúde de Portalegre', 'Rua das Oliveiras, 58', '7300-018', 10),
(515678901, 15111, 'Hospital da Guarda', 'Rua da Estação, 42', '6300-019', 4),
(516789012, 16527, 'Centro de Saúde de Tomar', 'Rua do Nabão, 15', '2300-020', 23),
(517890123, 18044, 'Hospital de Viana do Castelo', 'Av. Atlântica, 77', '4900-021', 13),
(518901234, 19658, 'Centro de Saúde de Caldas da Rainha', 'Rua do Termal, 99', '2500-022', 8),
(519012345, 15890, 'Hospital de Lamego', 'Rua dos Combatentes, 111', '5100-023', 7),
(520123456, 19122, 'Centro de Saúde de Bragança', 'Av. do Nordeste, 88', '5300-024', 6),
(521234567, 17733, 'Hospital de Olhão', 'Rua do Pescador, 70', '8700-025', 2),
(522345678, 16661, 'Centro de Saúde de Vila Franca de Xira', 'Av. Tejo, 45', '5000-027', 18),
(523456789, 15472, 'Hospital de Chaves', 'Rua das Termas, 81', '5400-028', 7),
(524567890, 19777, 'Centro de Saúde de Torres Vedras', 'Rua do Castelo, 39', '2560-029', 8),
(525678901, 18345, 'Hospital de Ponta Delgada', 'Av. Açores, 10', '9500-030', 1),
(526789012, 14566, 'Centro de Saúde de Lisboa', 'Rua da Liberdade, 12', '1000-001', 33),
(527890123, 16012, 'Hospital de Almada-Seixal', 'Av. do Mar, 42', '2900-009', 29),
(528901234, 14789, 'Centro de Saúde de Vila Real', 'Rua do Hospital, 87', '5000-013', 30),
(529012345, 17581, 'Hospital de Aveiro Norte', 'Av. Universidade, 65', '3800-011', 15),
(530123456, 16944, 'Centro de Saúde do Fundão', 'Rua das Escolas, 19', '6200-016', 17);

-- --------------------------------------POVOAR EMAIL_EPCS-----------------------------------------------------------------
INSERT INTO Email_epcs (email, epcs) VALUES
-- 1 Hospital de Braga
('secretaria.bragahospital@saude.pt', 501234567),
('urgencias.bragahospital@saude.pt', 501234567),
('administracao.bragahospital@saude.pt', 501234567),
('contactos.bragahospital@saude.pt', 501234567),

-- 2 Centro de Saúde de Faro
('secretaria.csfaro@saude.pt', 502345678),
('triagem.csfaro@saude.pt', 502345678),
('administracao.csfaro@saude.pt', 502345678),
('contactos.csfaro@saude.pt', 502345678),

-- 3 Hospital de Coimbra
('secretaria.hcoimbra@saude.pt', 503456789),
('urgencias.hcoimbra@saude.pt', 503456789),
('administracao.hcoimbra@saude.pt', 503456789),
('contactos.hcoimbra@saude.pt', 503456789),

-- 4 Centro de Saúde de Évora
('secretaria.csevora@saude.pt', 504567890),
('triagem.csevora@saude.pt', 504567890),
('administracao.csevora@saude.pt', 504567890),
('contactos.csevora@saude.pt', 504567890),

-- 5 Hospital de Viseu
('secretaria.hviseu@saude.pt', 505678901),
('urgencias.hviseu@saude.pt', 505678901),
('administracao.hviseu@saude.pt', 505678901),
('contactos.hviseu@saude.pt', 505678901),

-- 6 Centro de Saúde de Setúbal
('secretaria.cssetubal@saude.pt', 506789012),
('triagem.cssetubal@saude.pt', 506789012),
('administracao.cssetubal@saude.pt', 506789012),

-- 7 Hospital de Leiria
('secretaria.hleiria@saude.pt', 507890123),
('urgencias.hleiria@saude.pt', 507890123),
('administracao.hleiria@saude.pt', 507890123),
('contactos.hleiria@saude.pt', 507890123),

-- 8 Centro de Saúde de Aveiro
('secretaria.csaveiro@saude.pt', 508901234),
('triagem.csaveiro@saude.pt', 508901234),
('administracao.csaveiro@saude.pt', 508901234),

-- 9 Hospital de Santarém
('secretaria.hsantarem@saude.pt', 509012345),
('urgencias.hsantarem@saude.pt', 509012345),
('administracao.hsantarem@saude.pt', 509012345),
('contactos.hsantarem@saude.pt', 509012345),

-- 10 Centro de Saúde de Guimarães
('secretaria.csguimaraes@saude.pt', 510123456),
('triagem.csguimaraes@saude.pt', 510123456),
('administracao.csguimaraes@saude.pt', 510123456),

-- 11 Hospital de Vila Nova de Gaia
('secretaria.hvng@saude.pt', 511234567),
('urgencias.hvng@saude.pt', 511234567),
('administracao.hvng@saude.pt', 511234567),

-- 12 Centro de Saúde de Braga
('secretaria.csbraga@saude.pt', 512345678),
('triagem.csbraga@saude.pt', 512345678),
('administracao.csbraga@saude.pt', 512345678),

-- 13 Hospital de Faro
('secretaria.hfaro@saude.pt', 513456789),
('urgencias.hfaro@saude.pt', 513456789),
('administracao.hfaro@saude.pt', 513456789),

-- 14 Centro de Saúde de Coimbra
('secretaria.cscoimbra@saude.pt', 514567890),
('triagem.cscoimbra@saude.pt', 514567890),
('administracao.cscoimbra@saude.pt', 514567890),

-- 15 Hospital de Évora
('secretaria.hevora@saude.pt', 515678901),
('urgencias.hevora@saude.pt', 515678901),
('administracao.hevora@saude.pt', 515678901),

-- 16 Centro de Saúde de Viseu
('secretaria.csviseu@saude.pt', 516789012),
('triagem.csviseu@saude.pt', 516789012),
('administracao.csviseu@saude.pt', 516789012),

-- 17 Hospital de Setúbal
('secretaria.hssetubal@saude.pt', 517890123),
('urgencias.hssetubal@saude.pt', 517890123),
('administracao.hssetubal@saude.pt', 517890123),

-- 18 Centro de Saúde de Leiria
('secretaria.csleiria@saude.pt', 518901234),
('triagem.csleiria@saude.pt', 518901234),
('administracao.csleiria@saude.pt', 518901234),

-- 19 Hospital de Aveiro
('secretaria.haveiro@saude.pt', 519012345),
('urgencias.haveiro@saude.pt', 519012345),
('administracao.haveiro@saude.pt', 519012345),

-- 20 Centro de Saúde de Santarém
('secretaria.cssantarem@saude.pt', 520123456),
('triagem.cssantarem@saude.pt', 520123456),
('administracao.cssantarem@saude.pt', 520123456),

-- 21 Hospital de Guimarães
('secretaria.hguimaraes@saude.pt', 521234567),
('urgencias.hguimaraes@saude.pt', 521234567),
('administracao.hguimaraes@saude.pt', 521234567),

-- 22 Centro de Saúde de Vila Nova de Gaia
('secretaria.csvng@saude.pt', 522345678),
('triagem.csvng@saude.pt', 522345678),
('administracao.csvng@saude.pt', 522345678),

-- 23 Hospital de Braga
('secretaria.hbraga@saude.pt', 523456789),
('urgencias.hbraga@saude.pt', 523456789),
('administracao.hbraga@saude.pt', 523456789),

-- 24 Centro de Saúde de Faro
('secretaria.csfaro2@saude.pt', 524567890),
('triagem.csfaro2@saude.pt', 524567890),
('administracao.csfaro2@saude.pt', 524567890),

-- 25 Hospital de Coimbra
('secretaria.hcoimbra2@saude.pt', 525678901),
('urgencias.hcoimbra2@saude.pt', 525678901),
('administracao.hcoimbra2@saude.pt', 525678901),

-- 26 Centro de Saúde de Évora
('secretaria.csevora2@saude.pt', 526789012),
('triagem.csevora2@saude.pt', 526789012),
('administracao.csevora2@saude.pt', 526789012),

-- 27 Hospital de Viseu
('secretaria.hviseu2@saude.pt', 527890123),
('urgencias.hviseu2@saude.pt', 527890123),
('administracao.hviseu2@saude.pt', 527890123),

-- 28 Centro de Saúde de Setúbal
('secretaria.cssetubal2@saude.pt', 528901234),
('triagem.cssetubal2@saude.pt', 528901234),
('administracao.cssetubal2@saude.pt', 528901234),

-- 29 Hospital de Leiria
('secretaria.hleiria2@saude.pt', 529012345),
('urgencias.hleiria2@saude.pt', 529012345),
('administracao.hleiria2@saude.pt', 529012345),

-- 30 Centro de Saúde de Aveiro
('secretaria.csaveiro2@saude.pt', 530123456),
('triagem.csaveiro2@saude.pt', 530123456),
('administracao.csaveiro2@saude.pt', 530123456);

-- -----------------------------------------------POVOAR VIATURA------------------------------------------------------------------
INSERT INTO Viatura (matricula, marca, tipo, data_matricula, data_inspecao_anterior, data_inspecao_proxima, em_missao, epcs) VALUES
('23-CD-45', 'Ford', 'V002', '2019-07-22', '2023-07-20', '2024-07-20', 0, 502345678),
('78-MN-90', 'Toyota', 'V002', '2019-02-20', '2024-02-18', '2025-02-18', 0, 507890123),
('66-EF-90', 'Fiat', 'V005', '2018-01-05', '2024-01-02', '2025-12-31', 1, 516789012),
('60-WX-89', 'Peugeot', 'V005', '2017-09-09', '2023-09-06', '2025-09-06', 1, 525678901),

('45-GH-67', 'Volkswagen', 'V001', '2021-05-30', '2023-05-25', '2024-05-25', 0, 504567890),
('89-OP-12', 'Citroën', 'V003', '2020-06-10', '2024-06-05', '2025-06-10', 1, 508901234),
('77-GH-01', 'Toyota', 'V004', '2019-05-19', '2023-05-17', '2025-05-17', 0, 517890123),
('70-YZ-90', 'Fiat', 'V001', '2018-11-30', '2024-11-28', '2025-11-28', 0, 526789012),
('12-AB-34', 'Mercedes', 'V001', '2018-03-12', '2024-03-10', '2025-12-10', 1, 501234567),

('10-MN-34', 'Hyundai', 'V005', '2017-08-14', '2023-08-10', '2024-08-10', 0, 520123456),
('01-ST-34', 'Hyundai', 'V005', '2017-12-15', '2023-12-10', '2025-12-10', 0, 510123456),
('56-IJ-78', 'Peugeot', 'V005', '2017-11-11', '2024-11-10', '2025-11-10', 1, 505678901);


-- ---------------------------------------POVOAR EQUIPAMENTO-----------------------------------------------------------------
INSERT INTO Equipamento (numero_serie, descricao, quantidade, tipo, data_inspecao_anterior, data_inspecao_proxima, viatura) VALUES
('184203', 'FERNO 26-M', 2, 'AMB001', '2024-12-05', '2025-12-05', '23-CD-45'),  
('902317', 'Zoll AED Plus', 1, 'AMB002', '2024-12-05', '2025-12-05', '45-GH-67'),  
('635190', 'GE Carescape V100', 3, 'AMB003', '2025-03-07', '2025-09-01', '66-EF-90'),  
('748210', 'Weinmann Medumat Standard²', 2, 'AMB004', '2025-03-07', '2025-09-01', '12-AB-34'),  
('384762', 'First Aid Elite Kit', 5, 'AMB005', '2025-03-07', '2025-09-01', '10-MN-34'),  
('120874', 'Spencer Shell', 1, 'AMB006', '2024-12-05', '2025-12-05', '12-AB-34'), 
('569803', 'CleanPack Pro', 3, 'AMB007', '2025-03-07', '2025-09-01', '60-WX-89'),  
('981374', 'Kenwood NX-5200', 2, 'AMB008', '2024-12-05', '2025-12-05', '56-IJ-78'),  
('236701', 'Oxylitre 3L', 4, 'AMB009', '2024-12-05', '2025-12-05', '78-MN-90'),  
('654901', 'Baxter SIGMA Spectrum', 1, 'AMB010', '2025-03-07', '2025-09-01', '89-OP-12'),  
('879135', 'Hamilton T1', 2, 'AMB011', '2025-03-07', '2025-09-01', '77-GH-01'), 
('713460', 'Invacare Action 3', 1, 'AMB012', '2024-12-05', '2025-12-05', '01-ST-34'),  
('419062', 'Laerdal Stifneck', 3, 'AMB006', '2024-12-05', '2025-12-05', '70-YZ-90'), 
('560721', 'Defibtech Lifeline VIEW', 2, 'AMB002', '2024-12-05', '2025-12-05', '89-OP-12'),  
('847392', 'Philips HeartStart FRx', 4, 'AMB002', '2024-12-05', '2025-12-05', '45-GH-67'),  
('395084', '3M Littmann Classic III', 3, 'AMB003', '2025-03-07', '2025-09-01', '66-EF-90'),  
('902846', 'Philips Respironics', 2, 'AMB004', '2025-03-07', '2025-09-01', '66-EF-90'),  
('137658', 'Adventure Medical Kit', 5, 'AMB005', '2025-03-07', '2025-09-01', '77-GH-01'),  
('861940', 'ASP Traction Splint', 1, 'AMB006', '2024-12-05', '2025-12-05', '12-AB-34'),  
('741209', 'Motorola XPR 7550', 3, 'AMB008', '2024-12-05', '2025-12-05', '56-IJ-78');  


-- ------------------------------------------POVOAR MISSAO-------------------------------------------------------------------------

INSERT INTO Missao (tipo, descricao, viatura) VALUES
-- TM001: transporte de doentes estáveis ou urgentes (tipo V002, V005)
('TM001', 'Transporte urgente de paciente em estado crítico', '23-CD-45'),
('TM001', 'Transporte de paciente estável para consulta externa', '78-MN-90'),
('TM001', 'Transporte de paciente para cirurgia programada', '66-EF-90'),
('TM001', 'Transporte de paciente para exames complementares', '60-WX-89'),

-- TM002: intervenção rápida (V001, V003, V004)
('TM002', 'Intervenção rápida para acidente rodoviário', '45-GH-67'),
('TM002', 'Intervenção rápida em incêndio com vítimas', '89-OP-12'),
('TM002', 'Intervenção rápida em acidente industrial', '77-GH-01'),
('TM002', 'Intervenção rápida em acidente doméstico com múltiplas vítimas', '70-YZ-90'),

-- TM003: suporte avançado (V001, V003, V004)
('TM003', 'Suporte avançado em unidade móvel no local', '12-AB-34'),
('TM003', 'Suporte avançado em acidente de viação múltipla', '45-GH-67'),
('TM003', 'Suporte avançado em evento desportivo de grande escala', '89-OP-12'),
('TM003', 'Suporte avançado em operações de resgate em zonas rurais', '77-GH-01'),

-- TM004: transferências hospitalares (V001, V005)
('TM004', 'Transferência hospitalar programada para tratamento especializado', '66-EF-90'),
('TM004', 'Transferência hospitalar neonatal para unidade especializada', '60-WX-89'),
('TM004', 'Transferência hospitalar para tratamento oncológico', '10-MN-34'),
('TM004', 'Transferência hospitalar para tratamento intensivo', '01-ST-34'),

-- TM005: atendimento domiciliário (V005)
('TM005', 'Atendimento domiciliário a paciente com mobilidade reduzida', '10-MN-34'),
('TM005', 'Atendimento domiciliário a idoso com problemas respiratórios', '56-IJ-78'),
('TM005', 'Atendimento domiciliário para paciente com necessidades especiais', '01-ST-34'),
('TM005', 'Atendimento domiciliário para pacientes crónicos', '60-WX-89'),

-- TM006: formação e treino (V001, V003, V004, V005)
('TM006', 'Formação prática para novos condutores de ambulância', '12-AB-34'),
('TM006', 'Sessão de treino para primeiros socorros', '45-GH-67'),
('TM006', 'Formação teórica e prática para técnicos de emergência', '89-OP-12'),
('TM006', 'Simulação e treino em cenários de emergência', '56-IJ-78'),

-- TM007: transporte de órgãos (V002, V005)
('TM007', 'Transporte de órgãos para cirurgia urgente', '23-CD-45'),
('TM007', 'Transporte de órgãos entre hospitais de diferentes cidades', '66-EF-90'),
('TM007', 'Transporte urgente de órgãos para transplante', '78-MN-90'),

-- TM008: suporte psicológico (V005)
('TM008', 'Suporte psicológico a vítimas de desastre', '56-IJ-78'),
('TM008', 'Suporte psicológico a familiares em situação de emergência', '10-MN-34'),
('TM008', 'Suporte psicológico pós-catástrofe natural', '01-ST-34');



-- ------------------------------------------------------POVOAR PACIENTES-----------------------------------------------------------
INSERT INTO Pacientes (cc, nif, nome, morada, cod_postal, data_nascimento) VALUES
(23456789, 234567891, 'Carolina Melo', 'Rua das Camélias 4', '4900-021', '1965-04-15'),
(34567891, 345678912, 'João Silva', 'Avenida do Castelo 10', '2500-022', '2001-09-08'),
(45678912, 456789123, 'Patrícia Teixeira', 'Rua do Sol 29', '5100-023', '1955-07-21'),
(56789123, 567891234, 'Ricardo Mendes', 'Rua do Pinhal 17', '5300-024', '1970-11-30'),
(67891234, 678912345, 'Lúcia Almeida', 'Largo da Fonte 3', '8700-025', '1983-06-10'),
(78912345, 789123456, 'André Lopes', 'Rua do Jardim 22', '5000-027', '1999-12-01'),
(89123456, 891234567, 'Sandra Costa', 'Avenida da Liberdade 7', '5400-028', '2005-03-18'),
(91234567, 912345678, 'Miguel Ribeiro', 'Travessa Nova 5', '2560-029', '1948-10-09'),
(10234568, 102345689, 'Rita Gomes', 'Rua do Mercado 14', '9500-030', '1960-02-25'),
(11234569, 112345690, 'Joana Nunes', 'Rua do Campo 11', '1000-001', '2003-08-12'),
(12234570, 122345701, 'Pedro Martins', 'Largo do Teatro 6', '8000-002', '1995-11-07'),
(13234571, 132345712, 'Cláudia Silva', 'Rua das Flores 8', '4000-003', '1987-04-03'),
(14234572, 142345723, 'Tiago Carvalho', 'Rua da Liberdade 23', '3000-004', '1973-01-25'),
(15234573, 152345734, 'Sofia Pereira', 'Avenida Central 9', '4700-005', '1969-05-16'),
(16234574, 162345745, 'Nuno Santos', 'Rua do Sol 18', '7000-006', '1982-09-29'),
(17234575, 172345756, 'Isabel Rodrigues', 'Travessa das Flores 20', '8200-007', '1958-12-14'),
(18234576, 182345767, 'Carlos Almeida', 'Rua da Alegria 4', '3500-008', '2000-07-19'),
(19234577, 192345778, 'Mariana Silva', 'Rua Nova 12', '2900-009', '1977-03-30'),
(20234578, 202345789, 'Bruno Fernandes', 'Rua das Laranjeiras 30', '2400-010', '1993-10-10'),
(21234579, 212345790, 'Helena Marques', 'Avenida do Mar 45', '3800-011', '1963-06-24'),
(22234580, 222345801, 'Miguel Lopes', 'Rua do Rio 16', '2000-012', '1980-02-15'),
(23234581, 232345812, 'Ana Ferreira', 'Rua do Sol 33', '5000-013', '1996-07-04'),
(24234582, 242345823, 'Luís Almeida', 'Rua Nova 8', '4800-014', '1971-11-11'),
(25234583, 252345834, 'Sara Nunes', 'Avenida do Norte 5', '9000-015', '1988-05-20'),
(26234584, 262345845, 'Pedro Costa', 'Rua da Estrela 9', '6200-016', '1966-09-29'),
(27234585, 272345856, 'Rita Gomes', 'Rua das Flores 2', '7800-017', '2004-03-30'),
(28234586, 282345867, 'André Silva', 'Rua Nova 7', '7300-018', '1959-12-18'),
(29234587, 292345878, 'Cláudia Pereira', 'Largo do Mercado 11', '6300-019', '1976-08-14'),
(30234588, 302345889, 'Nuno Santos', 'Rua do Pinhal 20', '2300-020', '1990-01-27'),
(31234589, 312345890, 'Mariana Lopes', 'Rua Nova 14', '4900-021', '1962-06-08'),
(32234590, 322345901, 'Tiago Fernandes', 'Rua do Campo 6', '2500-022', '1985-10-30'),
(33234591, 332345912, 'Sofia Carvalho', 'Avenida do Castelo 13', '5100-023', '2002-02-14'),
(34234592, 342345923, 'Ricardo Almeida', 'Rua Nova 9', '5300-024', '1997-07-22'),
(35234593, 352345934, 'Ana Melo', 'Rua das Camélias 10', '8700-025', '1978-04-12'),
(36234594, 362345945, 'Carlos Santos', 'Rua do Jardim 21', '5000-027', '1964-09-05'),
(37234595, 372345956, 'Helena Costa', 'Travessa Nova 17', '5400-028', '1989-12-03'),
(38234596, 382345967, 'João Ribeiro', 'Rua do Mercado 19', '2560-029', '2000-05-16'),
(39234597, 392345978, 'Isabel Fernandes', 'Rua do Sol 28', '9500-030', '1957-03-25'),
(40234598, 402345989, 'Bruno Martins', 'Avenida Central 15', '1000-001', '1974-08-29');

-- -----------------------------------------POVOAR ASSISTENCIA----------------------------------------------------------------------
INSERT INTO Assistencia (data_hora_assist, missao, paciente) VALUES
('2025-01-01 08:00:00', 1, 5),
('2025-01-05 09:15:00', 2, 12),
('2025-01-10 07:45:00', 3, 8),
('2025-01-15 10:00:00', 4, 20),
('2025-01-20 11:30:00', 5, 3),
('2025-02-01 14:00:00', 6, 10),
('2025-02-03 08:30:00', 7, 2),
('2025-02-05 13:45:00', 8, 19),
('2025-02-10 09:00:00', 9, 14),
('2025-02-15 07:00:00', 10, 1),
('2025-03-01 08:30:00', 11, 6),
('2025-03-05 10:45:00', 12, 11),
('2025-03-10 12:00:00', 13, 4),
('2025-03-15 15:15:00', 14, 16),
('2025-03-20 09:45:00', 15, 17),
('2025-04-01 08:00:00', 16, 13),
('2025-04-05 09:15:00', 17, 15),
('2025-04-10 07:45:00', 18, 7),
('2025-04-15 10:00:00', 19, 9),
('2025-04-20 11:30:00', 20, 18),
('2025-05-01 14:00:00', 21, 20),
('2025-05-03 08:30:00', 22, 8),
('2025-05-05 13:45:00', 23, 5),
('2025-05-10 09:00:00', 24, 13),
('2025-05-15 07:00:00', 25, 19),
('2025-06-01 08:30:00', 26, 3),
('2025-06-05 10:45:00', 27, 12),
('2025-06-10 12:00:00', 28, 6),
('2025-06-15 15:15:00', 29, 1),
('2025-06-20 09:45:00', 30, 7);



-- -----------------------------------------POVOAR PROFISSIONAIS----------------------------------------------------------------
INSERT INTO Profissionais (nif, cc, cedula_profissional, nome, morada, cod_postal, data_nascimento, categoria) VALUES
(123456789, 987654321, 1001, 'Ana Silva', 'Rua do Comércio, 123', '1000-001', '1980-05-20', 'C001'),
(223456789, 887654321, 1002, 'João Santos', 'Avenida da Liberdade, 45', '8000-002', '1975-11-15', 'C002'),
(323456789, 787654321, 1003, 'Maria Costa', 'Rua de Santa Catarina, 67', '4000-003', '1990-07-03', 'C003'),
(423456789, 687654321, 1004, 'Pedro Lopes', 'Travessa do Carmo, 8', '3000-004', '1985-02-28', 'C004'),
(523456789, 587654321, 1005, 'Luisa Marques', 'Rua da Alegria, 12', '4700-005', '1992-09-10', 'C005'),
(623456789, 487654321, 1006, 'Ricardo Almeida', 'Avenida 5 de Outubro, 54', '7000-006', '1988-12-01', 'C006'),
(723456789, 387654321, 1007, 'Sara Pereira', 'Rua da Restauração, 89', '8200-007', '1979-04-23', 'C007'),
(823456789, 287654321, 1008, 'Manuel Rocha', 'Travessa do Olival, 7', '3500-008', '1991-10-05', 'C008'),
(923456789, 187654321, 1009, 'Paula Martins', 'Rua do Sol, 21', '2900-009', '1983-06-12', 'C009'),
(102345678, 987654322, 1010, 'Carlos Fernandes', 'Avenida do Brasil, 33', '2400-010', '1977-08-19', 'C010'),
(112345678, 887654322, 1011, 'Inês Gomes', 'Rua das Flores, 14', '3800-011', '1984-03-30', 'C011'),
(122345678, 787654322, 1012, 'Jorge Nunes', 'Travessa das Amoreiras, 16', '2000-012', '1993-07-21', 'C012'),
(132345678, 687654322, 1013, 'Marta Ribeiro', 'Rua do Norte, 22', '5000-013', '1978-11-10', 'C013'),
(142345678, 587654322, 1014, 'Tiago Carvalho', 'Avenida do Parque, 40', '4800-014', '1986-05-07', 'C014'),
(152345678, 487654322, 1015, 'Sofia Dias', 'Rua do Mercado, 55', '9000-015', '1990-01-15', 'C015'),
(162345678, 387654322, 1016, 'André Sousa', 'Travessa da Fonte, 28', '6200-016', '1982-09-02', 'C001'),
(172345678, 287654322, 1017, 'Helena Lopes', 'Rua do Castelo, 36', '7800-017', '1976-12-18', 'C002'),
(182345678, 187654322, 1018, 'Paulo Moreira', 'Avenida das Palmeiras, 42', '7300-018', '1987-03-14', 'C003'),
(192345678, 987654323, 1019, 'Carla Pinto', 'Rua do Jardim, 51', '6300-019', '1991-06-26', 'C004'),
(202345678, 887654323, 1020, 'Miguel Sousa', 'Travessa do Lagar, 60', '2300-020', '1985-08-09', 'C005'),
(212345678, 787654323, 1021, 'Ricardo Silva', 'Rua da Liberdade, 10', '4900-021', '1983-10-11', 'C006'),
(222345678, 687654323, 1022, 'Patrícia Melo', 'Avenida Central, 99', '2500-022', '1979-05-27', 'C007'),
(232345678, 587654323, 1023, 'Eduardo Costa', 'Rua Nova, 75', '5100-023', '1986-07-19', 'C008'),
(242345678, 487654323, 1024, 'Beatriz Marques', 'Travessa das Flores, 12', '5300-024', '1990-03-23', 'C009'),
(252345678, 387654323, 1025, 'João Moreira', 'Rua do Castelo, 44', '8700-025', '1982-11-05', 'C010'),
(262345678, 287654323, 1026, 'Margarida Sousa', 'Avenida do Mar, 88', '5000-027', '1978-01-18', 'C011'),
(272345678, 187654323, 1027, 'Filipe Pinto', 'Rua do Sol, 39', '5400-028', '1984-09-30', 'C012'),
(282345678, 987654324, 1028, 'Carolina Almeida', 'Travessa do Largo, 23', '2560-029', '1991-12-14', 'C013'),
(292345678, 887654324, 1029, 'Rui Fernandes', 'Rua do Comércio, 17', '9500-030', '1977-06-03', 'C014'),
(302345678, 787654324, 1030, 'Diana Lopes', 'Avenida da República, 66', '1000-001', '1985-04-20', 'C015'),
(312345678, 687654324, 1031, 'João Carvalho', 'Rua Nova, 55', '8000-002', '1990-08-15', 'C001'),
(322345678, 587654324, 1032, 'Ana Ribeiro', 'Travessa da Estação, 2', '4000-003', '1983-01-28', 'C002'),
(332345678, 487654324, 1033, 'Pedro Gomes', 'Rua do Campo, 101', '3000-004', '1975-12-12', 'C003'),
(342345678, 387654324, 1034, 'Marta Silva', 'Avenida das Flores, 20', '4700-005', '1991-11-11', 'C004'),
(352345678, 287654324, 1035, 'Sérgio Martins', 'Rua do Sol, 14', '7000-006', '1987-07-04', 'C005'),
(362345678, 187654324, 1036, 'Inês Almeida', 'Travessa do Mercado, 37', '8200-007', '1980-02-29', 'C006'),
(372345678, 987654325, 1037, 'Rafael Pereira', 'Rua do Porto, 89', '3500-008', '1979-09-18', 'C007'),
(382345678, 887654325, 1038, 'Sofia Lopes', 'Avenida Central, 70', '2900-009', '1993-05-07', 'C008'),
(392345678, 787654325, 1039, 'Tiago Fernandes', 'Rua da Fonte, 43', '2400-010', '1982-03-21', 'C009'),
(402345678, 687654325, 1040, 'Cláudia Santos', 'Travessa das Rosas, 31', '3800-011', '1988-10-09', 'C010');

-- --------------------------------------POVOAR PERTENCE--------------------------------------------------------------------
INSERT INTO Pertence (data_hora_inicio, missao, profissional, data_hora_fim, ativo) VALUES
('2025-01-01 08:00:00', 1, 123456789, '2025-01-01 12:00:00', 0),
('2025-01-05 09:15:00', 2, 223456789, '2025-01-05 13:30:00', 0),
('2025-01-10 07:45:00', 3, 323456789, '2025-01-10 11:45:00', 0),
('2025-01-15 10:00:00', 4, 423456789, NULL, 1),
('2025-01-20 11:30:00', 5, 523456789, '2025-01-20 14:00:00', 0),
('2025-02-01 14:00:00', 6, 623456789, NULL, 1),
('2025-02-03 08:30:00', 7, 723456789, '2025-02-03 12:30:00', 0),
('2025-02-05 13:45:00', 8, 823456789, '2025-02-05 17:00:00', 0),
('2025-02-10 09:00:00', 9, 923456789, NULL, 1),
('2025-02-15 07:00:00', 10, 102345678, '2025-02-15 11:15:00', 0),
('2025-03-01 08:30:00', 11, 112345678, NULL, 1),
('2025-03-05 10:45:00', 12, 122345678, '2025-03-05 13:30:00', 0),
('2025-03-10 12:00:00', 13, 132345678, NULL, 1),
('2025-03-15 15:15:00', 14, 142345678, '2025-03-15 18:00:00', 0),
('2025-03-20 09:45:00', 15, 152345678, NULL, 1),
('2025-04-01 08:00:00', 16, 162345678, '2025-04-01 12:00:00', 0),
('2025-04-05 09:15:00', 17, 172345678, NULL, 1),
('2025-04-10 07:45:00', 18, 182345678, '2025-04-10 11:45:00', 0),
('2025-04-15 10:00:00', 19, 192345678, NULL, 1),
('2025-04-20 11:30:00', 20, 202345678, '2025-04-20 14:00:00', 0),
('2025-05-01 14:00:00', 21, 123456789, NULL, 1),
('2025-05-03 08:30:00', 22, 223456789, '2025-05-03 12:30:00', 0),
('2025-05-05 13:45:00', 23, 323456789, NULL, 1),
('2025-05-10 09:00:00', 24, 423456789, '2025-05-10 12:30:00', 0),
('2025-05-15 07:00:00', 25, 523456789, NULL, 1),
('2025-06-01 08:30:00', 26, 623456789, '2025-06-01 11:30:00', 0),
('2025-06-05 10:45:00', 27, 723456789, NULL, 1),
('2025-06-10 12:00:00', 28, 823456789, '2025-06-10 15:30:00', 0),
('2025-06-15 15:15:00', 29, 923456789, NULL, 1),
('2025-06-20 09:45:00', 30, 102345678, '2025-06-20 13:00:00', 0);


-- --------------------------------------POVOAR TELEFONE-----------------------------------------------------------------
-- para epcs
INSERT INTO Telefone (telefone, epcs, profissional, paciente) VALUES
(220100101, 501234567, NULL, NULL),
(219876543, 502345678, NULL, NULL),
(229455667, 503456789, NULL, NULL),
(238123456, 504567890, NULL, NULL),
(234567890, 505678901, NULL, NULL),
(217654321, 506789012, NULL, NULL),
(211234567, 507890123, NULL, NULL),
(227891234, 508901234, NULL, NULL),
(213456789, 509012345, NULL, NULL),
(225678901, 510123456, NULL, NULL),
(238765432, 511234567, NULL, NULL),
(229998877, 512345678, NULL, NULL),
(212345678, 513456789, NULL, NULL),
(216789012, 514567890, NULL, NULL),
(223456789, 515678901, NULL, NULL),
(231234567, 516789012, NULL, NULL),
(219876780, 517890123, NULL, NULL),
(220987654, 518901234, NULL, NULL),
(217654987, 519012345, NULL, NULL),
(214567890, 520123456, NULL, NULL);

-- para profissionais
INSERT INTO Telefone (telefone, epcs, profissional, paciente) VALUES
(912345678, NULL, 123456789, NULL),
(913456789, NULL, 223456789, NULL),
(914567890, NULL, 323456789, NULL),
(915678901, NULL, 423456789, NULL),
(916789012, NULL, 523456789, NULL),
(917890123, NULL, 623456789, NULL),
(918901234, NULL, 723456789, NULL),
(919012345, NULL, 823456789, NULL),
(920123456, NULL, 923456789, NULL),
(921234567, NULL, 102345678, NULL),
(922345678, NULL, 112345678, NULL),
(923456789, NULL, 122345678, NULL),
(924567890, NULL, 132345678, NULL),
(925678901, NULL, 142345678, NULL),
(926789012, NULL, 152345678, NULL),
(927890123, NULL, 162345678, NULL),
(928901234, NULL, 172345678, NULL),
(929012345, NULL, 182345678, NULL),
(930123456, NULL, 192345678, NULL),
(931234567, NULL, 202345678, NULL);

-- para pacientes
INSERT INTO Telefone (telefone, epcs, profissional, paciente) VALUES
(912345679, NULL, NULL, 234567891),
(913456780, NULL, NULL, 345678912),
(914567891, NULL, NULL, 456789123),
(915678902, NULL, NULL, 567891234),
(916789013, NULL, NULL, 678912345),
(917890124, NULL, NULL, 789123456),
(918901235, NULL, NULL, 891234567),
(919012346, NULL, NULL, 912345678),
(920123457, NULL, NULL, 102345689),
(921234568, NULL, NULL, 112345690),
(922345679, NULL, NULL, 122345701),
(923456780, NULL, NULL, 132345712),
(924567891, NULL, NULL, 142345723),
(925678902, NULL, NULL, 152345734),
(926789013, NULL, NULL, 162345745),
(927890124, NULL, NULL, 172345756),
(928901235, NULL, NULL, 182345767),
(929012346, NULL, NULL, 192345778),
(930123457, NULL, NULL, 202345789),
(931234568, NULL, NULL, 212345790);




