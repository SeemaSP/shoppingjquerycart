--Employee table-----------
create table [seemap_A16028].[Employee]
(
	Name varchar(500) not null,
	EmpCode int not null primary key identity(1,1),
	DateOfBirth date not null,
	MonthlyPay money not null
)

select * from [seemap_A16028].[Employee]

drop table [seemap_A16028].[Employee]
drop table [seemap_A16028].[Attendance]
drop table [seemap_A16028].[ClockInRecords]
drop table [seemap_A16028].[ProjectAssignment]

insert into [seemap_A16028].[Employee](Name, DateOfBirth,MonthlyPay)
values('Sam','1994-01-01',15000)
insert into [seemap_A16028].[Employee](Name, DateOfBirth,MonthlyPay)
values('Jam','1994-06-01',12000)
insert into [seemap_A16028].[Employee](Name, DateOfBirth,MonthlyPay)
values('Ram','1994-07-01',15000)
insert into [seemap_A16028].[Employee](Name, DateOfBirth,MonthlyPay)
values('Gam','1994-08-01',25000)
insert into [seemap_A16028].[Employee](Name, DateOfBirth,MonthlyPay)
values('Kam','1994-08-01',30000)
insert into [seemap_A16028].[Employee](Name, DateOfBirth,MonthlyPay)
values('Lam','1994-06-01',10000)
insert into [seemap_A16028].[Employee](Name, DateOfBirth,MonthlyPay)
values('Jim','1994-09-02',25000)
insert into [seemap_A16028].[Employee](Name, DateOfBirth,MonthlyPay)
values('Kamer','1994-09-02',30000)
insert into [seemap_A16028].[Employee](Name, DateOfBirth,MonthlyPay)
values('Lamo','1994-09-02',10000)

-----Employee table ends here---------------
----------Attendance table-----------------
create table [seemap_A16028].[Attendance]
(
	EmpCode int not null,
	AttendanceDate date  not null,
	EmpStatus varchar(100) check(EmpStatus in ('Present','Absent','Leave') ) default 'Absent'
)

drop table [seemap_A16028].[Attendance]

alter table [seemap_A16028].[Attendance]
add constraint attendancetoemployee_fk foreign key (EmpCode) references [seemap_A16028].[Employee](EmpCode)

insert into [seemap_A16028].[Attendance](EmpCode,AttendanceDate, EmpStatus)
values(1,'2016-01-01','Present')

insert into [seemap_A16028].[Attendance](EmpCode,AttendanceDate, EmpStatus)
values(2,'2016-01-01','Absent')

insert into [seemap_A16028].[Attendance](EmpCode,AttendanceDate, EmpStatus)
values(3,'2016-01-01','Present')

insert into [seemap_A16028].[Attendance](EmpCode,AttendanceDate, EmpStatus)
values(4,'2016-01-01','Present')

insert into [seemap_A16028].[Attendance](EmpCode,AttendanceDate, EmpStatus)
values(5,'2016-01-01','Absent')

insert into [seemap_A16028].[Attendance](EmpCode,AttendanceDate, EmpStatus)
values(6,'2016-01-01','Present')

insert into [seemap_A16028].[Attendance](EmpCode,AttendanceDate, EmpStatus)
values(7,'2016-01-01','Present')

insert into [seemap_A16028].[Attendance](EmpCode,AttendanceDate, EmpStatus)
values(8,'2016-01-01','Absent')

insert into [seemap_A16028].[Attendance](EmpCode,AttendanceDate, EmpStatus)
values(9,'2016-01-01','Absent')

insert into [seemap_A16028].[Attendance](EmpCode,AttendanceDate, EmpStatus)
values(1,'2016-02-01','Absent')
select * from [seemap_A16028].[Attendance]

----------Attendance table ends here-----------------
-------ClockinRecords table----------------------
-------1=in and 2=out and null indicates that he is absent so set swipe date and time to null as well--------------------
create table [seemap_A16028].[ClockInRecords]
(
	EmpCode int not null,
	ChannelNo int  null check(ChannelNo in (1,2)) ,
	SwipeDate date  null,
	SwipeTime time null
)

drop table [seemap_A16028].[ClockInRecords]

alter table [seemap_A16028].[ClockInRecords]
add constraint clockinrecordstoemployee foreign key (EmpCode) references [seemap_A16028].[Employee](EmpCode)
--entry swipe----
insert into [seemap_A16028].[ClockInRecords](EmpCode,ChannelNo,SwipeDate,SwipeTime)
values(1,1,'2016-01-01','09:00')

