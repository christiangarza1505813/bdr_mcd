
DELIMITER //
#Declaramos la funcion "calculate_correlation" que toma dos parametros de entrada, data1  y data2
#ambos en formato JSON. 
CREATE FUNCTION calculate_correlation(data1 JSON, data2 JSON)
RETURNS FLOAT DETERMINISTIC
begin
#Declaramos las variables a utilizar en su mayoria flotantes (en caso de que los datos incluyan decimales).
    DECLARE sum_data1 FLOAT;
    DECLARE sum_data2 FLOAT;
    DECLARE sum_data1_squared FLOAT;
    DECLARE sum_data2_squared FLOAT;
    DECLARE sum_data1_data2 FLOAT;
    DECLARE n INT;
    DECLARE correlation FLOAT;
    DECLARE i INT;

    SET sum_data1 = 0;
    SET sum_data2 = 0;
    SET sum_data1_squared = 0;
    SET sum_data2_squared = 0;
    SET sum_data1_data2 = 0;
# La variable i empezara de 1, ya que sera nuestro parametro de inicio en el loop de while. 
    SET i = 1;
# La variable n tomara la longitud de los datos para establecer cuantas veces se correra el ciclo de while. 
   # En este caso se asume que el largo de data1= el largo de data2.
    SET n = JSON_LENGTH(data1);

    WHILE i <= n DO
#En esta linea calculamos la sumatoria del primer parametro de entrada. en json_extract utilizamos i-1 para que sea 0 dado que
#el primer valor se ecuentra en la posición 0 y la variable i empieza desde 1. 
        SET sum_data1 = sum_data1 +JSON_EXTRACT(data1, CONCAT('$[', i - 1, ']'));
#En esta linea calculamos la sumatoria del segundo parametro de entrada.
        SET sum_data2 = sum_data2 + JSON_EXTRACT(data2, CONCAT('$[', i - 1, ']'));
#En esta linea calculamos la sumatoria del primer parametro de entrada al cuadrado con la función pow.
        SET sum_data1_squared = sum_data1_squared + POW(JSON_EXTRACT(data1, CONCAT('$[', i - 1, ']')), 2);
#En esta linea calculamos la sumatoria del segundo parametro de entrada al cuadrado con la función pow.
        SET sum_data2_squared = sum_data2_squared + POW(JSON_EXTRACT(data2, CONCAT('$[', i - 1, ']')), 2);
#En esta linea calculamos la sumatoria de x*y
        SET sum_data1_data2 = sum_data1_data2 + JSON_EXTRACT(data1, CONCAT('$[', i - 1, ']')) * JSON_EXTRACT(data2, CONCAT('$[', i - 1, ']'));

		SET i = i + 1;
    END WHILE;
#finalmente calculamos la correlación de ambas variables con la formula de correlación y las sumatorias correspondientes. 
    SET correlation = (n * sum_data1_data2 - sum_data1 * sum_data2) / SQRT((n * sum_data1_squared - POW(sum_data1, 2)) * (n * sum_data2_squared - POW(sum_data2, 2)));

    RETURN correlation;
END //

DELIMITER ;
#drop function calculate_correlation;
   
       
DELIMITER //
#La siguiente funcion tiene una estructura muy similar a la función anterior por lo que comentaré solo las diferencias. 
CREATE FUNCTION calculate_reglin(data1 JSON, data2 JSON)
RETURNS JSON DETERMINISTIC
BEGIN
    DECLARE sum_data1 FLOAT;
    DECLARE sum_data2 FLOAT;
    DECLARE sum_data1_squared FLOAT;
    DECLARE sum_data1_data2 FLOAT;
    DECLARE n INT;
    DECLARE part1 FLOAT;
    declare inters FLOAT;
    DECLARE i INT;
	DECLARE result_1 JSON;

    SET sum_data1 = 0;
    SET sum_data2 = 0;
    SET sum_data1_squared = 0;
    SET sum_data1_data2 = 0;
    SET i = 1;
#En este caso tambien asusimos que la longitud de ambos parametros de entrada, es igual. 
    SET n = JSON_LENGTH(data1);

    WHILE i <= n DO
        SET sum_data1 = sum_data1 + JSON_EXTRACT(data1, CONCAT('$[', i - 1, ']'));
        SET sum_data2 = sum_data2 + JSON_EXTRACT(data2, CONCAT('$[', i - 1, ']'));
        SET sum_data1_squared = sum_data1_squared + POW(JSON_EXTRACT(data1, CONCAT('$[', i - 1, ']')), 2);
        SET sum_data1_data2 = sum_data1_data2 + JSON_EXTRACT(data1, CONCAT('$[', i - 1, ']')) * JSON_EXTRACT(data2, CONCAT('$[', i - 1, ']'));
        SET i = i + 1;
    END WHILE;
#Esta linea calcula la pendiente de la recta que utiliza nuestro modelo lineal
    SET part1 = (n * sum_data1_data2 - sum_data1 * sum_data2) / (n * sum_data1_squared - POW(sum_data1, 2));
#Esta linea calcula la intersección de la recta 
   SET inters = (sum_data2 - part1 * sum_data1) / n;
#finalmente obtenemos los datos de la ecuación de la recta del modelo lineal  
    SET result_1 = JSON_OBJECT('part1', part1, 'inters', inters);

    RETURN result_1;
END //

DELIMITER ;
#show create function calculate_correlation;
#drop function calculate_reglin;


#utilizaremos los siguientes datos de prueba (deben tener la misma longitud)
SET @temperatures = CAST('[51, 34, 39, 42, 47, 56, 42, 36, 39, 42, 48, 56, 52, 56, 68, 71, 75, 78, 62, 66, 68, 72, 75, 79]' AS JSON);
SET @consumption = CAST('[55, 49, 39, 47, 40, 43, 50, 44, 42, 42, 38, 40, 41, 46, 44, 71, 62, 73, 63, 64, 60, 74, 80, 75]' AS JSON);

#el primer ejemplo nos arroja un valor de 0.79 lo que nos dice que la relación entre la variable de temperaturas y consumo es fuerte y positiva. 
SELECT calculate_correlation(@temperatures, @consumption) AS correlation;
#este segundo ejemplo nos menciona los parametros de la ecuacion del modelo lineal
#es decir, consumo = 0.744244*temperatura + 11.42889
SELECT calculate_reglin(@temperatures, @consumption) AS regresion_lineal;





