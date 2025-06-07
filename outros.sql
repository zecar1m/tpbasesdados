-- USE hospitais;

-- ---------------------------------- Funções -------------------------------------------------------

-- Funções principais

/*Função entidade_nif(in_nif INT)
Recebe um NIF e verifica se há correspondência na base de dados nas tabelas Pacientes ou EPCS ou Profissionais.
Devolvendo uma string que caracteriza a tabela onde foi encontrado o NIF.
*/
DELIMITER $$
CREATE FUNCTION entidade_nif(in_nif INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE resultado VARCHAR(20);

    -- Verifica se o NIF existe na tabela Pacientes
    IF EXISTS (SELECT 1 FROM Pacientes WHERE nif = in_nif) THEN
        SET resultado = 'paciente';

    -- Verifica se o NIF existe na tabela EPCS
    ELSEIF EXISTS (SELECT 1 FROM EPCS WHERE nif = in_nif) THEN
        SET resultado = 'epcs';

    -- Verifica se o NIF existe na tabela Profissionais
    ELSEIF EXISTS (SELECT 1 FROM Profissionais WHERE nif = in_nif) THEN
        SET resultado = 'profissional';

    ELSE
        SET resultado = 'nenhum';
    END IF;

    RETURN resultado;
END$$
DELIMITER ;

-- Teste
SELECT entidade_nif(513456789);


/* Função inspecao_valida_viatura(matric VARCHAR(8))
Recebe como input uma matrícula e determina se está em cumprimento da inspeção (TRUE)
ou se está em incumprimento legal (FALSE)
*/
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

-- Teste
SELECT inspecao_valida_viatura('23-CD-45') as resultado;



-- Funções Auxiliares 


/* Função idade
Determina quantos anos passaram desde a data que recebe no input
*/
DELIMITER $$
CREATE FUNCTION idade(data_in DATE)
RETURNS INT
BEGIN
	RETURN TIMESTAMPDIFF(YEAR, data_in, CURDATE());
END$$
DELIMITER ;


/* Função validar_telefone
Valida se o número telefónico introduzido tem 9 caracteres e o primeiro caracter é 2 ou 9
*/

DELIMITER $$
CREATE FUNCTION validar_telefone(telefone INT)
RETURNS INT
DETERMINISTIC
BEGIN
	IF (telefone BETWEEN 200000000 AND 299999999) OR (telefone BETWEEN 900000000 AND 999999999) THEN
		RETURN TRUE;
	ELSE
		RETURN FALSE;
	END IF;
END$$
DELIMITER ;






-- ---------------------------------- Triggers -------------------------------------------------------

-- Triggers principais

/* Trigger 1 trg_validar_inspecao_viatura
Impede a criação de missões onde a viatura não tem a inspeção em dia.
Utiliza a função inspecao_valida_viatura para fazer a verificação.
*/
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


/* Trigger 2 trg_validacao_email
Impede a inserção de domínios de email inválidos.
Os emails devem seguir a estrutura %@%.%
*/
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

-- Outro trigger


/* Trigger 3 trg_viatura_em_missao
Atualiza o estado de atividade da viatura.
Quando uma missão é criada, a viatura associada é marcada como estando em missão.
*/
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







-- ---------------------------------- Procedimentos -------------------------------------------------------

-- Procedimentos principais

/*Procedimento identificar(novo_cc, novo_nif, novo_nome, nova_morada, novo_cod_postal, nova_data_nascimento)

Tem como objetivo auxiliar a identificação de novos pacientes.
Tem a capacidade de serem passados valores nulos em qualquer campo que os profissionais
 que efetuam a assistência não consigam identificar.
Explicação do funcionamento do procedimento:
Em primeiro lugar, verifica se existe algum cc ou nif correspondentes na tabela Pacientes.

	Se existir, é atualizado no primeiro registo que cumpra essa condição na tabela Pacientes:
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

-- Teste
CALL identificar(NULL, 123422789, 'João Silva', NULL, NULL, '1990-05-21');
CALL identificar(NULL, NULL, 'Cristiano Ronaldo', NULL, NULL, '1985-02-05');




/* Procedimento adicionar_telefone(IN in_tlf INT, IN in_nif INT)
1- Valida o telefone.
2- Determina a que tabela pertence o NIF introduzido.
3- Introduz um registo para o telefone, com o NIF na coluna correspondente e as restantes com valor NULL.
*/
DELIMITER $$
CREATE PROCEDURE adicionar_telefone(IN in_tlf INT, IN in_nif INT)
BEGIN
    DECLARE entidade VARCHAR(10);

    -- Validação do telefone
    IF validar_telefone(in_tlf) = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O número telefónico introduzido é inválido.';
    END IF;
	
    IF EXISTS(SELECT 1 FROM telefone WHERE in_tlf=telefone.telefone) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O número telefónico introduzido já existe na base de dados.';
    END IF;
    
    -- Verificar a entidade associada ao nif
    SET entidade = entidade_nif(in_nif);

    IF entidade = 'nenhum' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O NIF introduzido não tem correspondência na base de dados.';
        
    ELSEIF entidade = 'paciente' THEN
        INSERT INTO telefone (telefone, epcs, profissional, paciente)
        VALUES (in_tlf, NULL, NULL, in_nif);
        
    ELSEIF entidade = 'profissional' THEN
        INSERT INTO telefone (telefone, epcs, profissional, paciente)
        VALUES (in_tlf, NULL, in_nif, NULL);
        
    ELSEIF entidade = 'epcs' THEN
        INSERT INTO telefone (telefone, epcs, profissional, paciente)
        VALUES (in_tlf, in_nif, NULL, NULL);
        
    END IF;
END$$
DELIMITER ;

-- Teste
CALL adicionar_telefone(929123595,123456789);


-- Outro procedimento

/*Procedimento inspecao_viatura(in_matricula VARCHAR(8))
Modo de utilização previsto:
No dia da inspeção a uma determinada viatura, chamar o procedimento com a sua matrícula
de modo, guardando a data atual como data_inspecao_anterior e calculando a nova data limite de inspeção
com base na idade da matrícula.
Seguindo o Código da Estrada:
"4 — Automóveis ligeiros licenciados para transporte público de passageiros e ambulâncias:
Um ano após a data da primeira matrícula e, em seguida, anualmente, até perfazerem sete anos; no 8.º ano e seguintes, semestralmente."
*/

DELIMITER $$
CREATE PROCEDURE inspecao_viatura(IN in_matricula VARCHAR(8))
BEGIN
    DECLARE data_mat DATE;
    DECLARE nova_data_inspecao DATE;

    -- Obter a data de matrícula
    SELECT data_matricula INTO data_mat 
    FROM Viatura
    WHERE matricula = in_matricula;

    -- Calcular a próxima data de inspeção
    IF idade(data_mat) < 7 THEN
        SET nova_data_inspecao = DATE_ADD(CURDATE(), INTERVAL 1 YEAR);
    ELSE
        SET nova_data_inspecao = DATE_ADD(CURDATE(), INTERVAL 6 MONTH);
    END IF;

    -- Atualizar as datas de inspeção na tabela Viatura
    UPDATE Viatura
    SET
        data_inspecao_anterior = CURDATE(),
        data_inspecao_proxima = nova_data_inspecao
    WHERE matricula = in_matricula;
END$$
DELIMITER ;

-- Teste
call inspecao_viatura('12-AB-34');