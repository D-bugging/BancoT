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
    estado varchar(255) not null, #Char(2)
    cep varchar(255),
    
    primary key(idEndereco)
)default charset=utf8;
insert into Endereco(rua, numero, bairro, cidade, estado, cep)
	values('Rua do Abacaxi', 10, 'Centro', 'Uberlândia', 'MG', '38.400-121');
insert into Endereco(rua, numero, bairro, cidade, estado, cep)
	values('Rua das Oliveiras', 500, 'Vila Alburquerque', 'Uberlândia', 'MG', '32.859-157');

# Tabela para cliente, vinculado com Conta, CaixaEletronico, Endereco
create table Cliente(
	idCliente int not null unique auto_increment,
	numeroCartao int not null unique,
    nome varchar(255) not null,
    dataNascimento varchar(10) not null, #date
    pin int not null,
    endereco_idEndereco int not null,
    
	primary key(idCliente),
    foreign key(endereco_idEndereco) references Endereco(idEndereco)
)default charset=utf8;
insert into Cliente(numeroCartao, nome, dataNascimento, pin, endereco_idEndereco)
	values(4218470099201258, 'Aurora Aksnes', '02/06/1996', 1234, 1);

# Generalização
create table Conta(
	numero int not null unique,
    saldo double,
    cliente_idCliente int,
    
    primary key(numero),
    foreign key(cliente_idCliente) references Cliente(idCliente)
)default charset=utf8;
insert into Conta(numero, saldo, cliente_idCliente)
	values(154866321, 5.000, 1);

# Conta corrente ou poupanca
create table Corrente(
	limite double not null,
    taxaJuros double,
    conta_numero int not null,
    
    foreign key(conta_numero) references Conta(numero)
)default charset=utf8;
insert into Corrente(limite, taxaJuros, conta_numero)
	values(10.000, 0.05, 154866321);
create table Poupanca(
	rendimento double not null,
    conta_numero int not null,
    
    foreign key(conta_numero) references Conta(numero)
)default charset=utf8;
insert into Poupanca(rendimento, conta_numero)
	values(0.01, 154866321);
    
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

create table Banco(
    codigo int not null unique,
    gerente varchar(255) not null,
    primary key(codigo)
)default charset=utf8;
insert into Banco(codigo, gerente)
	values(1587, 'Hamilton Bueno');

# Caixa eletronico
create table CaixaEletronico(
	agencia varchar(255) not null unique,
    primary key(agencia),
    banco_codigo int not null,
    endereco_idEndereco int not null,
    foreign key(banco_codigo) references Banco(codigo),
    foreign key(endereco_idEndereco) references Endereco(idEndereco)
)default charset=utf8;
insert into CaixaEletronico(agencia, banco_codigo, endereco_idEndereco)
	values('148A', 1587, 2);