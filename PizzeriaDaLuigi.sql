CREATE DATABASE PizzeriaDaLuigi;

USE PizzeriaDaLuigi;

CREATE TABLE Pizza(
idPizza int identity (1,1),
Nome varchar(30) not null,
Prezzo decimal(5 , 2) not null,
constraint PK_idPIZZA primary key (idPizza),
constraint CHK_PREZZOPIZZA check (Prezzo > 0)
);

CREATE TABLE Ingrediente(
idIngrediente int identity (1000, 10),
Nome varchar(30) not null,
Costo decimal(5 , 2) not null,
ScorteMagazzino int not null,
constraint PK_idINGREDIENTE primary key (idIngrediente),
constraint CHK_PREZZOINGREDIENTE check (Costo > 0),
constraint CHK_SCORTEMAGAZZINO check (ScorteMagazzino >= 0)
);

CREATE TABLE Pizza_Ingrediente(
idPizza int not null constraint FK_idPIZZA foreign key references Pizza(idPizza),
idIngrediente int not null constraint FK_idINGREDIENTE foreign key references Ingrediente(idIngrediente),
constraint PK_PIZZAINGREDIENTI primary key (idPizza, idIngrediente)
);

INSERT INTO Pizza VALUES('Margherita', 5)
INSERT INTO Pizza VALUES('Bufala', 7)
INSERT INTO Pizza VALUES('Diavola', 6)
INSERT INTO Pizza VALUES('Quattro stagioni', 6.50)
INSERT INTO Pizza VALUES('Porcini', 7)
INSERT INTO Pizza VALUES('Dioniso', 8)
INSERT INTO Pizza VALUES('Ortolana', 8)
INSERT INTO Pizza VALUES('Patate e salsiccia', 6)
INSERT INTO Pizza VALUES('Pomodorini', 6)
INSERT INTO Pizza VALUES('Quattro formaggi', 7.50)
INSERT INTO Pizza VALUES('Caprese', 7.50)
INSERT INTO Pizza VALUES('Zeus', 7.50)
SELECT * FROM Pizza;

INSERT INTO Ingrediente VALUES('pomodoro', 2.99, 5);
INSERT INTO Ingrediente VALUES('mozzarella', 2.37, 10);
INSERT INTO Ingrediente VALUES('mozzarella di bufala', 3, 5);
INSERT INTO Ingrediente VALUES('spianata piccante', 2.50, 5);
INSERT INTO Ingrediente VALUES('funghi', 1.50, 15);
INSERT INTO Ingrediente VALUES('carciofi', 1.79, 12);
INSERT INTO Ingrediente VALUES('cotto', 1.34, 2);
INSERT INTO Ingrediente VALUES('olive', 3.50, 15);
INSERT INTO Ingrediente VALUES('funghi porcini', 2.35, 21);
INSERT INTO Ingrediente VALUES('stracchino', 1.50, 4);
INSERT INTO Ingrediente VALUES('speck', 3.20, 9);
INSERT INTO Ingrediente VALUES('rucola', 2.50, 13);
INSERT INTO Ingrediente VALUES('grana', 3, 8);
INSERT INTO Ingrediente VALUES('verdura di stagione', 2.70, 3);
INSERT INTO Ingrediente VALUES('patate', 3.50, 9);
INSERT INTO Ingrediente VALUES('salasicci', 4, 6);
INSERT INTO Ingrediente VALUES('pomodorini', 2, 19);
INSERT INTO Ingrediente VALUES('ricotta', 3.50, 6);
INSERT INTO Ingrediente VALUES('provola', 2.87, 4); 
INSERT INTO Ingrediente VALUES('gorgonzola', 3.78, 14); 
INSERT INTO Ingrediente VALUES('pomodoro fresco', 1.82, 4); 
INSERT INTO Ingrediente VALUES('basilico', 1.20, 8); 
INSERT INTO Ingrediente VALUES('bresaola', 1.50, 11);
SELECT * FROM Ingrediente


