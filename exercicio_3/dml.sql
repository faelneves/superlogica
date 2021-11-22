-- Server: MySQL
-- version: 5.0.2

CREATE TABLE USUARIO(
    id INT NOT NULL AUTO_INCREMENT,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE INFO(
    id INT NOT NULL AUTO_INCREMENT,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    genero VARCHAR(1) NOT NULL,
    ano_nascimento INT NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO USUARIO(cpf, nome) VALUES('16798125050', 'Luke Skywalker');
INSERT INTO USUARIO(cpf, nome) VALUES('59875804045', 'Bruce Wayne');
INSERT INTO USUARIO(cpf, nome) VALUES('04707649025', 'Diane Prince');
INSERT INTO USUARIO(cpf, nome) VALUES('21142450040', 'Bruce Banner');
INSERT INTO USUARIO(cpf, nome) VALUES('83257946074', 'Harley Quinn');
INSERT INTO USUARIO(cpf, nome) VALUES('07583509025', 'Peter Parker');


INSERT INTO INFO(cpf, genero, ano_nascimento) VALUES('16798125050', 'M', 1976);
INSERT INTO INFO(cpf, genero, ano_nascimento) VALUES('59875804045', 'M', 1960);
INSERT INTO INFO(cpf, genero, ano_nascimento) VALUES('04707649025', 'F', 1988);
INSERT INTO INFO(cpf, genero, ano_nascimento) VALUES('21142450040', 'M', 1954);
INSERT INTO INFO(cpf, genero, ano_nascimento) VALUES('83257946074', 'F', 1970);
INSERT INTO INFO(cpf, genero, ano_nascimento) VALUES('07583509025', 'M', 1972);

SELECT CONCAT(usuario.nome, " - ", info.genero) AS usuário,
       (CASE WHEN (year(curdate())-info.ano_nascimento) < 50 THEN 'NÃO'
           ELSE 'SIM' END) AS maior_50_anos
FROM usuario
	JOIN info ON usuario.cpf = info.cpf
WHERE usuario.nome IN ('Peter Parker','Luke Skywalker','Bruce Banner')
ORDER BY usuario.cpf;