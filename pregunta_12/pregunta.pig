/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Obtenga los apellidos que empiecen por las letras entre la 'd' y la 'k'. La 
salida esperada es la siguiente:

  (Hamilton)
  (Holcomb)
  (Garrett)
  (Fry)
  (Kinney)
  (Klein)
  (Diaz)
  (Guy)
  (Estes)
  (Jarvis)
  (Knight)

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

subset = FOREACH data GENERATE col_c;
filter_cols = FILTER subset BY (col_c >= 'D*' AND col_c > 'L*');
STORE filter_cols INTO 'output' USING PigStorage (',');
