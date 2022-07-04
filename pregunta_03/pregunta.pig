/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' USING PigStorage('\t')
  AS (
        col_a:chararray,
        col_b:chararray,
        col_c:int
  );

order_cols = ORDER data BY col_c ASC;
top_5 = LIMIT order_cols 5;
select_cols = FOREACH top_5 GENERATE col_c;
STORE select_cols INTO 'output' USING PigStorage (',');