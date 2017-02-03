CREATE TABLE jogador(
   	id_jogador serial PRIMARY KEY,
    numero int NOT NULL,
    nome varchar(50) NOT NULL,
    idade int NOT NULL,
    posicao varchar NOT NULL,
    situacao varchar(20) NOT NULL
);
CREATE TABLE clube(
    id_clube serial PRIMARY KEY,
    nome varchar(30) NOT NULL,
    escudo varchar(30) NOT NULL
);
CREATE TABLE estadio(
    id_estadio serial PRIMARY KEY,
    nome varchar(30) NOT NULL,
    capacidade varchar(12) NOT NULL,
    cep char(10)
);
CREATE TABLE tecnico(
    id_tecnico serial PRIMARY KEY,
    nome varchar(50) NOT NULL,
    idade int NOT NULL,
    clube varchar(30) NOT NULL
);
CREATE TABLE equipe(
    id_equipe serial PRIMARY KEY,
    id_tecnico int NOT NULL,
    id_clube int NOT NULL,
    divisao varchar(10) NOT NULL,
    categoria varchar(10) NOT NULL,
    tecnico_fk integer NOT NULL,
    clube_fk integer NOT NULL,
    FOREIGN KEY (tecnico_fk) REFERENCES tecnico (id_tecnico),
    FOREIGN KEY (clube_fk) REFERENCES clube (id_clube)
);
CREATE TABLE partida(
    id_partida serial PRIMARY KEY,
    data char(10) NOT NULL,
    publico int NOT NULL,
    mandante varchar(30) NOT NULL,
    id_estadio int NOT NULL,
    mandante_fk integer NOT NULL,
    FOREIGN KEY (mandante_fk) REFERENCES equipe (id_equipe)
);
CREATE TABLE jogador_partida(
    PRIMARY KEY (id_jogador, id_partida),
    gol int NOT NULL,
    qtd_cartao_amarelo int NOT NULL,
    qtd_cartao_vemelho int NOT NULL,
    jogador_fk integer NOT NULL,
    partida_fk integer NOT NULL,
    FOREIGN KEY (jogador_fk) REFERENCES jogador (id_jogador),
    FOREIGN KEY (partida_fk) REFERENCES partida (id_partida)
);
CREATE TABLE equipe_jogador(
    PRIMARY KEY (id_equipe, id_jogador),
    equipe_fk integer NOT NULL,
    jogador_fk integer NOT NULL,
    FOREIGN KEY (equipe_fk) REFERENCES equipe (id_equipe),
    FOREIGN KEY (id_jogador_fk) REFERENCES jogador (id_jogador)
);
CREATE TABLE clube_estadio(
    PRIMARY KEY (id_clube, id_estadio),
    id_clube integer NOT NULL,
    estadio_fk integer NOT NULL,
    FOREIGN KEY (id_clube_fk) REFERENCES clube (id_clube),
    FOREIGN KEY (estadio_fk) REFERENCES estadio (id_estadio)
);
    
    



    
    
     
    
    
    