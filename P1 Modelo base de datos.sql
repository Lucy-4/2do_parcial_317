create database BDBANCO
GO


CREATE TABLE Usuarios (
    UserID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    [Correo electrónico] VARCHAR(100),
    Contraseña VARCHAR(50)
);

CREATE TABLE Cuentas (
    CuentaID INT PRIMARY KEY,
    UserID INT,
    [Tipo de cuenta] VARCHAR(50),
    Saldo DECIMAL(10, 2),
    FOREIGN KEY (UserID) REFERENCES Usuarios(UserID)
);

CREATE TABLE Transacciones (
    TransaccionID INT PRIMARY KEY,
    CuentaID INT,
    [Tipo de transacción] VARCHAR(50),
    Monto DECIMAL(10, 2),
    Fecha DATE,
    FOREIGN KEY (CuentaID) REFERENCES Cuentas(CuentaID)
);

CREATE TABLE Beneficiarios (
    BeneficiarioID INT PRIMARY KEY,
    UserID INT,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    CuentaID INT,
    FOREIGN KEY (UserID) REFERENCES Usuarios(UserID),
    FOREIGN KEY (CuentaID) REFERENCES Cuentas(CuentaID)
);

CREATE TABLE Tarjetas (
    TarjetaID INT PRIMARY KEY,
    UserID INT,
    [Número de tarjeta] VARCHAR(20),
    [Fecha de vencimiento] VARCHAR(10),
    CVV VARCHAR(3),
    FOREIGN KEY (UserID) REFERENCES Usuarios(UserID)
);

CREATE TABLE Prestamos (
    PréstamoID INT PRIMARY KEY,
    UserID INT,
    Monto DECIMAL(10, 2),
    [Tasa de interés] DECIMAL(5, 2),
    [Fecha de inicio] DATE,
    [Fecha de vencimiento] DATE,
    FOREIGN KEY (UserID) REFERENCES Usuarios(UserID)
);

CREATE TABLE Movimientos (
    MovimientoID INT PRIMARY KEY,
    CuentaID INT,
    Descripcion VARCHAR(100),
    Monto DECIMAL(10, 2),
    Fecha DATE,
    FOREIGN KEY (CuentaID) REFERENCES Cuentas(CuentaID)
);




**********************************
INSERT INTO Usuarios (UserID, Nombre, Apellido, [Correo electrónico], Contraseña)
VALUES
    (1, 'Juan', 'Pérez', 'juan.perez@gmail.com', 'abc123'),
    (2, 'María', 'López', 'maria.lopez@gmail.com', 'xyz456'),
    (3, 'Pedro', 'Gómez', 'pedro.gomez@gmail.com', 'def789'),
    (4, 'Ana', 'Rodríguez', 'ana.rodriguez@gmail.com', 'qwe321'),
    (5, 'Graciela', 'Flores', 'graciela.flores@gmail.com', 'abo123'),
    (6, 'Julian', 'Figueroa', 'julian.figueroa@gmail.com', 'dfg456'),
    (7, 'Pepe', 'Maldonado', 'Pepe.maldonado@gmail.com', 'poi789'),
    (8, 'Rosa', 'Mercado', 'rosa.mercado@gmail.com', 'vbn876'),
    (9, 'Juan', 'Torrez', 'juan.torrez@gmail.com', 'rgn109'),
    (10, 'Jenny', 'Delgado', 'jenny.delgado@gmail.com', 'jhg135'),
    (11, 'Luis', 'Sánchez', 'luis.sanchez@gmail.com', 'tyu357'),
    (12, 'Sofía', 'Martínez', 'sofia.martinez@gmail.com', 'iop258'),
    (13, 'Carlos', 'Ruiz', 'carlos.ruiz@gmail.com', 'zxc753'),
    (14, 'Laura', 'Díaz', 'laura.diaz@gmail.com', 'qaz159'),
    (15, 'Andrés', 'Hernández', 'andres.hernandez@gmail.com', 'mnb852');


    INSERT INTO Cuentas (CuentaID, UserID, [Tipo de cuenta], Saldo)
VALUES
    (1, 1, 'Ahorros', 5000.00),
    (2, 1, 'Corriente', 10000.00),
    (3, 2, 'Ahorros', 7500.00),
    (4, 3, 'Corriente', 3000.00),
    (5, 4, 'Ahorros', 5000.00),
    (6, 1, 'Corriente', 10000.00),
    (7, 2, 'Ahorros', 7500.00),
    (8, 3, 'Corriente', 3000.00),
    (9, 7, 'Ahorros', 5000.00),
    (10, 8, 'Corriente', 10000.00),
    (11, 5, 'Ahorros', 8000.00 ),
    (12, 6, 'Corriente', 12000.00),
    (13, 7, 'Ahorros', 9500.00 ),
    (14, 8, 'Corriente', 4000.00 ),
    (15, 9, 'Ahorros', 5500.00 );
    


