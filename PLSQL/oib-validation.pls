create or replace FUNCTION IS_OIB(oib IN VARCHAR2) RETURN NUMBER AS

    o VARCHAR2(11);
    t NUMBER := 10;

BEGIN

    -- KONTROLA OIB-a = algoritam ISO/IEC 7064 (MOD 11,10)

    o := TRIM(oib);
    o := LPAD(o,11,'0');
    FOR i IN 1..10 LOOP
        t := MOD(t+TO_NUMBER(SUBSTR(o,i,1)),10);
        IF t = 0 THEN 
            t := 10;
        END IF;
        t := MOD(t*2,11);
    END LOOP;
    
    IF MOD(11-t,10)=SUBSTR(o,11,1) THEN
        RETURN 1;
    END IF;

    RETURN 0;
    
    EXCEPTION WHEN OTHERS THEN RETURN 0;
    
END IS_OIB;