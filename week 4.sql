DROP Table Room;
DROP Table Campus;

Create Table Room
(roomID INTEGER,
RoomType VARCHAR (12),
CampusID VARCHAR(2)
)
CREATE Table Campus
(CampusID VARCHAR(2),
CampusName VARCHAR(24))

INSERT INTO Campus VALUES ('D', 'Davis Campus ')
INSERT INTO Campus VALUES ('H', 'HMC')
INSERT INTO Campus VALUES ('T ', 'Trafalgar Campus ')

INSERT INTO Room VALUES (1, 'Class', 'D')
INSERT INTO Room VALUES (2, 'Lab', 'T')
INSERT INTO Room VALUES (3, 'Class', 'T')
INSERT INTO Room VALUES (4, 'Lab', 'D')
INSERT INTO Room VALUES (5, 'Class', 'D')
INSERT INTO Room VALUES (6, 'Admin', 'D')
INSERT INTO Room VALUES (7, 'Admin', 'T')
INSERT INTO Room VALUES (8, 'Class', 'T')
INSERT INTO Room VALUES (9, 'Lab', 'NA')
INSERT INTO Room VALUES (10, 'Class', NULL )

SELECT*
FROM ROOM;

SELECT * 
FROM CAMPUS;

SELECT * 
FROM ROOM R, CAMPUS C 
WHERE R.CAMPUSID = C.CAMPUSID;

SELECT R.ROOMID , R.ROOMTYPE, C.CAMPUSNAME 
FROM ROOM R INNER JOIN CAMPUS C 
ON R.CAMPUSID = C.CAMPUSID

SELECT R.ROOMID , R.ROOMTYPE , C.CAMPUSNAME
FROM ROOM R LEFT OUTER JOIN  CAMPUS C 
ON R.CAMPUSID = C.CAMPUSID ;

SELECT R.ROOMID , R.ROOMTYPE , C.CAMPUSNAME
FROM ROOM R RIGHT OUTER JOIN  CAMPUS C 
ON R.CAMPUSID = C.CAMPUSID ;

SELECT R.ROOMID , R.ROOMTYPE , C.CAMPUSNAME
FROM ROOM R FULL OUTER JOIN  CAMPUS C 
ON R.CAMPUSID = C.CAMPUSID ;




