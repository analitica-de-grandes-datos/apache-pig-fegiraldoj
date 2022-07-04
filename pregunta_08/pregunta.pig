/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

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

subset = FOREACH data GENERATE FLATTEN(col_b) AS col_b, FLATTEN(col_c) AS col_c;
group_cols = GROUP subset BY (col_b, col_c);
count = FOREACH group_cols GENERATE group, COUNT(subset);
STORE count INTO 'output' USING PigStorage (',');
