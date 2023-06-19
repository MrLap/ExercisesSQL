
CREATE TABLE nivel_escolaridade (
  id_nivel_escolaridade INT PRIMARY KEY AUTO_INCREMENT,
  descricao VARCHAR(45) NOT NULL);

CREATE TABLE departamento (
   id_departamento INT PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR(45) NOT NULL,
   id_gerente INT NULL,
   id_departamento_gerencia INT NULL);

CREATE TABLE empregado (
  id_empregado INT PRIMARY KEY AUTO_INCREMENT,
  primeiro_nome VARCHAR(45) NOT NULL,
  sobrenome VARCHAR(45) NOT NULL,
  id_departamento INT,
  telefone VARCHAR(11) NULL,
  data_nascimento DATE NULL,
  data_contratacao DATE NULL,
  sexo CHAR(1) NULL,
  salario DOUBLE NOT NULL,
  bonus DOUBLE NULL,
  id_nivel_escolaridade INT NULL);

CREATE TABLE projeto (
  id_projeto INT PRIMARY KEY AUTO_INCREMENT,
  descricao VARCHAR(45) NOT NULL,
  data_inicio DATE NOT NULL,
  data_fim DATE NOT NULL,
  id_departamento INT NOT NULL,
  custo DOUBLE NOT NULL,
  id_gerente INT NOT NULL,
  id_projeto_principal INT NULL);

CREATE TABLE atividade (
  id_atividade INT PRIMARY KEY AUTO_INCREMENT,
  descricao VARCHAR(45) NOT NULL);

CREATE TABLE empregado_projeto (
  id_projeto INT,
  id_empregado INT,
  id_atividade INT,
  tempo_gasto TIME NOT NULL,
  data_inicio DATE NOT NULL,
  data_fim DATE NOT NULL,
  CONSTRAINT PRIMARY KEY(id_empregado, id_projeto, id_atividade));

ALTER TABLE departamento ADD FOREIGN KEY(id_departamento_gerencia) REFERENCES departamento(id_departamento);
ALTER TABLE departamento ADD FOREIGN KEY(id_gerente) REFERENCES empregado(id_empregado);
ALTER TABLE empregado ADD FOREIGN KEY(id_departamento) REFERENCES departamento(id_departamento);
ALTER TABLE empregado ADD FOREIGN KEY(id_nivel_escolaridade) REFERENCES nivel_escolaridade(id_nivel_escolaridade);
ALTER TABLE projeto ADD FOREIGN KEY(id_gerente) REFERENCES empregado(id_empregado);
ALTER TABLE projeto ADD FOREIGN KEY(id_projeto_principal) REFERENCES projeto(id_projeto);
ALTER TABLE empregado_projeto ADD FOREIGN KEY(id_projeto) REFERENCES projeto(id_projeto);
ALTER TABLE empregado_projeto ADD FOREIGN KEY(id_atividade) REFERENCES atividade(id_atividade);
ALTER TABLE empregado_projeto ADD FOREIGN KEY(id_empregado) REFERENCES empregado(id_empregado);


INSERT INTO `atividade` (`id_atividade`, `descricao`) VALUES (NULL, 'GerÃªncia'), (NULL, 'ProgramaÃ§Ã£o'), (NULL, 'AnÃ¡lise de Sistemas'), (NULL, 'Suporte'), (NULL, 'Vendas'), (NULL, 'Teste'), (NULL, 'ImplantaÃ§Ã£o'), (NULL, 'ManutenÃ§Ã£o de Rede'), (NULL, 'ManutenÃ§Ã£o de BD'), (NULL, 'Auxiliar Financeiro');

INSERT INTO `departamento` (`id_departamento`, `nome`, `id_departamento_gerencia`) VALUES (NULL, 'PresidÃªncia', NULL),
(NULL, 'Diretorias', 1), (NULL, 'AnÃ¡lise de Sistemas', 2), (NULL, 'Desenvolvimento de Sistemas', 3), (NULL, 'Testes', 3), (NULL, 'Suporte', 3), (NULL, 'Vendas', 2), (NULL, 'Financeiro', 2);

INSERT INTO `nivel_escolaridade` (`id_nivel_escolaridade`, `descricao`) VALUES
(NULL, 'Ensino MÃ©dio'), (NULL, 'Curso TÃ©cnico'), (NULL, 'Superior'), (NULL, 'EspecializaÃ§Ã£o'), (NULL, 'Mestrado'), (NULL, 'Doutorado');


