-- Création de la table CLIENT
CREATE TABLE CLIENT (
    ClientID NUMBER PRIMARY KEY,
    Nom VARCHAR2(50),
    Prenom VARCHAR2(50),
    Adresse VARCHAR2(100),
    Telephone VARCHAR2(20)
);

-- Création de la table ORDERS
CREATE TABLE ORDERS (
    OrderID NUMBER PRIMARY KEY,
    ClientID NUMBER,
    OrderDate DATE DEFAULT SYSDATE,
    FOREIGN KEY (ClientID) REFERENCES CLIENT(ClientID)
);

-- Création de la table PRODUIT
CREATE TABLE PRODUIT (
    ProduitID NUMBER PRIMARY KEY,
    NomProduit VARCHAR2(50),
    Prix NUMBER,
    Quantite NUMBER,
    Categorie VARCHAR2(20)
);

-- Création de la table ORDER_DETAILS
CREATE TABLE ORDER_DETAILS (
    OrderID NUMBER,
    ProduitID NUMBER,
    Quantite NUMBER,
    PRIMARY KEY (OrderID, ProduitID),
    FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID),
    FOREIGN KEY (ProduitID) REFERENCES PRODUIT(ProduitID)
);

-- Ajout de la colonne Categorie à la table PRODUIT
ALTER TABLE PRODUIT
ADD Categorie VARCHAR2(20);

-- Ajout de la colonne OrderDate à la table ORDERS avec SYSDATE comme valeur par défaut
ALTER TABLE ORDERS
ADD OrderDate DATE DEFAULT SYSDATE;
