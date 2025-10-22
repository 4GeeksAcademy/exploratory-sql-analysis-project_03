SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1 Cuáles son las primeras 10 observaciones registradas?;

SELECT * FROM observations LIMIT 10;

-- MISSION 2 ¿Qué identificadores de región (region_id) aparecen en los datos?;
-- Your query here;

SELECT DISTINCT region_id FROM Observations;

-- MISSION 3 ¿Cuántas especies distintas (species_id) se han observado?
-- Combina COUNT con DISTINCT para no contar duplicados.;
-- Your query here;

SELECT COUNT (DISTINCT species_id) FROM observations;


-- MISSION 4
--¿Cuántas observaciones hay para la región con region_id = 2?;
--Aplica una condición con WHERE.;
-- Your query here;

SELECT COUNT (region_id) FROM observations WHERE region_id = 2;

-- MISSION 5;
--¿Cuántas observaciones se registraron el día 1998-08-08?;
--Filtra por fecha exacta usando igualdad.;
-- Your query here;

SELECT COUNT (*) FROM observations WHERE observation_date = '1998-08-08';

-- MISSION 6;
--Cuál es el region_id con más observaciones?;
--Agrupa por región y cuenta cuántas veces aparece cada una.;
-- Your query here;

SELECT *, COUNT(*) AS apariciones FROM observations GROUP BY region_id ORDER BY Apariciones DESC LIMIT 1;

-- MISSION 7;
--¿Cuáles son los 5 species_id más frecuentes?;
--Agrupa, ordena por cantidad descendente y limita el resultado.;
-- Your query here;

SELECT species_id, COUNT(*) AS frecuencia from observations GROUP BY species_id ORDER BY frecuencia DESC LIMIT 5;


-- MISSION 8
--¿Qué especies (species_id) tienen menos de 5 registros?
--Agrupa por especie y usa HAVING para aplicar una condición.
--Your query here;

SELECT species_id, COUNT(*) AS cantidad from observations GROUP BY species_id HAVING COUNT(*) < 5 LIMIT 5;

-- MISSION 9
--¿Qué observadores (observer) registraron más observaciones?
--Agrupa por el nombre del observador y cuenta los registros.
--Your query here;

SELECT observer, COUNT(*) AS observaciones FROM observations GROUP BY observer ORDER BY observaciones desc;   

-- MISSION 10;
--Muestra el nombre de la región (regions.name) para cada observación.;
--Relaciona observations con regions usando region_id.;
--Your query here;

SELECT regions.name, regions.id, observations.* FROM observations JOIN regions on regions.id = observations.region_id;

-- MISSION 11;
--Muestra el nombre científico de cada especie registrada (species.scientific_name).
--Relaciona observations con species usando species_id.
--Your query here;

SELECT species.scientific_name, observations.* FROM species JOIN observations ON species.id = observations.species_id;

-- MISSION 12;
--¿Cuál es la especie más observada por cada región?
--Agrupa por región y especie, y ordena por cantidad.
--Your query here;

SELECT 
    species.common_name, 
    regions.name, 
    COUNT (*) AS Cantidad
FROM Observations 
join species ON Observations.species_id = Species.id 
JOIN regions ON Observations.region_id = Regions.id
GROUP BY regions.name, species.common_name 
ORDER BY regions.name, Cantidad DESC;

-- MISSION 13;
--Inserta una nueva observación ficticia en la tabla observations.
--Asegúrate de incluir todos los campos requeridos por el esquema.

INSERT INTO Observations (species_id, region_id, observer, observation_date, latitude, longitude, count) VALUES (4, 2, 'obsr456129', '2025-10-23', -43.567321, 120.65371, 2);

