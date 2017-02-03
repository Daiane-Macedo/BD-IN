CREATE TABLE cliente(
    cpf_cliente serial PRIMARY KEY,
    nome varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    cep char(9) NOT NULL
);
CREATE TABLE floricultura(
    cnpj bigserial PRIMARY KEY,
    nome varchar [20] NOT NULL
);
CREATE TABLE flor(
    id_flor serial PRIMARY KEY,
    nome varchar(20) NOT NULL,
    preco varchar (10) NOT NULL
);
CREATE TABLE regiao(
    cep serial PRIMARY KEY,
    nome varchar(30) NOT NULL
);    
CREATE TABLE pedido(
    id_pedido serial PRIMARY KEY,
    valor varchar(10) NOT NULL,
    end_entrega varchar (100) NOT NULL,
    data char (10) NOT NULL,
    cpf_cliente integer NOT NULL,
    cliente_fk integer NOT NULL,
    floricultura_fk integer NOT NULL,
    FOREIGN KEY (cliente_fk) REFERENCES cliente (cpf_cliente),
    FOREIGN KEY (floricultura_fk) REFERENCES floricultura (cnpj)
);
CREATE TABLE pedido_flor(
    PRIMARY KEY (id_flor,id_pedido),
    id_flor integer NOT NULL,
    id_pedido integer NOT NULL,
    id_flor_fk integer NOT NULL,
    id_pedido_fk integer NOT NULL,
    qtd_flor int NOT NULL,
    FOREIGN KEY (id_flor_fk) REFERENCES flor (id_flor),
    FOREIGN KEY (id_pedido_fk) REFERENCES pedido (id_pedido)
);
CREATE TABLE flor_floricultura(
    id_flor_cnpj serial PRIMARY KEY,
    flor_fk integer NOT NULL,
    cnpj_floricultura_fk integer,
    FOREIGN KEY (flor_fk) REFERENCES flor (id_flor),
    FOREIGN KEY (cnpj_floricultura_fk) REFERENCES floricultura (cnpj)   
);
CREATE TABLE regiao_floricultura(
    id_cep_cnpj serial PRIMARY KEY,
	regiao_fk integer NOT NULL,
    id_floricultura_fk integer NOT NULL,
    FOREIGN KEY (regiao_fk) REFERENCES regiao (cep),
    FOREIGN KEY (id_floricultura_fk) REFERENCES floricultura (cnpj)
 );   
    
    
    
    
	    