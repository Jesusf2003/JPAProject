/* Poner en uso la base de datos master*/
USE master
GO

/* Eliminar base de datos dbServisoft */
DROP DATABASE Servisoftdb
GO

/* Validando la existencia de la base de datos dbServisoft */
IF db_id('Servisoftdb') IS NOT NULL
    PRINT '*** Si existe la base de datos ***'
ELSE
    PRINT '--- No existe la base de datos, procederé a crearla ---'
    CREATE DATABASE Servisoftdb
GO

/* Poner en uso la base de datos */
USE Servisoftdb
GO

/* Crear tabla Cliente */
CREATE TABLE CLIENTE (
    CODCLI INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
    FECREGCLI  DATE NOT NULL DEFAULT GETDATE(),
    NOMCLI VARCHAR(80) NOT NULL,
    APECLI VARCHAR(80) NOT NULL,
    CELCLI CHAR(9) NOT NULL,
    DNICLI CHAR(8) NOT NULL,
    EMACLI VARCHAR(80) NOT NULL,
    DIRCLI VARCHAR(60) NOT NULL,
    USRCLI VARCHAR(20) NOT NULL,
    PSDCLI VARCHAR(20) NOT NULL,
    CODUBI VARCHAR(6) NOT NULL,
    ESTCLI CHAR(1) NOT NULL DEFAULT 'A'
)
GO

/* Crear tabla Vendedor */
CREATE TABLE VENDEDOR(
    CODVEND INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
    FECREGVEND  DATE NOT NULL DEFAULT GETDATE(),
    NOMVEND VARCHAR(80) NOT NULL,
    APEVEND VARCHAR(80) NOT NULL,
    CELVEND CHAR(9) NOT NULL,
    DNIVEND CHAR(8) NOT NULL,
    EMAVEND VARCHAR(90) NOT NULL,
    DIRVEND VARCHAR(600) NOT NULL,
    USRVEND VARCHAR(20) NOT NULL,
    PSDVEND VARCHAR(20) NOT NULL,
    ESTVEND CHAR(1) NOT NULL DEFAULT 'A',
    CODUBI VARCHAR(6) NOT NULL
)
GO

/* Crear tabla Venta */
CREATE TABLE VENTA(
    CODVENT     INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
    FECREGVENT  DATETIME NOT NULL DEFAULT GETDATE(),
    TIPVENT     CHAR(1) NOT NULL, /* D = Delivery | E = Entrega en Tienda */
	CODVEND		INTEGER NOT NULL,
    CODCLI      INTEGER NOT NULL
)
GO

/* Crear tabla Venta Detalle */
CREATE TABLE VENTADETALLE(
    CODVENTDET      INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
    CANVENTDET      INT NOT NULL,
    CODPROD         INTEGER NOT NULL,
    CODVENT         INTEGER NOT NULL
)
GO

/* Crear tabla de histórico de venta */
CREATE TABLE HISTORICOVENTA
(
    CODHISTVENT INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
    FECHISTVENT DATETIME NULL DEFAULT GETDATE(),
    CODVENTHISTVENT INT NOT NULL,
    CODPRODHISTVENT INT NOT NULL,
    STOCKANTTPROD INT NOT NULL,
    CANTVENTHISTVENT INT NOT NULL,
    STOCKACTPROD INT,
    TOTVENTHISTVENT DECIMAL
)
GO

/* Crear tabla Producto */
CREATE TABLE PRODUCTO(
    CODPROD INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
    NOMPROD VARCHAR(50) NOT NULL,
    FECPROD DATE NOT NULL DEFAULT GETDATE(),
	PREPROD	DECIMAL(10,2) NOT NULL,
    TIPPROD CHAR(1) NOT NULL, -- V= Vino | P = Pisco
    TAMPROD CHAR(10) NOT NULL,
    STOCKPROD INTEGER NOT NULL,
    ESTPROD CHAR(1) NOT NULL DEFAULT 'A'
)
GO

