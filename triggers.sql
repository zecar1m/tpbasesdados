-- Triggers --

-- Para explicar no relatório --

-- Trigger 1 (+ função) --
-- Função que verifica se inspeção está em dia: Recebe a matricula, retorna TRUE ou FALSE --
DELIMITER $$
CREATE FUNCTION inspecao_valida_viatura(matric VARCHAR(8))
RETURNS BOOLEAN
READS SQL DATA
BEGIN
  DECLARE data_inspecao DATE;
  SELECT data_inspecao_proxima INTO data_inspecao
  FROM Viatura
  WHERE matricula = matric;
  RETURN (data_inspecao IS NULL OR data_inspecao >= CURDATE());
END$$
DELIMITER ;

-- Impedir criação de missão onde a viatura não tem a inpseção em dia --
DELIMITER $$
CREATE TRIGGER trg_validar_inspecao_viatura
BEFORE INSERT ON Missao
FOR EACH ROW
BEGIN
  IF NOT inspecao_valida_viatura(NEW.viatura) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Viatura sem inspeção em dia, não pode ser utilizada.';
  END IF;
END$$
DELIMITER ;

-- Teste do Trigger 1 --
INSERT INTO Missao (id_missao, tipo, descricao, viatura) VALUES (1, 'TM01', 'TESTE UM DOIS', '23-CD-45'); -- Cria missão, e ve-se o resultado esperado (erro) --

-- Trigger 2 --
-- Evitar domínios de email inválidos: seguem a estrutura de %@%.% --
DELIMITER $$
CREATE TRIGGER trg_validacao_email
BEFORE INSERT ON email_epcs
FOR EACH ROW
BEGIN
  IF NEW.email NOT LIKE '%@%.%' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Email inválido.';
  END IF;
END $$
DELIMITER ;

-- Teste Trigger 2 --
INSERT INTO email_epcs(email, epcs) VALUES('1234@1234.1234', 501234567) -- Cria email e ve-se o esperado (erro)

-- Triggers extra --
-- Trigger 3 --
-- Atualiza o estado de emergência da viatura:  quando a missão é criada com a viatura, marca-a como em missão --
DELIMITER $$
CREATE TRIGGER trg_viatura_em_missao
AFTER INSERT ON Missao
FOR EACH ROW
BEGIN
  UPDATE Viatura
  SET em_missao = 1
  WHERE matricula = NEW.viatura;
END $$
DELIMITER ;

-- Teste Trigger 3 --
SELECT matricula, em_missao FROM Viatura WHERE matricula = '01-ST-34'; -- Ver estado atual da viatura --
INSERT INTO Missao (tipo, descricao, viatura) VALUES ('TM001', 'TESTE TRIGGER 3', '01-ST-34'); -- Criar missão com a viatura --
SELECT matricula, em_missao FROM Viatura WHERE matricula = '01-ST-34'; -- Ver estado atual da viatura --

-- Faria sentido um outro trigger que ao inserir a missão começa-se o pertence também --
