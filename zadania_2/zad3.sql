-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-12 09:03:00.278

-- tables
-- Table: DIMAuthor
CREATE TABLE DIMAuthor (
    AuthorID int  NOT NULL,
    AuthorName nvarchar(200)  NOT NULL,
    CONSTRAINT DIMAuthor_pk PRIMARY KEY  (AuthorID)
);

-- Table: DIMBook
CREATE TABLE DIMBook (
    BookID int  NOT NULL,
    ISBN int  NOT NULL,
    Title nvarchar(200)  NOT NULL,
    AuthorID int  NOT NULL,
    PublisherID int  NOT NULL,
    NumberOfPages int  NOT NULL,
    DIMAuthor_AuthorID int  NOT NULL,
    DIMPublisher_PublisherID int  NOT NULL,
    CONSTRAINT DIMBook_pk PRIMARY KEY  (BookID)
);

-- Table: DIMCarrier
CREATE TABLE DIMCarrier (
    CarrierID int  NOT NULL,
    NIP int  NOT NULL,
    Address nvarchar(200)  NOT NULL,
    CarrierName nvarchar(200)  NOT NULL,
    CONSTRAINT DIMCarrier_pk PRIMARY KEY  (CarrierID)
);

-- Table: DIMClient
CREATE TABLE DIMClient (
    ClientID int  NOT NULL,
    PhoneNumber int  NOT NULL,
    Adress nvarchar(200)  NOT NULL,
    ClientFirstName nvarchar(200)  NOT NULL,
    ClientLastName nvarchar(200)  NOT NULL,
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

-- Table: DIMPublisher
CREATE TABLE DIMPublisher (
    PublisherID int  NOT NULL,
    PublisherName nvarchar(200)  NOT NULL,
    CONSTRAINT DIMPublisher_pk PRIMARY KEY  (PublisherID)
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

-- Table: FactSales
CREATE TABLE FactSales (
    OrderDetailsID int  NOT NULL,
    OrderID int  NOT NULL,
    DateID int  NOT NULL,
    ClinetID int  NOT NULL,
    BookID int  NOT NULL,
    CarrierID int  NOT NULL,
    TimeID int  NOT NULL,
    DIMCarrier_CarrierID int  NOT NULL,
    DIMBook_BookID int  NOT NULL,
    DIMClient_ClientID int  NOT NULL,
    DIMDate_DateID int  NOT NULL,
    DIMTime_TimeID int  NOT NULL,
    CONSTRAINT FactSales_pk PRIMARY KEY  (OrderDetailsID)
);

-- foreign keys
-- Reference: DIMBook_DIMAuthor (table: DIMBook)
ALTER TABLE DIMBook ADD CONSTRAINT DIMBook_DIMAuthor
    FOREIGN KEY (DIMAuthor_AuthorID)
    REFERENCES DIMAuthor (AuthorID);

-- Reference: DIMBook_DIMPublisher (table: DIMBook)
ALTER TABLE DIMBook ADD CONSTRAINT DIMBook_DIMPublisher
    FOREIGN KEY (DIMPublisher_PublisherID)
    REFERENCES DIMPublisher (PublisherID);

-- Reference: FactSales_CarrierDIM (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_CarrierDIM
    FOREIGN KEY (DIMCarrier_CarrierID)
    REFERENCES DIMCarrier (CarrierID);

-- Reference: FactSales_ClientDIM (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_ClientDIM
    FOREIGN KEY (DIMClient_ClientID)
    REFERENCES DIMClient (ClientID);

-- Reference: FactSales_DIMDate (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_DIMDate
    FOREIGN KEY (DIMDate_DateID)
    REFERENCES DIMDate (DateID);

-- Reference: FactSales_DIMTime (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_DIMTime
    FOREIGN KEY (DIMTime_TimeID)
    REFERENCES DIMTime (TimeID);

-- Reference: FactSales_ProductDIM (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_ProductDIM
    FOREIGN KEY (DIMBook_BookID)
    REFERENCES DIMBook (BookID);

-- sequences
-- Sequence: DIMAuthor_seq
CREATE SEQUENCE DIMAuthor_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DIMBook_seq
CREATE SEQUENCE DIMBook_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DIMCarrier_seq
CREATE SEQUENCE DIMCarrier_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

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

-- Sequence: DIMPublisher_seq
CREATE SEQUENCE DIMPublisher_seq
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

-- Sequence: FactSales_seq
CREATE SEQUENCE FactSales_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

