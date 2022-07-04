/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código que genere la siguiente salida.

   Boyer,BOYER,boyer
   Coffey,COFFEY,coffey
   Conway,CONWAY,conway
   Crane,CRANE,crane
   Diaz,DIAZ,diaz
   Estes,ESTES,estes
   Fry,FRY,fry
   Garrett,GARRETT,garrett
   Guy,GUY,guy
   Hamilton,HAMILTON,hamilton
   Holcomb,HOLCOMB,holcomb
   Jarvis,JARVIS,jarvis
   Kinney,KINNEY,kinney
   Klein,KLEIN,klein
   Knight,KNIGHT,knight
   Noel,NOEL,noel
   Sexton,SEXTON,sexton
   Silva,SILVA,silva

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',')
  AS (
        col_a:chararray,
        col_b:chararray,
        col_c:chararray,
        col_d:chararray,
        col_e:chararray,
        col_f:int
);

subset = FOREACH data GENERATE col_c, UPPER(col_c) AS col_upper, LOWER(col_c) AS col_lower;
order_cols = ORDER subset BY col_c ASC;
STORE order_cols INTO 'output' USING PigStorage (',');
