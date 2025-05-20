use shc;

SELECT * FROM part;



UPDATE part
SET unitprice = 250,
onhand = 5
WHERE partno='p002';


DELETE
FROM part
WHERE partno='p001';