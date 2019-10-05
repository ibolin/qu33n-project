CREATE TABLE certification (
	certId VARCHAR(60) PRIMARY KEY,
    agency VARCHAR (60),
    certType VARCHAR (60),
    renewalDate DATE,
    expireDate DATE
);
CREATE TABLE person (
	personId VARCHAR(60) PRIMARY KEY,
    firstName VARCHAR (60),
    lastName VARCHAR (60),
    position VARCHAR (60),
    gender VARCHAR (60),
    address VARCHAR (60),
	workPhone VARCHAR (17) DEFAULT NULL,
    mobilePhone VARCHAR (17) DEFAULT NULL,
    radioNumber VARCHAR (60) NOT NULL,
    stationNumber INTEGER NOT NULL,
    isActive BOOL
);
CREATE TABLE station (
	stationId VARCHAR (10) PRIMARY KEY,
    stationNumber INTEGER NOT NULL
);
CREATE TABLE personCert (
	personId VARCHAR(60),
    certId VARCHAR(60),
    PRIMARY KEY (personId, certId),
    FOREIGN KEY (personId) REFERENCES person(personId),
    FOREIGN KEY (certId) REFERENCES certification(certId)
);
CREATE TABLE personStation (
	personId VARCHAR (60),
    stationId VARCHAR (10),
    PRIMARY KEY (personId, stationId),
    FOREIGN KEY (personId) REFERENCES person(personId),
    FOREIGN KEY (stationId) REFERENCES station(stationId)
);


INSERT INTO person (personID, firstName, lastName, position, gender, address, workPhone, mobilePhone, radioNumber, stationNumber, isActive)
	VALUES("1", "Kathryn", "Pryde", "Female", "Chief", "1123 Xavier School Drive, Wtkinsville, GA 30677", "707-555-1234", "707-555-2345", "A-1", (1,8), "1");
INSERT INTO person (personID, firstName, lastName, position, gender, address, workPhone, mobilePhone, radioNumber, stationNumber, isActive)
	VALUES("2", "Piotr", "Rasputin", "Male", NULL, "A31 Mother Russia Road, Seattle, WA 98133", NULL, "206-555-9876", "841", 8, "1");
INSERT INTO person (personID, firstName, lastName, position, gender, address, workPhone, mobilePhone, radioNumber, stationNumber, isActive)
	VALUES("3", "Warren", "Worthington III", "Male", NULL, "1140 Experiment Station Rd, Watkinsville, GA", "(706) 555-3945", NULL, "122", 1, "1");
