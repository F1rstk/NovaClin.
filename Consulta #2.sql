

SHOW TABLES
SELECT*FROM consulta

 CREATE TABLE recepcionista(
 idRecepcionista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 nomeRecepcionista VARCHAR(50) NOT NULL,
 loginRecepcionsita VARCHAR(20) NOT NULL,
 senha CHAR(6) NOT NULL,
 celular CHAR(11)  NULL,
 cpf CHAR(11) NOT NULL
 );
 
 
 CREATE TABLE paciente(
idPaciente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
cel CHAR(11) NOT NULL,
dataNascimento DATETIME NOT NULL,
email VARCHAR(50) NULL,
logradouro VARCHAR (30) NOT NULL,
numero VARCHAR(6) NOT NULL,
complemento VARCHAR(10) NULL,
cidade VARCHAR(20) NOT NULL,
cep CHAR(8) NULL,
observações VARCHAR(100) 
);

CREATE TABLE especialidade(
idEspecialidade INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeEspecialidade VARCHAR(30) NOT NULL
);


CREATE TABLE medico(
idMedico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
IdEspecialidade INT NOT NULL,
nome VARCHAR(50) NOT NULL,
crm CHAR(8) NOT NULL,
login VARCHAR(20) NOT NULL,
senha CHAR(6) NOT NULL,
CONSTRAINT Fk_MedicoEspecialidade FOREIGN KEY(idEspecialidade)
REFERENCES especialidade(idEspecialidade)
);

CREATE TABLE consulta(
idConsulta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idPaciente INT NOT NULL,
idRecepcionista INT NOT NULL,
idMedico INT NOT NULL,
dataHoraConsulta DATETIME NOT NULL,
sintomas VARCHAR(200) NULL,
prescricao VARCHAR(200) NULL,
CONSTRAINT Fk_ConsultaPaciente FOREIGN KEY(idPaciente)
REFERENCES paciente(idPaciente),
CONSTRAINT Fk_ConsultaRecepcionista FOREIGN KEY(idRecepcionista)
REFERENCES recepcionista(idRecepcionista),
CONSTRAINT Fk_ConsultaMedico FOREIGN KEY(idMedico)
REFERENCES medico(idMedico)
);

CREATE TABLE exame(
idExame INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idConsulta INT NOT NULL,
dataHoraExame DATETIME NOT NULL,
nomeExame VARCHAR(30) NOT NULL,
statusExame VARCHAR(10) NOT NULL,
resultado VARCHAR(200) NULL,
dataRetiradaExane DATETIME NULL,
dataPrevisaoEntrega DATETIME NULL,
CONSTRAINT Fk_exameconsulta FOREIGN KEY(idConsulta)
REFERENCES consulta(idConsulta)
);

ALTER TABLE paciente
ADD estado CHAR(2) NOT NULL;

INSERT INTO paciente
VALUES
(1,'Donald','54421170801','13993445521','2000-03-01 13:00','DonaldTrump17@gmail.com','Rua Carlos Gomes','17','Casa','Santos','11085900',NUll,'SP'),
(2,'Margarida','32244415001','13993719011','2002-10-01 8:00','MargaridaBonitinha@gmail.com','Rua Jardim Clemente','44','Ap','São Vicente','22576700',NULL,'SP'),
(3,'Patinhas','21135683069','13999177427','2006-02-19 14:00','DuckDickBig@gmail.com','Rua Guarani','90','Casa','Santos','11350480',NULL,'SP'),
(4,'Hugiho','30996090053','13969899888','1999-11-20 13:30','HugoCRF128@gmail.com','Avenida Nove de Abril','10','Casa','Cubatão','11533250',NULL,'SP'),
(5,'Luizinho','91416842063','13983467621','2001-12-23 16:00','LuizGaginho@gmail.com','Avenida Kennedy','24','Casa','Praia Grande','11010911',NULL,'SP'),
(6,'Zezinho','89214350000','38984896854','2003-09-21','ZéZe234@gmail.com','Rua dos Girassóis','45','Casa','São João Del Rei','36305288',NULL,'MG'),
(7,'Mickey','69834733020','38984896854','1998-04-12','DisneyDONO@gmail.com','Rua Carinhanha','55','Casa','Rio de Janeiro','21750560',NULL,'RJ'),
(8,'Minnie','61904674070','16973297121','1999-01-20','EsposaMickey@gmail.com','Rua Alice Macuco Alves','34','Casa','São paulo','05453010',NULL,'SP');