SELECT * FROM Pizza;
SELECT * FROM Ingrediente;
--MARGHERITA
INSERT INTO Pizza_Ingrediente VALUES(1, 1000);
INSERT INTO Pizza_Ingrediente VALUES(1, 1010);
--BUFALA
INSERT INTO Pizza_Ingrediente VALUES(2, 1000);
INSERT INTO Pizza_Ingrediente VALUES(2, 1020);
--DIAVOLA
INSERT INTO Pizza_Ingrediente VALUES(3, 1000);
INSERT INTO Pizza_Ingrediente VALUES(3, 1010);
INSERT INTO Pizza_Ingrediente VALUES(3, 1030);
--QUATTRO STAGIONI
INSERT INTO Pizza_Ingrediente VALUES(4, 1000);
INSERT INTO Pizza_Ingrediente VALUES(4, 1010);
INSERT INTO Pizza_Ingrediente VALUES(4, 1040);
INSERT INTO Pizza_Ingrediente VALUES(4, 1050);
INSERT INTO Pizza_Ingrediente VALUES(4, 1060);
INSERT INTO Pizza_Ingrediente VALUES(4, 1070);
--PORCINI
INSERT INTO Pizza_Ingrediente VALUES(5, 1000);
INSERT INTO Pizza_Ingrediente VALUES(5, 1010);
INSERT INTO Pizza_Ingrediente VALUES(5, 1080);
--DIONISO
INSERT INTO Pizza_Ingrediente VALUES(6, 1000);
INSERT INTO Pizza_Ingrediente VALUES(6, 1010);
INSERT INTO Pizza_Ingrediente VALUES(6, 1090);
INSERT INTO Pizza_Ingrediente VALUES(6, 1100);
INSERT INTO Pizza_Ingrediente VALUES(6, 1110);
INSERT INTO Pizza_Ingrediente VALUES(6, 1120);
--ORTOLANA
INSERT INTO Pizza_Ingrediente VALUES(7, 1000);
INSERT INTO Pizza_Ingrediente VALUES(7, 1010);
INSERT INTO Pizza_Ingrediente VALUES(7, 1130);
--PATATE E SALSICCIA
INSERT INTO Pizza_Ingrediente VALUES(8, 1010);
INSERT INTO Pizza_Ingrediente VALUES(8, 1140);
INSERT INTO Pizza_Ingrediente VALUES(8, 1150);
--POMODORINI
INSERT INTO Pizza_Ingrediente VALUES(9, 1010);
INSERT INTO Pizza_Ingrediente VALUES(9, 1160);
INSERT INTO Pizza_Ingrediente VALUES(9, 1170);
--QUATTRO FORMAGGI
INSERT INTO Pizza_Ingrediente VALUES(10, 1010);
INSERT INTO Pizza_Ingrediente VALUES(10, 1180);
INSERT INTO Pizza_Ingrediente VALUES(10, 1190);
INSERT INTO Pizza_Ingrediente VALUES(10, 1120);
--CAPRESE
INSERT INTO Pizza_Ingrediente VALUES(11, 1010);
INSERT INTO Pizza_Ingrediente VALUES(11, 1200);
INSERT INTO Pizza_Ingrediente VALUES(11, 1210);
--ZEUS
INSERT INTO Pizza_Ingrediente VALUES(12, 1010);
INSERT INTO Pizza_Ingrediente VALUES(12, 1220);
INSERT INTO Pizza_Ingrediente VALUES(12, 1110);





--Si implementino le seguenti query:
--1. Estrarre tutte le pizze con prezzo superiore a 6 euro.
SELECT Nome, Prezzo FROM Pizza WHERE Prezzo > 6;


--2. Estrarre la pizza/le pizze più costosa/e.
SELECT Nome, Prezzo FROM Pizza WHERE Prezzo = (SELECT MAX(Prezzo) FROM Pizza);


--3. Estrarre le pizze «bianche»
SELECT Pizza.Nome FROM Pizza WHERE Pizza.Nome not in (SELECT Pizza.Nome FROM pizza 
						join Pizza_Ingrediente ON Pizza.idPizza = Pizza_Ingrediente.idPizza
   						join Ingrediente ON Ingrediente.idIngrediente = Pizza_Ingrediente.idIngrediente
WHERE Ingrediente.Nome = 'pomodoro');


--4. Estrarre le pizze che contengono funghi (di qualsiasi tipo).
SELECT Pizza.Nome, Pizza.Prezzo FROM Pizza join Pizza_Ingrediente on Pizza.idPizza = Pizza_Ingrediente.idPizza
							 join Ingrediente on Ingrediente.idIngrediente = Pizza_Ingrediente.idIngrediente
