create database banco
default character set utf8
default collate utf8_general_ci;
use banco;


# Tabela para endereco de Pessoa
create table Endereco(
	idEndereco int not null unique auto_increment,
	rua varchar(255) not null,
    numero int not null,
    bairro varchar(255) not null,
    cidade varchar(255) not null,
    estado varchar(255) not null,
    cep varchar(255),
    
    primary key(idEndereco)
    #pessoa_idPessoa int,
    #foreign key(pessoa_idPessoa) references Pessoa(idPessoa)
)default charset=utf8;

# Tabela Pessoa (Generalização)
create table Pessoa(
	idPessoa int not null unique auto_increment,
	nome varchar(255) not null,
    dataNascimento varchar(10) not null,
    
    primary key(idPessoa),
    endereco_idEndereco int not null,
    foreign key(endereco_idEndereco) references Endereco(idEndereco)
);
# Tabela para cliente (Herança de Pessoa)
create table Cliente(
	idCliente int not null unique auto_increment,
	numeroCartao int not null unique,
    pin int not null,
    pessoa_idPessoa int not null,
    
	primary key(idCliente),
    foreign key(pessoa_idPessoa) references Pessoa(idPessoa)
)default charset=utf8;
# Tabela para Gerente (Herança de Pessoa
create table Gerente(
	idGerente int not null unique auto_increment,
    pessoa_idPessoa int not null,
    
    primary key(idGerente),
    foreign key(pessoa_idPessoa) references Pessoa(idPessoa)
);


# Tabela para conta do cliente (deve estar vinculado com a tabela Cliente)
create table Conta(
	numero int not null unique,
    saldo double,
    cliente_idCliente int,
    
    primary key(numero),
    foreign key(cliente_idCliente) references Cliente(idCliente)
)default charset=utf8;
# Conta corrente ou poupanca
create table Corrente(
	limite double not null,
    taxaJuros double,
    conta_numero int not null,
    
    foreign key(conta_numero) references Conta(numero)
)default charset=utf8;
create table Poupanca(
	remdimento double not null,
    conta_numero int not null,
    
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
    conta_numero int not null,
    
    foreign key(conta_numero) references Conta(numero),
    primary key(idTransacao)
)default charset=utf8;


# [ ========== PARTE BANCO ========== ]
create table Banco(
    codigo int not null unique,
    endereco varchar(255) not null,
    
    primary key(codigo),
    endereco_idEndereco int not null,
    foreign key(endereco_idEndereco) references Endereco(idEndereco)
)default charset=utf8;

# Caixa eletronico
create table CaixaEletronico(
	agencia varchar(255) not null unique,
    gerente varchar(255) not null,
    
    primary key(agencia),
    banco_codigo int not null,
    foreign key(banco_codigo) references Banco(codigo)
)default charset=utf8;