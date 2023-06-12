--Quản lý giáo vụ--
CREATE DATABASE QLGV
GO
USE QLGV 
GO 
--------------------------------------
Create table HOCVIEN (
	MAHV char (5),
	HO varchar(40),
	TEN varchar(10),
	NGSINH smalldatetime,
	GIOITINH varchar(3),
	NOISINH varchar(40),
	MALOP char(3),
	constraint pk_mahv PRIMARY KEY (MAHV)
)
---------------------------------------
Create table LOP (
	MALOP char (3),
	TENLOP char (40),
	TRGLOP  char(5),
	SISO tinyint,
	MAGVCN char(4),
	constraint pk_malop PRIMARY KEY (MALOP)
)
---------------------------------------
Create table KHOA (
	MAKHOA char(4),
	TENKHOA varchar(40),
	NGTLAP smalldatetime ,
	TRGKHOA char(4),
	constraint pk_makhoa PRIMARY KEY (MAKHOA)
)
----------------------------------------
Create table MONHOC (
	MAMH char (10),
	TENMH varchar(40),
	TCLT tinyint,
	TCTH tinyint,
	MAKHOA char (4),
	constraint pk_mamh PRIMARY KEY (MAMH)
)
----------------------------------------
Create table DIEUKIEN (
	MAMH char(10),
	MAMH_TRUOC char(10),
	constraint pk_dk PRIMARY KEY (MAMH, MAMH_TRUOC)
)
----------------------------------------
Create table GIAOVIEN (
	MAGV char(4),
	HOTEN varchar(40),
	HOCVI varchar(10),
	HOCHAM varchar(10),
	GIOITINH varchar(3),
	NGSINH smalldatetime,
	NGVL smalldatetime,
	HESO numeric(4,2),
	MLUONG money,
	MAKHOA char(4),
	constraint pk_magv PRIMARY KEY (MAGV)
)
-----------------------------------------
Create table GIANGDAY (
	MALOP char(3),
	MAMH char(10),
	MAGV char(4),
	HOCKY tinyint,
	NAM smallint,
	TUNGAY smalldatetime,
	DENNGAY smalldatetime,
	constraint pk_giangday PRIMARY KEY (MALOP,MAMH)
)
------------------------------------------
Create table KETQUATHI (
	MAHV char(5),
	MAMH char(10),
	LANTHI tinyint,
	NGAYTHI smalldatetime,
	DIEM numeric(4,2),
	KETQUA varchar(10),
	constraint pk_ketquathi PRIMARY KEY (MAHV,MAMH,LANTHI)

)
-------------------------------------------
--khoa
alter table khoa add constraint fk_khoa FOREIGN KEY (TRGKHOA) REFERENCES GIAOVIEN(MAGV)
--monhoc
alter table monhoc add constraint fk_monhoc FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)
--dieukien
alter table DIEUKIEN add constraint fk_dieukien1 FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
alter table DIEUKIEN add constraint fk_dieukien2 FOREIGN KEY (MAMH_TRUOC) REFERENCES MONHOC(MAMH)
--giaovien
alter table GIAOVIEN add constraint fk_giaovien FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)
--lop
alter table LOP add constraint fk_lop1 FOREIGN KEY (TRGLOP) REFERENCES HOCVIEN(MAHV)
alter table LOP add constraint fk_lop2 FOREIGN KEY (MAGVCN) REFERENCES GIAOVIEN(MAGV)
--hocvien
alter table HOCVIEN add constraint fk_hocvien FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)
--giangday
alter table GIANGDAY add constraint fk_giangday1 FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)
alter table GIANGDAY add constraint fk_giangday2 FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV)
alter table GIANGDAY add constraint fk_giangday3 FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
--ketquathi
alter table KETQUATHI add constraint fk_ketquathi1 FOREIGN KEY (MAHV) REFERENCES HOCVIEN(MAHV)
alter table KETQUATHI add constraint fk_ketquathi2 FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)

