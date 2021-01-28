use Northwind
--Select
Select ContactName Adi, CompanyName Sirketadi, City Sehir from Customers

select * from Customers where City='Berlin'

select * from Products where CategoryID=1 or CategoryID=3

select * from Products where CategoryID=1 and UnitPrice<=10

select * from Products where CategoryID=1 order by UnitPrice desc ---asc default artan sıralama ---desc düşen azalan sıralama

select COUNT(*) Adet from Products where CategoryID=2

select categoryID, COUNT(*) from Products group by CategoryID -- hangi kategoriIDlerde kaç ürün var

select CategoryID Count(*) from Products where UnitPrice>20 -- fiyatı 20 den fazla olan ürünleri önce gruplandır, sonra
group by CategoryID having COUNT(*)<10 --- bu gruplarda fiyatı 10 dan küçük olanları grupla

select Products.ProductID, Products.ProductName, Products.UnitPrice, Categories.CategoryName, Categories.CategoryID---- sadece bu tabloları seç
from Products inner join Categories ----hem products hem categories in bir araya getirilmiş hali
on Products.CategoryID=Categories.CategoryID --- product tablosundaki kategoriID ile Categoriesdeki Kategori ID si eşit olanları
where Products.UnitPrice>10-- fiyatı 10 dan büyük olan ürünleri kategori ismiyle beraber getir

Select * from Products p left join [Order Details] od--- inner join sadece eşleşen kayıtları getirir.---left join solda olup sağda olmayanları getirir.
on p.ProductID=od.ProductID

Select * from Customers c left join Orders o---inner join de 830 kayıt geliyor tam olarak eşleşen.---left joinde solda yani customerde olup orders ta olmayan kayıtları getir832.
on c.CustomerID=o.CustomerID
where o.CustomerID is null--- orders ta kaydı olmayan left joinde (null) gelen müşteriler. Yani hiç sipariş vermeyenler

---right join de sağda olup solda olmayan kayıtlarıda dahil eder sorguya

Select * from Products p inner join [Order Details] od
on p.ProductID=od.ProductID
inner join Orders o
on o.OrderID=od.OrderID

--Uygulama
--Her bir üründen toplamda ne kadar para kazandığımızı bulunuz.
--İpucu : Group by kullanılacak
--İpucu : Products, Orders, Order Details tabloları join edilecek.
--İpucu : Sum kullanılacak.
--Sonuç aşağıdaki formatta olmalıdır.
--Ürün Adı, Kazanılan Toplam Miktar
Select ProductName 'Ürün Adı', Sum(od.Quantity*od.UnitPrice) 'Kazanılan Toplam Miktar' 
from [Order Details] od 
inner join Products p on p.ProductID=od.ProductID 
inner join Orders o on o.OrderID=od.OrderID
group by p.ProductName
order by ProductName

select Sum(Quantity*UnitPrice) from [Order Details] where ProductID=38--Test


