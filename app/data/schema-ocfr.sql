CREATE TABLE certification (
	certId VARCHAR(60) PRIMARY KEY,
    agency VARCHAR (60),
    certType VARCHAR (60)
);
CREATE TABLE person (
	personId VARCHAR(60) PRIMARY KEY,
    firstName VARCHAR (60),
    lastName VARCHAR (60),
    position VARCHAR (60),
    station VARCHAR (60),
    gender VARCHAR (60),
    address VARCHAR (60),
	workPhone VARCHAR (17) DEFAULT NULL,
    mobilePhone VARCHAR (17) DEFAULT NULL,
    radioNumber VARCHAR (60) NOT NULL,
    isActive BOOL
);
CREATE TABLE personCert (
	personId VARCHAR(60),
    certId VARCHAR(60),
    renewDate DATE,
    expireDate DATE,
    PRIMARY KEY (personId, certId),
    FOREIGN KEY (personId) REFERENCES person(personId),
    FOREIGN KEY (certId) REFERENCES certification(certId)
);

INSERT INTO person (personID, firstName, lastName, position, station, gender, address, workPhone, mobilePhone, radioNumber, isActive)
	VALUES("1", "Kathryn", "Pryde", "Chief", "All",  "Female", "1123 Xavier School Drive, Wtkinsville, GA 30677", "707-555-1234", "707-555-2345", "A-1", "1");
INSERT INTO person (personID, firstName, lastName, position, station, gender, address, workPhone, mobilePhone, radioNumber, isActive)
	VALUES("2", "Piotr", "Rasputin", NULL, "8", "Male", "A31 Mother Russia Road, Seattle, WA 98133", NULL, "206-555-9876", "841", "1");
INSERT INTO person (personID, firstName, lastName, position, station, gender, address, workPhone, mobilePhone, radioNumber, isActive)
	VALUES("3", "Warren", "Worthington III", NULL, "1", "Male", "1140 Experiment Station Rd, Watkinsville, GA", "(706) 555-3945", NULL, "122", "1");

INSERT INTO certification (certId, agency, certType)
	VALUES("A", "Fire Dept", "Firefighter II");
INSERT INTO certification (certId, agency, certType)
	VALUES("B", "CPR for the Professional Rescuer/American Red Cross", "CPR");
INSERT INTO certification (certId, agency, certType)
	VALUES("C", "Fire Dept", "HAZMAT");
INSERT INTO certification (certId, agency, certType)
	VALUES("D", "Fire Dept", "Extrication");
INSERT INTO certification (certId, agency, certType)
	VALUES("E", "DHS", "EMT-Adv");
INSERT INTO certification (certId, agency, certType)
	VALUES("F", "Dept of Public Safety", "Due Regard");
INSERT INTO certification (certId, agency, certType)
	VALUES("G", "DHS", "Paramedic");
INSERT INTO certification (certId, agency, certType)
	VALUES("H", "Ivy Technical College", "Firefighter I");
INSERT INTO certification (certId, agency, certType)
	VALUES("I", "Athens Technical College", "Firefighter I");
INSERT INTO certification (certId, agency, certType)
	VALUES("J", "Georgia POST Academy", "POST");
INSERT INTO certification (certId, agency, certType)
	VALUES("K", "CPR for Healthcare Providers/American Heart Association", "CPR");

INSERT INTO personCert (personId, certId, renewDate, expireDate)
	VALUES ("1", "A", "2018-8-01", "2020-8-01");
INSERT INTO personCert (personId, certId, renewDate, expireDate)
	VALUES ("1", "B", "2017-7-01", "2019-7-01");
INSERT INTO personCert (personId, certId, renewDate, expireDate)
	VALUES ("1", "C", NULL, "2020-2-01");
INSERT INTO personCert (personId, certId, renewDate, expireDate)
	VALUES ("1", "D", NULL, NULL);
INSERT INTO personCert (personId, certId, renewDate, expireDate)
	VALUES ("2", "E", NULL, "2020-9-01");
INSERT INTO personCert (personId, certId, renewDate, expireDate)
	VALUES ("2", "B", "2019-7-01", "2021-7-01");
INSERT INTO personCert (personId, certId, renewDate, expireDate)
	VALUES ("2", "F", "2019-10-01", "2021-10-01");
INSERT INTO personCert (personId, certId, renewDate, expireDate)
	VALUES ("3", "G", NULL, "2019-9-01");
INSERT INTO personCert (personId, certId, renewDate, expireDate)
	VALUES ("3", "B", NULL, "2020-7-01");
INSERT INTO personCert (personId, certId, renewDate, expireDate)
	VALUES ("3", "F", NULL, "2019-10-01");
INSERT INTO personCert (personId, certId, renewDate, expireDate)
	VALUES ("3", "H", NULL, "2020-8-01");
