/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

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

group_cols = GROUP data by(col_a);
count_cols = FOREACH group_cols GENERATE group, COUNT(data);
STORE count_cols INTO 'output'  USING PigStorage (',');