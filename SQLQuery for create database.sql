CREATE DATABASE TRAISE

CREATE TABLE Client(
clientId CHAR(5) PRIMARY KEY CHECK(clientId LIKE'CN[0-9][0-9][0-9]') NOT NULL,
cName VARCHAR(99) NOT NULL,
cOwnerName VARCHAR(99) NOT NULL,
cOwnerGender VARCHAR(99)CHECK(cOwnerGender IN('Male','Female')) NOT NULL,
cAddress VARCHAR(99) NOT NULL,
cPhone VARCHAR(99)CHECK(LEN(cPhone) between 5 and 15 ) NOT NULL
)


CREATE TABLE Vendor(
vendorId CHAR(5) PRIMARY KEY CHECK(vendorId LIKE'VR[0-9][0-9][0-9]') NOT NULL,
vName VARCHAR(99) NOT NULL,
vOwnerName VARCHAR(99) NOT NULL,
vAddress VARCHAR(99) NOT NULL,
vPhone VARCHAR(99)CHECK(LEN(vPhone) between 5 and 15 ) NOT NULL,
vEmail VARCHAR(99) NOT NULL
)

CREATE TABLE Staff(
staffId CHAR(5) PRIMARY KEY CHECK(staffId LIKE'ST[0-9][0-9][0-9]') NOT NULL,
sfName VARCHAR(99) NOT NULL,
sfGender VARCHAR(99)CHECK(sfGender IN('Male','Female')) NOT NULL,
sfAddress VARCHAR(99) NOT NULL,
sfPhone VARCHAR(99)CHECK(LEN(sfPhone) between 5 and 15 ) NOT NULL,
sfSalary INT NOT NULL,
sfEmail VARCHAR(99) NOT NULL
)

CREATE TABLE productCategory(
productCategoryId CHAR(5) PRIMARY KEY CHECK(productCategoryId LIKE'PC[0-9][0-9][0-9]') NOT NULL,
pcName VARCHAR(99) NOT NULL
)


CREATE TABLE Product(
productId CHAR(5) PRIMARY KEY CHECK(productId LIKE'PD[0-9][0-9][0-9]') NOT NULL,
productCategoryId CHAR(5) CHECK(productCategoryId LIKE'PC[0-9][0-9][0-9]') NOT NULL,
pName VARCHAR(99) NOT NULL,
pSalesPrice INT NOT NULL,
pPurchasePrice INT NOT NULL,
FOREIGN KEY (productCategoryId) REFERENCES productCategory(productCategoryId)
)

CREATE TABLE Branch(
branchId CHAR(5) PRIMARY KEY CHECK(branchId LIKE'BR[0-9][0-9][0-9]') NOT NULL,
bCityName VARCHAR(99) NOT NULL,
bAddress VARCHAR(99) NOT NULL
)

CREATE TABLE SalesTransaction(
salesId CHAR(5) PRIMARY KEY CHECK(salesId LIKE'SA[0-9][0-9][0-9]') NOT NULL,
staffId CHAR(5) FOREIGN KEY (staffId) REFERENCES Staff(staffId) CHECK(staffId LIKE'ST[0-9][0-9][0-9]') NOT NULL,
branchId CHAR(5) FOREIGN KEY (branchId) REFERENCES Branch(branchId) CHECK(branchId LIKE'BR[0-9][0-9][0-9]') NOT NULL,
clientId CHAR(5) FOREIGN KEY (clientId) REFERENCES Client(clientId) CHECK(clientId LIKE'CN[0-9][0-9][0-9]') NOT NULL,
SalesDate DATE CHECK (salesdate > '2017-12-31') NOT NULL,
)

CREATE TABLE PurchaseTransaction(
purchaseId CHAR(5) PRIMARY KEY CHECK(purchaseId LIKE'PU[0-9][0-9][0-9]') NOT NULL,
staffId CHAR(5) FOREIGN KEY (staffId) REFERENCES Staff(staffId) CHECK(staffId LIKE'ST[0-9][0-9][0-9]') NOT NULL,
branchId CHAR(5) FOREIGN KEY (branchId) REFERENCES Branch(branchId) CHECK(branchId LIKE'BR[0-9][0-9][0-9]') NOT NULL,
vendorId CHAR(5) FOREIGN KEY (vendorId) REFERENCES Vendor(vendorId)  CHECK(vendorId LIKE'VR[0-9][0-9][0-9]') NOT NULL,
PurchaseDate DATE CHECK ( purchaseDate > '2017-12-31') NOT NULL,
)

CREATE TABLE PurchaseDetail(
purchaseId CHAR(5) FOREIGN KEY (purchaseId) REFERENCES PurchaseTransaction(purchaseId) CHECK(purchaseId LIKE'PU[0-9][0-9][0-9]') NOT NULL,
productId CHAR(5) FOREIGN KEY (productId) REFERENCES product(productId) CHECK(productId LIKE'PD[0-9][0-9][0-9]') NOT NULL,
qty INT NOT NULL
)

CREATE TABLE SalesDetail(
salesId CHAR(5) FOREIGN KEY (salesId) REFERENCES SalesTransaction(salesId) CHECK(salesId LIKE'SA[0-9][0-9][0-9]') NOT NULL,
productId CHAR(5) FOREIGN KEY (productId) REFERENCES product(productId) CHECK(productId LIKE'PD[0-9][0-9][0-9]') NOT NULL,
qty INT NOT NULL
)
