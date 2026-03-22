Create Table Carrera (
    ID_Carrera INT PRIMARY KEY,
    Nombre_Carrera VARCHAR(100) NOT NULL,
    Duracion_Semestres INT NOT NULL
);

INSERT INTO Carrera VALUES (1, 'Ingeniería en Sistemas Computacionales', 10);
INSERT INTO Carrera VALUES (2, 'Licenciatura en Psicología Clínica', 9);
INSERT INTO Carrera VALUES (3, 'Ingeniería Civil', 10);
INSERT INTO Carrera VALUES (4, 'Licenciatura en Mercadotecnia Internacional', 8);
INSERT INTO Carrera VALUES (5, 'Licenciatura en Derecho Corporativo', 10);
select * from Carrera;

CREATE TABLE Estudiante (
    ID_Estudiante INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Correo VARCHAR(100) UNIQUE,
    ID_Carrera INT,
    FOREIGN KEY (ID_Carrera) REFERENCES Carrera(ID_Carrera)
);  

INSERT INTO Estudiante VALUES (
1, 'Mateo', 'Valenzuela', 'mateo.valenzuela@universidad.edu', 1);
INSERT INTO Estudiante VALUES (
2, 'Valentina', 'Fuentes', 'valentina.fuentes@universidad.edu', 1);
INSERT INTO Estudiante VALUES (
3, 'Santiago', 'Cordero', 'santiago.cordero@universidad.edu', 2);
INSERT INTO Estudiante VALUES (
4, 'Luciana', 'Paredes', 'luciana.paredes@universidad.edu', 3);
INSERT INTO Estudiante VALUES (
5, 'Emiliano', 'Ojeda', 'emiliano.ojeda@universidad.edu', 4);

select * from Estudiante;

CREATE TABLE Curso (
    ID_Curso INT PRIMARY KEY,
    Nombre_Curso VARCHAR(100) NOT NULL,
    Creditos INT NOT NULL
);

INSERT INTO Curso VALUES (1, 'Fundamentos de Programación', 4);
INSERT INTO Curso VALUES (2, 'Bases de Datos Relacionales', 4);
INSERT INTO Curso VALUES (3, 'Psicología del Desarrollo', 3);
INSERT INTO Curso VALUES (4, 'Mecánica de Materiales', 5);
INSERT INTO Curso VALUES (5, 'Derecho Constitucional', 4);

select * from Curso;

CREATE TABLE Matricula (
    ID_Matricula INT PRIMARY KEY,
    ID_Estudiante INT,
    ID_Curso INT,
    Fecha_Matricula DATE NOT NULL,
    Nota DECIMAL(4,2) NULL,
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiante(ID_Estudiante),
    FOREIGN KEY (ID_Curso) REFERENCES Curso(ID_Curso)
);

INSERT INTO Matricula VALUES (1, 1, 1, '2025-08-15', 87.5);
INSERT INTO Matricula VALUES (2, 1, 2, '2025-08-15', 92.0);
INSERT INTO Matricula VALUES (3, 2, 1, '2025-08-16', 78.0);
INSERT INTO Matricula VALUES (4, 3, 3, '2025-08-16', 95.5);
INSERT INTO Matricula VALUES (5, 4, 4, '2025-08-17', 81.0);

select * from Matricula;

--Null significa que el campo puede quedar vacío es decir sin un valor
--Not Null significa que el campo siempre debe tener un valor

SELECT * FROM Estudiante 
WHERE ID_Carrera = 1;

SELECT Curso.ID_Curso, Curso.Nombre_Curso, Curso.Creditos, Matricula.Fecha_Matricula, Matricula.Nota
FROM Curso
INNER JOIN Matricula ON Curso.ID_Curso = Matricula.ID_Curso
WHERE Matricula.ID_Estudiante = 1;
SELECT 
    Estudiante.ID_Estudiante,Estudiante.Nombre, Estudiante.Apellido, Estudiante.Correo, Carrera.Nombre_Carrera, Carrera.Duracion_Semestres
FROM Estudiante
INNER JOIN Carrera ON Estudiante.ID_Carrera = Carrera.ID_Carrera

SELECT Estudiante.Nombre, Estudiante.Apellido, Curso.Nombre_Curso, Matricula.Nota
FROM Matricula
INNER JOIN Estudiante ON Matricula.ID_Estudiante = Estudiante.ID_Estudiante
INNER JOIN Curso ON Matricula.ID_Curso = Curso.ID_Curso
WHERE Matricula.Nota > 80;

SELECT * FROM Estudiante WHERE Nombre LIKE '%Juan%';

DELETE FROM Matricula WHERE ID_Estudiante = 1;

UPDATE Matricula 
SET Nota = 95.0 
WHERE ID_Estudiante = 1;
 