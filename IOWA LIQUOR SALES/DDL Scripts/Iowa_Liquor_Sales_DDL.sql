/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      IowaModel.DM1
 *
 * Date Created : Friday, April 07, 2023 20:05:16
 * Target DBMS : Google BigQuery
 */

/* 
 * TABLE: Dim_Date 
 */

CREATE TABLE Dim_Date(
    DateSK                  INTEGER        NOT NULL,
    DateTime_Value          DATE,
    Month                   INTEGER,
    Year                    INTEGER,
    WeekNumber              INTEGER,
    DayNumber               INTEGER,
    DI_JobID                STRING(255),
    DI_CreateDate           DATE,
    DI_WorkflowDirectory    STRING(255)
)
OPTIONS( 
    friendly_name = "Dim_Date"
)
;

/* 
 * TABLE: DIM_Population 
 */

CREATE TABLE DIM_Population(
    PopulationSK            INTEGER        NOT NULL,
    County                  STRING(255),
    County_FIPS_Code        INTEGER,
    City                    STRING(255),
    FIPS_original           INTEGER,
    CityPopulation          INTEGER,
    CountyPopulation        INTEGER,
    CityPopulationDate      DATE,
    CountyPopulationDate    DATE,
    CityPopulationYear      INTEGER,
    CountyPopulationYear    INTEGER,
    CityLocation            STRING(255),
    CountyLocation          STRING(255),
    DI_JobID                STRING(255),
    DI_CreateDate           DATE,
    DI_WorkflowDirectory    STRING(255)
)
OPTIONS( 
    friendly_name = "DIM_Population"
)
;

/* 
 * TABLE: Dim_Product 
 */

CREATE TABLE Dim_Product(
    ProductSK               INTEGER        NOT NULL,
    Category_Name           STRING(255),
    Item_Number             STRING(255),
    Item_Description        STRING(255),
    Pack                    INTEGER,
    Age                     INTEGER,
    Proof                   INTEGER,
    List_Date               DATE,
    Report_Date             DATE,
    DI_JobID                STRING(255),
    DI_CreateDate           DATE,
    DI_WorkflowDirectory    STRING(255)
)
OPTIONS( 
    friendly_name = "Dim_Product"
)
;

/* 
 * TABLE: Dim_Store 
 */

CREATE TABLE Dim_Store(
    StoreSK                 INTEGER        NOT NULL,
    StoreNumber             INTEGER,
    StoreName               STRING(255),
    Store_Status            STRING(255),
    Address                 STRING(255),
    City                    STRING(255),
    State                   STRING(255),
    Zipcode                 STRING(255),
    Store_Address           STRING(255),
    ReportDate              DATE,
    DI_JobID                STRING(255),
    DI_CreateDate           DATE,
    DI_WorkflowDirectory    STRING(255)
)
OPTIONS( 
    friendly_name = "Dim_Store"
)
;

/* 
 * TABLE: Dim_Vendor 
 */

CREATE TABLE Dim_Vendor(
    VendorSK                INTEGER        NOT NULL,
    Vendor_Name             STRING(255),
    Vendor_Number           STRING(255),
    DI_JobID                STRING(255),
    DI_CreateDate           DATE,
    DI_WorkflowDirectory    STRING(255)
)
OPTIONS( 
    friendly_name = "Dim_Vendor"
)
;

/* 
 * TABLE: FCT_Invoice_Header 
 */

CREATE TABLE FCT_Invoice_Header(
    InvoiceNumber                  INTEGER        NOT NULL,
    Invoice_Item_Number            STRING(255),
    DateSK                         INTEGER        NOT NULL,
    InvoiceDate                    DATE,
    Invoice_Bottles_Sold           INTEGER,
    Invoice_Sales_Dollars          FLOAT64,
    Invoice_Volume_Sold_Litres     FLOAT64,
    Invoice_Volume_Sold_Gallons    FLOAT64,
    DI_JobID                       STRING(255),
    DI_CreateDate                  DATE,
    DI_Workflow_Directory          STRING(255),
    StoreSK                        INTEGER        NOT NULL,
    PopulationSK                   INTEGER        NOT NULL
)
OPTIONS( 
    friendly_name = "FCT_Invoice_Header"
)
;

/* 
 * TABLE: FCT_Invoice_Line 
 */

CREATE TABLE FCT_Invoice_Line(
    InvoiceLineSK           INTEGER        NOT NULL,
    BottleVolumeML          INTEGER,
    StateBottleRetail       FLOAT64,
    SalesDollar             FLOAT64,
    VolumeSoldLitres        FLOAT64,
    VolumeSoldGallons       FLOAT64,
    Pack                    INTEGER,
    StateBottleCost         FLOAT64,
    CaseCost                FLOAT64,
    DI_JobID                STRING(255),
    DI_CreateDate           DATE,
    DI_WorkflowDirectory    STRING(255),
    VendorSK                INTEGER        NOT NULL,
    ProductSK               INTEGER        NOT NULL,
    InvoiceNumber           INTEGER        NOT NULL
)
OPTIONS( 
    friendly_name = "FCT_Invoice_Line"
)
;

