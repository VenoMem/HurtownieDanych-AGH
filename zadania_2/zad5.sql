-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-12 09:35:07.551

-- tables
-- Table: DIMArchivePerformance
CREATE TABLE DIMArchivePerformance (
    APID int  NOT NULL,
    EmployeeID int  NOT NULL,
    Performance int  NOT NULL,
    ValidFrom date  NOT NULL,
    ValidTo date  NOT NULL,
    FactsEmployees_EmployeeID int  NOT NULL,
    CONSTRAINT DIMArchivePerformance_pk PRIMARY KEY  (APID)
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

-- Table: FactsEmployees
CREATE TABLE FactsEmployees (
    EmployeeID int  NOT NULL,
    PESEL int  NOT NULL,
    Address nvarchar(200)  NOT NULL,
    Wage float(2)  NOT NULL,
    Performance int  NOT NULL,
    DateID int  NOT NULL,
    DIMDate_DateID int  NOT NULL,
    CONSTRAINT FactsEmployees_pk PRIMARY KEY  (EmployeeID)
);

-- foreign keys
-- Reference: DIMArchivePerformance_FactsEmployees (table: DIMArchivePerformance)
ALTER TABLE DIMArchivePerformance ADD CONSTRAINT DIMArchivePerformance_FactsEmployees
    FOREIGN KEY (FactsEmployees_EmployeeID)
    REFERENCES FactsEmployees (EmployeeID);

-- Reference: FactsEmployees_DIMDate (table: FactsEmployees)
ALTER TABLE FactsEmployees ADD CONSTRAINT FactsEmployees_DIMDate
    FOREIGN KEY (DIMDate_DateID)
    REFERENCES DIMDate (DateID);

-- sequences
-- Sequence: DIMArchivePerformance_seq
CREATE SEQUENCE DIMArchivePerformance_seq
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

-- Sequence: FactsEmployees_seq
CREATE SEQUENCE FactsEmployees_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

