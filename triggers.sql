-- Triggers --

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

-- Atualiza o estado de emergência da viatura: quando a missão termina, marca a viatura como não em missão --
DELIMITER $$
CREATE TRIGGER trg_viatura_livre
AFTER UPDATE ON Pertence
FOR EACH ROW
BEGIN
  IF NEW.data_hora_fim IS NOT NULL THEN
    IF NOT EXISTS (
      SELECT 1 FROM Pertence
      WHERE missao = NEW.missao AND data_hora_fim IS NULL
    ) THEN
      UPDATE Viatura
      SET em_missao = 0
      WHERE matricula = (
        SELECT viatura FROM Missao WHERE id_missao = NEW.missao
      );
    END IF;
  END IF;
END $$
DELIMITER ;

-- Impedir inserção de quantidade inválida: quantidade de equipamento tem de ser > 0 --
DELIMITER $$
CREATE TRIGGER trg_quantidade_valida
BEFORE INSERT ON Equipamento
FOR EACH ROW
BEGIN
  IF NEW.quantidade < 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Quantidade de equipamento não pode ser negativa.';
  END IF;
END $$
DELIMITER ;

-- Impedir repetição de informação: o mesmo telefone não pode estar atribuido a mais de uma entidade epcs, profissional, paciente --
DELIMITER $$
CREATE TRIGGER trg_telefone_unico
BEFORE INSERT ON telefone
FOR EACH ROW
BEGIN
  IF (NEW.epcs IS NOT NULL AND (NEW.profissional IS NOT NULL OR NEW.paciente IS NOT NULL))
     OR (NEW.profissional IS NOT NULL AND NEW.paciente IS NOT NULL) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Telefone só pode estar associado a uma entidade.';
  END IF;
END $$
DELIMITER ;


-- ao fazer ecps, se não existir o código postal dar erro a dizer que não existe e para inserir --
DELIMITER $$
CREATE TRIGGER trg_verifica_codigo_postal
BEFORE INSERT ON EPCS
FOR EACH ROW
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM Codigo_postal WHERE codigo_postal = NEW.codigo_postal
  ) THEN
    SIGNAL SQLSTATE '45000' 
      SET MESSAGE_TEXT = 'Erro: Código Postal não existe. Por favor, insira o código postal antes de inserir o EPCS.';
  END IF;
END$$
DELIMITER ;





-- Evitar domínios de email inválidos: --
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


-- desativar automaticamente outras missões ativas do profissional --
-- antes de inserir um novo registo Pertence com ativo = 1, desativa os anteriores para o mesmo profissional --

DELIMITER $$
CREATE TRIGGER trg_limpa_missoes_ativas
BEFORE INSERT ON Pertence
FOR EACH ROW
BEGIN
  IF NEW.ativo = 1 THEN
    UPDATE Pertence
    SET ativo = 0, data_hora_fim = NOW()
    WHERE profissional = NEW.profissional AND ativo = 1;
  END IF;
END $$
DELIMITER ;



-- so poder atribuir equipamento quando ambulância não em missão --
DELIMITER $$
CREATE TRIGGER trg_verifica_viatura_livre
BEFORE INSERT ON Equipamento
FOR EACH ROW
BEGIN
  DECLARE viatura_status TINYINT;
  SELECT em_missao INTO viatura_status
  FROM Viatura
  WHERE matricula = NEW.viatura;
  IF viatura_status = 1 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Não é possível atribuir equipamento: viatura está em missão.';
  END IF;
END $$
DELIMITER ;


-- impedir mais de 3 profissionais em uma missão --

DELIMITER $$
CREATE TRIGGER trg_limite_profissionais_missao
BEFORE INSERT ON Pertence
FOR EACH ROW
BEGIN
  DECLARE total_ativos INT;
  SELECT COUNT(*) INTO total_ativos
  FROM Pertence
  WHERE missao = NEW.missao AND ativo = 1;
  IF total_ativos >= 3 AND NEW.ativo = 1 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Limite de 3 profissionais ativos por missão atingido.';
  END IF;
END$$
DELIMITER ;

-- se se tentar criar uma missão onde a viatura esta sem a inspeção em dia não deixa --
DELIMITER $$
CREATE TRIGGER trg_validar_inspecao_viatura
BEFORE INSERT ON Missao
FOR EACH ROW
BEGIN
  DECLARE data_inspecao DATE;
  SELECT data_inspecao_proxima INTO data_inspecao
  FROM Viatura
  WHERE matricula = NEW.viatura;
  IF data_inspecao IS NOT NULL AND data_inspecao < CURDATE() THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Viatura com inspeção vencida não pode ser usada.';
  END IF;
END$$
DELIMITER ;


-- impede que se adicione equipamento sem a data de inspeção valida --
DELIMITER $$
CREATE TRIGGER trg_verifica_inspecao_equipamento
BEFORE INSERT ON Equipamento
FOR EACH ROW
BEGIN
  IF NEW.data_inspecao_proxima IS NOT NULL AND NEW.data_inspecao_proxima < CURDATE() THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Equipamento com inspeção vencida.';
  END IF;
END$$
DELIMITER ;


-- trigger que impede profissional inserido em 2 missoes com sobreposição de hora --
DELIMITER $$
CREATE TRIGGER trg_verifica_sobreposicao_missao
BEFORE INSERT ON Pertence
FOR EACH ROW
BEGIN
  DECLARE data_inicio DATETIME;
  DECLARE data_fim DATETIME;
  SELECT id_missao, data_hora_inicio, data_hora_fim INTO data_inicio, data_fim
  FROM Pertence
  WHERE profissional = NEW.profissional;
  IF EXISTS (
    SELECT 1
    FROM Pertence p
    JOIN Missao m ON p.missao = m.id_missao
    WHERE p.profissional = NEW.profissional
      AND (
        (NEW.data_hora_inicio BETWEEN p.data_hora_inicio AND IFNULL(p.data_hora_fim, NOW()))
        OR
        (IFNULL(NEW.data_hora_fim, NOW()) BETWEEN p.data_hora_inicio AND IFNULL(p.data_hora_fim, NOW()))
      )
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Profissional já está em missão sobreposta nesse horário.';
  END IF;
END$$
DELIMITER ;





