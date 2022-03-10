---------------------------------------------------------------------------------------------------------------------------------------------
--INSERT TO TABLE Client
---------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Client(clientId,cName,cOwnerName,cOwnerGender,cAddress,cPhone,cEmail)VALUES 
('CN001','Cogidoo','Austina','Male','8 Killdeer Hill','1746439208','bnellenqb@disqus.com'),
('CN002','JumpXS','Randee','Male','74778 Karstens Lane','5676801762','bwoodesonqc@ted.com'),
('CN003','Mymm','Kiley','Male','85095 Novick Park','5854068001','csevilleqd@cbc.ca'),
('CN004','Babbleblab','Harcourt','Male','364 Arizona Pass','4066130328','kkettelqe@blogspot.com'),
('CN005','Roodel','Veronike','Female','7 Moose Terrace','6274518794','acorcoranqf@ox.ac.uk'),
('CN006','Ozu','Julienne','Female','0 Northfield Pass','5239231405','fwallingtonqg@naver.com'),
('CN007','Brightdog','Dolli','Male','689 Londonderry Court','8592044606','mvooghtqh@techcrunch.com'),
('CN008','Babbleset','Candida','Male','20748 Bultman Avenue','1465022234','pcastelynqi@washington.edu'),
('CN009','Skinder','Cecil','Female','7465 Dwight Crossing','3004261321','csteeplesqj@homestead.com'),
('CN010','Vinder','Wilmette','Male','7043 Montana Park','4847856399','cmoretonqk@moonfruit.com')

---------------------------------------------------------------------------------------------------------------------------------------------
--INSERT TO TABLE Vendor
---------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Vendor(vendorId,vName,vOwnerName,vAddress,vPhone,vEmail)VALUES 
('VR001','Zoomzone','Berkie','14532 Oxford Way','1894796370','rdepkaq1@usda.gov'),
('VR002','Mita','Brig','01 Reindahl Place','8371415134','klarratq2@booking.com'),
('VR003','Mynte','Celka','4 Daystar Pass','6458340962','hlefeaverq3@yelp.com'),
('VR004','Skipstorm','Karla','8 Parkside Drive','2568001557','vmuskerq4@moonfruit.com'),
('VR005','Thoughtmix','Alejandra','606 Tennyson Road','6101360656','jsebrookq5@dropbox.com'),
('VR006','Rhyzio','Fin','6057 Sutteridge Alley','8387948314','dstorreq6@moonfruit.com'),
('VR007','Browsecat','Marni','46951 Morning Trail','4286563421','cmccrackanq7@moonfruit.com'),
('VR008','Fanoodle','Putnam','6306 Waubesa Crossing','5693819453','cwatmoughq8@cdbaby.com'),
('VR009','Twitterwire','Carolan','2 Dottie Junction','9363631639','wwetheraldq9@umich.edu'),
('VR010','Devcast','Cedric','6057 Sutteridge Alley','5284041517','kbarenskiqa@github.com')

---------------------------------------------------------------------------------------------------------------------------------------------
--INSERT TO TABLE Staff
---------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Staff(staffId,sfName,sfGender,sfAddress,sfPhone,sfSalary,sfEmail)VALUES 
('ST001','Flora','Male','92419 Dorton Junction','9743308485','3800000','fpostgatepm@dot.gov'),
('ST002','Larry','Male','8 Pearson Pass','4703143130','3800000','lsignorepn@dailymail.co.uk'),
('ST003','Tedie','Male','78010 Elka Center','4428168914','3800000','tteagerpo@printfriendly.com'),
('ST004','Rafaellle','Female','242 Cambridge Trail','3908825465','3800000','rsteadpp@aboutads.info'),
('ST005','Lydia','Male','4104 Farragut Court','9462595873','3800000','llowthpq@hp.com'),
('ST006','Pierre','Male','4 Nova Road','3259219524','3800000','pfishbypr@unicef.org'),
('ST007','Alvina','Male','77177 Anthes Crossing','4269634230','3800000','asoeirops@fc2.com'),
('ST008','Louisa','Female','8128 Birchwood Lane','9738527679','3800000','lmurgatroydpt@amazon.co.jp'),
('ST009','Cosimo','Male','7374 Myrtle Terrace','7115599614','3800000','cdecourcypu@comcast.net'),
('ST010','Leigha','Female','907 Elka Crossing','8514619686','3800000','lastillpv@mozilla.org')

---------------------------------------------------------------------------------------------------------------------------------------------
--INSERT TO TABLE Product Catagory
---------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ProductCategory(productCategoryId,pcName) VALUES 
('PC001','medic'),
('PC002','food'),
('PC003','drink'),
('PC004','otomotif'),
('PC005','sound'),
('PC006','house'),
('PC007','furniture'),
('PC008','tools'),
('PC009','motor'),
('PC010','small')

---------------------------------------------------------------------------------------------------------------------------------------------
--INSERT TO TABLE Branch
---------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Branch(branchId,bCityName,bAddress) VALUES 
('BR001','Bandung','Tamansari Street'),
('BR002','Jakarta Barat','KH Syahdan Street'),
('BR003','Jakarta Timur','Ramayana Street'),
('BR004','Jakarta Utara','Gajah Mada Street'),
('BR005','Jakarta Selatan','Prapanca Raya Street'),
('BR006','Jakarta Pusat','Tanah Abang Street'),
('BR007','Bogor','Siliwangi Street'),
('BR008','Depok','Somantri Street'),
('BR009','Tangerang','Ciledug Raya Street'),
('BR010','Bekasi','Bulevar Street')