/* Crear tabla Ubigeo */
CREATE TABLE UBIGEO(
    CODUBI      VARCHAR(6) PRIMARY KEY NOT NULL,
    DEPUBI      VARCHAR(60) NOT NULL,
    PROUBI      VARCHAR(60) NOT NULL,
    DISUBI      VARCHAR(60) NOT NULL
)
GO

/* Creando relaciones entre tablas (CLIENTE - VENTA) */
ALTER TABLE VENTA
    ADD CONSTRAINT CLIENTE_VENTA FOREIGN KEY (CODCLI) REFERENCES CLIENTE (CODCLI)
GO

/* Creando relaciones entre tablas (VENTA - VENTA_DETALLE) */
ALTER TABLE VENTADETALLE
    ADD CONSTRAINT VENTA_VENTADETALLE FOREIGN KEY (CODVENT) REFERENCES VENTA (CODVENT)
GO

/* Creando relaciones entre tablas (PRODUCTO - VENTA_DETALLE) */
ALTER TABLE VENTADETALLE
    ADD CONSTRAINT PRODUCTO_VENTADETALLE FOREIGN KEY (CODPROD) REFERENCES PRODUCTO (CODPROD)
GO

/* Relacionar entre las tablas (VENDEDOR - VENTA) */
ALTER TABLE VENTA
    ADD CONSTRAINT VENDEDOR_VENTA FOREIGN KEY (CODVEND) REFERENCES VENDEDOR (CODVEND)
GO

/* Relacionar entre las tablas VENDEDOR - UBIGEO */
ALTER TABLE VENDEDOR
    ADD CONSTRAINT VENDEDOR_UBIGEO FOREIGN KEY (CODUBI) REFERENCES UBIGEO (CODUBI)
GO

/* Relacionar entre las tablas CLIENTE - UBIGEO */
ALTER TABLE CLIENTE
    ADD CONSTRAINT CLIENTE_UBIGEO FOREIGN KEY (CODUBI) REFERENCES UBIGEO (CODUBI)
GO

/* Insertar registros de UBIGEO */
INSERT INTO UBIGEO
    (CODUBI, DEPUBI, PROUBI, DISUBI)
VALUES
    ('150501','Lima', 'Cañete', 'San Vicente de Cañete'),
    ('150502','Lima', 'Cañete', 'Asia'),
    ('150503','Lima', 'Cañete', 'Calango'),
    ('150504','Lima', 'Cañete', 'Cerro Azul'),
    ('150505','Lima', 'Cañete', 'Chilca'),
    ('150506','Lima', 'Cañete', 'Coayllo'),
    ('150507','Lima', 'Cañete', 'Imperial'),
    ('150508','Lima', 'Cañete', 'Lunahuaná'),
    ('150509','Lima', 'Cañete', 'Mala'),
    ('150510','Lima', 'Cañete', 'Nuevo Imperial'),
    ('150511','Lima', 'Cañete', 'Pacaran'),
    ('150512','Lima', 'Cañete', 'Quilmaná'),
    ('150513','Lima', 'Cañete', 'San Antonio'),
    ('150514','Lima', 'Cañete', 'San Luis'),
    ('150515','Lima', 'Cañete', 'Santa Cruz de Flores'),
    ('150516','Lima', 'Cañete', 'Zúñiga')
GO

/* Insertar datos a la tabla CLIENTE */
INSERT INTO CLIENTE
    (NOMCLI, APECLI, CELCLI, DNICLI, EMACLI, DIRCLI, USRCLI, PSDCLI, CODUBI)
