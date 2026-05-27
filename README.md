# 🔧 Sistema de Mecânica

Sistema web para controle de funcionários e clientes de uma oficina mecânica, com autenticação via sessão PHP.

## 🛠️ Tecnologias

- PHP
- MySQL
- HTML5
- MySQLi

## 📋 Funcionalidades

- Login de funcionário com verificação no banco de dados
- Controle de sessão PHP após autenticação
- Redirecionamento seguro para área restrita (`site.php`)
- Cadastro e gerenciamento de clientes (`cliente.php`)

## 🗄️ Banco de Dados

- **Banco:** `mecanica`
- **Tabela principal:** `funcionario` (id, nome, senha)

## 📁 Estrutura

```
mecanica/
├── index.php           # Tela de login
├── verificaLogin.php   # Autenticação e controle de sessão
└── cliente.php         # Gerenciamento de clientes
```

## ▶️ Como executar

1. Importe o banco `mecanica` no MySQL
2. Crie a tabela `funcionario` com os campos `id`, `nome` e `senha`
3. Configure as credenciais de banco em `verificaLogin.php`
4. Sirva o projeto em um servidor local (XAMPP, Laragon, etc.)
5. Acesse `index.php` no navegador

## 👤 Autor

Mauá Giunco — [github.com/porteiro1](https://github.com/porteiro1)
