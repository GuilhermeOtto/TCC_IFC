-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Fev-2021 às 14:05
-- Versão do servidor: 10.4.13-MariaDB
-- versão do PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `hf`
--

DELIMITER $$
--
-- Funções
--
CREATE DEFINER=`root`@`localhost` FUNCTION `calorias_diarias` (`id` INT) RETURNS DECIMAL(10,2) BEGIN
	DECLARE  qtd_cal DECIMAL(10,2);
    
	SELECT (met_basal * fator_atv_fisica) INTO qtd_cal FROM proc_dieta, usuario WHERE proc_dieta.cod_cad = usuario.cod_cad AND usuario.cod_cad = id;	

RETURN qtd_cal;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `anotacoes`
--

CREATE TABLE `anotacoes` (
  `cod_anotacoes` int(11) NOT NULL,
  `cod_cad` int(11) NOT NULL,
  `cod_proc_dieta` int(11) NOT NULL,
  `dt` date NOT NULL,
  `notas` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dieta`
--

CREATE TABLE `dieta` (
  `cod_dieta` int(11) NOT NULL,
  `cod_cad` int(11) NOT NULL,
  `proteina` decimal(10,2) DEFAULT NULL,
  `gordura` decimal(10,2) DEFAULT NULL,
  `carboidrato` decimal(10,2) DEFAULT NULL,
  `kcal_diaria` decimal(10,2) DEFAULT NULL,
  `kcal_consumida` decimal(10,2) DEFAULT NULL,
  `kcal_gasta` decimal(10,2) DEFAULT NULL,
  `proteina_consumida` decimal(10,2) DEFAULT NULL,
  `gordura_consumida` decimal(10,2) DEFAULT NULL,
  `carboidrato_consumido` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `dieta`
--

INSERT INTO `dieta` (`cod_dieta`, `cod_cad`, `proteina`, `gordura`, `carboidrato`, `kcal_diaria`, `kcal_consumida`, `kcal_gasta`, `proteina_consumida`, `gordura_consumida`, `carboidrato_consumido`) VALUES
(10, 6, '150.00', '70.00', '200.00', '2500.00', '0.00', '0.00', '0.00', '0.00', '0.00'),
(12, 1, '200.00', '400.00', '100.00', '2500.00', '0.00', '0.00', '0.00', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `humor`
--

CREATE TABLE `humor` (
  `cod_humor` int(11) NOT NULL,
  `cod_proc_dieta` int(11) NOT NULL,
  `cod_cad` int(11) NOT NULL,
  `humor` int(11) DEFAULT NULL,
  `dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `humor`
--

INSERT INTO `humor` (`cod_humor`, `cod_proc_dieta`, `cod_cad`, `humor`, `dt`) VALUES
(44, 26, 6, 1, '2020-12-04'),
(45, 26, 6, 3, '2020-12-05'),
(46, 26, 6, 4, '2020-12-06'),
(48, 26, 6, 2, '2020-12-07'),
(50, 28, 1, 3, '2020-12-08'),
(54, 26, 6, 1, '2020-12-10'),
(55, 28, 1, 4, '2021-01-12'),
(57, 26, 6, 4, '2021-01-14'),
(58, 28, 1, 1, '2021-01-15'),
(60, 26, 6, 3, '2021-01-22');

-- --------------------------------------------------------

--
-- Estrutura da tabela `info_user`
--

CREATE TABLE `info_user` (
  `cod_info` int(11) NOT NULL,
  `cod_cad` int(11) NOT NULL,
  `peso` decimal(10,2) NOT NULL,
  `altura` int(11) DEFAULT NULL,
  `ombro` decimal(10,2) NOT NULL,
  `peito` decimal(10,2) NOT NULL,
  `braco_esq` decimal(10,2) NOT NULL,
  `braco_dir` decimal(10,2) NOT NULL,
  `antebraco_esq` decimal(10,2) NOT NULL,
  `antebraco_dir` decimal(10,2) NOT NULL,
  `cintura` decimal(10,2) NOT NULL,
  `quadril` decimal(10,2) NOT NULL,
  `gluteos` decimal(10,2) NOT NULL,
  `coxa_esq` decimal(10,2) NOT NULL,
  `coxa_dir` decimal(10,2) NOT NULL,
  `panturrilha_esq` decimal(10,2) NOT NULL,
  `panturrilha_dir` decimal(10,2) NOT NULL,
  `dt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `info_user`
--

INSERT INTO `info_user` (`cod_info`, `cod_cad`, `peso`, `altura`, `ombro`, `peito`, `braco_esq`, `braco_dir`, `antebraco_esq`, `antebraco_dir`, `cintura`, `quadril`, `gluteos`, `coxa_esq`, `coxa_dir`, `panturrilha_esq`, `panturrilha_dir`, `dt`) VALUES
(182, 6, '58.00', 167, '70.00', '62.00', '28.00', '29.00', '24.00', '25.00', '52.00', '59.00', '62.00', '57.00', '58.00', '32.00', '33.00', '2018-01-16'),
(183, 6, '71.00', 169, '80.00', '77.00', '31.00', '33.00', '27.00', '28.00', '60.00', '72.00', '75.00', '63.00', '64.00', '37.00', '38.00', '2020-06-17'),
(200, 1, '80.00', 175, '92.00', '87.00', '40.00', '40.20', '34.00', '35.00', '70.00', '76.00', '80.00', '80.00', '82.00', '40.00', '41.00', '2020-12-08'),
(201, 1, '72.00', 170, '85.00', '80.00', '37.00', '35.00', '31.00', '29.00', '67.00', '71.00', '74.00', '77.00', '75.00', '34.00', '34.30', '2020-11-08'),
(212, 6, '75.00', 179, '90.00', '80.00', '42.00', '43.00', '36.00', '37.00', '70.00', '75.00', '80.00', '65.00', '64.00', '39.00', '40.00', '2020-12-11'),
(217, 6, '72.00', 168, '333.00', '333.00', '333.00', '333.00', '333.00', '333.00', '333.00', '333.00', '333.00', '333.00', '333.00', '333.00', '333.00', '2021-01-15');

-- --------------------------------------------------------

--
-- Estrutura da tabela `proc_dieta`
--

CREATE TABLE `proc_dieta` (
  `cod_proc_dieta` int(11) NOT NULL,
  `cod_cad` int(11) NOT NULL,
  `met_basal` int(11) NOT NULL,
  `fator_atv_fisica` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `proc_dieta`
--

INSERT INTO `proc_dieta` (`cod_proc_dieta`, `cod_cad`, `met_basal`, `fator_atv_fisica`) VALUES
(26, 6, 1776, '1.60'),
(28, 1, 1907, '6.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `cod_cad` int(11) NOT NULL,
  `adm` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `sobrenome` varchar(120) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(3000) NOT NULL,
  `dt_nasc` date NOT NULL,
  `sexo` varchar(15) NOT NULL,
  `biotipo` varchar(20) NOT NULL,
  `atv_fisica` varchar(20) NOT NULL,
  `tip_dieta` varchar(20) NOT NULL,
  `foto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`cod_cad`, `adm`, `nome`, `sobrenome`, `email`, `senha`, `dt_nasc`, `sexo`, `biotipo`, `atv_fisica`, `tip_dieta`, `foto`) VALUES
(1, 1, 'admin', 'admin', 'admin@admin.com', 'YWRtaW4=', '2020-12-01', 'Masculino', 'Ectomorfo', 'Alta', 'Ganhar peso', 'sem_foto_masculino.jpg'),
(6, 0, 'Guilherme', 'Otto', 'guilherme_otto@outlook.com', 'b3R0bw==', '2002-06-03', 'Masculino', 'Endomorfo', 'Baixa', 'Perder peso', 'sem_foto_masculino.jpg');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `anotacoes`
--
ALTER TABLE `anotacoes`
  ADD PRIMARY KEY (`cod_anotacoes`),
  ADD KEY `cod_cad` (`cod_cad`),
  ADD KEY `cod_proc_dieta` (`cod_proc_dieta`);

--
-- Índices para tabela `dieta`
--
ALTER TABLE `dieta`
  ADD PRIMARY KEY (`cod_dieta`),
  ADD KEY `cod_cad` (`cod_cad`);

--
-- Índices para tabela `humor`
--
ALTER TABLE `humor`
  ADD PRIMARY KEY (`cod_humor`),
  ADD KEY `cod_proc_dieta` (`cod_proc_dieta`),
  ADD KEY `cod_cad` (`cod_cad`);

--
-- Índices para tabela `info_user`
--
ALTER TABLE `info_user`
  ADD PRIMARY KEY (`cod_info`),
  ADD KEY `cod_cad` (`cod_cad`);

--
-- Índices para tabela `proc_dieta`
--
ALTER TABLE `proc_dieta`
  ADD PRIMARY KEY (`cod_proc_dieta`),
  ADD KEY `cod_cad` (`cod_cad`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cod_cad`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `anotacoes`
--
ALTER TABLE `anotacoes`
  MODIFY `cod_anotacoes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `dieta`
--
ALTER TABLE `dieta`
  MODIFY `cod_dieta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `humor`
--
ALTER TABLE `humor`
  MODIFY `cod_humor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de tabela `info_user`
--
ALTER TABLE `info_user`
  MODIFY `cod_info` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT de tabela `proc_dieta`
--
ALTER TABLE `proc_dieta`
  MODIFY `cod_proc_dieta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `cod_cad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `anotacoes`
--
ALTER TABLE `anotacoes`
  ADD CONSTRAINT `anotacoes_ibfk_1` FOREIGN KEY (`cod_cad`) REFERENCES `usuario` (`cod_cad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `anotacoes_ibfk_2` FOREIGN KEY (`cod_proc_dieta`) REFERENCES `proc_dieta` (`cod_proc_dieta`);

--
-- Limitadores para a tabela `dieta`
--
ALTER TABLE `dieta`
  ADD CONSTRAINT `dieta_ibfk_1` FOREIGN KEY (`cod_cad`) REFERENCES `usuario` (`cod_cad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `humor`
--
ALTER TABLE `humor`
  ADD CONSTRAINT `humor_ibfk_1` FOREIGN KEY (`cod_proc_dieta`) REFERENCES `proc_dieta` (`cod_proc_dieta`),
  ADD CONSTRAINT `humor_ibfk_2` FOREIGN KEY (`cod_cad`) REFERENCES `usuario` (`cod_cad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `info_user`
--
ALTER TABLE `info_user`
  ADD CONSTRAINT `info_user_ibfk_1` FOREIGN KEY (`cod_cad`) REFERENCES `usuario` (`cod_cad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `proc_dieta`
--
ALTER TABLE `proc_dieta`
  ADD CONSTRAINT `proc_dieta_ibfk_1` FOREIGN KEY (`cod_cad`) REFERENCES `usuario` (`cod_cad`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
