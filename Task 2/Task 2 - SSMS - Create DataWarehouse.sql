CREATE TABLE Stg_Sales_Cleaned (
    Date_Vente DATE,
    SKU VARCHAR(50),
    Collection VARCHAR(50),
    Nom_Produit VARCHAR(100),
    Couleur VARCHAR(50),
    Taille VARCHAR(20),
    Quantité_Vendue INT,
    Prix_Unitaire DECIMAL(10,2),
    Remise INT,
    Prix_Final DECIMAL(10,2),
    Canal VARCHAR(50),
    Paiement VARCHAR(50),
    Pays VARCHAR(50),
    date_vente DATE,
    pays_commande VARCHAR(50)
);

CREATE TABLE Dim_Date (
    Date_ID INT IDENTITY PRIMARY KEY,
    Full_Date DATE,
    Day INT,
    Month INT,
    Year INT,
    Quarter INT
);

CREATE TABLE Dim_Product (
    Product_ID INT IDENTITY PRIMARY KEY,
    SKU VARCHAR(50),
    Nom_Produit VARCHAR(100),
    Collection VARCHAR(50)
);

CREATE TABLE Dim_Size (
    Size_ID INT IDENTITY PRIMARY KEY,
    Taille VARCHAR(20)
);

CREATE TABLE Dim_Color (
    Color_ID INT IDENTITY PRIMARY KEY,
    Couleur VARCHAR(50)
);

CREATE TABLE Dim_Customer (
    Customer_ID INT IDENTITY PRIMARY KEY,
    Pays VARCHAR(50),
    Pays_Commande VARCHAR(50)
);

INSERT INTO Dim_Date
SELECT DISTINCT Date_Vente,
DAY(Date_Vente),
MONTH(Date_Vente),
YEAR(Date_Vente),
DATEPART(QUARTER, Date_Vente)
FROM Stg_Sales_Cleaned;

INSERT INTO Dim_Product
SELECT DISTINCT SKU, Nom_Produit, Collection
FROM Stg_Sales_Cleaned;

INSERT INTO Dim_Size
SELECT DISTINCT Taille FROM Stg_Sales_Cleaned;

INSERT INTO Dim_Color
SELECT DISTINCT Couleur FROM Stg_Sales_Cleaned;

INSERT INTO Dim_Customer
SELECT DISTINCT Pays, pays_commande
FROM Stg_Sales_Cleaned;

CREATE TABLE Fact_Sales (
    Sales_ID INT IDENTITY PRIMARY KEY,
    Date_ID INT,
    Product_ID INT,
    Size_ID INT,
    Color_ID INT,
    Customer_ID INT,
    Quantité_Vendue INT,
    Prix_Unitaire DECIMAL(10,2),
    Remise INT,
    Prix_Final DECIMAL(10,2),
    Canal VARCHAR(50),
    Paiement VARCHAR(50)
);

INSERT INTO Fact_Sales
SELECT
    d.Date_ID,
    p.Product_ID,
    s.Size_ID,
    c.Color_ID,
    cu.Customer_ID,
    st.Quantité_Vendue,
    st.Prix_Unitaire,
    st.Remise,
    st.Prix_Final,
    st.Canal,
    st.Paiement
FROM Stg_Sales_Cleaned st
JOIN Dim_Date d ON st.date_vente = d.Full_Date
JOIN Dim_Product p ON st.SKU = p.SKU
JOIN Dim_Size s ON st.Taille = s.Taille
JOIN Dim_Color c ON st.Couleur = c.Couleur
JOIN Dim_Customer cu
ON st.Pays = cu.Pays
AND st.pays_commande = cu.Pays_Commande;


SELECT TOP 10 * FROM Fact_Sales;
