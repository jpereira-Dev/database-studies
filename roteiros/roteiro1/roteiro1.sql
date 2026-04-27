-- criação da tabela de automovel
CREATE TABLE AUTOMOVEL (
    chassi CHAR(17) PRIMARY KEY,
    dono CHAR(11),
    placa CHAR(7),
    modelo VARCHAR(30) NOT NULL,
    cor VARCHAR(30),
    tipo_combustivel VARCHAR(19),
    montadora VARCHAR(25),
    ano_fabricacao INTEGER NOT NULL,
    FOREIGN KEY (dono) REFERENCES SEGURADO(cpf)
);     

CREATE TABLE SEGURADO (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(30),
    contato CHAR(11),
    endereco TEXT,
);

CREATE TABLE PERITO(

    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(30),
    laudo TEXT,
    contato CHAR(11)
);

CREATE TABLE OFICINA (
    cnpj CHAR(14) PRIMARY KEY,
    contato CHAR(11),
    endereco TEXT
);

CREATE TABLE SEGURO(
    number_contract INT PRIMARY KEY,
    segurado CHAR(11),
    automovel CHAR(17),
    data_inicio DATE,
    data_fim DATE,
    FOREIGN KEY (segurado) REFERENCES SEGURADO(cpf),
    FOREIGN KEY (automovel) REFERENCES AUTOMOVEL(chassi)
);