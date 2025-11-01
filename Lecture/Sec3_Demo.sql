Create database if not exists Sec3Demo;
use Sec3demo;
-- Create table with option 1
-- apply for single PK attribute
Create table tb1op1(
	ID		int	not null unique Primary key,
    sName 	varchar(50)
);
-- Create table with option 2
-- apply for composite PK attributes
Create table tb1op2(
	ID		int			not null,
    sName	varchar(100) not null,
    Primary key (ID, sName)
);
-- Create table with option 3
-- apply for composite PK attributes 
-- with constraints 
Create table tb1op3(
	ID		int			not null,
    sName	varchar(100) not null,
    constraint PK_tb1Op1 Primary key (ID, sName)
);

-- Create table with FK
Create table tb2(
	id 	int not null unique primary key,
    idTB1	int not null,
    sName	varchar(100),
    constraint FK_tb1 foreign key (idTB1)
    references tb1op3 (id)
);