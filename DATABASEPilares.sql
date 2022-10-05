CREATE DATABASE PILARES;
USE PILARES;
CREATE TABLE profesor(
  idProfesor INT UNSIGNED AUTO_INCREMENT,
  nombre VARCHAR(20),
  apellidoM VARCHAR(20),
  apellidoP VARCHAR(20),
  programa VARCHAR(20),
  escolaridad VARCHAR(20),
  carrera VARCHAR(30),
  PRIMARY KEY(idProfesor)
);

CREATE TABLE alumno(
  idAlumno INT UNSIGNED AUTO_INCREMENT,
  nombre VARCHAR(30),
  apellidoM VARCHAR(20),
  apellidoP VARCHAR(20),
  fechaNac VARCHAR(20),
  escolaridad VARCHAR(20),
  PRIMARY KEY (idAlumno)
);

CREATE TABLE taller(
  idTaller INT UNSIGNED AUTO_INCREMENT,
  nombre VARCHAR(20),
  salon VARCHAR(20),
  capacidad VARCHAR(20),
  idProfesor INT UNSIGNED, 
  PRIMARY KEY (idTaller),
  FOREIGN KEY (idProfesor) REFERENCES profesor(idProfesor)
);

CREATE TABLE alumno_asistir_taller(
  idTaller INT UNSIGNED,
  idAlumno INT UNSIGNED,
  fecha DATE,
  PRIMARY KEY (idTaller, idAlumno),
  FOREIGN KEY (idTaller) REFERENCES taller(idTaller),
  FOREIGN KEY (idAlumno) REFERENCES alumno(idAlumno)

);
  
INSERT INTO profesor(nombre,apellidoP,apellidoM,programa,escolaridad,carrera) VALUES
("Alejandro", "Mendez", "Mendez","CiberEscuela","Licenciatura","Biologia"),
("Arnulfo", "Carrera", "García","CiberEscuela","Licenciatura","Física"),
("Bernardo", "López","Pérez","CiberEscuela","Maestría","Pedagogía"),
("Carlos", "Lozano", "Ruiz","CiberEscuela","Maestría","Psicología" ),
("Carlos", "Rodriguez", "Guzman","Autonomía Económica","Bachillerato",NULL),
("César","Noriega", "Morales","Autonomía Económica","Bachillerato",NULL),
("Lilia","López","Carmona","Autonomía Económica","Licenciatura",""),
("Eliza", "Paredes", "Savala","Ponte Pila","Licenciatura","Educación Física"),
("María","Vásquez","Rosales","Ponte Pila","Licenciatura","Biologia"),
("Mario", "Calderón","Ramírez","Ponte Pila","Bachillerato",Null),
("Sandra","Reyes","Mendez","Ponte Pila","Licenciatura","Educación Física"),
("Mario", "Ayala","Rosales","CiberEscuela","Ingenieria","Computación"),
("Laura","Carrizoza","Elizalde","CiberEscuela","Ingenieria","Sistemas Computacionales"),
("Justino","Morán","Mendez","Autonomía Económica","Bachillerato",NULL);

INSERT INTO alumno(nombre,apellidoM,apellidoP,fechaNac,escolaridad) VALUES
("Marco","Zarate","Peña","2006-01-20","Bachillerato"),
("Esther","Fernandez","Mendoza","2005-03-12","Bachillerato"),
("Leticia", "Ruiz","Colin","1990-10-10","Licenciatura"),
("Atziri","Rodriguez","López","2010-03-02","Secundaria"),
("Eduardo","Navarro","Pérez","2013-03-24","Primaria"),
("Silvia","Diaz","Rodriguez","2010-05-20","Secundaria"),
("Marisol","Arcos","Trinidad","2008-12-12","Secundaria"),
("Lilia","López","Contreras","1988-10-04","Licenciatura"),
("Gustavo","Reyes","Pérez","1980-11-12","Secundaria"),
("Mario","Torres","Carrizoza","2010-10-12","Primaria"),
("Maria","Contreras","Augusto","2000-04-21","Secundaria"),
("Miguel","Quiroz","Gutierrez","2010-08-30","Secundaria"),
("Jessica","Pérez","Miranda","2013-05-26","Primaria"),
("Daniel","Zarate","Morales","2015-11-12","Primaria"),
("Lourdes","Rosas","Cuevas","1988-03-04","Licenciatura"),
("Gabriel","Ramos","Paredes","1980-10-12","Secundaria"),
("Monica","Tinajero","Cabral","2010-01-12","Primaria"),
("Marisol","Coral","Pérez","2001-07-21","Secundaria"),
("Marcos","Quintero","Arcos","2011-04-30","Secundaria"),
("Alexis","Morales","Rodriguez","2014-05-23","Primaria"),
("David","Colorado","Pérez","2015-05-22","Primaria"),
("Lilia","López","Contreras","1988-10-04","Licenciatura"),
("Gabriela","Morales","Pérez","1980-11-12","Secundaria"),
("Miguel","Tinoco","Carrizoza","2016-10-12","Primaria"),
("Monica","Colin","Arenas","2000-05-21","Secundaria"),
("Marcos","Quintero","Arcos","2010-04-30","Secundaria"),
("Alejandro","Moreno","Mendoza","2013-05-23","Primaria"),
("David","Zamudio","Pérez","2015-05-22","Primaria"),
 ("Kevin","Zamudio","Pérez","2013-06-12","Primaria");

INSERT INTO taller(nombre,salon,capacidad,idProfesor)
VALUES ("Prepa en línea","C1",20,1),
("INEA","C2",25,1),
("Matemáticas","C1",25,2),
("Español","C2",25,2),
("Ígles","C4",25,1),
("Computación","CiberEscuela",20,12),
("Excel","CiberEscuela",20,13),
("Programación","CiberEscuela",20,13),
("Base de datos","CiberEscuela",20,12),
("Electricidad","C3",23,5),
("Carpintería","C4",25,6),
("Repostería","C5",26,6);

INSERT INTO alumno_asistir_taller(idTaller,idAlumno)VALUES (1,1),(1,2),(2,1),(2,3),(3,1),(4,2),(4,3),(4,1),(5,1),(6,1),(7,1),(8,2),(9,3),(10,2),(10,3),(11,2),(11,3),(11,4);
USE PILARES;
SELECT profesor.nombre,profesor.carrera,taller.nombre
FROM profesor LEFT JOIN taller
ON profesor.idProfesor=taller.idProfesor
WHERE profesor.escolaridad="licenciatura";
