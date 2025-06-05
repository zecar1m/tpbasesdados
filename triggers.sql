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