WHERE Ingrediente.Nome LIKE '%grana%';







--Implementare sul DB appena costruito le seguenti procedure:
--1. Inserimento di una nuova pizza (parametri: nome, prezzo)
CREATE PROCEDURE NuovaPizza 
	@Nome varchar(30),
	@Prezzo decimal(5, 2)
AS
	INSERT INTO Pizza VALUES (@Nome, @Prezzo)
GO
EXECUTE NuovaPizza @Nome = 'Sarda', @Prezzo = 6.50


--2. Assegnazione di un ingrediente a una pizza (parametri: nome pizza, nome ingrediente)
CREATE PROCEDURE AssegnaIngrediente 
	@NomePizza varchar(30),
	@NomeIngrediente varchar(30)
AS
	DECLARE @ID_INGREDIENTE INT
	SELECT @ID_INGREDIENTE = Ingrediente.idIngrediente
	FROM Ingrediente
	WHERE Ingrediente.Nome = @NomeIngrediente

	DECLARE @ID_PIZZA INT
	SELECT @ID_PIZZA = Pizza.idPizza
	FROM Pizza
	WHERE Pizza.Nome = @NomePizza

	INSERT INTO Pizza_Ingrediente VALUES(@ID_PIZZA, @ID_INGREDIENTE)
GO
EXECUTE AssegnaIngrediente @NomePizza = 'Sarda', @NomeIngrediente = 'Pomodoro';


--3. Aggiornamento del prezzo di una pizza (parametri: nome pizza e nuovo prezzo)
CREATE PROCEDURE AggiornaPrezzo
	@Nome varchar(30),
	@NuovoPrezzo decimal(5, 2)
AS
	UPDATE Pizza
	SET Prezzo = @NuovoPrezzo
	WHERE Nome = @Nome
GO
EXECUTE AggiornaPrezzo @Nome = 'Sarda', @NuovoPrezzo = 8


--4. Eliminazione di un ingrediente da una pizza (parametri: nome pizza, nome ingrediente)
CREATE PROCEDURE EliminaIngredientePizza 
	@NomePizza varchar(30),
	@NomeIngrediente varchar(30)
AS
	DECLARE @ID_INGREDIENTE INT
	SELECT @ID_INGREDIENTE = Ingrediente.idIngrediente
	FROM Ingrediente
	WHERE Ingrediente.Nome = @NomeIngrediente

	DECLARE @ID_PIZZA INT
	SELECT @ID_PIZZA = Pizza.idPizza
	FROM Pizza
	WHERE Pizza.Nome = @NomePizza

	DELETE FROM Pizza_Ingrediente WHERE idPizza = @ID_PIZZA AND idIngrediente = @ID_INGREDIENTE
GO
EXECUTE EliminaIngredientePizza @NomePizza = 'Sarda', @NomeIngrediente = 'Pomodoro';


--5. Incremento del 10% del prezzo delle pizze contenenti un ingrediente (parametro: nome ingrediente)
CREATE PROCEDURE Incremento10Ingrediente 
	@NomeIngrediente varchar(30)
AS 
	DECLARE @idINGREDIENTE INT
	SELECT @idINGREDIENTE = Ingrediente.idIngrediente
	FROM Ingrediente
	WHERE Ingrediente.Nome = @NomeIngrediente

	UPDATE PIZZA 
	SET Prezzo = Prezzo + (Prezzo*10)/100 
	WHERE IdPizza in (
	SELECT Pizza.idPizza
	FROM Pizza join Pizza_Ingrediente on Pizza.idPizza =Pizza_Ingrediente.idPizza
	WHERE Pizza_Ingrediente.idIngrediente = @idINGREDIENTE)
GO
EXECUTE Incremento10Ingrediente @NomeIngrediente = 'grana';






--Si implementino le seguenti funzioni:
--1. Tabella listino pizze (nome, prezzo) (parametri: nessuno)
CREATE FUNCTION ListinoPizze()
RETURNS TABLE
AS
RETURN
	SELECT Nome, Prezzo
	FROM Pizza

SELECT * FROM ListinoPizze()



