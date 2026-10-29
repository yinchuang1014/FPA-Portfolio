
select*
from dbo.Housing

--------------------------------------------------------------------------------------------------------------------------------------------

-- Standardize Date Format

select SaleDate, convert(date,SaleDate)
from dbo.Housing

update dbo.Housing
set SaleDate=convert(date,SaleDate)

-- this is not working

-- try Create new column for SaleDateConvert, then fill information

alter table dbo.Housing
add SaleDateConvert date;

update dbo.Housing
set SaleDateConvert=convert(date,SaleDate)

-- Delete unused column later


--------------------------------------------------------------------------------------------------------------------------------------------

-- Populate Property Address data (fill out where is null)

----seach where property address is null

select *
from dbo.Housing
where PropertyAddress is null

----see which rows have same ParcelID but different Unique ID ( like compare function), and fill out information

select a.PropertyAddress,b.PropertyAddress,a.ParcelID,b.ParcelID,isnull(a.PropertyAddress,b.PropertyAddress)
from dbo.Housing a
join dbo.Housing b
     on a.ParcelID=b.ParcelID
     and a.UniqueID<>b.UniqueID
where a.PropertyAddress is null

----update table with what have done
update a
set PropertyAddress=isnull(a.PropertyAddress,b.PropertyAddress)
from dbo.Housing a
join dbo.Housing b
     on a.ParcelID=b.ParcelID
     and a.UniqueID<>b.UniqueID
where a.PropertyAddress is null

----finally double check nothing left
select *
from dbo.Housing
where PropertyAddress is null


--------------------------------------------------------------------------------------------------------------------------------------------
-- Breaking out Address into Individual Columns (Address, City, State)

---- REVIEW - Break out Property address and city 
select 
       substring(PropertyAddress,1,charindex(',',PropertyAddress)-1) as PropertyAddress,
       substring(PropertyAddress,charindex(',',PropertyAddress)+1,len(PropertyAddress)) as PropertyCity
from dbo.Housing

----update table PropertyAddress (run alter and update separate)
alter table dbo.Housing
add PropertySplitAddress nvarchar(255)

update dbo.Housing
set PropertySplitAddress=substring(PropertyAddress,1,charindex(',',PropertyAddress)-1)

----update table PropertyCity (run alter and update separate)
alter table dbo.Housing
add PropertyCity nvarchar(255)

update dbo.Housing
set PropertyCity=substring(PropertyAddress,charindex(',',PropertyAddress)+1,len(PropertyAddress))

---------there is easier way to do break out address
select OwnerAddress
from dbo.Housing

---- REVIEW - break out owner address

select
parsename(REPLACE(OwnerAddress,',','.'),3) as OwnerSplitAdrress,
parsename(REPLACE(OwnerAddress,',','.'),2) as OwnerSplitCity,
parsename(REPLACE(OwnerAddress,',','.'),1) as OwnerSplitState
from dbo.Housing


---- Create column for OwnerSplitAdrress,OwnerSplitCity,OwnerSplitState

alter table dbo.Housing
add OwnerSplitAdrress nvarchar(500),
    OwnerSplitCity nvarchar(500),
    OwnerSplitState nvarchar(500)


---- Fill out information in new columns

update dbo.Housing
set OwnerSplitAdrress=parsename(REPLACE(OwnerAddress,',','.'),3),
    OwnerSplitCity=parsename(REPLACE(OwnerAddress,',','.'),2),
    OwnerSplitState=parsename(REPLACE(OwnerAddress,',','.'),1)

---- Final check

select*
from dbo.Housing

--------------------------------------------------------------------------------------------------------------------------------------------
-- Change Y and N to Yes and No in "Sold as Vacant" field

---- Search Y,N,Yes,No

select 
Distinct(SoldAsVacant),count(SoldAsVacant)
from dbo.Housing
group by SoldAsVacant
order by 2
----(order by 2 means second column which is the count, order by 1 means first column which is SoladAsVacant)


---- REVIEW the change

select SoldAsVacant,
       case 
           when SoldAsVacant='Y' then 'Yes'
           when SoldAsVacant='N' then 'No'
           Else SoldAsVacant
       end
from dbo.Housing

---- Update table

update dbo.Housing
set SoldAsVacant=
       case 
           when SoldAsVacant='Y' then 'Yes'
           when SoldAsVacant='N' then 'No'
           Else SoldAsVacant
       end


--------------------------------------------------------------------------------------------------------------------------------------------
-- Remove Duplicates for ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference

---- Check duplicate on these,and assign number for duplicates in colunm row_num

   select*,
      row_number() over(
                        partition by ParcelID,
                                     PropertyAddress,
                                     SalePrice,
                                     SaleDate,
                                     LegalReference
                        order by UniqueID
                        ) row_num
  from dbo.Housing

---- Create row_numCTE (snyc copy of table), so we can use WHERE to look at duplicate rows

with row_numCTE as(
   select*,
      row_number() over(
                        partition by ParcelID,
                                     PropertyAddress,
                                     SalePrice,
                                     SaleDate,
                                     LegalReference
                        order by UniqueID
                        ) row_num
   from dbo.Housing)
--- select* after veviewing the all row_num>1, we can delete these row by change clause from select to delete
delete
from row_numCTE
where row_num>1

---- after deleted, change delete back to select* to double check result

--------------------------------------------------------------------------------------------------------------------------------------------
-- Delete Unused Columns

alter table dbo.Housing
drop column PropertyAddress,SaleDate,LegalReference,OwnerAddress


-------------------------------------------------------------------------------------------------------------------------------------------
------------Revenue analysis, Trends analysis, Data quality, Business questions -----------------------------------------------------------
select*
from PracticeProject.dbo.Housing

-- 1. Tope 10 highest sale price
select top 10 SalePrice,OwnerName,UniqueID
from PracticeProject.dbo.Housing
order by 1 desc

-- 2. Average sale price
select AVG(SalePrice) average_sale_price
from PracticeProject.dbo.Housing

-- 3. Total sales Amount
select SUM(SalePrice) total_sales_amount
from PracticeProject.dbo.Housing

-- 4. Transactions by year
select Year(SaleDateConvert) as year,count(*) as transaction_by_year
from PracticeProject.dbo.Housing
group by Year(SaleDateConvert)
order by 2 desc

-- 5. Transactions by city (and I added search top 10 city)
select top 10 PropertyCity,count(PropertyCity) transactions_by_city
from PracticeProject.dbo.Housing
group by PropertyCity 
order by 2 desc

-- 6. Count missing OwnerName
select count (*) as missing_OwnerName
from PracticeProject.dbo.Housing
where OwnerName is null

-- 7. Count missing Acreage
select count(*) 
from PracticeProject.dbo.Housing
where Acreage is null


-- 8. Find Duplicate ParcelID
select ParcelID,COUNT(ParcelID)
from PracticeProject.dbo.Housing
group by ParcelID
having count(ParcelID)>1
order by 2 desc


-- 9. Top 10 citiese by transaction count

select top 10 PropertyCity,count(PropertyCity) transactionnum
from PracticeProject.dbo.Housing
group by PropertyCity
order by 2 desc


-- 10. Top 10 cities by average sale price round to nearest dollar 

select top 10 PropertyCity, round(AVG(SalePrice),0) AvgSalePrice
From PracticeProject.dbo.Housing
group by PropertyCity
order by 2 desc
------- round to nearest dollar, but without ","

select top 10 PropertyCity, format(AVG(SalePrice),'N0') AvgSalePrice
From PracticeProject.dbo.Housing
group by PropertyCity
order by AVG(SalePrice) desc
------- round to nearest dollar, and split thousand