--**************************************************************************************************--
ALTER TABLE KHOA NOCHECK CONSTRAINT ALL
ALTER TABLE LOP NOCHECK CONSTRAINT ALL
ALTER TABLE MONHOC NOCHECK CONSTRAINT ALL
ALTER TABLE GIANGDAY NOCHECK CONSTRAINT ALL
ALTER TABLE GIAOVIEN NOCHECK CONSTRAINT ALL
ALTER TABLE DIEUKIEN NOCHECK CONSTRAINT ALL
ALTER TABLE KETQUATHI NOCHECK CONSTRAINT ALL
ALTER TABLE HOCVIEN NOCHECK CONSTRAINT ALL
----------------------------------------------
delete from KHOA
delete from LOP
delete from MONHOC
delete from GIANGDAY
delete from GIAOVIEN
delete from DIEUKIEN
delete from KETQUATHI
delete from HOCVIEN
-----------------------------------------------

set dateformat dmy
--------------NHAP DU LIEU--------------
--khoa 
INSERT INTO KHOA VALUES('KHMT','khoa hoc may tinh','7/6/2005','GV01')
INSERT INTO KHOA VALUES('HTTT','he thong thong tin','7/6/2005','GV02')
INSERT INTO KHOA VALUES('CNPM','cong nghe phan mem','7/6/2005','GV04')
INSERT INTO KHOA VALUES('MTT','mang va truyen thong','20/10/2005','GV03')
INSERT INTO KHOA VALUES('KTMT','ky thuat may tinh','20/12/2005','null')
--lop
INSERT INTO LOP VALUES('K11','Lop 1 khoa 1','K1108',11,'GV07')
INSERT INTO LOP VALUES('K12','Lop 2 khoa 1','K1205',12,'GV09')
INSERT INTO LOP VALUES('K13','Lop 3 khoa 1','K1305',12,'GV14')
--monhoc
INSERT INTO MONHOC VALUES('THDC','Tin hoc dai cuong',4,1,'KHMT')
INSERT INTO MONHOC VALUES('CTRR','Cau truc roi rac',5,0,'KHMT')
INSERT INTO MONHOC VALUES('CSDL','Co so du lieu',3,1,'HTTT')
INSERT INTO MONHOC VALUES('CTDLGT','Cau truc du lieu va giai thuat',3,1,'KHMT')
INSERT INTO MONHOC VALUES('PTTKTT','Phan tich thiet ke thuat toan',3,0,'KHMT')
INSERT INTO MONHOC VALUES('DHMT','Do hoa may tinh',3,1,'KHMT')
INSERT INTO MONHOC VALUES('KTMT','Kien truc may tinh',3,0,'KTMT')
INSERT INTO MONHOC VALUES('TKCSDL','Thiet ke co so du lieu',3,1,'HTTT')
INSERT INTO MONHOC VALUES('PTTKHTTT','Phan tich thiet ke he thong thong tin',4,1,'HTTT')
INSERT INTO MONHOC VALUES('HDH','He dieu hanh',4,0,'KTMT')
INSERT INTO MONHOC VALUES('NMCNPM','Nhap mon cong nghe phan mem',3,0,'CNPM')
INSERT INTO MONHOC VALUES('LTCFW','Lap trinh C for win',3,1,'CNPM')
INSERT INTO MONHOC VALUES('LTHDT','Lap trinh huong doi tuong',3,1,'CNPM')
--giangday
INSERT INTO GIANGDAY VALUES('K11','THDC','GV07',1,2006,'01/02/2006','05/12/2006')
INSERT INTO GIANGDAY VALUES('K12','THDC','GV06',1,2006,'01/02/2006','05/12/2006')
INSERT INTO GIANGDAY VALUES('K13','THDC','GV15',1,2006,'01/02/2006','05/12/2006')
INSERT INTO GIANGDAY VALUES('K11','CTRR','GV02',1,2006,'01/09/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES('K12','CTRR','GV02',1,2006,'01/09/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES('K13','CTRR','GV08',1,2006,'01/09/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES('K11','CSDL','GV05',2,2006,'06/01/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES('K12','CSDL','GV09',2,2006,'06/01/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES('K13','CTDLGT','GV15',2,2006,'06/01/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES('K13','CSDL','GV05',3,2006,'08/01/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K13','DHMT','GV07',3,2006,'08/01/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K11','CTDLGT','GV15',3,2006,'08/01/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K12','CTDLGT','GV15',3,2006,'08/01/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K11','HDH','GV04',1,2007,'01/02/2007','18/2/2007')
INSERT INTO GIANGDAY VALUES('K12','HDH','GV04',1,2007,'01/02/2007','20/3/2007')
INSERT INTO GIANGDAY VALUES('K11','DHMT','GV07',1,2007,'18/2/2007','20/3/2007')
--giaovien
INSERT INTO GIAOVIEN VALUES('GV01','Ho Thanh Son','PTS','GS','Nam','05/02/1950','01/11/2004',5,2250000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV02','Tran Tam Thanh','TS','PGS','Nam','17/12/1965','20/4/2004',4.5,2025000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV03','Do Nghiem Phung','TS','GS','Nu','08/01/1950','23/9/2004',4,1800000,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV04','Tran Nam Son','TS','PGS','Nam','22/2/1961','01/12/2005',4.5,2025000,'KTMT')
INSERT INTO GIAOVIEN VALUES('GV05','Mai Thanh Danh','ThS','GV','Nam','03/12/1958','01/12/2005',3,1350000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV06','Tran Doan Hung','TS','GV','Nam','03/11/1953','01/12/2005',4.5,2025000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV07','Nguyen Minh Tien','ThS','GV','Nam','23/11/1971','03/01/2005',4,1800000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV08','Le Thi Tran','KS','Null','Nu','26/3/1974','03/01/2005',1.69,760500,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV09','Nguyen To Lan','ThS','GV','Nu','31/12/1966','03/01/2005',4,1800000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV10','Le Tran Anh Loan','KS','Null','Nu','17/7/1972','03/01/2005',1.86,837000,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV11','Ho Thanh Tung','CN','GV','Nam','01/12/1980','15/5/2005',2.67,1201500,'MTT')
INSERT INTO GIAOVIEN VALUES('GV12','Tran Van Anh','CN','Null','Nu','29/3/1981','15/5/2005',1.69,760500,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV13','Nguyen Linh Dan','CN','Null','Nu','23/5/1980','15/5/2005',1.69,760500,'KTMT')
INSERT INTO GIAOVIEN VALUES('GV14','Truong Minh Chau','ThS','GV','Nu','30/11/1976','15/5/2005',3,1350000,'MTT')
INSERT INTO GIAOVIEN VALUES('GV15','Le Ha Thanh','ThS','GV','Nam','05/04/1978','15/5/2005',3,1350000,'KHMT')
--dieukien
INSERT INTO DIEUKIEN VALUES('CSDL','CTRR')
INSERT INTO DIEUKIEN VALUES('CSDL','CTDLGT')
INSERT INTO DIEUKIEN VALUES('CTDLGT','THDC')
INSERT INTO DIEUKIEN VALUES('PTTKTT','THDC')
INSERT INTO DIEUKIEN VALUES('PTTKTT','CTDLGT')
INSERT INTO DIEUKIEN VALUES('DHMT','THDC')
INSERT INTO DIEUKIEN VALUES('LTHDT','THDC')
INSERT INTO DIEUKIEN VALUES('PTTKHTTT','CSDL')
--ketquathi
INSERT INTO KETQUATHI VALUES('K1101','CSDL',1,'20/7/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1101','CTDLGT',1,'28/12/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES('K1101','THDC',1,'20/5/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES('K1101','CTRR',1,'13/5/2006',9.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',1,'20/7/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',2,'27/7/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',3,'08/10/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',1,'28/12/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',2,'01/05/2007',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',3,'15/1/2007',6,'Dat')
INSERT INTO KETQUATHI VALUES('K1102','THDC',1,'20/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTRR',1,'13/5/2006',7,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','CSDL',1,'20/7/2006',3.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1103','CSDL',2,'27/7/2006',8.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','CTDLGT',1,'28/12/2006',7,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','CTRR',1,'13/5/2006',6.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1104','CSDL',1,'20/7/2006',3.75,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTDLGT',1,'28/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',1,'13/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',2,'20/5/2006',3.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',3,'30/6/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1201','CSDL',1,'20/7/2006',6,'Dat')
INSERT INTO KETQUATHI VALUES('K1201','CTDLGT',1,'28/12/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1201','THDC',1,'20/5/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1201','CTRR',1,'13/5/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES('K1202','CSDL',1,'20/7/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTDLGT',1,'28/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTDLGT',2,'01/05/2007',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1202','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','THDC',2,'27/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',1,'13/5/2006',3,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',2,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',3,'30/6/2006',6.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','CSDL',1,'20/7/2006',9.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','CTDLGT',1,'28/12/2006',9.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','THDC',1,'20/5/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','CTRR',1,'13/5/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1204','CSDL',1,'20/7/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1204','CTDLGT',1,'28/12/2006',6.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1204','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1204','CTRR',1,'13/5/2006',6,'Dat')
INSERT INTO KETQUATHI VALUES('K1301','CSDL',1,'20/12/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1301','CTDLGT',1,'25/7/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1301','THDC',1,'20/5/2006',7.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1301','CTRR',1,'13/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','CSDL',1,'20/12/2006',6.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','CTDLGT',1,'25/7/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','CTRR',1,'13/5/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1303','CSDL',1,'20/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',1,'25/7/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',2,'08/07/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',3,'15/8/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','THDC',1,'20/5/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTRR',1,'13/5/2006',3.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTRR',2,'20/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','CSDL',1,'20/12/2006',7.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','CTDLGT',1,'25/7/2006',9.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','THDC',1,'20/5/2006',5.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','CTRR',1,'13/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','CSDL',1,'20/12/2006',9.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','CTDLGT',1,'25/7/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','CTRR',1,'13/5/2006',10,'Dat')
--hocvien
INSERT INTO HOCVIEN VALUES('K1101','Nguyen Van','A','27/1/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1102','Tran Ngoc','Han','14/3/1986','Nu','Kien Giang','K11')
INSERT INTO HOCVIEN VALUES('K1103','Ha Duy','Lap','18/4/1986','Nam','Nghe An','K11')
INSERT INTO HOCVIEN VALUES('K1104','Tran Ngoc','Linh','30/3/1986','Nu','Tay Ninh','K11')
INSERT INTO HOCVIEN VALUES('K1105','Tran Minh','Long','27/2/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1106','Le Nhat','Minh','24/1/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1107','Nguyen Nhu','Nhut','27/1/1986','Nam','Ha Noi','K11')
INSERT INTO HOCVIEN VALUES('K1108','Nguyen Manh','Tam','27/2/1986','Nam','Kien Giang','K11')
INSERT INTO HOCVIEN VALUES('K1109','Phan Thi Thanh','Tam','27/1/1986','Nu','Vinh Long','K11')
INSERT INTO HOCVIEN VALUES('K1110','Le Hoai','Thuong','02/05/1986','Nu','Can Tho','K11')
INSERT INTO HOCVIEN VALUES('K1111','Le Ha','Vinh','25/12/1986','Nam','Vinh Long','K11')
INSERT INTO HOCVIEN VALUES('K1201','Nguyen Van','B','02/11/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1202','Nguyen Thi Kim','Duyen','18/1/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1203','Tran Thi Kim','Duyen','17/9/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1204','Truong My','Hanh','19/5/1986','Nu','Dong Nai','K12')
INSERT INTO HOCVIEN VALUES('K1205','Nguyen Thanh','Nam','17/4/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1206','Nguyen Thi Truc','Thanh','03/04/1986','Nu','Kien Giang','K12')
INSERT INTO HOCVIEN VALUES('K1207','Tran Thi Bich','Thuy','02/08/1986','Nu','Nghe An','K12')
INSERT INTO HOCVIEN VALUES('K1208','Huynh Thi Kim','Trieu','04/08/1986','Nu','Tay Ninh','K12')
INSERT INTO HOCVIEN VALUES('K1209','Pham Thanh','Trieu','23/2/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1210','Ngo Thanh','Tuan','14/2/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1211','Do Thi','Xuan','03/09/1986','Nu','Ha Noi','K12')
INSERT INTO HOCVIEN VALUES('K1212','Le Thi Phi','Yen','03/12/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1301','Nguyen Thi Kim','Cuc','06/09/1986','Nu','Kien Giang','K13')
INSERT INTO HOCVIEN VALUES('K1302','Truong Thi My','Hien','18/3/1986','Nu','Nghe An','K13')
INSERT INTO HOCVIEN VALUES('K1303','Le Duc','Hien','21/3/1986','Nam','Tay Ninh','K13')
INSERT INTO HOCVIEN VALUES('K1304','Le Quang','Hien','18/4/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1305','Le Thi','Huong','27/3/1986','Nu','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1306','Nguyen Thai','Huu','30/3/1986','Nam','Ha Noi','K13')
INSERT INTO HOCVIEN VALUES('K1307','Tran Minh','Man','28/5/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1308','Nguyen Hieu','Nghia','04/08/1986','Nam','Kien Giang','K13')
INSERT INTO HOCVIEN VALUES('K1309','Nguyen Trung','Nghia','18/1/1987','Nam','Nghe An','K13')
INSERT INTO HOCVIEN VALUES('K1310','Tran Thi Hong','Tham','22/4/1986','Nu','Tay Ninh','K13')
INSERT INTO HOCVIEN VALUES('K1311','Tran Minh','Thuc','04/04/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1312','Nguyen Thi Kim','Yen','09/07/1986','Nu','TpHCM','K13')

--***********************************************--
--1.In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp.
SELECT HV.MAHV , HO, TEN, NGSINH,L.MALOP
FROM HOCVIEN HV JOIN LOP L
ON HV.MALOP=L.MALOP
WHERE HV.MAHV=L.TRGLOP
--***********************************************--
--2. In ra bảng điểm khi thi (mã học viên, họ tên , lần thi, điểm số) môn CTRR của lớp “K12”, sắp xếp
--theo tên, họ học viên.
SELECT HV.MAHV, HO,TEN ,LANTHI, DIEM
FROM HOCVIEN HV JOIN KETQUATHI KQT
ON HV.MAHV=KQT.MAHV
WHERE MAMH='CTRR' AND MALOP='K12'
--***********************************************--
--3. In ra danh sách những học viên (mã học viên, họ tên) và những môn học mà học viên đó thi lần thứ
--nhất đã đạt.
SELECT DISTINCT HV.MAHV, HO ,TEN
FROM (HOCVIEN HV JOIN KETQUATHI KQT
ON HV.MAHV= KQT.MAHV ) JOIN MONHOC MH ON MH.MAMH=KQT.MAMH
WHERE LANTHI=1 AND KQT.KETQUA='Dat'
--***********************************************--
--4. In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” thi môn CTRR không đạt (ở lần thi 1).
SELECT DISTINCT HV.MAHV, HO ,TEN
FROM (HOCVIEN HV JOIN KETQUATHI KQT
ON HV.MAHV= KQT.MAHV )
WHERE MALOP='K11' AND KQT.MAMH='CTRR' AND LANTHI=1 AND KQT.KETQUA='Khong Dat'
--***********************************************--
--5. * Danh sách học viên (mã học viên, họ tên) của lớp “K” thi môn CTRR không đạt (ở tất cả các lần
--thi).
SELECT DISTINCT HV.MAHV, HO ,TEN
FROM (HOCVIEN HV JOIN KETQUATHI KQT
ON HV.MAHV= KQT.MAHV )
WHERE MALOP LIKE 'K%' AND KQT.MAMH='CTRR' AND 
					NOT EXISTS (SELECT *
					FROM KETQUATHI KQT1
					WHERE KQT1.MAHV=HV.MAHV AND KQT1.KETQUA='Dat' AND KQT1.MAMH='CTRR')
--***********************************************--
--6. Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” dạy trong học kỳ 1 năm 2006.
SELECT DISTINCT MH.TENMH
FROM (MONHOC MH JOIN GIANGDAY GD 
ON MH.MAMH=GD.MAMH )JOIN GIAOVIEN GV
ON GD.MAGV=GV.MAGV
WHERE GV.HOTEN='Tran Tam Thanh' AND GD.HOCKY='1' AND NAM='2006'
--***********************************************--
--7. Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp “K11” dạy trong học
--kỳ 1 năm 2006.
SELECT DISTINCT MH.MAMH, TENMH
FROM (MONHOC MH JOIN GIANGDAY GD 
ON MH.MAMH=GD.MAMH ) JOIN LOP L ON GD.MALOP=L.MALOP
WHERE L.MALOP='K11' and HOCKY='1' AND NAM='2006'
--***********************************************--
--8. Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên “Nguyen To Lan” dạy môn “Co So Du Lieu”.
SELECT DISTINCT HO, TEN
FROM ((((HOCVIEN HV JOIN LOP L ON HV.MAHV=L.TRGLOP)
	JOIN GIANGDAY GD ON GD.MALOP=L.MALOP)
	JOIN GIAOVIEN GV ON GV.MAGV=GD.MAGV)
	JOIN MONHOC MH ON GD.MAMH=MH.MAMH)
WHERE GV.HOTEN='Nguyen To Lan' AND MH.TENMH='Co So Du Lieu'
--***********************************************--
--9. In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn “Co So Du
--Lieu”.
SELECT MONHOCTRUOC.MAMH, MONHOCTRUOC.TENMH
FROM (MONHOC MH JOIN DIEUKIEN DK 
ON MH.MAMH=DK.MAMH ) JOIN MONHOC AS MONHOCTRUOC ON DK.MAMH_TRUOC=MONHOCTRUOC.MAMH
WHERE MH.TENMH='Co So Du Lieu'
--***********************************************--
--10. Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước những môn học (mã môn học, tên
--môn học) nào.
SELECT MH.MAMH, MH.TENMH
FROM (MONHOC MH JOIN DIEUKIEN DK 
ON MH.MAMH=DK.MAMH ) JOIN MONHOC AS MONHOCTRUOC ON DK.MAMH_TRUOC=MONHOCTRUOC.MAMH
WHERE MONHOCTRUOC.TENMH='Cau Truc Roi Rac'
--***********************************************--
--11. Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” trong cùng học kỳ 1 năm 2006.
SELECT GV.HOTEN
FROM GIAOVIEN GV JOIN GIANGDAY GD
ON GV.MAGV=GD.MAGV
WHERE GD.MALOP='K11' AND HOCKY='1' AND NAM='2006'
INTERSECT 
SELECT GV.HOTEN
FROM GIAOVIEN GV JOIN GIANGDAY GD
ON GV.MAGV=GD.MAGV
WHERE GD.MALOP='K12' AND HOCKY='1' AND NAM='2006'
--***********************************************--
--12. Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 nhưng chưa thi
--lại môn này.
SELECT HV.MAHV, HO , TEN
FROM HOCVIEN HV JOIN KETQUATHI KQT 
ON HV.MAHV=KQT.MAHV
WHERE LANTHI=1 AND MAMH='CSDL' AND KETQUA='Khong Dat'
AND NOT EXISTS (SELECT *
					FROM KETQUATHI KQT1
					WHERE LANTHI>1 AND KQT1.MAHV=HV.MAHV)
--***********************************************--
--13. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào.
SELECT GV.MAGV, HOTEN
FROM GIAOVIEN GV 
WHERE MAGV NOT IN (SELECT MAGV 
					FROM GIANGDAY GD 
					WHERE GD.MAGV=GV.MAGV)
--***********************************************--
--14. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào thuộc
--khoa giáo viên đó phụ trách.
SELECT GV.MAGV, HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS (SELECT *
					FROM MONHOC MH
					WHERE MH.MAKHOA=GV.MAKHOA 
					AND NOT EXISTS (SELECT *
										FROM GIANGDAY GD
										WHERE GD.MAGV=GV.MAGV))
--***********************************************--
--15. Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 3 lần vẫn “Khong dat” hoặc thi lần
--thứ 2 môn CTRR được 5 điểm.
SELECT HO, TEN 
FROM HOCVIEN HV JOIN KETQUATHI KQT
ON HV.MAHV=KQT.MAHV
WHERE HV.MALOP='K11' AND LANTHI=2 AND DIEM=5 AND MAMH='CTRR'
		OR HV.MAHV IN (SELECT MAHV
							FROM KETQUATHI
							WHERE KETQUA='Khong Dat' 
							GROUP BY MAHV , MAMH
							HAVING COUNT(*)>3)
--***********************************************--
--16. Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng một học kỳ của một năm học.
SELECT GV.HOTEN
FROM GIAOVIEN GV JOIN GIANGDAY GD
ON GV.MAGV=GD.MAGV
WHERE GD.MAMH='CTRR'
GROUP BY GV.MAGV, HOTEN, HOCKY
HAVING COUNT(*)>=2
--***********************************************--
--17. Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).
SELECT HV.*, DIEM AS DIEMTHILANCUOI
FROM HOCVIEN HV JOIN KETQUATHI KQT
ON HV.MAHV=KQT.MAHV
WHERE MAMH='CSDL' and LANTHI = (SELECT MAX(LANTHI)
									FROM KETQUATHI KQT1
									WHERE KQT1.MAHV=HV.MAHV AND MAMH='CSDL' 
									GROUP BY MAHV)		
--***********************************************--									
--18. Danh sách học viên và điểm thi môn “Co So Du Lieu” (chỉ lấy điểm cao nhất của các lần thi).
SELECT HV.*, DIEM AS MAXDIEMTHI
FROM (HOCVIEN HV JOIN KETQUATHI KQT
ON HV.MAHV=KQT.MAHV) JOIN MONHOC MH ON MH.MAMH=KQT.MAMH
WHERE MH.TENMH='Co So Du Lieu' and DIEM = (SELECT MAX(DIEM)
									FROM KETQUATHI KQT1 JOIN MONHOC MH1
									ON KQT1.MAMH=MH1.MAMH
									WHERE  KQT1.MAHV= HV.MAHV AND TENMH='Co So Du Lieu'
									GROUP BY MAHV)	
--***********************************************--									
--19. Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất.
SELECT K.MAKHOA,TENKHOA
FROM KHOA K
WHERE NGTLAP = (SELECT MIN(NGTLAP) FROM KHOA)
--20. Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.
SELECT COUNT(MAGV) AS SLGV
FROM GIAOVIEN GV
WHERE GV.HOCHAM = 'GS' OR GV.HOCHAM = 'PGS'
--***********************************************--
--21. Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi khoa.
SELECT MAKHOA,HOCVI, COUNT(HOCVI) SLHV
FROM GIAOVIEN
GROUP BY MAKHOA, HOCVI
ORDER BY MAKHOA
--***********************************************--
--22. Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).
SELECT MAMH, KETQUA, COUNT(MAHV) SLHV
FROM KETQUATHI
GROUP BY MAMH,KETQUA 
ORDER BY MAMH
--***********************************************--
--23. Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho lớp đó ít
--nhất một môn học.
SELECT DISTINCT GV.MAGV, HOTEN
FROM (GIAOVIEN GV JOIN GIANGDAY GD
ON GV.MAGV=GD.MAGV) JOIN LOP L ON GD.MALOP=L.MALOP
WHERE GV.MAGV=MAGVCN
--***********************************************--
--24. Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất.
SELECT HO,TEN
FROM LOP L JOIN HOCVIEN HV
ON L.TRGLOP= HV.MAHV
WHERE SISO = (SELECT MAX(SISO)
				FROM LOP)
--***********************************************--
--25. * Tìm họ tên những LOPTRG thi không đạt quá 3 môn (mỗi môn đều thi không đạt ở tất cả các lần
--thi).
SELECT HO, TEN
FROM (HOCVIEN HV JOIN LOP L
ON HV.MAHV=L.TRGLOP) JOIN KETQUATHI KQT ON HV.MAHV=KQT.MAHV
GROUP BY TRGLOP , HO, TEN
HAVING COUNT(*)	>3
--***********************************************--
--26. Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
SELECT TOP 1 WITH TIES HV.MAHV , HO, TEN
FROM HOCVIEN HV JOIN KETQUATHI KQT
ON HV.MAHV=KQT.MAHV
WHERE DIEM>=9
GROUP BY HV.MAHV, HO, TEN
ORDER BY COUNT(*) DESC
--***********************************************--
--27. Trong từng lớp, tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
SELECT TOP 1 WITH TIES L.MALOP, HV.MAHV , HO, TEN
FROM (HOCVIEN HV JOIN KETQUATHI KQT
ON HV.MAHV=KQT.MAHV) JOIN LOP L
ON HV.MALOP=L.MALOP
WHERE DIEM>=9
GROUP BY HV.MAHV, HO, TEN, L.MALOP
ORDER BY COUNT(*) DESC
--***********************************************--
--28. Trong từng học kỳ của từng năm, mỗi giáo viên phân công dạy bao nhiêu môn học, bao nhiêu lớp.
SELECT MAGV , COUNT(DISTINCT MALOP) SLLOP, COUNT(DISTINCT MAMH) SLMH
FROM GIANGDAY GD 
GROUP BY MAGV
--***********************************************--
--29. Trong từng học kỳ của từng năm, tìm giáo viên (mã giáo viên, họ tên) giảng dạy nhiều nhất.
SELECT GD.NAM, GD.HOCKY,GV.MAGV, GV.HOTEN
FROM GIANGDAY GD JOIN GIAOVIEN GV ON GD.MAGV=GV.MAGV
GROUP BY GV.MAGV, GV.HOTEN, GD.NAM, GD.HOCKY
HAVING COUNT(*)= (SELECT MAX(A.SL)
							FROM (SELECT GD1.NAM, GD1.HOCKY, GD1.MAGV,COUNT(*) SL
									FROM GIANGDAY GD1
									GROUP BY GD1.NAM, GD1.HOCKY,GD1.MAGV) AS A
							WHERE GD.NAM=A.NAM AND GD.HOCKY=A.HOCKY
							GROUP BY A.NAM,A.HOCKY)
ORDER BY GD.NAM
--***********************************************--
--30. Tìm môn học (mã môn học, tên môn học) có nhiều học viên thi không đạt (ở lần thi thứ 1) nhất.
SELECT TOP 1 WITH TIES MH.MAMH, TENMH
FROM (MONHOC MH JOIN KETQUATHI KQT
ON MH.MAMH=KQT.MAMH) 
WHERE LANTHI=1 AND KETQUA='Khong Dat'
GROUP BY MH.MAMH, TENMH
ORDER BY COUNT(*) DESC
--***********************************************--
--31. Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi thứ 1).
SELECT DISTINCT HV.MAHV, HO, TEN
FROM HOCVIEN HV JOIN KETQUATHI KQT
ON HV.MAHV=KQT.MAHV
WHERE NOT EXISTS (SELECT *
					FROM KETQUATHI KQT1
					WHERE KQT1.MAHV=HV.MAHV AND LANTHI=1 AND KQT1.KETQUA= 'Khong Dat' )
--***********************************************--
--32. * Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi sau cùng).
SELECT DISTINCT HV.MAHV, HO, TEN
FROM HOCVIEN HV JOIN KETQUATHI KQT
ON HV.MAHV=KQT.MAHV
WHERE NOT EXISTS (SELECT *
					FROM KETQUATHI KQT1
					WHERE LANTHI = (SELECT MAX(LANTHI) FROM KETQUATHI WHERE MAHV=HV.MAHV GROUP BY MAHV)
					AND KQT1.MAHV=HV.MAHV AND KQT1.KETQUA= 'Khong Dat' )
--***********************************************--
--33. * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi thứ 1).
SELECT HV.MAHV, HO, TEN
FROM HOCVIEN HV 
WHERE NOT EXISTS (SELECT *
					FROM MONHOC
					WHERE NOT EXISTS (SELECT *
										FROM KETQUATHI
										WHERE LANTHI=1
										AND KETQUATHI.MAHV=HV.MAHV
										AND KETQUA='Dat'))
--***********************************************--			
--34. * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi sau cùng).
SELECT HV.MAHV, HO, TEN
FROM HOCVIEN HV 
WHERE NOT EXISTS (SELECT *
					FROM MONHOC
					WHERE NOT EXISTS (SELECT *
										FROM KETQUATHI
										WHERE LANTHI= (SELECT MAX(LANTHI) FROM KETQUATHI WHERE MAHV=HV.MAHV GROUP BY MAHV)
										AND KETQUATHI.MAHV=HV.MAHV
										AND KETQUA='Dat'))
--***********************************************--
--35. ** Tìm học viên (mã học viên, họ tên) có điểm thi cao nhất trong từng môn (lấy điểm ở lần thi sau
--cùng).
SELECT MAMH, MAHV, HOTEN
FROM
(
	SELECT
		MAMH, HOCVIEN.MAHV, (HO+' '+TEN) HOTEN, RANK() OVER (PARTITION BY MAMH ORDER BY MAX(DIEM) DESC) AS XepHang
	FROM
		HOCVIEN, KETQUATHI
	WHERE
		HOCVIEN.MAHV = KETQUATHI.MAHV
		AND LANTHI = (SELECT MAX(LANTHI) FROM KETQUATHI WHERE MAHV = HOCVIEN.MAHV GROUP BY MAHV)
	GROUP BY
		MAMH, HOCVIEN.MAHV, HO, TEN
) AS A
WHERE XepHang = 1
--***********************************************--












	
