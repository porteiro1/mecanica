-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 27/05/2026 às 21:51
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mecanica`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id` int(11) NOT NULL,
  `nome` varchar(11) NOT NULL,
  `senha` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `funcionario`
--

INSERT INTO `funcionario` (`id`, `nome`, `senha`) VALUES
(1, 'maua', '123');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ordemServico`
--

CREATE TABLE `ordemServico` (
  `idOrdemServico` int(11) NOT NULL,
  `servico` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `servico`
--

CREATE TABLE `servico` (
  `idservico` int(11) NOT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `ordemServico_idOrdemServico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculos`
--

CREATE TABLE `veiculos` (
  `idveiculos` int(11) NOT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `cliente_idcliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculos_has_ordemServico`
--

CREATE TABLE `veiculos_has_ordemServico` (
  `veiculos_idveiculos` int(11) NOT NULL,
  `ordemServico_idOrdemServico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ordemServico`
--
ALTER TABLE `ordemServico`
  ADD PRIMARY KEY (`idOrdemServico`);

--
-- Índices de tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`idservico`),
  ADD KEY `fk_servico_ordemServico1_idx` (`ordemServico_idOrdemServico`);

--
-- Índices de tabela `veiculos`
--
ALTER TABLE `veiculos`
  ADD PRIMARY KEY (`idveiculos`),
  ADD KEY `fk_veiculos_cliente1_idx` (`cliente_idcliente`);

--
-- Índices de tabela `veiculos_has_ordemServico`
--
ALTER TABLE `veiculos_has_ordemServico`
  ADD PRIMARY KEY (`veiculos_idveiculos`,`ordemServico_idOrdemServico`),
  ADD KEY `fk_vhos_ordemServico1_idx` (`ordemServico_idOrdemServico`),
  ADD KEY `fk_vhos_veiculos_idx` (`veiculos_idveiculos`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `idservico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `veiculos`
--
ALTER TABLE `veiculos`
  MODIFY `idveiculos` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `servico`
--
ALTER TABLE `servico`
  ADD CONSTRAINT `fk_servico_ordemServico1` FOREIGN KEY (`ordemServico_idOrdemServico`) REFERENCES `ordemServico` (`idOrdemServico`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `veiculos`
--
ALTER TABLE `veiculos`
  ADD CONSTRAINT `fk_veiculos_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `veiculos_has_ordemServico`
--
ALTER TABLE `veiculos_has_ordemServico`
  ADD CONSTRAINT `fk_vhos_ordemServico1` FOREIGN KEY (`ordemServico_idOrdemServico`) REFERENCES `ordemServico` (`idOrdemServico`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vhos_veiculos` FOREIGN KEY (`veiculos_idveiculos`) REFERENCES `veiculos` (`idveiculos`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
