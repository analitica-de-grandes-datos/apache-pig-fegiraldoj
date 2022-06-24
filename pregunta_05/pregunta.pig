/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' USING PigStorage(',')
  AS (
        col_a:chararray,
        col_b:bag{t: tuple(p:int)},
        col_c:map[]

);

subset = FOREACH data GENERATE FLATTEN(col_b) AS col_b;
group_cols = GROUP subset BY col_b;
count = FOREACH group_cols GENERATE group, COUNT(subset);
STORE count INTO 'output' USING PigStorage (',');

