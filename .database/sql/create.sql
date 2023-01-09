CREATE SCHEMA core;

CREATE TABLE core.users (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	username VARCHAR NOT NULL,
	status BOOLEAN NOT null,
	created_by integer,
	created_date timestamp,
	last_updated_by integer,
	last_updated_date timestamp
);

CREATE TABLE core.organizations (
	id SERIAL PRIMARY KEY,
	code VARCHAR NOT NULL,
	name VARCHAR NOT NULL,
	status BOOLEAN NOT null,
	parent_id integer,
	created_by integer,
	created_date timestamp,
	last_updated_by integer,
	last_updated_date timestamp,
	CONSTRAINT fk_parent
      FOREIGN KEY(parent_id) 
	  	REFERENCES core.organizations(id)
);


create table core.employments (
	id serial primary key,
	user_id integer not null,
	organization_id integer not null,
	status BOOLEAN NOT null,
	date_from date not null,
	date_to date,
	created_by integer,
	created_date timestamp,
	last_updated_by integer,
	last_updated_date timestamp,
	CONSTRAINT fk_users
      FOREIGN KEY(user_id) 
	  	REFERENCES core.users(id),
	CONSTRAINT fk_organizations
      FOREIGN KEY(organization_id) 
	  	REFERENCES core.organizations(id)
);


INSERT INTO core.users (first_name, last_name, username, created_date, last_updated_date, status)
VALUES('Admin', 'Admin', 'admin', current_date, current_date, true);

INSERT INTO core.organizations (code, name, status, created_by, last_updated_by)
VALUES('MPU', 'Ministarstvo pravosuđa i uprave', true, 1, 1);