INSERT INTO Transacciones (TransaccionID, CuentaID, [Tipo de transacción], Monto, Fecha)
VALUES
    (1, 1, 'Depósito', 1000.00, '2023-05-15'),
    (2, 1, 'Retiro', 500.00, '2023-05-18'),
    (3, 2, 'Depósito', 2000.00, '2023-05-20'),
    (4, 3, 'Retiro', 1000.00, '2023-05-22'),
    (5, 5, 'Depósito', 1000.00, '2023-05-15'),
    (6, 6, 'Retiro', 500.00, '2023-05-18'),
    (7, 5, 'Depósito', 2000.00, '2023-05-20'),
    (8, 8, 'Retiro', 1000.00, '2023-05-22'),
    (9, 9, 'Depósito', 1000.00, '2023-05-15'),
    (10, 4, 'Retiro', 500.00, '2023-05-18'),
    (11, 6, 'Depósito', 1000.00, '2023-06-01'),
    (12, 7, 'Retiro', 500.00, '2023-06-03'),
    (13, 8, 'Depósito', 2000.00, '2023-06-05'),
    (14, 9, 'Retiro', 1000.00, '2023-06-07'),
    (15, 10, 'Depósito', 1000.00, '2023-06-01'),
    (16, 5, 'Retiro', 500.00, '2023-06-03'),
    (17, 6, 'Depósito', 2000.00, '2023-06-05'),
    (18, 7, 'Retiro', 1000.00, '2023-06-07'),
    (19, 8, 'Depósito', 1000.00, '2023-06-09'),
    (20, 9, 'Retiro', 500.00, '2023-06-11');



INSERT INTO Beneficiarios (BeneficiarioID, UserID, Nombre, Apellido, CuentaID)
VALUES
    (1, 1, 'Ana', 'Rodríguez', 2),
    (2, 1, 'Carlos', 'González', 2),
    (3, 2, 'Laura', 'García', 3),
    (4, 1, 'Ana', 'Rodríguez', 2),
    (5, 3, 'Carlos', 'González', 5),
    (6, 5, 'Graciela', 'Flores', 6),
    (7, 7, 'Pepe', 'Maldonado', 4),
    (8, 5, 'Ana', 'Rodríguez', 9),
    (9, 9, 'Carlos', 'González', 10),
    (10, 10, 'Jenny', 'Delgado', 1);

  


INSERT INTO Tarjetas (TarjetaID, UserID, [Número de tarjeta], [Fecha de vencimiento], CVV)
VALUES
    (1, 1, '1234-5678-9012-3456', '06/25', '123'),
    (2, 2, '9876-5432-1098-7654', '09/24', '456'),
    (3, 3, '4567-8901-2345-6789', '03/26', '789'),
    (4, 4, '1214-5678-9092-3456', '06/25', '127'),
    (5, 7, '8976-5432-1036-7664', '09/24', '345'),
    (6, 10, '4567-8901-2345-6729', '03/26', '987'),
    (7, 3, '1234-5678-9012-3456', '06/25', '123'),
    (8, 4, '9876-5432-1098-7654', '09/24', '456'),
    (9, 5, '4567-8901-2345-6789', '03/26', '789'),
    (10, 6, '1214-5678-9092-3456', '06/25', '127'),
    (11, 8, '8976-5432-1036-7664', '09/24', '345'),
    (12, 9, '4567-8901-2345-6729', '03/26', '987');


    


INSERT INTO Prestamos (PréstamoID, UserID, Monto, [Tasa de interés], [Fecha de inicio], [Fecha de vencimiento])
VALUES
    (1, 1, 5000.00, 5.2, '2023-04-01', '2024-03-31'),
    (2, 2, 10000.00, 4.8, '2023-05-15', '2024-05-14'),
    (3, 3, 5000.00, 5.2, '2023-04-01', '2024-03-31'),
    (4, 5, 10000.00, 4.8, '2023-05-15', '2024-05-14'),
    (5, 6, 8000.00,  6.50 , '2023-06-01' , '2024-05-31'),
    (6, 7, 12000.00, 7.20 , '2023-06-05' , '2024-06-04'),
    (7, 8, 5000.00,  5.50 , '2023-06-10' , '2024-06-09'),
    (8, 9, 10000.00, 4.75 , '2023-06-15' , '2024-06-14'),
    (9, 10,7000.00, 6.00 ,'2023-06-20' ,'2024-06-19');



INSERT INTO Movimientos (MovimientoID, CuentaID, Descripcion, Monto, Fecha)
VALUES
    (1, 1, 'Compra en línea', 100.00, '2023-05-15'),
    (2, 2, 'Depósito de salario', 2500.00, '2023-05-18'),
    (3, 3, 'Pago de factura', 50.00, '2023-05-20'),
    (4, 4, 'Retiro en cajero', 200.00, '2023-05-22'),
    (5, 1, 'Compra en línea', 100.00 , '2023-05-15'),
    (6, 2, 'Depósito de salario', 2500.00 , '2023-05-18'),
    (7, 3, 'Pago de factura', 50.00 , '2023-05-20'),
    (8, 4, 'Retiro en cajero', 200.00 , '2023-05-22'),
    (9, 10, 'Transferencia entrante', 500.00 , '2023-06-01'),
    (10, 5, 'Depósito de ahorros', 2000.00 , '2023-06-03'),
    (11, 6, 'Pago de tarjeta de crédito', 500.00 , '2023-06-05'),
    (12, 7, 'Transferencia saliente', 300.00 , '2023-06-07'),
    (13, 8, 'Recarga telefónica', 20.00 , '2023-06-09');