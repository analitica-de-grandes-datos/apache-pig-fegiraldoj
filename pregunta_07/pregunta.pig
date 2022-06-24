/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' USING PigStorage('\t')
  AS (
        col_a:chararray,
        col_b:bag{t: tuple(p:chararray)},
        col_c:map[]

);

subset = FOREACH data GENERATE col_a, SIZE(col_b) AS col_b, SIZE(col_c) AS col_c;
order_cols = ORDER subset BY col_a ASC, col_b ASC, col_c ASC;
STORE order_cols INTO 'output' USING PigStorage (',');