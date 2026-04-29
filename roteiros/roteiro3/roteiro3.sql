CREATE TABLE FARMACIAS(
    id INT PRIMARY KEY,
    tipo VARCHAR(8),
    bairro VARCHAR(30),
    cidade VARCHAR(30),
    estado  VARCHAR(30),
    gerente CHAR(11) UNIQUE

    CONSTRAINT validacao CHECK (tipo = 'filial' OR tipo = 'sede')
    CONSTRAINT enderecos_unidade_fkey FOREIGN KEY (endereco) REFERENCES ENDERECOS(unidade)
    CONSTRAINT funcionario_gerente_fkey FOREIGN KEY (gerente) REFERENCES FUNCIONARIOS(cpf)

);

CREATE TABLE ENDERECOS_CLIENTES(

    id INT PRIMARY KEY,
    tipo VARCHAR(8)
    cliente CHAR(11),
    numero_casa INT,
    bairro TEXT,
    cidade TEXT,
    estado  TEXT,

    CONSTRAINT cliente_endereco FOREIGN KEY (cliente) REFERENCES CLIENTES(cpf)
    CONSTRAINT tipo_endereco CHECK (tipo IN ('residencia','casa','outro'))
);

CREATE TABLE FUNCIONARIOS(

    cpf CHAR(11) PRIMARY KEY,
    tipo VARCHAR(30),
    nome VARCHAR(30) NOT NULL,
    vinculo_empregaticio INT UNIQUE,
    CONSTRAINT validacao  CHECK(tipo = 'farmacêutico' OR tipo = 'vendedor' OR  tipo = 'entregadores' OR tipo = 'caixa' OR  tipo = 'admistrador')
    CONSTRAINT empresa_vinculada FOREIGN KEY (vinculo_empregaticio) REFERENCES FARMACIAS(id)

);

CREATE TABLE MEDICAMENTOS(

);

CREATE TABLE VENDAS(

);

CREATE TABLE ENTREGAS(

);

CREATE TABLE CLIENTES(

    cpf CHAR(11) PRIMARY KEY,
    endereco 
);


