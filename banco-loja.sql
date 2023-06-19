CREATE TABLE estado (
  `id_estado` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `uf` char(2) NOT NULL);  

CREATE TABLE cidade (
  `id_cidade` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `id_estado` INT NULL);

CREATE TABLE cliente(
  `id_cliente` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NULL,
  `id_cidade` INT NULL, 
  `telefone` VARCHAR(11) NULL);

CREATE TABLE departamento(
  `id_departamento` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL);  
  
CREATE TABLE funcionario(
  `id_funcionario` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `data_contratacao` DATE NULL,
  `cargo` VARCHAR(30) NULL,
  `salario_fixo` decimal(10,2) NULL,
  `bonus` decimal(10,2) NULL,
  `id_departamento` INT NULL,
  `id_gerente` INT NULL);  

CREATE TABLE categoria(
  `id_categoria` INT PRIMARY KEY AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL);

CREATE TABLE produto(
  `id_produto` INT PRIMARY KEY AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `preco_compra` decimal(10,2) NULL,  
  `preco_venda` decimal(10,2) NULL,
  `id_categoria` INT NULL,
  `quantidade` INT NULL);

CREATE TABLE pedido(
  `id_pedido` INT PRIMARY KEY AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `total` decimal(10,2) NULL,
  `id_funcionario` INT NOT NULL,
  `id_cliente` INT NOT NULL);

CREATE TABLE itens_pedido (
  `id_item_pedido` INT PRIMARY KEY AUTO_INCREMENT,
  `id_produto` INT NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `quantidade` INT NOT NULL,
  `id_pedido` INT NOT NULL);
  
ALTER TABLE cidade add CONSTRAINT FOREIGN KEY(id_estado) REFERENCES estado(id_estado);
ALTER TABLE cliente add CONSTRAINT FOREIGN KEY(id_cidade) REFERENCES cidade(id_cidade);
ALTER TABLE produto add CONSTRAINT FOREIGN KEY(id_categoria) REFERENCES categoria(id_categoria);
ALTER TABLE funcionario add CONSTRAINT FOREIGN KEY(id_gerente) REFERENCES funcionario(id_funcionario);
ALTER TABLE funcionario add CONSTRAINT FOREIGN KEY(id_departamento) REFERENCES departamento(id_departamento);
ALTER TABLE pedido add CONSTRAINT FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE pedido add CONSTRAINT FOREIGN KEY(id_funcionario) REFERENCES funcionario(id_funcionario);
ALTER TABLE itens_pedido add CONSTRAINT FOREIGN KEY(id_pedido) REFERENCES pedido(id_pedido);
ALTER TABLE itens_pedido add CONSTRAINT FOREIGN KEY(id_produto) REFERENCES produto(id_produto);

INSERT INTO `estado` (`id_estado`, `nome`, `uf`) VALUES (NULL, 'ParanÃ¡', 'PR');
INSERT INTO `estado` (`id_estado`, `nome`, `uf`) VALUES (NULL, 'SÃ£o Paulo', 'SP');
INSERT INTO `estado` (`id_estado`, `nome`, `uf`) VALUES (NULL, 'Santa Catarina', 'SC');
INSERT INTO `estado` (`id_estado`, `nome`, `uf`) VALUES (NULL, 'RIo Grande do Sul', 'RS');

INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'Guarapuava', '1');
INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'Curitiba', '1');
INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'Londrina', '1');
INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'MaringÃ¡', '1');
INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'SÃ£o JosÃ© dos Campos', '2');
INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'SÃ£o Paulo', '2');
INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'Campinas', '2');
INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'SÃ£o JosÃ© dos Campos', '2');
INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'FlorianÃ³polis', '3');
INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'Blumenau', '3');
INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'Ponta Grossa', NULL);

