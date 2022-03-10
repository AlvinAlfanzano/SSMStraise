-- Query Create table

CREATE TABLE Staff
(
	StaffID CHAR(5) PRIMARY KEY
		CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(50)NOT NULL,
	StaffGender VARCHAR(10) 
		CHECK(StaffGender = 'Male' or StaffGender = 'Female'),
	StaffEmail VARCHAR(50)NOT NULL,
	StaffPhone INT
		CHECK(StaffPhone <5 OR StaffPhone >15),
	StaffAddress VARCHAR(50)NOT NULL,
	StaffSalary VARCHAR(50)NOT NULL
)

CREATE TABLE ProductCatagory
(
	ProductCatagoryID CHAR(5) PRIMARY KEY
		CHECK(ProductCatagoryID LIKE ('PC[0-9][0-9][0-9]')),
	ProductCatagoryName VARCHAR(50) NOT NULL
)

CREATE TABLE Product
(
	Product_ID CHAR(5) PRIMARY KEY
		CHECK(Product_ID LIKE ('PD[0-9][0-9][0-9]')),
	ProductCatagoryID CHAR(5) FOREIGN KEY
		REFERENCES ProductCatagory
		ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	ProductName VARCHAR(50) NOT NULL,
	PurchasePrice INT NOT NULL,
	SalesPrice INT NOT NULL
)

CREATE TABLE Vendor
(
	VendorID CHAR(5) PRIMARY KEY
		CHECK(VendorID LIKE('VR[0-9][0-9][0-9]')),
	VendorName VARCHAR(50) NOT NULL,
	VendorOwnerName VARCHAR(50) NOT NULL,
	VendorPhone INT
		CHECK(VendorPhone <5 OR VendorPhone >15),
	VendorAddress VARCHAR(50) NOT NULL,
	VendorEmail VARCHAR(50) NOT NULL
)

CREATE TABLE Client
(
	ClientID CHAR(5) PRIMARY KEY
		CHECK(ClientID LIKE 'CN[0-9][0-9][0-9]'),
	ClientName VARCHAR(50) NOT NULL,
	ClientPhone INT
		CHECK(ClientPhone <5 OR ClientPhone >15),
	ClientAddress VARCHAR(50) NOT NULL,
	ClientOwnerName VARCHAR(50) NOT NULL,
	ClientOwnerGender VARCHAR(50)
		CHECK(ClientOwnerGender = 'Male' OR ClientOwnerGender = 'Female'),
	ClientEmail VARCHAR(50) NOT NULL
)

CREATE TABLE Branch
(
	Branch_ID CHAR(5) PRIMARY KEY
		CHECK(BranchID LIKE 'BR[0-9][0-9][0-9]'),
	BranchName VARCHAR(50) NOT NULL,
	BranchAddress VARCHAR(50)
		CHECK(BranchAddress LIKE '% Street')
)

CREATE TABLE SalesTransaction
(
	SalesTransactionID CHAR(5) PRIMARY KEY
		CHECK(SalesTransactionID LIKE 'SA[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY
		REFERENCES Staff
		ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	ClientID CHAR(5) FOREIGN KEY
		REFERENCES Client
		ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	BranchID CHAR(5) FOREIGN KEY
		REFERENCES Branch
		ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Sales_Transaction_Date DATE NOT NULL
		CHECK (DATEPART(YEAR, Sales_Transaction_Date) >= '2018')
)
CREATE TABLE PurchaseTransaction
(
	PurchaseTransactionID CHAR(5) PRIMARY KEY
		CHECK(PurchaseTransactionID LIKE 'PU[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY 
		REFERENCES Staff
		ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	VendorID CHAR(5) FOREIGN KEY
		REFERENCES Vendor
		ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	BranchID CHAR(5) FOREIGN KEY
		REFERENCES Branch
		ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Purchase_Transaction_Date DATE NOT NULL
		CHECK (DATEPART(YEAR, Purchase_Transaction_Date) >= '2018')
)

CREATE TABLE Purchase_Transaction_Detail
(
	Purchase_Transaction_Detail_ID CHAR(5) PRIMARY KEY
		CHECK (Purchase_Transaction_Detail_ID LIKE 'TP[0-9][0-9][0-9]'),
	PurchaseTransactionID CHAR(5) FOREIGN KEY 
		REFERENCES PurchaseTransaction
		ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Product_ID CHAR(5) FOREIGN KEY
		REFERENCES Product
		ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Quantity INT NOT NULL

)

CREATE TABLE Sales_Transaction_Detail
(
	Sales_Transaction_Detail_ID CHAR(5) PRIMARY KEY
		CHECK (Sales_Transaction_Detail_ID LIKE 'TS[0-9][0-9][0-9]'),
	SalesTransactionID CHAR(5) FOREIGN KEY 
		REFERENCES SalesTransaction
		ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Product_ID CHAR(5) FOREIGN KEY
		REFERENCES Product
		ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Quantity INT NOT NULL
)

DROP TABLE Product
DROP TABLE SalesTransaction
DROP TABLE PurchaseTransaction
DROP TABLE Sales_Transaction_Detail
DROP TABLE Purchase_Transaction_Detail