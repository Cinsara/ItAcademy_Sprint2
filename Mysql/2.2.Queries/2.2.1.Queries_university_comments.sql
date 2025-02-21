USE universidad;

# 1. Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.

SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;

# 2. Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.

SELECT apellido1, apellido2, nombre FROM persona WHERE telefono = NULL;

# 3. Retorna el llistat dels alumnes que van néixer en 1999.

SELECT * FROM persona WHERE fecha_nacimiento = 1999;

# 4. Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.

SELECT * FROM persona WHERE tipo = 'profesor' AND nif LIKE 'K%';

# 5. Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.

SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

# 6. Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.

SELECT per.apellido1 AS primer_apellido, per.apellido2 AS segundo_apellido, per.nombre AS nombre, dep.nombre AS departamento FROM profesor p JOIN persona per ON p.id_profesor = per.id JOIN departamento dep ON p.id_departamento = dep.id ORDER BY per.apellido1 ASC, per.apellido2 ASC, per.nombre ASC;

# 7. Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.

SELECT a.nombre AS asignatura, c.anyo_inicio, c.anyo_fin FROM persona p JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno JOIN curso_escolar c ON am.id_curso_escolar = c.id JOIN asignatura a ON am.id_asignatura = a.id WHERE p.tipo = 'alumno' AND p.nif = '26902806M';

# 8. Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).

SELECT DISTINCT d.nombre AS departamento FROM departamento d JOIN profesor p ON d.id = p.id_departamento JOIN asignatura a ON a.id_profesor = p.id_profesor JOIN grado g ON a.id_grado = g.id WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

# 9. Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.

SELECT DISTINCT per.nombre, per.apellido1, per.apellido2, per.nif FROM persona per JOIN alumno_se_matricula_asignatura alm ON per.id = alm.id_alumno WHERE alm.id_curso_escolar = '2018/2019';

-- Consultes LEFT JOIN i RIGHT JOIN

# 1. Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.

SELECT per.nombre, per.apellido1, per.apellido2, d.nombre AS departamento FROM persona per LEFT JOIN profesor prof ON per.id = prof.id_profesor LEFT JOIN departamento d ON d.id = prof.id_departamento WHERE per.tipo = 'profesor' ORDER BY d.nombre ASC, per.apellido1 ASC, per.apellido2 ASC, per.nombre ASC;

# 2. Retorna un llistat amb els professors/es que no estan associats a un departament.

SELECT per.nombre FROM persona per LEFT JOIN profesor prof ON per.id = prof.id_profesor WHERE per.tipo = 'profesor' AND prof.id_departamento IS NULL;

# 3. Retorna un llistat amb els departaments que no tenen professors/es associats.

SELECT d.nombre FROM departamento d LEFT JOIN profesor prof ON d.id = prof.id_departamento WHERE prof.id_departamento IS NULL;

# 4. Retorna un llistat amb els professors/es que no imparteixen cap assignatura.

SELECT p.nombre from persona p LEFT JOIN profesor prof ON p.id = prof.id_profesor LEFT JOIN asignatura a ON prof.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL AND p.tipo ='profesor';

# 5. Retorna un llistat amb les assignatures que no tenen un professor/a assignat.

SELECT a.nombre FROM asignatura a LEFT JOIN persona p ON a.id_profesor = p.id WHERE a.id_profesor IS NULL;

# 6. Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.

SELECT DISTINCT d.nombre FROM departamento d LEFT JOIN profesor prof ON d.id = prof.id_departamento LEFT JOIN asignatura a ON  prof.id_profesor = a.id_profesor WHERE a.id IS NULL; 

-- Consultes resum

# 1. Retorna el nombre total d'alumnes que hi ha.

SELECT COUNT(nombre) FROM persona WHERE tipo = 'alumno';

# 2. Calcula quants alumnes van néixer en 1999.

SELECT COUNT(fecha_nacimiento) FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento LIKE '1999%';

# 3. Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.

SELECT d.nombre AS departamento, COUNT(prof.id_profesor) AS profesores_en_total FROM departamento d JOIN profesor prof ON d.id = prof.id_departamento GROUP BY prof.id_departamento ORDER by profesores_en_total DESC;

# 4. Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.

SELECT d.nombre, COUNT(prof.id_profesor) AS profesores_en_total FROM departamento d LEFT JOIN profesor prof ON d.id = prof.id_departamento GROUP BY d.id ORDER BY profesores_en_total DESC;

# 5. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.

SELECT g.nombre, COUNT(a.id) AS total_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.id ORDER BY total_asignaturas DESC; 