INSERT INTO `departamento` (`id_departamento`, `nome`) VALUES (NULL, 'RH');
INSERT INTO `departamento` (`id_departamento`, `nome`) VALUES (NULL, 'Diretoria');
INSERT INTO `departamento` (`id_departamento`, `nome`) VALUES (NULL, 'TI');
INSERT INTO `departamento` (`id_departamento`, `nome`) VALUES (NULL, 'Vendas');
INSERT INTO `departamento` (`id_departamento`, `nome`) VALUES (NULL, 'Financeiro');

INSERT INTO `funcionario` (`id_funcionario`, `nome`, `data_contratacao`, `cargo`, `salario_fixo`, `bonus`, `id_departamento`, `id_gerente`) VALUES (NULL, 'Mario Bros', '2007-05-21', 'Presidente', '15000', '2000', '2', NULL);
INSERT INTO `funcionario` (`id_funcionario`, `nome`, `data_contratacao`, `cargo`, `salario_fixo`, `bonus`, `id_departamento`, `id_gerente`) VALUES (NULL, 'Luigi Bros', '2009-05-21', 'Diretor', '12000', '1000', '2', '1');
INSERT INTO `funcionario` (`id_funcionario`, `nome`, `data_contratacao`, `cargo`, `salario_fixo`, `bonus`, `id_departamento`, `id_gerente`) VALUES (NULL, 'Paulo Nobre', '2002-07-20', 'Gerente', '13000', '2000', '5', '2');
INSERT INTO `funcionario` (`id_funcionario`, `nome`, `data_contratacao`, `cargo`, `salario_fixo`, `bonus`, `id_departamento`, `id_gerente`) VALUES (NULL, 'Bill Gates', '2015-05-11', 'Programador', '5000', '500', '3', '2');
INSERT INTO `funcionario` (`id_funcionario`, `nome`, `data_contratacao`, `cargo`, `salario_fixo`, `bonus`, `id_departamento`, `id_gerente`) VALUES (NULL, 'Tony Stark', '2002-09-21', 'TÃ©cnico', '2000', '1000', '3', '4');
INSERT INTO `funcionario` (`id_funcionario`, `nome`, `data_contratacao`, `cargo`, `salario_fixo`, `bonus`, `id_departamento`, `id_gerente`) VALUES (NULL, 'JosÃ© da Silva', '2009-05-21', 'Gerente', '2000', '200', '4', '2');
INSERT INTO `funcionario` (`id_funcionario`, `nome`, `data_contratacao`, `cargo`, `salario_fixo`, `bonus`, `id_departamento`, `id_gerente`) VALUES (NULL, 'JoÃ£o da Garrincha', '2001-01-22', 'Vendedor', '1000', '200', '4', '6');
INSERT INTO `funcionario` (`id_funcionario`, `nome`, `data_contratacao`, `cargo`, `salario_fixo`, `bonus`, `id_departamento`, `id_gerente`) VALUES (NULL, 'John Rambo', '2001-04-21', 'Vendedor', '1000', NULL, '4', '6');
INSERT INTO `funcionario` (`id_funcionario`, `nome`, `data_contratacao`, `cargo`, `salario_fixo`, `bonus`, `id_departamento`, `id_gerente`) VALUES (NULL, 'Joaquim Fernandez', '2004-01-22', 'Vendedor', '1000', '200', '4', '6');
INSERT INTO `funcionario` (`id_funcionario`, `nome`, `data_contratacao`, `cargo`, `salario_fixo`, `bonus`, `id_departamento`, `id_gerente`) VALUES (NULL, 'Maria da Silva', '2003-02-26', 'TÃ©cnico de RH', '3000', '300', '1', '2');


INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `id_cidade`, `telefone`) VALUES (NULL, 'Gabriel Jesus', 'Rua Juca, 45', '1', '44999566878');
INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `id_cidade`, `telefone`) VALUES (NULL, 'Fernando Pras', 'Rua XV, 55', '1', '44999564378');
INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `id_cidade`, `telefone`) VALUES (NULL, 'Dudu da Silva', 'Rua Guara, 45', '2', '44999066878');
INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `id_cidade`, `telefone`) VALUES (NULL, 'Felipe Melo', 'Rua Brasil, 52', '3', '23999566878');
INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `telefone`) VALUES (NULL, 'Roger Guedes', NULL, '47988566878');
INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `id_cidade`, `telefone`) VALUES (NULL, 'William Bigode', 'Rua 19, 21', '5', '25999566878');
INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `id_cidade`, `telefone`) VALUES (NULL, 'Miguel Borja', 'Rua JoÃ£o, 40', '6', '44999566878');
INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `id_cidade`, `telefone`) VALUES (NULL, 'ZÃ© Roberto da Silva', 'Rua XV, 53', '9', '44599566870');
INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `id_cidade`, `telefone`) VALUES (NULL, 'Jean da Silva', 'Rua Atlantica, 9', '1', '77699566878');
INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `id_cidade`, `telefone`) VALUES (NULL, 'Felipe Melo', 'Rua Brasil, 23', '3', '23999566878');

INSERT INTO `categoria` (`id_categoria`, `descricao`) VALUES (NULL, 'MemÃ³rias');
INSERT INTO `categoria` (`id_categoria`, `descricao`) VALUES (NULL, 'Processadores');
INSERT INTO `categoria` (`id_categoria`, `descricao`) VALUES (NULL, 'Placa MÃ£e');
INSERT INTO `categoria` (`id_categoria`, `descricao`) VALUES (NULL, 'Disco');
INSERT INTO `categoria` (`id_categoria`, `descricao`) VALUES (NULL, 'AcessÃ³rios');
INSERT INTO `categoria` (`id_categoria`, `descricao`) VALUES (NULL, 'Monitores');

INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Processador i7 2.8GHz','2','200', '400', '30');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Processador i5 2.0GHz','2','150', '300', '30');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Processador i3 2.2GHz','2','100', '200', '30');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'MemÃ³ria Kingston 8GB','1','100', '200', '20');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'MemÃ³ria Kingston 16GB','1','200', '300', '25');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'MemÃ³ria Scandisk 4GB','1','80', '120', '20');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'HD 1TB Samsung','4','200', '300', '40');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'HD 2TB Samsung','4','300', '400', '40');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'HD SSD 100GB Samsung','4','500', '800', '15');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'HD SSD 200GB Seagate','4','1000', '1500', '15');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Placa MÃ£e Intel P8','3','300', '600', '35');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Placa MÃ£e ASUS XM','3','340', '650', '35');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Mouse Wireless Multilaser','5','30', '60', '30');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Mouse com fio Multilaser','5','20', '40', '30');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Teclado Wireless Dell','5','30', '60', '30');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Teclado com fio Multilaser','5','10', '20', '30');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Monitor LG 15','6','300', '600', '20');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Monitor Dell 14','6','200', '500', '20');

INSERT INTO `pedido` (`id_pedido`, `data`, `total`, `id_funcionario`, `id_cliente`) VALUES (NULL, '2017-05-23', '1400', '7', '4');
INSERT INTO `itens_pedido` (`id_item_pedido`, `id_produto`, `preco`, `quantidade`, `id_pedido`) VALUES (NULL, '1', '400', '2', '1'), (NULL, '11', '600', '1', '1');

INSERT INTO `pedido` (`id_pedido`, `data`, `total`, `id_funcionario`, `id_cliente`) VALUES (NULL, '2017-02-22', '1400', '7', '5');
INSERT INTO `itens_pedido` (`id_item_pedido`, `id_produto`, `preco`, `quantidade`, `id_pedido`) VALUES (NULL, '1', '400', '2', '2'), (NULL, '11', '600', '1', '2');

INSERT INTO `pedido` (`id_pedido`, `data`, `total`, `id_funcionario`, `id_cliente`) VALUES (NULL, '2016-03-22', '1400', '7', '5');
INSERT INTO `itens_pedido` (`id_item_pedido`, `id_produto`, `preco`, `quantidade`, `id_pedido`) VALUES (NULL, '1', '400', '2', '3'), (NULL, '11', '600', '1', '3');

