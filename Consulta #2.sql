

SHOW TABLES
SELECT*FROM paciente

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


INSERT INTO recepcionista(nomeRecepcionista,login,senha,celular,cpf)
('Chico


 