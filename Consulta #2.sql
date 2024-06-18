

SHOW TABLES
SELECT*FROM

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

CREATE TABLE medico(
idMedico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
IdEspecialidade INT NOT NULL,
nome VARCHAR(50) NOT NULL,
crm CHAR(8) NOT NULL,
login VARCHAR(20) NOT NULL,
senha CHAR(6) NOT NULL
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
 