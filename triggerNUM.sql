CREATE OR REPLACE TRIGGER "TRG_NUMNOTA" 
  AFTER INSERT ON TGFCAB
  REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
DECLARE

PRAGMA AUTONOMOUS_TRANSACTION;
V_NUMNOTA INT;


BEGIN

  SELECT COUNT(*) INTO V_NUMNOTA FROM TGFCAB WHERE NUMNOTA = TO_CHAR(:NEW.NUMNOTA)
  AND CODPARC = TO_CHAR(:NEW.CODPARC);


  IF( V_NUMNOTA > 0

  )
   THEN 

   RAISE_APPLICATION_ERROR (
         -20101,
         'Número da nota já consta no sistema!'); 


  END IF;


END;