---------------------------------------------------------------------------------------------------------------------------------------------
--INSERT TO TABLE Product
---------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Product(productid,pName,pSalesPrice,productCategoryId,pPurchasePrice)VALUES 
('PD001','speaker bluetooth','100000','PC001','90000'),
('PD002','indomie','200000','PC002','100000'),
('PD003','sofa','300000','PC003','200000'),
('PD004','table','40000','PC004','30000'),
('PD005','backpack','500000','PC005','400000'),
('PD006','book','600000','PC006','500000'),
('PD007','parfume','500000','PC007','300000'),
('PD008','xeon','400000','PC008','200000'),
('PD009','tv','20000','PC009','10000'),
('PD010','clock','200000','PC010','100000')

---------------------------------------------------------------------------------------------------------------------------------------------
--INSERT TO TABLE Sales Transaction
---------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO SalesTransaction(salesId,clientId,branchId,SalesDate,staffId) VALUES 
('SA001','CN001','BR001','3/15/2019','ST001'),
('SA002','CN002','BR002','12/5/2018','ST002'),
('SA003','CN003','BR003','10/18/2018','ST003'),
('SA004','CN004','BR004','8/19/2018','ST004'),
('SA005','CN005','BR005','5/24/2019','ST005'),
('SA006','CN006','BR006','3/12/2019','ST006'),
('SA007','CN007','BR007','1/19/2019','ST007'),
('SA008','CN008','BR008','10/12/2018','ST008'),
('SA009','CN009','BR009','3/21/2019','ST009'),
('SA010','CN010','BR007','10/29/2018','ST010'),
('SA011','CN005','BR001','8/3/2018','ST005'),
('SA012','CN006','BR005','3/12/2019','ST006'),
('SA013','CN007','BR002','3/12/2019','ST007'),
('SA014','CN008','BR004','11/26/2018','ST008'),
('SA015','CN009','BR005','10/12/2018','ST009')

---------------------------------------------------------------------------------------------------------------------------------------------
--INSERT TO TABLE Purchase Transaction
---------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO PurchaseTransaction(purchaseId,vendorId,branchId,purchaseDate,staffid) VALUES 
('PU001','VR001','BR001','3/15/2019','ST001'),
('PU002','VR002','BR002','12/5/2018','ST002'),
('PU003','VR003','BR003','10/18/2018','ST003'),
('PU004','VR004','BR004','8/19/2018','ST004'),
('PU005','VR005','BR005','5/24/2019','ST005'),
('PU006','VR006','BR006','3/12/2019','ST006'),
('PU007','VR007','BR007','1/19/2019','ST007'),
('PU008','VR008','BR008','10/12/2018','ST008'),
('PU009','VR009','BR009','3/21/2019','ST009'),
('PU010','VR010','BR007','10/29/2018','ST010'),
('PU011','VR005','BR001','8/3/2018','ST005'),
('PU012','VR006','BR005','3/12/2019','ST006'),
('PU013','VR007','BR002','3/12/2019','ST007'),
('PU014','VR008','BR004','11/26/2018','ST008'),
('PU015','VR009','BR005','10/12/2018','ST009')

---------------------------------------------------------------------------------------------------------------------------------------------
--INSERT TO TABLE Sales Detail
---------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO SalesDetail(salesid,productId,Qty) VALUES 
('SA001','PD001','1'),
('SA002','PD002','2'),
('SA003','PD003','3'),
('SA004','PD004','2'),
('SA005','PD005','3'),
('SA006','PD006','2'),
('SA007','PD007','1'),
('SA008','PD008','2'),
('SA009','PD009','3'),
('SA010','PD010','2'),
('SA011','PD005','1'),
('SA012','PD006','2'),
('SA013','PD007','3'),
('SA014','PD008','2'),
('SA015','PD009','3'),
('SA005','PD001','2'),
('SA006','PD002','1'),
('SA007','PD003','2'),
('SA008','PD004','3'),
('SA009','PD005','2'),
('SA010','PD006','1'),
('SA011','PD007','2'),
('SA012','PD008','3'),
('SA013','PD009','2'),
('SA014','PD010','1')

---------------------------------------------------------------------------------------------------------------------------------------------
--INSERT TO TABLE Purchase Detail
---------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO purchaseDetail( purchaseId,productId,Qty) VALUES 
('PU001','PD001','5'),
('PU002','PD002','6'),
('PU003','PD003','6'),
('PU004','PD004','5'),
('PU005','PD005','4'),
('PU006','PD006','5'),
('PU007','PD007','6'),
('PU008','PD008','5'),
('PU009','PD009','6'),
('PU010','PD010','5'),
('PU011','PD005','6'),
('PU012','PD006','7'),
('PU013','PD007','6'),
('PU014','PD008','5'),
('PU015','PD009','6'),
('PU005','PD001','5'),
('PU006','PD002','4'),
('PU007','PD003','3'),
('PU008','PD004','5'),
('PU009','PD005','6'),
('PU010','PD006','6'),
('PU011','PD007','4'),
('PU012','PD008','6'),
('PU013','PD009','7'),
('PU014','PD010','5')


