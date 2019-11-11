create database banco
default character set utf8
default collate utf8_general_ci;
use banco;


# [ ========== PARTE CLIENTE ========== ]
# Tabela para cliente
create table Cliente(
	idCliente int not null unique auto_increment,
	cpf varchar(11) not null unique,
	numeroCartao int not null unique,
    nome varchar(255) not null,
    endereco varchar(255) not null,
    dataNascimento varchar(10) not null,
    pin int not null,
    conta_numero int,
    
	primary key(idCliente),
    foreign key(conta_numero) references Conta(numero)
)default charset=utf8;
# Tabela para endereco do cliente
create table Endereco(
	idEndereco int not null unique auto_increment,
	rua varchar(255) not null,
    numero int not null,
    bairro varchar(255) not null,
    cidade varchar(255) not null,
    estado varchar(255) not null,
    cep varchar(255),
    
    cliente_idCliente int,
    foreign key(cliente_idCliente) references Cliente(idCliente)
)default charset=utf8;

# Tabela para conta do cliente (deve estar vinculado com a tabela Cliente)
create table Conta(
	numero int not null unique,
    saldo double,
    
    primary key(numero)
)default charset=utf8;
# Conta corrente ou poupanca
create table Corrente(
	limite double not null,
    taxaJuros double,
    conta_numero int,
    
    foreign key(conta_numero) references Conta(numero)
)default charset=utf8;
create table Poupanca(
	remdimento double not null,
    conta_numero int,
    
    foreign key(conta_numero) references Conta(numero)
)default charset=utf8;

# Transacoes caixa registra as atividades feitas pela conta
# 		(depositar, retirar, transferir)
create table TransacoesCaixa(
	idTransacao int not null unique auto_increment,
    dataTransacao varchar(10) not null,
    tipo varchar(255),
    valor double not null,
    posBalanco varchar(255),
    conta_numero int,
    
    foreign key(conta_numero) references Conta(numero),
    primary key(idTransacao)
)default charset=utf8;


# [ ========== PARTE BANCO ========== ]
create table Banco(
    codigo int not null unique,
    endereco varchar(255) not null,
    
    primary key(codigo)
)default charset=utf8;

# Caixa eletroni
create table CaixaEletronico(
	agencia varchar(255) not null unique,
    gerente varchar(255) not null,
)default charset=utf8;