insert into [seemap_A16028].[ClockInRecords](EmpCode,ChannelNo,SwipeDate,SwipeTime)
values(3,1,'2016-01-01','09:02')
insert into [seemap_A16028].[ClockInRecords](EmpCode,ChannelNo,SwipeDate,SwipeTime)
values(4,1,'2016-01-01','09:30')

insert into [seemap_A16028].[ClockInRecords](EmpCode,ChannelNo,SwipeDate,SwipeTime)
values(6,1,'2016-01-01','09:05')
insert into [seemap_A16028].[ClockInRecords](EmpCode,ChannelNo,SwipeDate,SwipeTime)
values(7,1,'2016-01-01','10:10')

--entry swipe:ends here----

--exit swipe----
insert into [seemap_A16028].[ClockInRecords](EmpCode,ChannelNo,SwipeDate,SwipeTime)
values(1,2,'2016-01-01','04:00')

insert into [seemap_A16028].[ClockInRecords](EmpCode,ChannelNo,SwipeDate,SwipeTime)
values(3,2,'2016-01-01','06:02')
insert into [seemap_A16028].[ClockInRecords](EmpCode,ChannelNo,SwipeDate,SwipeTime)
values(4,2,'2016-01-01','08:00')

insert into [seemap_A16028].[ClockInRecords](EmpCode,ChannelNo,SwipeDate,SwipeTime)
values(6,2,'2016-01-01','10:05')
insert into [seemap_A16028].[ClockInRecords](EmpCode,ChannelNo,SwipeDate,SwipeTime)
values(7,2,'2016-01-01','07:10')

--exit swipe:ends here----


select * from [seemap_A16028].[ClockInRecords]
-------ClockinRecords table ends here----------------------

--------project master-----------------
create table [seemap_A16028].[Project]
(
ProjectCode int not null primary key,
ProjectName varchar(500) not null

)


select * from  [seemap_A16028].[Project]
--------project master ends here-----------------
---------ProjectAssignment table----------------
create table [seemap_A16028].[ProjectAssignment]
(
	EmpCode int not null,
	ProjectCode int null,
	fromDate date null,
	toDate date null

)

alter table [seemap_A16028].[ProjectAssignment]
add constraint projectassignmenttoemployee foreign key (EmpCode) references  [seemap_A16028].[Employee] (EmpCode)

alter table [seemap_A16028].[ProjectAssignment]
add constraint projectassignmenttoprojectmaster foreign key (ProjectCode) references  [seemap_A16028].[Project](ProjectCode)


select * from [seemap_A16028].[ProjectAssignment]
---------ProjectAssignment table ends here----------------




-------question 1:List all employees who have birthday as of the current date----------

select EmpCode,Name
from [seemap_A16028].[Employee]
where day(DateOfBirth)=day(getdate()) and month(DateOfBirth)=month(getdate())

-------question 1:ends here----------

------Question 2:For a given month, Find all employees who were absent---------

--the consideration is that when a employee is absent he cannot swipe in and out so there wont be any 
--records of the absent employee in the ClockInRecords table but in Attendance Table he would be marked absent

select e.EmpCode,e.Name,a.AttendanceDate,a.EmpStatus  
from [seemap_A16028].[Employee] e, [seemap_A16028].[Attendance] a
where e.EmpCode=a.EmpCode and a.EmpStatus='Absent' and datename(MM,a.AttendanceDate)='January'
--for all the employees absent in the month of january ---
--select datename(MM,'2016-01-01')
--select month('2016-01-01')
--enter full names of months as date name returns the full name as well---------

------Question 2:Ends here---------

/*Question 3:Create a procedure to calculate his monthly salary.
 The salary shall be deducted for number of days he is absent.*/
 alter procedure [seemap_A16028].[return_monthly_salary]
 @EMpCode int,
 @any_month varchar(500)
 as 
 begin
	declare @workingdays int
	set @workingdays=(select count(*)
					 from [seemap_A16028].[Employee] e, [seemap_A16028].[Attendance] a
					 where e.EmpCode=a.EmpCode and a.EmpStatus='Present' and datename(MM,a.AttendanceDate)= @any_month and e.EmpCode= @EMpCode
					 )
	print @workingdays
	declare @absentdays int 
	set @absentdays=(select count(*)
					 from [seemap_A16028].[Employee] e, [seemap_A16028].[Attendance] a
				     where e.EmpCode=a.EmpCode and a.EmpStatus='Absent' and datename(MM,a.AttendanceDate)= @any_month and e.EmpCode= @EMpCode
					 )
	print @absentdays
	declare @referencemonth date
	set   @referencemonth=( select top 1 AttendanceDate
							from [seemap_A16028].[Employee] e, [seemap_A16028].[Attendance] a
							where e.EmpCode=a.EmpCode  and datename(MM,a.AttendanceDate)= @any_month and e.EmpCode= @EMpCode
							)
	declare @totaldaysinmonth int

	set @totaldaysinmonth=day(EOMONTH( @referencemonth))

	declare @basemonthlysalary money
	set @basemonthlysalary=(select MonthlyPay
						from [seemap_A16028].[Employee] 
						where EmpCode= @EMpCode )
	print  @basemonthlysalary

	declare @monthsalaryforemp money
	set @monthsalaryforemp=(@workingdays-@absentdays)*@basemonthlysalary
	set @monthsalaryforemp=@monthsalaryforemp/@totaldaysinmonth
	print @monthsalaryforemp
	return @monthsalaryforemp
