use NewData;
-- this is show all data from table ()(
select * from year_make_model_master_ultimate;
-- this is not Data that is not duplicated
select distinct Make from year_make_model_master_ultimate
order by Make DESC;
-- this is not Data that is not duplicated
select distinct Make from year_make_model_master_ultimate
order by Make asc;

-- here create table and identification pramary key and outo numebr 
CREATE TABLE Makes (

    makeId INT IDENTITY(1,1) not null,
   Makename nvarchar(50),

    PRIMARY KEY (makeId)
);


-- here copy data from table to last Table 
insert into Makes
select distinct Make From year_make_model_master_ultimate
order by Make ASC;

-- here show data from table 
select * from Makes;
-- here filter data from table 
select * from Makes
where Makename like 'A%';
-- here add coloum to table 
alter table year_make_model_master_ultimate
add MakeID int null;
-- Update MakeID in the master table by matching the 'Make' name with the 'Makes' reference table.
UPDATE year_make_model_master_ultimate
SET MakeID = (SELECT MakeID FROM Makes WHERE Makes.Makename = year_make_model_master_ultimate.Make
);
-- here delete coloum from year_make_model_master_ultimate Spsific Make
ALTER TABLE year_make_model_master_ultimate 
DROP COLUMN Make;


SELECT        year_make_model_master_ultimate.MakeID AS Expr1, year_make_model_master_ultimate.*, Makes.Makename
FROM            year_make_model_master_ultimate INNER JOIN
                   Makes ON year_make_model_master_ultimate.MakeID =Makes.makeId