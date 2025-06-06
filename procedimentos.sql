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


call inspecao_viatura('12-AB-34');