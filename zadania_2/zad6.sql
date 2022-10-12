-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-12 08:44:35.325

-- tables
-- Table: DIMBrand
CREATE TABLE DIMBrand (
    BrandID int  NOT NULL,
    Name nvarchar(200)  NOT NULL,
    CONSTRAINT DIMBrand_pk PRIMARY KEY  (BrandID)
);

-- Table: DIMDate
CREATE TABLE DIMDate (
    DateID int  NOT NULL,
    FullDate date  NOT NULL,
    Day int  NOT NULL,
    Month int  NOT NULL,
    Year int  NOT NULL,
    Quarter int  NOT NULL,
    CONSTRAINT DIMDate_pk PRIMARY KEY  (DateID)
);

-- Table: DIMProductName
CREATE TABLE DIMProductName (
    ProductID int  NOT NULL,
    Name nvarchar(200)  NOT NULL,
    BrandID int  NOT NULL,
    DIMBrand_BrandID int  NOT NULL,
    CONSTRAINT DIMProductName_pk PRIMARY KEY  (ProductID)
);

-- Table: DIMProducts
CREATE TABLE DIMProducts (
    ProductKey int  NOT NULL,
    ProductID int  NOT NULL,
    ValidFrom date  NOT NULL,
    ValidTo date  NULL,
    DIMProductName_ProductID int  NOT NULL,
    CONSTRAINT DIMProducts_pk PRIMARY KEY  (ProductKey)
);

-- Table: DIMWarehouse
CREATE TABLE DIMWarehouse (
    WarehouseID int  NOT NULL,
    Address nvarchar(200)  NOT NULL,
    Country nvarchar(200)  NOT NULL,
    CONSTRAINT DIMWarehouse_pk PRIMARY KEY  (WarehouseID)
);

-- Table: FactsFMCG
CREATE TABLE FactsFMCG (
    FactID int  NOT NULL,
    WarehouseID int  NOT NULL,
    ProductKey int  NOT NULL,
    ProductAmount int  NOT NULL,
    DateID int  NOT NULL,
    DIMWarehouse_WarehouseID int  NOT NULL,
    DIMProducts_ProductKey int  NOT NULL,
    DIMDate_DateID int  NOT NULL,
    CONSTRAINT FactsFMCG_pk PRIMARY KEY  (FactID)
);

-- foreign keys
-- Reference: FactsFMCG_DIMDate (table: FactsFMCG)
ALTER TABLE FactsFMCG ADD CONSTRAINT FactsFMCG_DIMDate
    FOREIGN KEY (DIMDate_DateID)
    REFERENCES DIMDate (DateID);

-- Reference: FactsFMCG_ProductsDIM (table: FactsFMCG)
ALTER TABLE FactsFMCG ADD CONSTRAINT FactsFMCG_ProductsDIM
    FOREIGN KEY (DIMProducts_ProductKey)
    REFERENCES DIMProducts (ProductKey);

-- Reference: FactsFMCG_WarehouseDIM (table: FactsFMCG)
ALTER TABLE FactsFMCG ADD CONSTRAINT FactsFMCG_WarehouseDIM
    FOREIGN KEY (DIMWarehouse_WarehouseID)
    REFERENCES DIMWarehouse (WarehouseID);

-- Reference: ProductDIM_BrandDIM (table: DIMProductName)
ALTER TABLE DIMProductName ADD CONSTRAINT ProductDIM_BrandDIM
    FOREIGN KEY (DIMBrand_BrandID)
    REFERENCES DIMBrand (BrandID);

-- Reference: ProductsDIM_ProductDIM (table: DIMProducts)
ALTER TABLE DIMProducts ADD CONSTRAINT ProductsDIM_ProductDIM
    FOREIGN KEY (DIMProductName_ProductID)
    REFERENCES DIMProductName (ProductID);

-- sequences
-- Sequence: DIMBrand_seq
CREATE SEQUENCE DIMBrand_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DIMDate_seq
CREATE SEQUENCE DIMDate_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DIMProductName_seq
CREATE SEQUENCE DIMProductName_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DIMProducts_seq
CREATE SEQUENCE DIMProducts_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DIMWarehouse_seq
CREATE SEQUENCE DIMWarehouse_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: FactsFMCG_seq
CREATE SEQUENCE FactsFMCG_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

