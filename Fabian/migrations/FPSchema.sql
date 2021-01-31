CREATE TABLE employee (
  empid CHAR(9),
  lname CHAR(15),
  fname CHAR(12),
  address CHAR(20),
  city CHAR(20),
  state CHAR(2),
  zip CHAR(5)
);

CREATE TABLE payroll (
  empid CHAR(9),
  bonus INTEGER,
  salary INTEGER
);


