#-----------------------------------------------------------------
# Cria o banco de dados
#-----------------------------------------------------------------
CREATE DATABASE desafio_sql;

#-----------------------------------------------------------------
# Seleciona o banco como default
#-----------------------------------------------------------------
USE desafio_sql;

#-----------------------------------------------------------------
# Cria as tabelas remessa e infracao
#-----------------------------------------------------------------
CREATE TABLE remessa(
	id int unsigned not null auto_increment,
	totalInfracao int,
	situacao varchar(20),
	PRIMARY KEY (id)
);

CREATE TABLE infracao (
	numero int unsigned not null auto_increment,
    remessaId int unsigned not null,
    dataHora datetime,
    equipamento varchar(20),
    velPermitida int,
    velMedida int,
    valida boolean,
    PRIMARY KEY (numero),
    CONSTRAINT fk_remessaId FOREIGN KEY (remessaId) REFERENCES remessa (id)
);

#-----------------------------------------------------------------
# Faz as insercoes na tabela remessa
#-----------------------------------------------------------------
INSERT INTO remessa(totalInfracao, situacao) VALUES (10, "Criada");
INSERT INTO remessa(totalInfracao, situacao) VALUES (5, "Expedida");
INSERT INTO remessa(totalInfracao, situacao) VALUES (6, "Aceita");
INSERT INTO remessa(totalInfracao, situacao) VALUES (3, "Nao Aceita");

#-----------------------------------------------------------------
# faz as insercoes na tabela infracao
#-----------------------------------------------------------------

INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (1, "2020-11-08 09:35:10", "RS-287", 80, 85, true);
INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (1, "2020-11-08 10:10:25", "RS-287", 80, 75, false);
INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (1, "2020-11-08 11:15:45", "RS-287", 80, 70, false);
INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (1, "2020-11-08 12:00:02", "RS-287", 80, 90, true);
INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (1, "2020-11-08 14:19:45", "RS-287", 80, 60, false);
INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (1, "2020-11-08 14:22:58", "RS-287", 80, 100, true);
INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (1, "2020-11-08 16:39:54", "RS-287", 80, 97, true);
INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (1, "2020-11-08 17:38:46", "RS-287", 80, 60, false);
INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (1, "2020-11-08 20:51:49", "RS-287", 80, 120, true);
INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (1, "2020-11-08 22:05:05", "RS-287", 80, 80, false);


INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (2, "2020-11-28 08:35:10", "RS-287", 100, 125, true);
INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (2, "2020-11-30 10:10:25", "RS-287", 100, 95, false);
INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (2, "2020-12-01 11:15:45", "RS-287", 100, 90, false);
INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (2, "2020-12-03 12:00:02", "RS-287", 100, 130, true);
INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (2, "2020-12-05 14:19:45", "RS-287", 100, 89, false);


INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (3, "2020-12-08 09:35:10", "RS-287", 90, 85, true);
INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (3, "2020-12-08 10:10:25", "RS-287", 90, 75, false);
INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (3, "2020-12-08 11:15:45", "RS-287", 90, 90, false);
INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (3, "2021-01-08 12:00:02", "RS-287", 90, 130, true);
INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (3, "2021-02-08 14:19:45", "RS-287", 90, 80, false);
INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (3, "2021-03-08 14:22:58", "RS-287", 90, 120, true);

INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (4, "2021-04-01 09:45:10", "RS-287", 60, 85, true);
INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (4, "2021-04-05 10:11:25", "RS-287", 60, 55, false);
INSERT INTO infracao(remessaId, dataHora, equipamento, velPermitida, velMedida, valida) VALUES (4, "2021-03-01 09:00:10", "RS-287", 60, 72, true);

#-----------------------------------------------------------------
# Select para infracoes com velocidade igual ou superior a 20%
#-----------------------------------------------------------------

SELECT velMedida AS "Velocidade Medida", velPermitida AS "Velocidade Permitida", equipamento AS "Equipamento", dataHora AS "Data e Hora" 
FROM infracao 
WHERE velMedida >= (velPermitida * 1.2) AND valida = true 
ORDER BY dataHora;

#-----------------------------------------------------------------
# Select para remessas
#-----------------------------------------------------------------

SELECT r.id AS "Identificacao", r.situacao AS "Situacao", r.totalInfracao AS "Total Infracoes", COUNT(i.remessaId) AS "Total Infracoes Validas", (r.totalInfracao - COUNT(i.remessaId)) AS "Total Infracoes Invalidas"
FROM infracao AS i, remessa AS r 
WHERE i.valida = true AND r.id = i.remessaId 
GROUP BY i.remessaId
ORDER BY r.situacao;
