/*
Pregunta
===========================================================================

Ordene el archivo `data.tsv`  por letra y valor (3ra columna). Escriba el
resultado separado por comas.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

     >>> Escriba el codigo del mapper a partir de este punto <<<
*/

data = LOAD 'data.tsv' USING PigStorage('\t')
  AS (
        col_a:chararray,
        col_b:chararray,
        col_c:int
  );

order_cols = ORDER data BY col_a ASC, col_c ASC;
STORE order_cols INTO 'output'  USING PigStorage (',');