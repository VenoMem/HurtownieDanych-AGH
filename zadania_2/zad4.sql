-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-12 09:17:23.269

-- tables
-- Table: DIMClient
CREATE TABLE DIMClient (
    ClientID int  NOT NULL,
    ClientName nvarchar(200)  NOT NULL,
    NIP nvarchar(200)  NOT NULL,
    ClientAddress nvarchar(200)  NOT NULL,
    CONSTRAINT DIMClient_pk PRIMARY KEY  (ClientID)
);

-- Table: DIMDate
CREATE TABLE DIMDate (
    DateID int  NOT NULL,
    FullDate date  NOT NULL,
    Day int  NOT NULL,
    Month int  NOT NULL,
    Year int  NOT NULL,
    CONSTRAINT DIMDate_pk PRIMARY KEY  (DateID)
);

-- Table: DIMFruit
CREATE TABLE DIMFruit (
    FruitID int  NOT NULL,
    FruitName nvarchar(200)  NOT NULL,
    PricePerKg float(2)  NOT NULL,
    FruitCategoryID int  NOT NULL,
    DIMFruitCategory_FruitCategoryID int  NOT NULL,
    CONSTRAINT DIMFruit_pk PRIMARY KEY  (FruitID)
);

-- Table: DIMFruitCategory
CREATE TABLE DIMFruitCategory (
    FruitCategoryID int  NOT NULL,
    FruitCategory nvarchar(200)  NOT NULL,
    CONSTRAINT DIMFruitCategory_pk PRIMARY KEY  (FruitCategoryID)
);

-- Table: DIMOrder
CREATE TABLE DIMOrder (
    OrderID int  NOT NULL,
    FruitAmount float(3)  NOT NULL,
    MoneyAmount float(2)  NOT NULL,
    CONSTRAINT DIMOrder_pk PRIMARY KEY  (OrderID)
);

-- Table: DIMPlace
CREATE TABLE DIMPlace (
    PlaceID int  NOT NULL,
    PlaceName nvarchar(200)  NOT NULL,
    PlaceAddress nvarchar(200)  NOT NULL,
    CONSTRAINT DIMPlace_pk PRIMARY KEY  (PlaceID)
);

-- Table: DIMTime
CREATE TABLE DIMTime (
    TimeID int  NOT NULL,
    FullTime time  NOT NULL,
    Hours int  NOT NULL,
    Minutes int  NOT NULL,
    Seconds int  NOT NULL,
    CONSTRAINT DIMTime_pk PRIMARY KEY  (TimeID)
);

-- Table: FactsSales
CREATE TABLE FactsSales (
    OrderDetailID int  NOT NULL,
    OrderID int  NOT NULL,
    FruitID int  NOT NULL,
    ClientID int  NOT NULL,
    DateID int  NOT NULL,
    TimeID int  NOT NULL,
    PlaceID int  NOT NULL,
    DIMFruit_FruitID int  NOT NULL,
    DIMOrder_OrderID int  NOT NULL,
    DIMClient_ClientID int  NOT NULL,
    DIMDate_DateID int  NOT NULL,
    DIMTime_TimeID int  NOT NULL,
    DIMPlace_PlaceID int  NOT NULL,
    CONSTRAINT FactsSales_pk PRIMARY KEY  (OrderDetailID)
);

-- foreign keys
-- Reference: DIMFruit_DIMFruitCategory (table: DIMFruit)
ALTER TABLE DIMFruit ADD CONSTRAINT DIMFruit_DIMFruitCategory
    FOREIGN KEY (DIMFruitCategory_FruitCategoryID)
    REFERENCES DIMFruitCategory (FruitCategoryID);

-- Reference: FactsSales_DIMPlace (table: FactsSales)
ALTER TABLE FactsSales ADD CONSTRAINT FactsSales_DIMPlace
    FOREIGN KEY (DIMPlace_PlaceID)
    REFERENCES DIMPlace (PlaceID);

-- Reference: OrderFacts_ClientDIM (table: FactsSales)
ALTER TABLE FactsSales ADD CONSTRAINT OrderFacts_ClientDIM
    FOREIGN KEY (DIMClient_ClientID)
    REFERENCES DIMClient (ClientID);

-- Reference: OrderFacts_DIMDate (table: FactsSales)
ALTER TABLE FactsSales ADD CONSTRAINT OrderFacts_DIMDate
    FOREIGN KEY (DIMDate_DateID)
    REFERENCES DIMDate (DateID);

-- Reference: OrderFacts_DIMTime (table: FactsSales)
ALTER TABLE FactsSales ADD CONSTRAINT OrderFacts_DIMTime
    FOREIGN KEY (DIMTime_TimeID)
    REFERENCES DIMTime (TimeID);

-- Reference: OrderFacts_FruitDIM (table: FactsSales)
ALTER TABLE FactsSales ADD CONSTRAINT OrderFacts_FruitDIM
    FOREIGN KEY (DIMFruit_FruitID)
    REFERENCES DIMFruit (FruitID);

-- Reference: OrderFacts_OrderDIM (table: FactsSales)
ALTER TABLE FactsSales ADD CONSTRAINT OrderFacts_OrderDIM
    FOREIGN KEY (DIMOrder_OrderID)
    REFERENCES DIMOrder (OrderID);

-- sequences
-- Sequence: DIMClient_seq
CREATE SEQUENCE DIMClient_seq
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

-- Sequence: DIMFruitCategory_seq
CREATE SEQUENCE DIMFruitCategory_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DIMFruit_seq
CREATE SEQUENCE DIMFruit_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DIMOrder_seq
CREATE SEQUENCE DIMOrder_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DIMPlace_seq
CREATE SEQUENCE DIMPlace_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DIMTime_seq
CREATE SEQUENCE DIMTime_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: FactsSales_seq
CREATE SEQUENCE FactsSales_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