--2. Tabella listino pizze (nome, prezzo) contenenti un ingrediente (parametri: nome ingrediente)
CREATE FUNCTION ListinoPizze2(@NomeIngrediente varchar(30))
RETURNS TABLE
AS
RETURN
	SELECT Pizza.Nome, Pizza.Prezzo FROM Pizza 
			join Pizza_Ingrediente on Pizza.idPizza = Pizza_Ingrediente.idPizza
			join Ingrediente on Ingrediente.idIngrediente = Pizza_Ingrediente.idIngrediente
	WHERE Ingrediente.Nome = @NomeIngrediente;

SELECT * FROM ListinoPizze2('rucola')



--3. Tabella listino pizze (nome, prezzo) che non contengono un certo ingrediente (parametri: nome ingrediente)
CREATE FUNCTION ListinoPizze3(@NomeIngrediente varchar(30))
RETURNS TABLE
AS
RETURN
	SELECT Pizza.Nome FROM Pizza WHERE Pizza.Nome not in (SELECT Pizza.Nome FROM pizza 
						join Pizza_Ingrediente ON Pizza.idPizza = Pizza_Ingrediente.idPizza
   						join Ingrediente ON Ingrediente.idIngrediente = Pizza_Ingrediente.idIngrediente
	WHERE Ingrediente.Nome = @NomeIngrediente)

SELECT * FROM ListinoPizze3('pomodoro')



--4. Calcolo numero pizze contenenti un ingrediente (parametri: nome ingrediente)
CREATE FUNCTION CalcoloPizzeConIngrediente(@NomeIngrediente varchar(30))
RETURNS INT
AS
BEGIN
	DECLARE @numeroPizze int
	SELECT @numeroPizze = COUNT(*) FROM Pizza 
			join Pizza_Ingrediente on Pizza.idPizza = Pizza_Ingrediente.idPizza
			join Ingrediente on Ingrediente.idIngrediente = Pizza_Ingrediente.idIngrediente
	WHERE Ingrediente.Nome = @NomeIngrediente; 
	
	RETURN @numeroPizze
END

SELECT dbo.CalcoloPizzeConIngrediente('rucola') AS [Numero pizze] --Valore atteso 2



--5. Calcolo numero pizze che non contengono un ingrediente (parametri: codice ingrediente)
CREATE FUNCTION CalcoloPizzeSenzaIngrediente(@CodiceIngrediente int)
RETURNS INT
AS
BEGIN
	DECLARE @numeroPizze int
	SELECT @numeroPizze = COUNT(*) FROM Pizza WHERE Pizza.Nome not in (SELECT Pizza.Nome FROM pizza 
			join Pizza_Ingrediente ON Pizza.idPizza = Pizza_Ingrediente.idPizza
   			join Ingrediente ON Ingrediente.idIngrediente = Pizza_Ingrediente.idIngrediente
	WHERE Ingrediente.idIngrediente = @CodiceIngrediente) 
	
	RETURN @numeroPizze
END

SELECT dbo.CalcoloPizzeSenzaIngrediente(1010) AS [Numero pizze] --Valore atteso 1



--6. Calcolo numero ingredienti contenuti in una pizza (parametri: nome pizza)
CREATE FUNCTION CalcoloIngredientiDiUnaPizza(@NomePizza varchar(30))
RETURNS INT 
AS
BEGIN 
	DECLARE @NumeroIngredienti int
	SELECT @NumeroIngredienti = COUNT(*) FROM Pizza
			join Pizza_Ingrediente on Pizza.idPizza = Pizza_Ingrediente.idPizza
	WHERE Pizza.Nome = @NomePizza

	RETURN @NumeroIngredienti
END

SELECT dbo.CalcoloIngredientiDiUnaPizza('Dioniso') AS [Numero Ingredienti] --Valore atteso 6





--Realizzare una view che rappresenta il menù con tutte le pizze.
CREATE VIEW MenuProva 
AS(select P.Nome, P.Prezzo, string_agg(I.Nome, ', ') AS [Ingredienti]
FROM Pizza P
		join Pizza_Ingrediente PIN on P.IdPizza = PIN.IdPizza
		join Ingrediente I on I.IdIngrediente = PIN.IdIngrediente
GROUP BY P.Nome, P.Prezzo)

SELECT * FROM MenuProva;