INSERT INTO `empregado` (`id_empregado`, `primeiro_nome`, `sobrenome`, `id_departamento`, `telefone`, `data_nascimento`, `data_contratacao`, `sexo`, `salario`, `bonus`, `id_nivel_escolaridade`) VALUES
(NULL, 'Mauricio', 'Galiote', '1', '44999577675', '1966-08-23', '2000-03-08', 'M', '15000', '2000', '6'),
(NULL, 'Alexandre', 'Matos', '2', '44999572134', '1977-02-26', '2003-04-02', 'M', '10000', '1000', '5'),
(NULL, 'Cuca', 'da Silva', '3', '44999432114', '1978-09-12', '2005-01-09', 'M', '8000', '500', '4'),
(NULL, 'Dudu', 'Hernandez', '4', '44999573232', '1992-02-11', '2009-05-27', 'M', '16000', '3000', '3'),
(NULL, 'Roger', 'Guedes', '4', '44999578899', '1993-06-21', '2009-04-22', 'M', '3000', '1000', '3'),
(NULL, 'Edu', 'Dracena', '4', '44999323221', '1998-04-28', '2010-03-17', 'M', '2000', '0', '3'),
(NULL, 'Gabriel', 'Jesus', '4', '44999575566', '1999-03-14', '2011-05-11', 'M', '5000', '2000', '3'),
(NULL, 'Neymar', 'Santos', '5', '44999563222', '1993-02-21', '2012-06-27', 'M', '1000', '1000', '3'),
(NULL, 'Alejandro', 'Guerra', '5', '44999118822', '1996-09-21', '2013-08-08', 'M', '2000', '500', '2'),
(NULL, 'Matheus', 'Macedo', '6', '44999114546', '1997-02-25', '2003-09-02', 'M', '1000', '200', '2'),
(NULL, 'Juliana', 'GuanaÃ­ra', '7', '44944114546', '1991-03-25', '2004-05-02', 'F', '1000', '200', '2'),
(NULL, 'Maria', 'Silva', '7', '44992114546', '1994-06-25', '2001-09-02', 'F', '1000', '200', '2'),
(NULL, 'ZÃ©', 'Roberto', '8', '44996614546', '1994-06-25', '2009-09-02', 'M', '3000', '200', '2'),
(NULL, 'JoÃ£o', 'Coelho', '8', '44991114546', '1999-06-25', '2003-05-02', 'M', '3000', '200', '2');

UPDATE `departamento` SET `id_gerente` = '1' WHERE `id_departamento` = 1;
UPDATE `departamento` SET `id_gerente` = '2' WHERE `id_departamento` = 2;
UPDATE `departamento` SET `id_gerente` = '3' WHERE `id_departamento` = 3;
UPDATE `departamento` SET `id_gerente` = '4' WHERE `id_departamento` = 4;
UPDATE `departamento` SET `id_gerente` = '8' WHERE `id_departamento` = 5;
UPDATE `departamento` SET `id_gerente` = '10' WHERE `id_departamento` = 6;
UPDATE `departamento` SET `id_gerente` = '11' WHERE `id_departamento` = 7;
UPDATE `departamento` SET `id_gerente` = '13' WHERE `id_departamento` = 8;

INSERT INTO `projeto` (`id_projeto`, `descricao`, `data_inicio`, `data_fim`, `id_departamento`, `custo`, `id_gerente`, `id_projeto_principal`) VALUES
(NULL, 'Sistema de Supermercado', '2014-05-08', '2017-12-31', '3', '100000', '3', NULL),
(NULL, 'Site de Supermercado', '2015-01-01', '2017-12-31', '3', '50000', '3', 1),
(NULL, 'Sistema de Padaria', '2017-01-01', '2017-12-31', '3', '30000', '4', NULL),
(NULL, 'Melhoria do Suporte', '2014-05-08', '2017-12-31', '3', '100000', '6', NULL),
(NULL, 'Melhoria da Qualidade do Software', '2014-01-01', '2015-12-31', '3', '5000', '5', NULL),
(NULL, 'Sistema de Venda por Celular', '2011-01-01', '2015-12-31', '4', '35000', '5', NULL),
(NULL, 'Site de Vendas Online', '2014-01-01', '2015-12-31', '4', '55000', '5', 6);

INSERT INTO `empregado_projeto` (`id_projeto`, `id_empregado`, `id_atividade`, `tempo_gasto`, `data_inicio`, `data_fim`) VALUES
('1', '3', '1', '12:00:00', '2014-05-08', '2017-12-31'),
('1', '4', '3', '50:00:00', '2015-07-03', '2017-12-31'),
('1', '5', '2', '100:00:00', '2015-08-01', '2017-10-15'),
('1', '6', '2', '100:00:00', '2015-08-01', '2017-10-15'),
('1', '7', '2', '100:00:00', '2015-08-01', '2017-10-15'),
('1', '6', '6', '20:00:00', '2015-08-01', '2017-10-15'),
('2', '3', '1', '12:00:00', '2014-05-08', '2017-12-31'),
('2', '4', '3', '50:00:00', '2015-07-03', '2017-12-31'),
('2', '5', '2', '100:00:00', '2015-08-01', '2017-10-15'),
('2', '6', '2', '100:00:00', '2015-08-01', '2017-10-15'),
('2', '7', '2', '100:00:00', '2015-08-01', '2017-10-15'),
('2', '8', '6', '20:00:00', '2015-08-01', '2017-10-15'),
('3', '3', '1', '12:00:00', '2014-05-08', '2017-12-31'),
('3', '4', '3', '50:00:00', '2015-07-03', '2017-12-31'),
('3', '5', '2', '100:00:00', '2015-08-01', '2017-10-15'),
('3', '6', '2', '100:00:00', '2015-08-01', '2017-10-15'),
('3', '7', '2', '100:00:00', '2015-08-01', '2017-10-15'),
('3', '9', '6', '20:00:00', '2015-08-01', '2017-10-15'),
('4', '3', '1', '12:00:00', '2014-05-08', '2017-12-31'),
('4', '4', '3', '50:00:00', '2015-07-03', '2017-12-31'),
('4', '5', '4', '100:00:00', '2015-08-01', '2017-10-15'),
('4', '6', '4', '100:00:00', '2015-08-01', '2017-10-15'),
('4', '7', '4', '100:00:00', '2015-08-01', '2017-10-15'),
('4', '9', '4', '20:00:00', '2015-08-01', '2017-10-15');


