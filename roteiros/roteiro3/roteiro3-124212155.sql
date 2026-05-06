CREATE TYPE estados AS ENUM ('AL','BA','CE','MA','PB','PE','PI','RN');

CREATE TABLE FARMACIAS(
    id INT PRIMARY KEY,
    tipo VARCHAR(8),
    bairro VARCHAR(30) UNIQUE,
    cidade VARCHAR(30),
    gerente CHAR(11) UNIQUE,
    tipo_gerente VARCHAR(30) NOT NULL,
    estado estados,

    CONSTRAINT validacao CHECK (tipo = 'filial' OR tipo = 'sede')
    CONSTRAINT funcionario_gerente_fkey FOREIGN KEY (gerente,tipo_gerente) REFERENCES FUNCIONARIOS(cpf,tipo)
    CONSTRAINT unico_valor_se EXCLUDE USING gist (tipo WITH =) WHERE (tipo = 'sede'),
    CONSTRAINT tipo_gerente_fkey CHECK (tipo_gerente IN ('farmacêutico', 'admistrador'))

);

CREATE TABLE ENDERECOS_CLIENTES(

    id INT PRIMARY KEY,
    tipo VARCHAR(15) NOT NULL,
    cliente CHAR(11) NOT NULL,
    numero_casa INT,
    bairro TEXT,
    cidade TEXT,
    estado  TEXT,

    CONSTRAINT cliente_endereco FOREIGN KEY (cliente) REFERENCES CLIENTES(cpf),
    CONSTRAINT tipo_endereco CHECK (tipo IN ('residencia','casa'))
);

CREATE TABLE FUNCIONARIOS(

    cpf CHAR(11) PRIMARY KEY,
    tipo VARCHAR(30),
    nome VARCHAR(30) NOT NULL,
    vinculo_empregaticio INT UNIQUE SET NULL,

    CONSTRAINT validacao  CHECK(tipo IN ('farmacêutico', 'vendedor', 'entregador', 'caixa', 'admistrador')),
    CONSTRAINT empresa_vinculada FOREIGN KEY (vinculo_empregaticio) REFERENCES FARMACIAS(id),
    UNIQUE(cpf,tipo)

);

CREATE TABLE MEDICAMENTOS(
    id INT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    laboratorio VARCHAR(30) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
    receita BOOLEAN NOT NULL
    
);

CREATE TABLE VENDAS(
    id INT PRIMARY KEY,
    cliente CHAR(11), 
    medicamento INT,
    quantidade INT,
    funcionario CHAR(11) NOT NULL,
    tipo_funcionario VARCHAR(10),
    data_venda DATE,

    CONSTRAINT medicamento_venda_fkey FOREIGN KEY (medicamento) REFERENCES MEDICAMENTOS(id) ON DELETE RESTRICT,
    CONSTRAINT cliente_venda_fkey FOREIGN KEY (cliente) REFERENCES CLIENTES(cpf),
    CONSTRAINT funcionario_venda_fkey FOREIGN KEY (funcionario) REFERENCES FUNCIONARIOS(cpf) ON DELETE RESTRICT,
    CONSTRAINT tipo_funcionario_venda CHECK (tipo_funcionario = 'vendedor')
);

CREATE TABLE ENTREGAS(
    id INT PRIMARY KEY,
    venda INT,
    cliente CHAR(11) NOT NULL,
    data_entrega DATE,

    CONSTRAINT venda_entrega_fkey FOREIGN KEY (venda) REFERENCES VENDAS(id),
    CONSTRAINT cliente_entrega_fkey FOREIGN KEY (cliente) REFERENCES CLIENTES(cpf)  
);

CREATE TABLE CLIENTES(

    cpf CHAR(11) PRIMARY KEY,
    idade INT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    contato VARCHAR(20) NOT NULL,

    CONSTRAINT contato_unico UNIQUE (contato),
    CONSTRAINT idade_validacao CHECK (idade >= 18)
);