INSERT INTO `pedido` (`id_pedido`, `data`, `total`, `id_funcionario`, `id_cliente`) VALUES (NULL, '2016-02-12', '1400', '7', '6');
INSERT INTO `itens_pedido` (`id_item_pedido`, `id_produto`, `preco`, `quantidade`, `id_pedido`) VALUES (NULL, '1', '400', '2', '4'), (NULL, '11', '600', '1', '4');

INSERT INTO `pedido` (`id_pedido`, `data`, `total`, `id_funcionario`, `id_cliente`) VALUES (NULL, '2017-02-10', '1400', '8', '2');
INSERT INTO `itens_pedido` (`id_item_pedido`, `id_produto`, `preco`, `quantidade`, `id_pedido`) VALUES (NULL, '1', '400', '2', '5'), (NULL, '11', '600', '1', '5');

INSERT INTO `pedido` (`id_pedido`, `data`, `total`, `id_funcionario`, `id_cliente`) VALUES (NULL, '2017-05-10', '1800', '8', '8');
INSERT INTO `itens_pedido` (`id_item_pedido`, `id_produto`, `preco`, `quantidade`, `id_pedido`) VALUES (NULL, '1', '400', '3', '6'), (NULL, '11', '600', '1', '6');

INSERT INTO `pedido` (`id_pedido`, `data`, `total`, `id_funcionario`, `id_cliente`) VALUES (NULL, '2014-09-15', '1400', '8', '1');
INSERT INTO `itens_pedido` (`id_item_pedido`, `id_produto`, `preco`, `quantidade`, `id_pedido`) VALUES (NULL, '1', '400', '2', '7'), (NULL, '11', '600', '1', '7');
CREATE TABLE estado (
  `id_estado` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `uf` char(2) NOT NULL);  

CREATE TABLE cidade (
  `id_cidade` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `id_estado` INT NULL);

CREATE TABLE cliente(
  `id_cliente` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NULL,
  `id_cidade` INT NULL, 
  `telefone` VARCHAR(11) NULL);

CREATE TABLE departamento(
  `id_departamento` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL);  
  
CREATE TABLE funcionario(
  `id_funcionario` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `data_contratacao` DATE NULL,
  `cargo` VARCHAR(30) NULL,
  `salario_fixo` decimal(10,2) NULL,
  `bonus` decimal(10,2) NULL,
  `id_departamento` INT NULL,
  `id_gerente` INT NULL);  

CREATE TABLE categoria(
  `id_categoria` INT PRIMARY KEY AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL);

CREATE TABLE produto(
  `id_produto` INT PRIMARY KEY AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `preco_compra` decimal(10,2) NULL,  
  `preco_venda` decimal(10,2) NULL,
  `id_categoria` INT NULL,
  `quantidade` INT NULL);

CREATE TABLE pedido(
  `id_pedido` INT PRIMARY KEY AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `total` decimal(10,2) NULL,
  `id_funcionario` INT NOT NULL,
  `id_cliente` INT NOT NULL);

CREATE TABLE itens_pedido (
  `id_item_pedido` INT PRIMARY KEY AUTO_INCREMENT,
  `id_produto` INT NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `quantidade` INT NOT NULL,
  `id_pedido` INT NOT NULL);
  
