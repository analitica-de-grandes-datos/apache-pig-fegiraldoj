/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

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

subset = FOREACH data GENERATE SUBSTRING(col_d,0,4) AS anio;
group_cols = GROUP subset BY anio;
count_cols = FOREACH group_cols GENERATE group, COUNT(subset);
STORE count_cols INTO 'output' USING PigStorage (',');
