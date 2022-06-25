/*
Pregunta
===========================================================================

Para el archivo `data.csv` escriba una consulta en Pig que genere la 
siguiente salida:

  Vivian@Hamilton
  Karen@Holcomb
  Cody@Garrett
  Roth@Fry
  Zoe@Conway
  Gretchen@Kinney
  Driscoll@Klein
  Karyn@Diaz
  Merritt@Guy
  Kylan@Sexton
  Jordan@Estes
  Hope@Coffey
  Vivian@Crane
  Clio@Noel
  Hope@Silva
  Ayanna@Jarvis
  Chanda@Boyer
  Chadwick@Knight

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

subset = FOREACH data GENERATE CONCAT(col_b, '@', col_c);
STORE subset INTO 'output' USING PigStorage (',');
