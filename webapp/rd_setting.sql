SELECT 'DROP TABLE "'  ||TABLE_NAME||  '" CASCADE CONSTRAINTS;' FROM user_tables;






select *
from users;

select *
from dog;



CREATE TABLE users (
	userNo	NUMBER	NOT NULL,
	locationNo	NUMBER	NOT NULL,
	id	varchar2(20)	NOT NULL,
	password	varchar2(20)	NOT NULL,
	name	varchar2(20)	NOT NULL,
	code	varchar2(20)	NOT NULL,
	birth	varchar2	NULL,
	gender	varchar2	NULL,
	status	char	NOT NULL
);

CREATE TABLE dog (
	dogNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	name	varchar2(20)	NOT NULL,
	birth	varchar2(20)	NOT NULL,
	gender	varchar2(20)	NOT NULL,
	weight	NUMBER	NOT NULL,
	kind	varchar2	NULL,
	neuter	varchar2	NULL,
	personality	varchar2	NULL,
	cert	varchar2	NULL,
	color	varchar2	NULL,
	status	char	NOT NULL
);

CREATE TABLE friend (
	friendNo	NUMBER	NOT NULL,
	applyUserNo	NUMBER	NOT NULL,
	appliedUserNo	NUMBER	NOT NULL,
	status	char	NOT NULL
);









