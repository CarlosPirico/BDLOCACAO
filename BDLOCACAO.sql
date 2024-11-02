-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.39 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para videolocadora
CREATE DATABASE IF NOT EXISTS `videolocadora` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `videolocadora`;

-- Copiando estrutura para tabela videolocadora.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `cod_categoria` int NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela videolocadora.categoria: ~9 rows (aproximadamente)
INSERT INTO `categoria` (`cod_categoria`, `nome_categoria`) VALUES
	(1, 'Ação'),
	(2, 'Romance'),
	(3, 'Aventura'),
	(4, 'Ficção'),
	(5, 'Drama'),
	(6, 'Terror'),
	(7, 'ANIMAÇÃO'),
	(9, 'Comédia');

-- Copiando estrutura para tabela videolocadora.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `cod_cliente` int NOT NULL AUTO_INCREMENT,
  `rg` varchar(9) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `cidade` varchar(30) DEFAULT NULL,
  `estado` char(2) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `datanascimento` datetime DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  PRIMARY KEY (`cod_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela videolocadora.cliente: ~10 rows (aproximadamente)
INSERT INTO `cliente` (`cod_cliente`, `rg`, `nome`, `endereco`, `bairro`, `cidade`, `estado`, `telefone`, `email`, `datanascimento`, `sexo`) VALUES
	(1, '321346530', 'Abimael Silva', 'Rua Valmir, 1', 'Jd. Wanel Ville Cruz', 'Sorocaba', 'SP', '32125809', 'abimael.oliveira@facens.br', '1982-12-27 00:00:00', 'M'),
	(2, '421346111', 'Rafael Fernando de Moraes Moreno', 'Rua Francisco de Souza, 123', 'Jd. Nova Esperança', 'São Roque', 'SP', '32274567', 'rafael@terra.com.br', '1985-04-01 00:00:00', 'M'),
	(3, '324857670', 'João da Silva', 'Rua Mario Quintana, 13', 'Av. Bartolomeu', 'Sorocaba', 'SP', '32134098', 'joao@uol.com.br', '1992-12-05 00:00:00', 'M'),
	(4, '112345553', 'Maria Chiquinha', 'Rua Padre Luiz, 55', 'Jd. Vera Cruz', 'Sorocaba', 'SP', '23336684', 'maria@ig.com.br', '1982-11-30 00:00:00', 'F'),
	(5, '945848768', 'Rafael Nunes Sales', 'Rua Guilherme Orlando, 333', 'Jardim Santa Rosália', 'Sorocaba', 'SP', '1532145543', 'rafael.sales@terra.com.br', '1985-04-01 00:00:00', 'M'),
	(6, '676548499', 'Daniela Martin Feitosa', 'Rua Guilherme Oliveria, 1', 'Jd. Vera das Acássicas', 'Votorantim', 'SP', '32132109', 'daniela.martin@gmail.com', '1986-12-26 00:00:00', 'F'),
	(7, '321349999', 'Renata Cristina', 'Rua Orlando Alvarenga, 1', 'Jd. Vera Cruz', 'Sorocaba', 'SP', '32125809', 'renata@gmail', '1970-09-01 00:00:00', 'F'),
	(8, '335466531', 'Joaquim Ferreira de Souza Junior', 'Rua Outubro Vermelho, 65', 'Jd. Santa Rosália', 'Votorantim', 'SP', '11125809', 'joaquim_junior@ig.com.br', '1980-04-08 00:00:00', 'M'),
	(9, '112233445', 'Ladislau Ferreira', 'Rua Orlando Alvarenga, 12345', 'Jd. Vera Cruz', 'Sorocaba', 'SP', '32144409', 'ladislau@terra.com.br', '1988-01-03 00:00:00', 'M'),
	(10, '222222222', 'Vanessa Oliveira', 'Rua das Flores, 1', 'Jd. do Sol', 'Votorantim', 'SP', '32122222', 'vanessa@ig.com.br', '1998-08-08 00:00:00', 'F'),
	(11, '101011011', 'Carlão', 'rua teste', 'bairro teste', 'sorocaba', 'sp', '15999764654', '248701@facens.br', '0200-08-30 00:00:00', 'M'),
	(12, '221232348', 'Dino da Silva Sauro', 'Rua Joaquim Silveira, 34', 'Jd. Romano', 'São Roque', 'SP', NULL, NULL, NULL, 'M');

-- Copiando estrutura para tabela videolocadora.filme
CREATE TABLE IF NOT EXISTS `filme` (
  `cod_filme` int NOT NULL AUTO_INCREMENT,
  `filme` varchar(30) NOT NULL,
  `cod_categoria` int NOT NULL,
  `diretor` varchar(50) NOT NULL,
  `valor_locacao` float NOT NULL,
  `reservada` char(1) NOT NULL,
  PRIMARY KEY (`cod_filme`),
  KEY `fk_categoria_filme` (`cod_categoria`),
  CONSTRAINT `fk_categoria_filme` FOREIGN KEY (`cod_categoria`) REFERENCES `categoria` (`cod_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela videolocadora.filme: ~19 rows (aproximadamente)
INSERT INTO `filme` (`cod_filme`, `filme`, `cod_categoria`, `diretor`, `valor_locacao`, `reservada`) VALUES
	(1, '300', 1, 'Richard Donner', 3.5, 'n'),
	(2, 'Máquina Mortífera', 1, 'Richard Donner', 3.6, 'n'),
	(3, 'A Mexicana', 2, 'Burr Steers', 3, 's'),
	(4, 'A Verdade Nua e Crua', 2, 'Robert Luketic', 6, 'n'),
	(5, 'A vida é bela', 2, 'Roberto Benigni', 3.5, 's'),
	(6, 'Austrália', 3, 'Baz Luhrmann', 6, 's'),
	(7, 'Ultimato Bourn', 3, 'Paul Greengrass', 3.5, 'n'),
	(8, 'Constantine', 4, 'Francis Lawrence', 2.5, 's'),
	(9, 'Os Irmãos Grimm', 4, 'Terry Gilliam', 3.5, 's'),
	(10, 'Os Doze Macacos', 4, 'Terry Gilliam', 2.5, 's'),
	(11, 'Amadeus', 5, 'Milos Forman', 10, 'n'),
	(12, 'As Torres Gêmeas', 5, 'Oliver Stone', 2.5, 's'),
	(13, 'Platoon', 1, 'Oliver Stone', 5.5, 's'),
	(14, 'O Advogado do Diabo', 6, 'Taylor Hackford', 1.5, 's'),
	(15, 'Beowulf', 7, 'Robert Zemeckis', 1, 'n'),
	(16, 'Bolt o super cão', 7, 'Byron Howard', 1.5, 's'),
	(17, 'Apertem o cinto o piloto sumiu', 9, 'Jim Abrahams', 3.6, 's'),
	(18, 'Doze é demais', 9, 'Shawn Levy', 9.2, 's'),
	(19, 'Uma noite no museu', 9, 'Shawn Levy', 2.5, 'n'),
	(20, 'Missão Impossível: 3', 1, 'J.J. Abrams', 7, 'n');

-- Copiando estrutura para tabela videolocadora.locacao
CREATE TABLE IF NOT EXISTS `locacao` (
  `cod_locacao` int NOT NULL AUTO_INCREMENT,
  `cod_cliente` int NOT NULL,
  `cod_filme` int NOT NULL,
  `data_retirada` datetime NOT NULL,
  `data_devolucao` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_locacao`,`cod_cliente`,`cod_filme`),
  KEY `fk_locacoes_cliente` (`cod_cliente`),
  KEY `fk_locacoes_filme` (`cod_filme`),
  CONSTRAINT `fk_locacoes_cliente` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`cod_cliente`),
  CONSTRAINT `fk_locacoes_filme` FOREIGN KEY (`cod_filme`) REFERENCES `filme` (`cod_filme`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela videolocadora.locacao: ~22 rows (aproximadamente)
INSERT INTO `locacao` (`cod_locacao`, `cod_cliente`, `cod_filme`, `data_retirada`, `data_devolucao`) VALUES
	(1, 1, 1, '2010-03-20 19:05:44', '2010-03-23 00:00:00'),
	(2, 1, 6, '2010-03-20 19:05:44', '2010-03-23 00:00:00'),
	(3, 1, 8, '2010-03-20 19:05:44', '2010-03-23 00:00:00'),
	(4, 1, 2, '2010-03-15 00:00:00', '2010-03-17 00:00:00'),
	(5, 1, 13, '2010-03-15 00:00:00', '2010-03-17 00:00:00'),
	(6, 2, 5, '2010-03-20 19:05:44', '2010-03-21 00:00:00'),
	(7, 3, 3, '2010-03-18 19:05:44', '2010-03-20 00:00:00'),
	(8, 3, 19, '2010-03-18 19:05:44', '2010-03-20 00:00:00'),
	(9, 4, 17, '2010-03-01 19:05:44', '2010-03-03 00:00:00'),
	(10, 5, 5, '2010-03-03 19:05:44', '2010-03-05 00:00:00'),
	(11, 6, 7, '2010-03-03 19:05:44', '2010-03-04 00:00:00'),
	(12, 6, 9, '2010-03-03 19:05:44', '2010-03-04 00:00:00'),
	(13, 7, 16, '2010-03-13 19:05:44', '2010-03-15 00:00:00'),
	(14, 7, 1, '2010-03-13 19:05:44', '2010-03-15 00:00:00'),
	(15, 7, 5, '2010-03-14 19:05:44', '2010-03-16 00:00:00'),
	(16, 7, 8, '2010-03-14 19:05:44', '2010-03-16 00:00:00'),
	(17, 7, 11, '2010-03-14 19:05:44', '2010-03-16 00:00:00'),
	(18, 7, 12, '2010-03-15 19:05:44', '2010-03-17 00:00:00'),
	(19, 8, 9, '2010-03-20 19:05:44', '2010-03-21 00:00:00'),
	(20, 9, 3, '2010-03-21 19:05:44', '2010-03-22 00:00:00'),
	(21, 9, 6, '2010-03-21 19:05:44', '2010-03-22 00:00:00'),
	(22, 10, 10, '2010-02-20 19:05:44', '2010-02-21 00:00:00'),
	(23, 11, 11, '2024-11-01 21:31:25', NULL),
	(24, 11, 8, '2024-11-01 21:31:25', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