ALTER TABLE cidade add CONSTRAINT FOREIGN KEY(id_estado) REFERENCES estado(id_estado);
ALTER TABLE cliente add CONSTRAINT FOREIGN KEY(id_cidade) REFERENCES cidade(id_cidade);
ALTER TABLE produto add CONSTRAINT FOREIGN KEY(id_categoria) REFERENCES categoria(id_categoria);
ALTER TABLE funcionario add CONSTRAINT FOREIGN KEY(id_gerente) REFERENCES funcionario(id_funcionario);
ALTER TABLE funcionario add CONSTRAINT FOREIGN KEY(id_departamento) REFERENCES departamento(id_departamento);
ALTER TABLE pedido add CONSTRAINT FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE pedido add CONSTRAINT FOREIGN KEY(id_funcionario) REFERENCES funcionario(id_funcionario);
ALTER TABLE itens_pedido add CONSTRAINT FOREIGN KEY(id_pedido) REFERENCES pedido(id_pedido);
ALTER TABLE itens_pedido add CONSTRAINT FOREIGN KEY(id_produto) REFERENCES produto(id_produto);

INSERT INTO `estado` (`id_estado`, `nome`, `uf`) VALUES (NULL, 'ParanÃ¡', 'PR');
INSERT INTO `estado` (`id_estado`, `nome`, `uf`) VALUES (NULL, 'SÃ£o Paulo', 'SP');
INSERT INTO `estado` (`id_estado`, `nome`, `uf`) VALUES (NULL, 'Santa Catarina', 'SC');
INSERT INTO `estado` (`id_estado`, `nome`, `uf`) VALUES (NULL, 'RIo Grande do Sul', 'RS');

INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'Guarapuava', '1');
INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'Curitiba', '1');
INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'Londrina', '1');
INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'MaringÃ¡', '1');
INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'SÃ£o JosÃ© dos Campos', '2');
INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'SÃ£o Paulo', '2');
INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'Campinas', '2');
INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'SÃ£o JosÃ© dos Campos', '2');
INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'FlorianÃ³polis', '3');
INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'Blumenau', '3');
INSERT INTO `cidade` (`id_cidade`, `nome`, `id_estado`) VALUES (NULL, 'Ponta Grossa', NULL);

INSERT INTO `departamento` (`id_departamento`, `nome`) VALUES (NULL, 'RH');
INSERT INTO `departamento` (`id_departamento`, `nome`) VALUES (NULL, 'Diretoria');
INSERT INTO `departamento` (`id_departamento`, `nome`) VALUES (NULL, 'TI');
INSERT INTO `departamento` (`id_departamento`, `nome`) VALUES (NULL, 'Vendas');
INSERT INTO `departamento` (`id_departamento`, `nome`) VALUES (NULL, 'Financeiro');

INSERT INTO `funcionario` (`id_funcionario`, `nome`, `data_contratacao`, `cargo`, `salario_fixo`, `bonus`, `id_departamento`, `id_gerente`) VALUES (NULL, 'Mario Bros', '2007-05-21', 'Presidente', '15000', '2000', '2', NULL);
INSERT INTO `funcionario` (`id_funcionario`, `nome`, `data_contratacao`, `cargo`, `salario_fixo`, `bonus`, `id_departamento`, `id_gerente`) VALUES (NULL, 'Luigi Bros', '2009-05-21', 'Diretor', '12000', '1000', '2', '1');
INSERT INTO `funcionario` (`id_funcionario`, `nome`, `data_contratacao`, `cargo`, `salario_fixo`, `bonus`, `id_departamento`, `id_gerente`) VALUES (NULL, 'Paulo Nobre', '2002-07-20', 'Gerente', '13000', '2000', '5', '2');
INSERT INTO `funcionario` (`id_funcionario`, `nome`, `data_contratacao`, `cargo`, `salario_fixo`, `bonus`, `id_departamento`, `id_gerente`) VALUES (NULL, 'Bill Gates', '2015-05-11', 'Programador', '5000', '500', '3', '2');
INSERT INTO `funcionario` (`id_funcionario`, `nome`, `data_contratacao`, `cargo`, `salario_fixo`, `bonus`, `id_departamento`, `id_gerente`) VALUES (NULL, 'Tony Stark', '2002-09-21', 'TÃ©cnico', '2000', '1000', '3', '4');
INSERT INTO `funcionario` (`id_funcionario`, `nome`, `data_contratacao`, `cargo`, `salario_fixo`, `bonus`, `id_departamento`, `id_gerente`) VALUES (NULL, 'JosÃ© da Silva', '2009-05-21', 'Gerente', '2000', '200', '4', '2');
INSERT INTO `funcionario` (`id_funcionario`, `nome`, `data_contratacao`, `cargo`, `salario_fixo`, `bonus`, `id_departamento`, `id_gerente`) VALUES (NULL, 'JoÃ£o da Garrincha', '2001-01-22', 'Vendedor', '1000', '200', '4', '6');
INSERT INTO `funcionario` (`id_funcionario`, `nome`, `data_contratacao`, `cargo`, `salario_fixo`, `bonus`, `id_departamento`, `id_gerente`) VALUES (NULL, 'John Rambo', '2001-04-21', 'Vendedor', '1000', NULL, '4', '6');
INSERT INTO `funcionario` (`id_funcionario`, `nome`, `data_contratacao`, `cargo`, `salario_fixo`, `bonus`, `id_departamento`, `id_gerente`) VALUES (NULL, 'Joaquim Fernandez', '2004-01-22', 'Vendedor', '1000', '200', '4', '6');
INSERT INTO `funcionario` (`id_funcionario`, `nome`, `data_contratacao`, `cargo`, `salario_fixo`, `bonus`, `id_departamento`, `id_gerente`) VALUES (NULL, 'Maria da Silva', '2003-02-26', 'TÃ©cnico de RH', '3000', '300', '1', '2');


INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `id_cidade`, `telefone`) VALUES (NULL, 'Gabriel Jesus', 'Rua Juca, 45', '1', '44999566878');
INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `id_cidade`, `telefone`) VALUES (NULL, 'Fernando Pras', 'Rua XV, 55', '1', '44999564378');
INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `id_cidade`, `telefone`) VALUES (NULL, 'Dudu da Silva', 'Rua Guara, 45', '2', '44999066878');
INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `id_cidade`, `telefone`) VALUES (NULL, 'Felipe Melo', 'Rua Brasil, 52', '3', '23999566878');
INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `telefone`) VALUES (NULL, 'Roger Guedes', NULL, '47988566878');
INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `id_cidade`, `telefone`) VALUES (NULL, 'William Bigode', 'Rua 19, 21', '5', '25999566878');
INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `id_cidade`, `telefone`) VALUES (NULL, 'Miguel Borja', 'Rua JoÃ£o, 40', '6', '44999566878');
INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `id_cidade`, `telefone`) VALUES (NULL, 'ZÃ© Roberto da Silva', 'Rua XV, 53', '9', '44599566870');
INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `id_cidade`, `telefone`) VALUES (NULL, 'Jean da Silva', 'Rua Atlantica, 9', '1', '77699566878');
INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `id_cidade`, `telefone`) VALUES (NULL, 'Felipe Melo', 'Rua Brasil, 23', '3', '23999566878');

INSERT INTO `categoria` (`id_categoria`, `descricao`) VALUES (NULL, 'MemÃ³rias');
INSERT INTO `categoria` (`id_categoria`, `descricao`) VALUES (NULL, 'Processadores');
INSERT INTO `categoria` (`id_categoria`, `descricao`) VALUES (NULL, 'Placa MÃ£e');
INSERT INTO `categoria` (`id_categoria`, `descricao`) VALUES (NULL, 'Disco');
INSERT INTO `categoria` (`id_categoria`, `descricao`) VALUES (NULL, 'AcessÃ³rios');
INSERT INTO `categoria` (`id_categoria`, `descricao`) VALUES (NULL, 'Monitores');

INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Processador i7 2.8GHz','2','200', '400', '30');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Processador i5 2.0GHz','2','150', '300', '30');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Processador i3 2.2GHz','2','100', '200', '30');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'MemÃ³ria Kingston 8GB','1','100', '200', '20');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'MemÃ³ria Kingston 16GB','1','200', '300', '25');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'MemÃ³ria Scandisk 4GB','1','80', '120', '20');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'HD 1TB Samsung','4','200', '300', '40');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'HD 2TB Samsung','4','300', '400', '40');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'HD SSD 100GB Samsung','4','500', '800', '15');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'HD SSD 200GB Seagate','4','1000', '1500', '15');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Placa MÃ£e Intel P8','3','300', '600', '35');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Placa MÃ£e ASUS XM','3','340', '650', '35');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Mouse Wireless Multilaser','5','30', '60', '30');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Mouse com fio Multilaser','5','20', '40', '30');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Teclado Wireless Dell','5','30', '60', '30');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Teclado com fio Multilaser','5','10', '20', '30');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Monitor LG 15','6','300', '600', '20');
INSERT INTO `produto` (`id_produto`, `descricao`,`id_categoria`, `preco_compra`, `preco_venda`, `quantidade`) VALUES (NULL, 'Monitor Dell 14','6','200', '500', '20');

INSERT INTO `pedido` (`id_pedido`, `data`, `total`, `id_funcionario`, `id_cliente`) VALUES (NULL, '2017-05-23', '1400', '7', '4');
INSERT INTO `itens_pedido` (`id_item_pedido`, `id_produto`, `preco`, `quantidade`, `id_pedido`) VALUES (NULL, '1', '400', '2', '1'), (NULL, '11', '600', '1', '1');

INSERT INTO `pedido` (`id_pedido`, `data`, `total`, `id_funcionario`, `id_cliente`) VALUES (NULL, '2017-02-22', '1400', '7', '5');
INSERT INTO `itens_pedido` (`id_item_pedido`, `id_produto`, `preco`, `quantidade`, `id_pedido`) VALUES (NULL, '1', '400', '2', '2'), (NULL, '11', '600', '1', '2');

INSERT INTO `pedido` (`id_pedido`, `data`, `total`, `id_funcionario`, `id_cliente`) VALUES (NULL, '2016-03-22', '1400', '7', '5');
INSERT INTO `itens_pedido` (`id_item_pedido`, `id_produto`, `preco`, `quantidade`, `id_pedido`) VALUES (NULL, '1', '400', '2', '3'), (NULL, '11', '600', '1', '3');

INSERT INTO `pedido` (`id_pedido`, `data`, `total`, `id_funcionario`, `id_cliente`) VALUES (NULL, '2016-02-12', '1400', '7', '6');
INSERT INTO `itens_pedido` (`id_item_pedido`, `id_produto`, `preco`, `quantidade`, `id_pedido`) VALUES (NULL, '1', '400', '2', '4'), (NULL, '11', '600', '1', '4');

INSERT INTO `pedido` (`id_pedido`, `data`, `total`, `id_funcionario`, `id_cliente`) VALUES (NULL, '2017-02-10', '1400', '8', '2');
INSERT INTO `itens_pedido` (`id_item_pedido`, `id_produto`, `preco`, `quantidade`, `id_pedido`) VALUES (NULL, '1', '400', '2', '5'), (NULL, '11', '600', '1', '5');

INSERT INTO `pedido` (`id_pedido`, `data`, `total`, `id_funcionario`, `id_cliente`) VALUES (NULL, '2017-05-10', '1800', '8', '8');
INSERT INTO `itens_pedido` (`id_item_pedido`, `id_produto`, `preco`, `quantidade`, `id_pedido`) VALUES (NULL, '1', '400', '3', '6'), (NULL, '11', '600', '1', '6');

INSERT INTO `pedido` (`id_pedido`, `data`, `total`, `id_funcionario`, `id_cliente`) VALUES (NULL, '2014-09-15', '1400', '8', '1');
INSERT INTO `itens_pedido` (`id_item_pedido`, `id_produto`, `preco`, `quantidade`, `id_pedido`) VALUES (NULL, '1', '400', '2', '7'), (NULL, '11', '600', '1', '7');
