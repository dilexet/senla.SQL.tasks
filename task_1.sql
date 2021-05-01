CREATE TABLE Product (
maker varchar(10) NOT NULL, 
model varchar(50) PRIMARY KEY, 
type varchar(50) NOT NULL
CHECK (type IN('printer', 'pc', 'laptop'))
);

CREATE TABLE PC (
code int UNIQUE,
model varchar(50) NOT NULL,
speed smallint NOT NULL,
ram smallint NOT NULL,
hd real NOT NULL,
cd varchar(10) NOT NULL,
price money
FOREIGN KEY(model) REFERENCES Product
);

CREATE TABLE Laptop (
code int UNIQUE,
model varchar(50) NOT NULL,
speed smallint NOT NULL,
ram smallint NOT NULL,
hd real NOT NULL,
price money,
screen tinyint NOT NULL
FOREIGN KEY(model) REFERENCES Product
);

CREATE TABLE Printer (
code int UNIQUE,
model varchar(50) NOT NULL,
color char(1) NOT NULL,
type varchar(10) NOT NULL,
price money
FOREIGN KEY(model) REFERENCES Product,
CHECK (type IN('laser', 'jet', 'matrix')),
CHECK (color IN('y', 'n'))
);