INSERT INTO recepcionista(nomeRecepcionista,loginRecepcionsita,senha,celular,cpf)
VALUES('Chico Bento','chicobento.senaclin','123456','13994964352','74468816074'),
('Franjinho','franjinha.senaclin','654321','18996236139','53875476000'),
('Cebolinha','cebolhina.senaclin','56321','15996448866','73247097023');

INSERT INTO especialidade(nomeEspecialidade)
VALUES
('Cardiologista'),
('Otorrinolaringologista'),
('Clínico Geral'),
('Gastroenterologista'),
('Ortopedista');

INSERT INTO medico
VALUES 
(1, 1,'Pardal','765544SP','pardal_med.senaclin','12345'),
(2, 5,'Monica','768880SP','monica_med.senaclin','123456'),
(3, 3,'Zé Carioca','165544RJ','zeca_med.senaclin','65432'),
(4, 4,'Magali','265544SP','magali_med.senaclin','654321'),
(5, 2,'Horácio','365544MG','horacio_med.senaclin','546321');


INSERT INTO consulta(idPaciente,idMedico,idRecepcionista,dataHoraConsulta,sintomas,prescricao)
VALUES(1,1,1,'2024-06-22 16:00','Dores no Peito',NULL),
(2,2,1,'2024-06-22 11:00','Dores no Pé',NULL),
(3,3,1,'2024-06-22 15:00','Dor na cabeça',NULL),
(7,4,2,'2024-06-23 11:00','Dor de barriga',NULL),
(8,5,2,'2024-06-23 14:00','Dores no ouvido',NULL);

INSERT INTO consulta(idConsulta,idPaciente,idMedico,idRecepcionista,dataHoraConsulta,sintomas,prescricao)
VALUES(6,3,1,1,'2024-06-26 17:00','Dores no Peito',NULL),
(7,3,2,1,'2024-06-26 11:00','Dores nos Pés',NULL);


/*questão 7-.Inserir um exame para cada consulta do Patinhas criada no item anterior (6)*/
INSERT INTO exame (idConsulta, dataHoraExame, nomeExame, statusExame)
VALUES 
(3, '2024-06-30 15:30:00', 'Eletrocardiograma', 'Pendente'),
(5, '2024-07-01 16:30:00', 'Raio-X Coluna', 'Pendente');

/*questão 8-Remarcar (Atualizar) a consulta do Donald para a mesma data porém, 2hs mais tarde.*/
UPDATE consulta
SET dataHoraConsulta = DATE_ADD(dataHoraConsulta, INTERVAL 2 HOUR)
WHERE idConsulta = 1;

/*questão 9-A Minie mudou de endereço mas não mudou de cidade (logradouro, numero e
complemento). Realize a alteração dos dados.*/
UPDATE paciente
SET logradouro = 'nova rua', numero = '456', complemento = 'ap10'
WHERE nome = 'Minie';

/*questão 10-O Mickey mudou o celular, realize a alteração.*/
UPDATE paciente
SET cel = '999888777'
WHERE nome = 'Mickey';

/*questão 11-O Patinhas não poderá comparecer na consulta com o Ze Carioca. Realize a exclusão da
mesma no sistema. Foi possível? Justifique.*/
DELETE FROM consulta
WHERE idPaciente = 3 AND idMedico = 3;
/*motivo do erro*/
/*Esta operação pode falhar devido a uma restrição de chave estrangeira. A consulta do Patinhas com Zé Carioca pode estar referenciada em outras tabelas (por exemplo, na tabela exame através da chave estrangeira idConsulta). Antes de excluir, seria necessário remover as dependências nesses registros relacionados*/

