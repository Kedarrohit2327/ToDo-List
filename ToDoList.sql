

create table regForm(
id int identity(1,1) not null,
username varchar(500),
password varchar(max),
email varchar(max)
)

select * from regForm

CREATE TABLE Tasks (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    TaskDescr NVARCHAR(255) NOT NULL,
    IsCompleted BIT NOT NULL DEFAULT 0 -- 0 for false, 1 for true
);

select * from Tasks
