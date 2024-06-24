

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



 
 