VALUES
    ('Fernando', 'Canales Rodríguez', '997845126', '45781236', 'fernandocanales@servisoft.com', 'Av. Miraflores', 'user001', '1234', '150513'),
    ('Jose', 'Suarez Campos', '987654321', '48451236', 'josesuarez@gmail.com', 'Av. Libertad', 'user001', '1234', '150510'),
    ('Alfredo', 'Ramirez Ávila', '947525643', '15359575', 'alfredoramirez@gmail.com', 'Av. 2 de Mayo', 'user001', '1234', '150516'),
    ('Mariano', 'Arotinco Pariona', '918273465', '15754635', 'marianoarotinco@yahoo.com', 'Av. Simon Bolivar', 'user001', '1234', '150509'),
    ('Micaela', 'Pizarro Atahualpa', '963741645', '48471236', 'micaelapizarro@sgmail.com', 'Calle San Bernardo S/N', 'user001', '1234', '150516'),
    ('Pedro', 'Terrones Cerrón', '951357258', '46159522', 'pedroterrones@outlook.com', 'Jr. La Unión Nº 777', 'user001', '1234', '150505'),
    ('Andrea', 'Meneses Paredes', '962742358', '15482697', 'abdresmeneses@yahoo.com', 'Jr. Huancavelica', 'user001', '1234', '150501'),
    ('Carla', 'Tarazona Hernández', '986514327', '45236598', 'carlatarazona@gmail.com', 'Calle La Paz', 'user001', '1234', '150501'),
    ('Abraham', 'Oldazabal Rossi', '974521486', '48751236', 'abrahamoldazabal@outlook.com', 'Av. Francisco Bolognesi', 'user001', '1234', '150513'),
    ('Noelia', 'Pachas Gutierrez', '913782641', '15957535', 'noeliapachas@servisoft.com', 'Jr. Los Laureles', 'user001', '1234', '150514')
GO

/* Insertar datos a la tabla VENDEDOR */
INSERT INTO VENDEDOR
    (NOMVEND, APEVEND, CELVEND, DNIVEND, EMAVEND, DIRVEND, USRVEND, PSDVEND, CODUBI)
VALUES
    ('María', 'Chumpitaz Castillo', '977556412', '45129535', 'mariachumpitaz@servisoft.com', 'Av. Miraflores', 'user001', '1234', '150507'),
    ('Sofía', 'Rodríguez Cuya', '966332141', '47411325', 'sofiarodriguez@servisoft.com', 'Av. Libertad', 'user001', '1234', '150501'),
    ('Wilmer', 'Torres Chauca', '922551147', '44229985', 'wilmertorres@servisoft.com', 'Av. 2 de Mayo', 'user001', '1234', '150509')
GO

/* Configurando para que el formato de fecha sea dmy*/
SET DATEFORMAT dmy
GO

/* Insertar datos en la tabla PRODUCTO */
INSERT INTO PRODUCTO
    (NOMPROD, PREPROD, TIPPROD, TAMPROD, STOCKPROD, ESTPROD)
VALUES
    ('Vino Seco', 15.00, 'V', '250 ML', 100, 'A'),
    ('Vino Seco', 25.00, 'V', '500 ML', 100, 'A'),
    ('Vino Seco', 55.00, 'V', '750 ML', 100, 'A'),
    ('Vino Manzanillo', 15.00, 'V', '250 ML', 120, 'A'),
    ('Vino Manzanillo', 25.00, 'V', '500 ML', 120, 'A'),
    ('Vino Manzanillo', 55.00, 'V', '750 ML', 120, 'A'),
    ('Vino Arrope', 17.00, 'V', '250 ML', 150, 'A'),
    ('Vino Arrope', 30.00, 'V', '500 ML', 150, 'A'),
    ('Pisco Quebranta', 45.00, 'P', '750 ML', 150, 'A'),
    ('Pisco Acholado', 45.00, 'P', '750 ML', 140, 'A'),
    ('Pisco Italia', 40.00, 'P', '500 ML', 165, 'A'),
    ('Pisco Moscatel', 50.00, 'P', '500 ML', 160, 'A'),
    ('Pisco Mosto Verde', 65.00, 'P', '750 ML', 165, 'A')
GO

-- TABLA CABECERA
CREATE PROCEDURE spInsertVenta
    (
        @tipoVenta CHAR(1),
        @codigoVendedor INT,
        @codigoCliente INT
    )
