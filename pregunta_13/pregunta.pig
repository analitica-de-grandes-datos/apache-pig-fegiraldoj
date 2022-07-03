/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT
       color
   FROM 
       u 
   WHERE 
       color 
   LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig


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

subset = FOREACH data GENERATE col_e;
filter_cols = FILTER subset BY (col_e MATCHES '.*b.*');
STORE filter_cols INTO 'output' USING PigStorage (',');

