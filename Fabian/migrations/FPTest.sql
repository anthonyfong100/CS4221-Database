CREATE OR REPLACE FUNCTION test (TEXT, INT) RETURNS TEXT AS
$$
DECLARE
r RECORD;
p TEXT;
e TEXT;
ap NUMERIC := 0;
ae NUMERIC := 0;
BEGIN
FOR i IN 1..$2
LOOP
	FOR r in EXECUTE 'EXPLAIN ANALYZE ' || $1
	LOOP
		IF  r::TEXT LIKE '%Planning%'
		THEN 
		p := regexp_replace( r::TEXT, '.*Planning (?:T|t)ime: (.*) ms.*', '\1');
		END IF;
		IF r::TEXT LIKE '%Execution%'
		THEN 
		e := regexp_replace( r::TEXT, '.*Execution (?:T|t)ime: (.*) ms.*', '\1');
		END IF;
	END LOOP;
	ap := ap + (p::NUMERIC - ap) / i;
	ae := ae + (e::NUMERIC - ae) / i;
END LOOP;
RETURN ROUND(ap, 2) || ' : ' || ROUND(ae, 2) ;
END;
$$ LANGUAGE plpgsql;