AS
    BEGIN
    SET NOCOUNT ON
        BEGIN TRY
            BEGIN TRAN
                INSERT INTO VENTA
                    (TIPVENT, CODVEND, CODCLI)
                VALUES
                    (UPPER(@tipoVenta), @codigoVendedor, @codigoCliente) 
                IF UPPER(@tipoVenta) = 'D' OR UPPER(@tipoVenta) = 'E'
                    COMMIT TRAN
                ELSE
                    ROLLBACK TRAN;
        END TRY
        BEGIN CATCH
            SELECT 'No se ha registrado la venta' AS 'ERROR'
            IF @@TRANCOUNT > 0 ROLLBACK TRAN; 
        END CATCH
    END 
GO

CREATE PROCEDURE spInsertVentaDetalle
    (
        @cantidadProducto INT,
        @codigoProducto INT,
        @codigoVenta INT
    )
AS
    BEGIN
    SET NOCOUNT ON
        BEGIN TRY
            BEGIN TRAN
                INSERT INTO dbo.VENTADETALLE
                (CANVENTDET, CODPROD, CODVENT)
                VALUES
                (@cantidadProducto, @codigoProducto, @codigoVenta)
        END TRY
        BEGIN CATCH
            SELECT 'No se ha registrado la venta' AS 'ERROR'
            IF @@TRANCOUNT > 0 ROLLBACK TRAN; 
        END CATCH
    END 
GO

-- CRUD Producto
CREATE PROCEDURE spInsertProducto
    (
        @nomProd    VARCHAR(50),
        @precioProd DECIMAL(10, 2),
        @tipoProd   CHAR(1),
        @tamanoProd CHAR(10),
        @stockProd  INT,
        @estadoProd CHAR(1)
    )
AS
    BEGIN
        SET NOCOUNT ON
        BEGIN TRY
        BEGIN TRAN;
            SET DATEFORMAT dmy
            IF(SELECT COUNT(*) FROM dbo.PRODUCTO AS P WHERE P.NOMPROD = TRIM(@nomProd) AND P.TAMPROD = TRIM(@tamanoProd)) >= 1
                ROLLBACK TRAN;
            ELSE
                INSERT INTO dbo.PRODUCTO
                (NOMPROD, PREPROD, TIPPROD, TAMPROD, STOCKPROD, ESTPROD)
                VALUES
                (@nomProd, @precioProd, @tipoProd, @tamanoProd, @stockProd, @estadoProd)
        COMMIT TRAN;
        END TRY
        BEGIN CATCH
            SELECT 'El producto ya existe' AS 'ERROR'
            IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        END CATCH
    END
GO

CREATE PROCEDURE spDeleteProducto
    (
        @codigoProducto INT
    )
AS
    BEGIN
        SET NOCOUNT ON
        UPDATE dbo.PRODUCTO
        SET 
            dbo.Producto.ESTPROD = 'I'
        WHERE
            dbo.PRODUCTO.CODPROD = @codigoProducto
        SELECT * 
        FROM dbo.PRODUCTO
        WHERE dbo.PRODUCTO.ESTPROD = 'A'
    END
GO

/* Crear una vista personalizada de la tabla CLIENTE */
CREATE VIEW vwCliente
AS
SELECT
    TOP(100)(UPPER(C.APECLI) + ', '+ C.NOMCLI) AS 'Apellidos y Nombres' ,
    C.CODCLI AS 'Item',
    C.CELCLI AS 'Celular',
    C.EMACLI AS 'Correo Electrónico',
    C.DIRCLI AS 'Dirección',
    U.DEPUBI AS 'Departamento',
    U.PROUBI AS 'Provincia',
    U.DISUBI AS 'Distrito'
FROM
    dbo.CLIENTE AS C
    INNER JOIN UBIGEO AS U 
    ON C.CODUBI = U.CODUBI
ORDER BY
    [Apellidos y Nombres]
GO

/* Crear una vista de la tabla VENDEDOR */
CREATE VIEW vwVendedor
AS
SELECT
    TOP(100)(UPPER(V.APEVEND) + ', '+ V.NOMVEND) AS 'Apellidos y Nombres',
    V.CODVEND AS 'Vendedor',
    V.CELVEND AS 'Celular',
    V.EMAVEND AS 'Correo electrónico',
    V.DIRVEND AS 'Dirección',
    U.DEPUBI AS 'Departamento',
    U.PROUBI AS 'Provincia',
    U.DISUBI AS 'Distrito'