--select @monthsalaryforemp
end

exec [seemap_A16028].[return_monthly_salary] 2,'January'
 /*select top 1 AttendanceDate
                 from [seemap_A16028].[Employee] e, [seemap_A16028].[Attendance] a
                 where e.EmpCode=a.EmpCode and a.EmpStatus='Present' and datename(MM,a.AttendanceDate)='January' and e.EmpCode=1
     */           
--select day(EOMONTH('2016-01-01'))

 
 ----question 3 ends here-------------------------

 ----question 4:For a given date, Find all employees who were absent (not swiped even a single time )-----

 --here the absent employee wont be able to swipe his card so there wont be any records in the ClockinRecords table------
--the considered date is '2016-01-01' -can put others
select *
from [seemap_A16028].[Employee] e, [seemap_A16028].[Attendance] a
where e.EmpCode=a.EmpCode  and a.AttendanceDate='2016-01-01' and e.EmpCode not in(select EmpCode
																				  from [seemap_A16028].[ClockInRecords])

--[seemap_A16028].[ClockInRecords] and a.EmpStatus='Absent'
/*
 select e.EmpCode,e.Name,a.AttendanceDate,a.EmpStatus  
 from [seemap_A16028].[Employee] e, [seemap_A16028].[Attendance] a
 where e.EmpCode=a.EmpCode and a.EmpStatus='Absent' and datename(MM,a.AttendanceDate)='January'*/
 ----question 4:ends here-----

 ---question 5: Create a procedure to get the total time in office for each employee---

 select * from [seemap_A16028].[ClockInRecords]
 select * from [seemap_A16028].[Employee]

 create procedure total_time 
 @any_date date
 as
 begin
 declare @starttime time
 set @starttime=(select SwipeTime from [seemap_A16028].[Employee] e,[seemap_A16028].[ClockInRecords] c
	 where e.EmpCode=c.EmpCode and e.EmpCode=1 and c.ChannelNo=1 and c.SwipeDate='2016-01-01')
	
	--select SwipeTime from [seemap_A16028].[Employee] e,[seemap_A16028].[ClockInRecords] c
	-- where e.EmpCode=c.EmpCode and e.EmpCode=1 and c.ChannelNo=1 and c.SwipeDate='2016-01-01'
 
 declare @endtime time
 set @endtime=(select SwipeTime from [seemap_A16028].[Employee] e,[seemap_A16028].[ClockInRecords] c
	where e.EmpCode=c.EmpCode and e.EmpCode=1 and c.ChannelNo=2)
	
	--select SwipeTime from [seemap_A16028].[Employee] e,[seemap_A16028].[ClockInRecords] c
	--where e.EmpCode=c.EmpCode and e.EmpCode=1 and c.ChannelNo=2
 declare @difftime time
 set @difftime=@starttime-@endtime
 --here diff time is the total time
 
 end
-----------------------------------------------------question 5 ends here------------ 
 select * from [seemap_A16028].[Employee] e,[seemap_A16028].[ClockInRecords] c
 where e.EmpCode=c.EmpCode and e.EmpCode=1 and c.ChannelNo=1 and c.SwipeDate='2016-01-01'
 

 select * from [seemap_A16028].[Employee] e,[seemap_A16028].[ClockInRecords] c
 where e.EmpCode=c.EmpCode and e.EmpCode=1 and c.ChannelNo=2



 -- [seemap_A16028].[ClockInRecords]
  ---question 5:ends here---

  --------question 6: Find all employees who were less than 8 hours in office.----------
  --from the previous question 5
  /*
  the logic that was 
  */

  --------question 6:ends here----------