/*questão 12-Realize a exclusão da Dr Mônica da tabela Medico. Foi possível? Justifique.*/
DELETE FROM medico
WHERE nome = 'Mônica';
/*Não é possível excluir a médica Mônica diretamente devido a restrições de chave estrangeira. Ela pode estar associada a consultas na tabela consulta ou a exames na tabela exame. Para excluir, primeiro seria necessário remover todas as dependências relacionadas a ela nessas tabelas.*/

/*questão 13-Exibir a data de todas as consultas em ordem cronológica, da que está mais próxima para a
que está mais longe.*/
SELECT dataHoraConsulta
FROM consulta
ORDER BY dataHoraConsulta;

/*questão 14-Exibir todos os dados da tabela médico.*/
SELECT * FROM medico;

/*questão 15-Exibir apenas as cidades em que a clínica possui pacientes, em ordem alfabética.*/
SELECT DISTINCT cidade
FROM paciente
ORDER BY cidade;

/*questão 16-Exibir nome, celular e e-mail de todos os pacientes da clínica, em ordem alfabética.*/
SELECT nome, cel, email
FROM paciente
ORDER BY nome;

/*questão 17-Atualizar apenas o CRM do Dr.Pardal que foi cadastrado errado no sistema.*/
UPDATE medico
SET crm = '765544SP'
WHERE nome = 'Pardal';

/*questão 18-Resetar a senha de todos os médicos do sistema para o padrão "DOCTOR".*/
UPDATE medico
SET senha = 'DOCTOR';

/*questão 19-Exibir apenas o nome do médico e seu CRM, dos médicos registrados em SP, tudo isto em
ordem alfabética.*/
SELECT nome, crm
FROM medico
WHERE crm LIKE '%SP%'
ORDER BY nome;

/*questão 20-Exibir nome e celular de todos os pacientes que vivem em Santos e possuem nome
iniciando com a letra P.*/
SELECT nome, cel
FROM paciente
WHERE cidade = 'Santos' AND nome LIKE 'P%'
ORDER BY nome;


/*desafio- Exibir o nome, logradouro, numero e cidade de todos os pacientes que moram em
casa, em ordem alfabética.*/
SELECT nome, logradouro, numero, cidade
FROM paciente
WHERE logradouro LIKE '%casa%'
ORDER BY nome;


/*1.Buscar nome do médico, nome da especialidade, e crm de todos os médicos cuja especialidade
seja “Cardiologista”.*/

SELECT nome, nomeEspecialidade, crm
FROM medico
INNER JOIN especialidade ON especialidade.idEspecialidade = medico.IdEspecialidade
WHERE nomeEspecialidade LIKE '%Cardiologista%';

/*2.Buscar quantos pacientes a clínica possui por cidade.*/

SELECT cidade, COUNT(*) AS num_pacientes
FROM paciente
GROUP BY cidade;

/*3.Buscar a data de todas as consultas, nome do médico e o nome do paciente, em ordem
cronológica. */

 
SELECT c.dataHoraConsulta, m.nome AS nome_medico, p.nome AS nome_paciente
FROM consulta c
JOIN medico m ON c.idMedico = m.idMedico
JOIN paciente p ON c.idPaciente = p.idPaciente
ORDER BY c.dataHoraConsulta;
 
/*4- Buscar o nome do paciente, celular, email, e a data da consulta de todos os pacientes com consulta marcada, desde que vivam em Santos.*/
 
SELECT p.nome, p.cel, p.email, c.dataHoraConsulta
FROM paciente p
JOIN consulta c ON p.idPaciente = c.idPaciente
WHERE p.cidade = 'Santos';

/*5- Buscar todos os pacientes que tenham com a letra "P" no nome. */
 
SELECT *
FROM paciente
WHERE nome LIKE '%P%';
 
/*6- Buscar o nome do médico, a data da consulta, o nome do paciente e a especialidade do médico de todas as consultas de determinado dia (escolhido por você), em ordem alfabética.*/
 