FROM 
    dbo.VENDEDOR AS V
    INNER JOIN dbo.UBIGEO AS U
    ON V.CODUBI = U.CODUBI
ORDER BY
    [Apellidos y Nombres]
GO

/* Crear una vista de la tabla PRODUCTO */
CREATE VIEW vwProducto
AS
SELECT
    TOP(100) P.NOMPROD AS 'Producto',
    P.TAMPROD AS 'Formato',
    YEAR(P.FECPROD) AS 'Año',
    P.PREPROD AS 'Precio',
    P.STOCKPROD AS 'Stock'
FROM
    dbo.PRODUCTO AS P
ORDER BY 
    PRODUCTO DESC
GO

/* Crear una vista de las ventas realizadas */
CREATE VIEW vwVentas
AS
SELECT
    TOP(100) V.CODVENT,
    V.FECREGVENT AS 'Fecha',
    UPPER(C.APECLI) + ', ' + C.NOMCLI AS 'Cliente',
    UPPER(VEN.APEVEND) + ', ' + VEN.NOMVEND AS 'Vendedor',
    PRO.NOMPROD AS 'Producto',
    PRO.TAMPROD AS 'Formato',
    VD.CANVENTDET AS 'Cantidad',
    PRO.PREPROD AS 'Precio Unitario',
    VD.CANVENTDET * PRO.PREPROD AS 'Sub Total'
FROM
    dbo.VENTA AS V
    INNER JOIN dbo.VENTADETALLE AS VD
    ON V.CODVENT = VD.CODVENT
    INNER JOIN dbo.CLIENTE AS C
    ON V.CODCLI = C.CODCLI
    INNER JOIN dbo.VENDEDOR AS VEN
    ON V.CODVEND = VEN.CODVEND
    INNER JOIN dbo.PRODUCTO AS PRO
    ON VD.CODPROD = PRO.CODPROD
ORDER BY
    v.FECREGVENT DESC
GO

/* Resultados de compras realizadas por el CLIENTE */
SELECT
    Tipo = 
    CASE V.TIPVENT 
        WHEN 'D' THEN 'Delivery'
        WHEN 'E' THEN 'Entrega en tienda'
        ELSE 'No hay venta'
        END,
    UPPER(C.APECLI) + ', ' + C.NOMCLI AS 'Cliente',
    SUM(VD.CANVENTDET * PRO.PREPROD) AS 'Total'
FROM
    dbo.VENTA AS V
    INNER JOIN dbo.VENTADETALLE AS VD
    ON V.CODVENT = VD.CODVENT
    INNER JOIN dbo.CLIENTE AS C
    ON V.CODCLI = C.CODCLI
    INNER JOIN dbo.PRODUCTO AS PRO
    ON VD.CODPROD = PRO.CODPROD
GROUP BY
    C.APECLI, C.NOMCLI, V.TIPVENT
GO

/* Resultados de ventas realizadas por VENDEDOR */
SELECT
    UPPER(VEND.APEVEND) + ', ' + VEND.NOMVEND AS 'Vendedor',
    SUM(VD.CANVENTDET * PRO.PREPROD) AS 'Total'
FROM
    dbo.VENTA AS V
    INNER JOIN dbo.VENTADETALLE AS VD
    ON V.CODVENT = VD.CODVENT
    INNER JOIN dbo.VENDEDOR AS VEND
    ON V.CODVEND = VEND.CODVEND
    INNER JOIN dbo.PRODUCTO AS PRO
    ON VD.CODPROD = PRO.CODPROD
GROUP BY
    VEND.APEVEND, VEND.NOMVEND
GO

/* Lista la cantidad de productos vendidos */
SELECT 
    P.NOMPROD AS 'Producto',
    P.TAMPROD AS 'Tamaño',
    SUM(HV.CANTVENTHISTVENT) AS 'Cantidad vendida'
