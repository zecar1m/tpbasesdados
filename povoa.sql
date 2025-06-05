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
-- Povoar tabela EPCS com 30 registos e nregistos aleatórios
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
INSERT INTO Viatura (matricula, marca, tipo, data_matricula, data_inspecao_anterior, data_inspecao_proxima, em_missao, uls) VALUES
('AA-12-BC', 'Mercedes-Benz', 'V001', '2020-05-20', '2025-02-10', '2026-02-10', 1, 5),
('CD-34-EF', 'Fiat', 'V002', '2019-09-14', '2024-01-10', '2025-01-10', 0, 7),
('GH-56-IJ', 'Renault', 'V003', '2021-03-30', '2025-03-01', '2026-03-01', 1, 9),
('KL-78-MN', 'Volkswagen', 'V004', '2022-11-11', '2025-04-15', '2026-04-15', 0, 12),
('OP-90-QR', 'Ford', 'V005', '2020-06-25', '2025-01-20', '2026-01-20', 1, 16),
('ST-12-UV', 'Peugeot', 'V001', '2021-04-10', '2025-03-05', '2026-03-05', 0, 18),
('WX-34-YZ', 'Citroën', 'V002', '2020-02-18', '2025-02-25', '2026-02-25', 1, 21),
('AB-56-CD', 'Iveco', 'V003', '2021-08-05', '2025-04-01', '2026-04-01', 0, 23),
('EF-78-GH', 'Opel', 'V004', '2022-10-29', '2025-03-20', '2026-03-20', 1, 25),
('IJ-90-KL', 'Toyota', 'V005', '2023-01-07', '2025-05-12', '2026-05-12', 0, 28),
('MN-11-OP', 'Nissan', 'V001', '2021-07-14', '2025-01-03', '2026-01-03', 1, 30),
('QR-22-ST', 'Mercedes-Benz', 'V002', '2020-03-05', '2025-02-18', '2026-02-18', 0, 1),
('UV-33-WX', 'Fiat', 'V003', '2019-12-20', '2025-01-20', '2026-01-20', 1, 3),
('YZ-44-AB', 'Renault', 'V004', '2020-04-09', '2025-04-01', '2026-04-01', 0, 4),
('CD-55-EF', 'Volkswagen', 'V005', '2021-08-26', '2025-02-25', '2026-02-25', 1, 6),
('GH-66-IJ', 'Ford', 'V001', '2020-12-12', '2025-03-07', '2026-03-07', 0, 8),
('KL-77-MN', 'Peugeot', 'V002', '2022-06-01', '2025-05-10', '2026-05-10', 1, 10),
('OP-88-QR', 'Citroën', 'V003', '2021-09-30', '2025-06-01', '2026-06-01', 0, 11),
('ST-99-UV', 'Iveco', 'V004', '2020-05-18', '2025-04-15', '2026-04-15', 1, 13),
('WX-10-YZ', 'Opel', 'V005', '2022-10-22', '2025-03-30', '2026-03-30', 0, 15),
('AB-21-CD', 'Toyota', 'V001', '2023-03-14', '2025-05-18', '2026-05-18', 1, 17),
('EF-32-GH', 'Nissan', 'V002', '2022-06-11', '2025-02-05', '2026-02-05', 0, 19),
('IJ-43-KL', 'Mercedes-Benz', 'V003', '2020-01-30', '2025-05-03', '2026-05-03', 1, 20),
('MN-54-OP', 'Fiat', 'V004', '2021-11-17', '2025-03-01', '2026-03-01', 0, 22),
('QR-65-ST', 'Renault', 'V005', '2022-07-09', '2025-01-30', '2026-01-30', 1, 24),
('UV-76-WX', 'Volkswagen', 'V001', '2021-03-23', '2025-04-14', '2026-04-14', 0, 26),
('YZ-87-AB', 'Ford', 'V002', '2022-02-08', '2025-02-05', '2026-02-05', 1, 27),
('CD-98-EF', 'Peugeot', 'V003', '2023-05-05', '2025-04-08', '2026-04-08', 0, 29),
('GH-09-IJ', 'Citroën', 'V004', '2021-01-01', '2025-03-30', '2026-03-30', 1, 31),
('KL-20-MN', 'Iveco', 'V005', '2020-10-10', '2025-05-25', '2026-05-25', 0, 33);
