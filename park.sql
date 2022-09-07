create table memberinfo(
	memberID varchar(20) NOT NULL,
    memberpw varchar(20) not null,
    membername varchar(10) not null,
    expirydate date,
    cartype varchar(20) not null,
    carnumber varchar(10) not null,
	primary key(memberID)
);

create table managerinfo(
	managerID varchar(20) NOT NULL,
	managerpw varchar(20) NOT NULL,
    managername varchar(10) NOT NULL,
    primary key(managerID)
);
insert into managerinfo values("manageID","managePW","관리자");

create table parkinglot(
	total int NOT NULL,
	used int NOT NULL,
	primary key(total)
);
insert into parkinglot values(10,0);

create table nowuser(
	carnumber varchar(20) NOT NULL,
	startusing timestamp NOT NULL,
    primary key(carnumber)
);