FROM dbo.HISTORICOVENTA AS HV
    INNER JOIN dbo.PRODUCTO AS P ON
    HV.CODPRODHISTVENT = P.CODPROD
GROUP BY 
    P.NOMPROD, P.TAMPROD
GO

/* Listar el stock actual de productos */
SELECT 
    TIPO = CASE P.TIPPROD 
        WHEN 'V' THEN 'Vino'
        WHEN 'P' THEN 'Pisco'
        ELSE 'No existe'
        END,
    P.NOMPROD AS 'Producto',
    P.TAMPROD AS 'Tamaño',
    P.STOCKPROD AS 'Stock actual'
FROM dbo.PRODUCTO AS P
GO

/* Vista de Histórico venta y producto*/
CREATE VIEW vVENTAS
AS
SELECT 
    FORMAT(FECHISTVENT, 'dd/MM/yyyy ') as date,
    P.NOMPROD,
    HISTORICOVENTA.CANTVENTHISTVENT,
    P.PREPROD,
    HISTORICOVENTA.TOTVENTHISTVENT
FROM dbo.HISTORICOVENTA
    INNER JOIN PRODUCTO AS P
    ON HISTORICOVENTA.CODPRODHISTVENT = P.CODPROD
GO

select
    V.CODVENT,
    C.APECLI + ', ' + C.NOMCLI,
    V.FECREGVENT,
    V.TIPVENT,
    VT.CANVENTDET,
    P.NOMPROD,
    P.PREPROD,
    VT.CANVENTDET * P.PREPROD
from VENTA AS V
INNER JOIN VENTADETALLE AS VT
ON VT.CODVENT = V.CODVENT
INNER JOIN PRODUCTO AS P
ON P.CODPROD = VT.CODPROD
INNER JOIN CLIENTE AS C
ON C.CODCLI = V.CODVENT
where V.CODVENT = (select MAX(CODVENT) from VENTA)
GO

CREATE VIEW vFactura
AS
select
    V.CODVENT,
    (C.APECLI + ', ' + C.NOMCLI) AS CLIENTE,
    FORMAT(V.FECREGVENT, 'dd/MM/yy') AS FECHA,
    SUM(VT.CANVENTDET * P.PREPROD) AS 'TOTCOMPRA'
from VENTA AS V
    INNER JOIN VENTADETALLE AS VT
    ON VT.CODVENT = V.CODVENT
    INNER JOIN PRODUCTO AS P
    ON P.CODPROD = VT.CODPROD
    INNER JOIN CLIENTE AS C
    ON C.CODCLI = V.CODVENT
    GROUP BY V.CODVENT, C.APECLI, C.NOMCLI, V.FECREGVENT
GO

CREATE VIEW vComprobante
AS
SELECT
    V.CODVENT,
    (C.APECLI + ', ' + C.NOMCLI) AS CLIENTE,
    (P.NOMPROD + ', Tam. ' + P.TAMPROD) AS PRODUCTO,
    FORMAT(V.FECREGVENT, 'dd/MM/yy') AS FECREGVENT,
    VT.CANVENTDET,
    P.PREPROD,
    C.DIRCLI,
    C.CELCLI,
    U.PROUBI,
    U.DEPUBI,
    SUM(VT.CANVENTDET * P.PREPROD) AS TOTCOMPRA
from VENTA AS V
    INNER JOIN VENTADETALLE AS VT
    ON VT.CODVENT = V.CODVENT
    INNER JOIN PRODUCTO AS P
    ON P.CODPROD = VT.CODPROD
    INNER JOIN CLIENTE AS C
    ON C.CODCLI = V.CODVENT
    INNER JOIN UBIGEO AS U
    ON U.CODUBI = C.CODUBI
    GROUP BY V.CODVENT, C.APECLI, C.NOMCLI, P.NOMPROD, VT.CANVENTDET,V.FECREGVENT, P.PREPROD, C.CELCLI, U.PROUBI, U.DEPUBI, C.DIRCLI, P.TAMPROD
GO

SELECT * FROM VENDEDOR
GO

SELECT * FROM PRODUCTO
GO