USE hospitais;

/*Procedimento identificar(novo_cc, novo_nif, novo_nome, nova_morada, novo_cod_postal, nova_data_nascimento)

Tem como objetivo auxiliar a identificação de novos pacientes.
Tem a capacidade de serem passados valores nulos em qualquer campo que os profissionais
 que efetuam a assistência não consigam identificar.
Explicação do funcionamento do procedimento:
Em primeiro lugar, verifica se existe algum cc ou nif correspondentes na tabela Pacientes.

	Se existir, é atualizado no primeiro registo que cumpra essa condição cna tabela Pacientes:
		--> Para cada campo: se novo_[campo] não for um valor nulo, então o campo é atualizado com a nova informação
						     se novo_[campo] for um valor nulo, mantém-se a informação incumbente para esse campo
                             
	Se não existir uma correspondência de cc ou nif, então insere-se a informação nova num novo registo              
*/


DELIMITER $$
CREATE PROCEDURE identificar(
	IN novo_cc INT,
    IN novo_nif INT,
    IN novo_nome VARCHAR(80),
    IN nova_morada VARCHAR(80),
    IN novo_cod_postal VARCHAR(8),
    IN nova_data_nascimento DATE
)
BEGIN
	DECLARE existe_id INT;

    -- Verifica se já existe registo do paciente pelo cc ou nif (um dos dois pode ser nulo)
    SELECT id INTO existe_id
    FROM pacientes
    WHERE (cc = novo_cc AND novo_cc IS NOT NULL)
       OR (nif = novo_nif AND novo_nif IS NOT NULL)
    LIMIT 1;

    IF existe_id IS NOT NULL THEN
        -- Atualiza o paciente existente com os campos fornecidos
        UPDATE pacientes
        SET 
            nome = IF(novo_nome IS NOT NULL, novo_nome, nome),
            morada = IF(nova_morada IS NOT NULL, nova_morada, morada),
            cod_postal = IF(novo_cod_postal IS NOT NULL, novo_cod_postal, cod_postal),
            data_nascimento = IF(nova_data_nascimento IS NOT NULL, nova_data_nascimento, data_nascimento),
            cc = IF(novo_cc IS NOT NULL, novo_cc, cc),
            nif = IF(novo_nif IS NOT NULL, novo_nif, nif)
        WHERE id = existe_id;

    ELSE
        -- Insere um novo paciente com os dados disponíveis
        INSERT INTO pacientes (cc, nif, nome, morada, cod_postal, data_nascimento)
        VALUES (
            novo_cc,
            novo_nif,
            novo_nome,
            nova_morada,
            novo_cod_postal,
            nova_data_nascimento
        );
    END IF;
END$$
DELIMITER ;



CALL identificar(NULL, 123422789, 'João Silva', NULL, NULL, '1990-05-21');
CALL identificar(NULL, NULL, 'Cristiano Ronaldo', NULL, NULL, '1985-02-05');





DELIMITER $$
CREATE FUNCTION idade(data_in DATE)
RETURNS INT
BEGIN
	RETURN TIMESTAMPDIFF(YEAR, data_in, CURDATE());
END$$
DELIMITER ;



DELIMITER $$

CREATE PROCEDURE atualizar_inspecao_viatura(IN p_idViatura INT)
BEGIN
DECLARE v_data_matricula DATE;
DECLARE v_idade INT;
DECLARE v_nova_data DATE;

-- Obter a data da matrícula
SELECT data_matricula INTO v_data_matricula
FROM Viatura
WHERE idViatura = p_idViatura;

-- Calcular idade da viatura
SET v_idade = idade(v_data_matricula);

-- Calcular nova data limite de inspeção
IF v_idade < 1 THEN
    SET v_nova_data = DATE_ADD(v_data_matricula, INTERVAL 1 YEAR);
ELSEIF v_idade < 8 THEN
    SET v_nova_data = DATE_ADD(CURDATE(), INTERVAL 1 YEAR);
ELSE
    SET v_nova_data = DATE_ADD(CURDATE(), INTERVAL 6 MONTH);
END IF;

-- Atualizar a viatura com a nova data limite
UPDATE Viatura
SET data_limite_inspecao = v_nova_data
WHERE idViatura = p_idViatura;
END$$

DELIMITER ;