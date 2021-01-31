CREATE or REPLACE FUNCTION random_string(length INTEGER) RETURNS TEXT AS 
$$
DECLARE
  chars TEXT[] := '{A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z}';
  result TEXT := '';
  i INTEGER := 0;
BEGIN
  IF length < 0 then
    RAISE EXCEPTION 'Given length cannot be less than 0';
  END IF;
  FOR i IN 1..length 
  LOOP
    result := result || chars[1+random()*(array_length(chars, 1)-1)];
  END LOOP;
  RETURN result;
END;
$$ LANGUAGE plpgsql;


INSERT INTO employee
SELECT
  TO_CHAR(g, '09999') AS empid,
  random_string(15) AS lname,
  random_string(12) AS fname,
  '500 ORACLE PARKWAY' AS address,
  'REDWOOD SHORES' AS city,
  'CA' AS state,
  '94065' AS zip
FROM
  generate_series(0, 9999) g;

INSERT INTO payroll(empid, bonus, salary)
SELECT
  per.empid,
  0 as bonus,
  99170 + ROUND(random() * 1000)*100 AS salary
FROM
  employee per;
