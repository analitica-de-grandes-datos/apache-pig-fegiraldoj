/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

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

subset = FOREACH data GENERATE FLATTEN(col_c) AS col_c;
group_cols = GROUP subset BY col_c;
count = FOREACH group_cols GENERATE group, COUNT(subset);
STORE count INTO 'output' USING PigStorage (',');