SELECT m.nome AS nome_medico, c.dataHoraConsulta, p.nome AS nome_paciente, e.nomeEspecialidade AS especialidade
FROM consulta c
JOIN medico m 
ON c.idMedico = m.idMedico
JOIN paciente p 
ON c.idPaciente = p.idPaciente
JOIN especialidade e 
ON m.IdEspecialidade = e.idEspecialidade
WHERE DATE(c.dataHoraConsulta) = '2024-06-22'
ORDER BY m.nome;

/*7- Buscar o nome dos médicos e sua especialidade, apenas dos médicos com CRM de SP.*/
 
SELECT m.nome AS nome_medico, e.nomeEspecialidade AS especialidade
FROM medico m
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
WHERE m.crm LIKE '%SP%';
 
 
/*8- Buscar a data da consulta que está mais longe na clínica. */
 
SELECT MAX(dataHoraConsulta) AS data_mais_longe
FROM consulta;
 
/*9- Buscar quantos médicos a clínica possui por especialidade.*/
 
SELECT e.nomeEspecialidade AS especialidade, COUNT(*) AS num_medicos
FROM medico m
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
GROUP BY e.nomeEspecialidade;
 
 
/*10- Buscar o nome, celular e email de todos os pacientes que começam com a letra “D” em ordem alfabética.*/
 
SELECT nome, cel, email
FROM paciente
WHERE nome LIKE 'D%'
ORDER BY nome;
 
/*11- Buscar todos os exames, bem como quem foi o médico que solicitou e a data do exame, em ordem cronológica (por data). */
 
SELECT nomeExame, m.nome AS medico_solicitante,dataHoraExame
FROM exame ex
JOIN consulta c ON ex.idConsulta = c.idConsulta
JOIN medico m ON c.idMedico = m.idMedico
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
ORDER BY ex.dataHoraExame;

/*12- Buscar o nome do médico, o crm e a data da consulta, de todos os médicos, ainda que não possuam consultas.*/
 
SELECT m.nome AS nome_medico, m.crm, c.dataHoraConsulta
FROM medico m
LEFT JOIN consulta c ON m.idMedico = c.idMedico
ORDER BY m.nome;
 
/*13-Buscar o nome de todos os pacientes, celular, email e data da consulta em ordem alfabética. Trazer os pacientes ainda que não possuam consultas.*/
 
SELECT p.nome, p.cel, p.email, c.dataHoraConsulta
FROM paciente p
LEFT JOIN consulta c ON p.idPaciente = c.idPaciente
ORDER BY p.nome;
 
/*14- Buscar o nome de todos os pacientes, logradouro, número e complemento apenas dos moradores que moram em São Paulo, em ordem alfabética.*/
 
SELECT nome, logradouro, numero, complemento
FROM paciente
WHERE cidade = 'São Paulo'
ORDER BY nome;
 
/*15- Buscar a data de todas as consultas, o nome do recepcionista que marcou, o nome do
paciente, o nome do médico, a especialidade do médico e o celular do paciente em ordem
cronológica invertida.*/
 
SELECT c.dataHoraConsulta, nomeRecepcionista AS nome_recepcionista, p.nome AS nome_paciente, m.nome AS nome_medico, e.nomeEspecialidade AS especialidade_medico, p.cel AS celular_paciente
FROM consulta c
JOIN recepcionista rec ON c.idRecepcionista = rec.idRecepcionista
JOIN paciente p ON c.idPaciente = p.idPaciente
JOIN medico m ON c.idMedico = m.idMedico
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
ORDER BY c.dataHoraConsulta DESC;
 
 /*Desafio - É possível realizar? Justifique:*/
/*Sim, é possível realizar essa consulta. Ela envolve múltiplas junções (joins) entre várias tabelas (consulta, recepcionista, paciente, medico e especialidade), onde os relacionamentos são bem definidos através de chaves estrangeiras. A ordenação é feita de forma decrescente pela coluna dataHoraConsulta.*/
 
