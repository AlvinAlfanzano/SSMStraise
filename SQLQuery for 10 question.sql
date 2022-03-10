--1
select
	[StaffId] = s.staffId,
	[StaffName] = s.sfName,
	[Total Item(s)] = sd.qty
from
	staff s JOIN SalesTransaction st
	ON s.staffId = st.salesId JOIN
	SalesDetail sd ON st.salesId = sd.salesId
where
	datename (month, st.SalesDate) = 'december' and 
	S.sfName = left(s.sfName ,charindex(s.sfName,' '))

--2
select
	[productId] = p.productId,
	[productName] = p.pName,
	[Sales Profit] = 'Rp. ' + CAST((sum(p.pSalesPrice) - p.pPurchasePrice)*pd.qty AS VARCHAR)
from
	product p JOIN PurchaseDetail pd
	ON p.productId = pd.productId
group by
	p.productId, p.pName, p.pPurchasePrice, pd.qty

--3
select
	[ClientName] = c.cName,
	[Client Owner Name] = 'Mr.' + c.cOwnerName,
	[Sales Date] = convert(VARCHAR,st.SalesDate,106),
	[Item Variance] = count(sd.salesId),
	[Item Purchase] = sum(sd.qty),
	[day] = datepart(d, st.SalesDate)
from
	Client c JOIN salesTransaction st 
	ON c.clientId = st.clientId JOIN
	salesDetail sd on st.salesId = sd.salesId
where
	datepart(d, st.SalesDate) % 2 = 0 and
	c.cOwnerGender LIKE 'Male'
group by
	c.cName, c.cOwnerName, st.SalesDate

union

select
	[ClientName] = c.cName,
	[Client Owner Name] = 'Mrs.' + c.cOwnerName,
	[Sales Date] = convert(VARCHAR,st.SalesDate,106),
	[Item Variance] = count(sd.salesId),
	[Item Purchase] = sum(sd.qty),
	[day] = datepart(d, st.SalesDate)
from
	Client c JOIN salesTransaction st 
	ON c.clientId = st.clientId JOIN
	salesDetail sd on st.salesId = sd.salesId
where
	datepart(d, st.SalesDate) % 2 = 0 and
	c.cOwnerGender LIKE 'Female'
group by
	c.cName, c.cOwnerName, st.SalesDate

--4
select
	[vendorName] = v.vName,
	[BranchCity] = b.bCityName,
	[Total Transaction] = count(pt.purchaseId),
	[Item(s) Purchased] = cast(sum(pd.qty) AS VARCHAR) + ' item(s)' 
from	
	vendor v JOIN PurchaseTransaction pt ON
	v.vendorId = pt.vendorId JOIN Branch b 
	ON pt.branchId = b.branchId JOIN PurchaseDetail pd ON
	pt.purchaseId = pd.purchaseId
where
	b.bCityName LIKE 'Bandung'
group by
	v.vName, b.bCityName
having
	count(pt.purchaseId) > 1
ORDER BY
	count(Pt.purchaseId) DESC

--5
select
	[StaffId] = s.staffId,
	[StaffName] = s.sfName,
	[StaffGender] = left(s.sfGender,1),
	[StaffSalary] = 'Rp. ' + cast(s.sfSalary AS VARCHAR)
from
	staff s,
	(select avg(sfSalary)[staffSalary] from Staff) avgsalary
where
	S.sfName = left(s.sfName ,charindex(s.sfName,' ')) and
	s.sfSalary > avgsalary.staffSalary

--6
select
	[Product ID] = replace(p.productId,'PD','Product '),
	[ProductName] = p.pName,
	[ProductCategoryName] = pc.pcName,
	[Sales Date] = convert(VARCHAR,st.SalesDate,107) 
from
	SalesTransaction st JOIN SalesDetail sd 
	on st.salesId = sd.salesId JOIN Product p  on 
	sd.productId = p.productId
	JOIN productCategory pc on
	p.productCategoryId = pc.productCategoryId,
	(select avg(pSalesPrice)[SalesPrice] from Product) avgproduct
where
	datepart(d, st.SalesDate) < 28 and
	p.pSalesPrice > avgproduct.SalesPrice

--7
select
	[vendorName] = v.vName,
	[First Vendor Owner Name] = SUBSTRING(v.vOwnerName, 0, CHARINDEX(' ', v.vOwnerName, 0)),
	[Vendor Email] = v.vEmail,
	[VendorPhoneNumber] = v.vPhone,
	[VendorAddress] = v.vAddress,
	[Staff Name] = SUBSTRING(s.sfName, 0, CHARINDEX(' ', s.sfName, 0)),
	[Item(s) Purchased] = CAST(pd.qty AS VARCHAR) + ' item(s)' 

from
	Vendor v JOIN PurchaseTransaction pt
	on v.vendorId = pt.vendorId JOIN staff s
	on pt.staffId = s.staffId JOIN PurchaseDetail pd
	on pt.purchaseId = pd.purchaseId,
	(select avg(qty)[qtyp] from PurchaseDetail) avgqty
where
	pd.qty > avgqty.qtyp and pd.qty > 10

--8
select
	[ProductName] = p.pName,
	[Product Category ID] = replace(pc.productCategoryId,'PC','Category '),
	[ProductCategoryName] = pc.pcName,
	[Gross Sales] = 'Rp. ' + CAST(p.pSalesPrice*sd.qty AS VARCHAR),
	[Purchase Cost] = 'Rp. ' + CAST(p.pPurchasePrice*pd.qty AS VARCHAR)
from
	Product p JOIN productCategory pc 
	on p.productCategoryId = pc.productCategoryId JOIN
	SalesDetail sd on sd.productId = p.productId JOIN
	PurchaseDetail pd on p.productId = pd.productId,
	(select avg(pSalesPrice)[Salesp] from Product) avgp,
	(select avg(pPurchasePrice)[Purchasep] from Product) avgpu
where
	p.pSalesPrice > avgp.Salesp and
	p.pPurchasePrice > avgpu.Purchasep

--9
create view 
ViewClientRecord
as
select
	[ClientName] = c.cName,
	[Client Phone Number] = replace(c.cPhone,'+62','0'),
	[Maximum Quantity] = max(sd.qty),
	[Minimum Quantity] = min(sd.qty)
from
	client c JOIN SalesTransaction st
	on c.clientId = st.clientId JOIN SalesDetail sd
	on st.salesId = sd.salesId
group by
	C.cName, C.cPhone
having
	min(sd.qty) > 1 and max(sd.qty) != min(sd.qty)
order by
	c.cName

--10
create view
ViewVendorRecord
as
select
	[VendorId] = v.vendorId,
	[VendorName] = v.vName,
	[Total Transaction] = count(pt.purchaseId),
	[Total Purchase] = p.pPurchasePrice*pd.qty
from
	vendor v JOIN PurchaseTransaction pt on
	v.vendorId = pt.vendorId JOIN PurchaseDetail pd on
	pd.purchaseId = pt.purchaseId JOIN Product p on
	pd.productId = p.productId
where
	datename (day, pt.PurchaseDate) != 'sunday'
group by
		v.vendorId,v.vName,p.pPurchasePrice,pd.qty
having
	count(pt.purchaseId) > 1