/*Relatório a) - Quantas consultas cada médico realizou na clínica:*/
SELECT m.nome AS nome_medico, COUNT(c.idConsulta) AS num_consultas
FROM medico m
LEFT JOIN consulta c ON m.idMedico = c.idMedico
GROUP BY m.nome;
 
/*Relatório b) - Quantas consultas foram realizadas por especialidade:*/
SELECT e.nomeEspecialidade AS especialidade_medico, COUNT(c.idConsulta) AS num_consultas
FROM consulta c
JOIN medico m ON c.idMedico = m.idMedico
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
GROUP BY e.nomeEspecialidade;


/*1- Criar uma view que traga nome e contatos (telefones e pacientes) em ordem alfabética 
e executá-la.*/
CREATE VIEW vw_contatos
AS
SELECT p.nome, p.cel
FROM paciente p
LEFT JOIN consulta c ON p.idPaciente = c.idPaciente
ORDER BY p.nome;

SELECT*FROM vw_contatos

/*2- Criar uma view que traga a quantidade de consultas agrupadas por especialidade e 
executá-la*/
CREATE VIEW vw_consultas_especialidade AS
SELECT e.nomeEspecialidade AS Especialidade, COUNT(c.idConsulta) AS QuantidadeConsultas
FROM consulta c
JOIN medico m ON c.idMedico = m.idMedico
JOIN especialidade e ON m.idEspecialidade = e.idEspecialidade
GROUP BY e.nomeEspecialidade;

SELECT*FROM vw_consultas_especialidade

/*3-Criar uma procedure que permita saber quantos médicos possuímos por especialidade. 
A procedure deverá exibir a quantidade de médico de acordo com o nome da 
especialidade informada. Executar a procedure.*/
CREATE PROCEDURE sp_MedicoEspecialidade(IN nomeEspecialidade VARCHAR(30))
    SELECT COUNT(*) AS quantidade_medicos
    FROM medico m
    JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
    WHERE e.nomeEspecialidade = nomeEspecialidade; 

CALL sp_MedicoEspecialidade('Cardiologista');

/*4-Criar uma procedure para resetar todas as senhas dos médicos para DOCTOR e 
executá-la*/
CREATE PROCEDURE sp_senhaMedico()
    UPDATE medico
    SET senha = 'DOCTOR';

CALL sp_senhaMedico();

SELECT*FROM medico

/*5- Criar uma procedure para alterar as informações de paciente.*/
CREATE PROCEDURE pu_PacienteAlterar(
    IN p_nome VARCHAR(50),
    IN p_logradouro VARCHAR(30),
    IN p_numero VARCHAR(6),
    IN p_complemento VARCHAR(10),
    IN p_cidade VARCHAR(20),
    IN p_cpf CHAR(11)
)
 
    UPDATE paciente
    SET logradouro = p_logradouro,
        numero = p_numero,
        complemento = p_complemento,
        cidade = p_cidade
    WHERE cpf = p_cpf AND nome = p_nome;
    
    CALL pu_PacienteAlterar('Minie', 'nova rua', '456', 'ap10', 'São Paulo', '00998877665');


SELECT*FROM paciente

/*6-Criar uma procedure para inserir uma consulta na clínica.*/
CREATE PROCEDURE pi_Consulta(
    IN
	  p_idPaciente INT,
    p_idRecepcionista INT,
    p_idMedico INT,
     p_dataHoraConsulta DATETIME,
     p_sintomas VARCHAR(200),
     p_prescricao VARCHAR(200))
     
       INSERT INTO consulta (idPaciente, idRecepcionista, idMedico, dataHoraConsulta, sintomas, prescricao)
    VALUES (p_idPaciente, p_idRecepcionista, p_idMedico, p_dataHoraConsulta, p_sintomas, p_prescricao);
    
    CALL pi_Consulta (3, 1, 1, '2024-06-30 15:00:00', 'Dor no peito',NULL)
    
    SELECT*FROM consulta
    
    
    