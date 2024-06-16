-- Borra la base de datos si existe
DROP DATABASE IF EXISTS valorant;

-- Crea la base de datos
CREATE DATABASE valorant;

-- Usa la base de datos
USE valorant;


-- Crea las tablas Arma1, Arma2 y Arma3 para clasificar las armas
CREATE TABLE Arma1 (
    id_arma1 INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    tipo VARCHAR(100),
    precio INT,
    cadencia_fuego FLOAT,
    capacidad_cargador INT,
    danio_cabeza INT,
    danio_cuerpo INT,
    danio_piernas INT
) ENGINE = InnoDB;

CREATE TABLE Arma2 (
    id_arma2 INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    tipo VARCHAR(100),
    precio INT,
    cadencia_fuego FLOAT,
    capacidad_cargador INT,
    danio_cabeza INT,
    danio_cuerpo INT,
    danio_piernas INT
) ENGINE = InnoDB;

CREATE TABLE Arma3 (
    id_arma3 INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    tipo VARCHAR(100),
    precio INT,
    cadencia_fuego FLOAT,
    capacidad_cargador INT,
    danio_cabeza INT,
    danio_cuerpo INT,
    danio_piernas INT
) ENGINE = InnoDB;

-- Crea la tabla Personajes
CREATE TABLE Personajes (
    id_personaje INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    habilidad_1 VARCHAR(255),
    habilidad_2 VARCHAR(255),
    habilidad_3 VARCHAR(255),
    definitiva VARCHAR(255),
    descripcion TEXT,
    rol VARCHAR(100),
    nacionalidad VARCHAR(100),
    genero VARCHAR(50)
) ENGINE = InnoDB;

-- Crea la tabla Mapas
CREATE TABLE Mapas (
    id_mapa INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion TEXT,
    numero_sites INT
) ENGINE = InnoDB;

-- Crea la tabla Partidas
CREATE TABLE Partidas (
    id_partida INT AUTO_INCREMENT PRIMARY KEY,
    modo_juego VARCHAR(100),
    duracion TIME,
    resultado VARCHAR(50),
    puntuacion_final VARCHAR(10),
    id_mapa INT,
    id_personaje INT,
    id_arma1 INT,
    id_arma2 INT,
    id_arma3 INT,
    FOREIGN KEY (id_mapa) REFERENCES Mapas(id_mapa),
    FOREIGN KEY (id_personaje) REFERENCES Personajes(id_personaje),
    FOREIGN KEY (id_arma1) REFERENCES Arma1(id_arma1),
    FOREIGN KEY (id_arma2) REFERENCES Arma2(id_arma2),
    FOREIGN KEY (id_arma3) REFERENCES Arma3(id_arma3)
) ENGINE = InnoDB;

INSERT INTO Arma2 (nombre, tipo, precio, cadencia_fuego, capacidad_cargador, danio_cabeza, danio_cuerpo, danio_piernas)
VALUES
    ('Ghost', 'Pistola', 500, 6.75, 15, 105, 30, 25),
    ('Classic', 'Pistola', 0, 6.75, 12, 78, 26, 22),
    ('Sheriff', 'Pistola', 800, 4, 6, 160, 55, 47),
    ('Shorty', 'Escopeta', 300, 3.3, 2, 36, 12, 10),
    ('Frenzy', 'Pistola', 450, 10, 13, 156, 39, 33);
   
INSERT INTO Arma1 (nombre, tipo, precio, cadencia_fuego, capacidad_cargador, danio_cabeza, danio_cuerpo, danio_piernas)
VALUES
    ('Stinger', 'Subfusil', 1100, 18, 20, 67, 27, 23),
    ('Spectre', 'Subfusil', 1600, 13.33, 30, 160, 26, 22),
    ('Vandal', 'Rifle', 2900, 9, 25, 160, 40, 34),
    ('Phantom', 'Rifle', 2900, 11, 30, 156, 39, 33),
    ('Bulldog', 'Rifle', 2050, 9.15, 24, 160, 35, 30),
    ('Operator', 'Francotirador', 4700, 0.75, 5, 255, 150, 127),
    ('Ares', 'Rifle', 1600, 10, 50, 72, 30, 25),
    ('Odin', 'Rifle', 3200, 12, 100, 95, 38, 32),
    ('Judge', 'Escopeta', 1850, 3.5, 7, 34, 17, 14),
    ('Bucky', 'Escopeta', 850, 1.1, 5, 44, 22, 18),
    ('Guardian', 'Rifle', 2250, 6.5, 12, 195, 65, 49);

-- Inserta armas de tipo Escopeta en Armas y Arma3
INSERT INTO Arma3 (nombre, tipo, precio, cadencia_fuego, capacidad_cargador, danio_cabeza, danio_cuerpo, danio_piernas)
VALUES
    ('Cuchillo', 'Cuerpo', 0,1, 1, 150, 75, 50);

-- Inserta datos en la tabla Mapas
INSERT INTO Mapas (nombre, descripcion, numero_sites)
VALUES
    ('Bind', 'Bind tiene dos puntos de ataque y un objetivo que los defensores pueden defender desde varios ángulos.', 2),
    ('Lotus', 'Lotus tiene tres puntos de ataque, lo que permite estrategias de juego más variadas.', 3),
    ('Split', 'Split tiene dos pisos que los jugadores pueden utilizar para sorprender a sus oponentes.', 2),
    ('Icebox', 'Icebox es un mapa situado en una instalación de investigación abandonada en la región ártica, con múltiples niveles y pasillos estrechos.', 2),
    ('Ascent', 'Ascent es un mapa situado en una ciudad italiana con un diseño vertical que permite estrategias de juego creativas y variadas.', 2),
    ('Breeze', 'Breeze es un mapa situado en una isla tropical con amplios espacios abiertos y varias rutas de ataque y defensa.', 2);

-- Inserta datos en la tabla Personajes
INSERT INTO Personajes (nombre, habilidad_1, habilidad_2, habilidad_3, definitiva, descripcion, rol, nacionalidad, genero)
VALUES
    ('Jett', 'Corriente Ascendente', 'Cuchillas Vendaval', 'Rabia del Viento', 'Tormenta de Navajas', 'Jett es una maestra de la agilidad, que utiliza su rapidez para superar a sus oponentes.', 'Duelista', 'Coreana', 'Femenino'),
    ('Phoenix', 'Bola Caliente', 'Resplandor', 'Muro de Fuego', 'Fuego de la Gran Fénix', 'Phoenix es un duelista elemental que puede cuidarse a sí mismo o quemar a los enemigos.', 'Duelista', 'Británico', 'Masculino'),
    ('Sage', 'Orbe Curativo', 'Orbe de Lento', 'Orbe Barrera', 'Resurrección', 'Sage es una curandera que puede bloquear las líneas de visión de los enemigos y revivir a los compañeros de equipo.', 'Centinela', 'China', 'Femenino'),
    ('Breach', 'Falla Terrestre', 'Falla Celestial', 'Onda de Choque', 'Represión', 'Breach es un iniciador que puede abrir brechas en las defensas enemigas y desorientar a los oponentes.', 'Iniciador', 'Sueco', 'Masculino'),
    ('Brimstone', 'Incendiario', 'Estimulante', 'Campo de Humo', 'Orbital Strike', 'Brimstone es un líder de equipo táctico que puede bloquear áreas y proporcionar apoyo con sus habilidades.', 'Controlador', 'Estadounidense', 'Masculino'),
    ('Omen', 'Paranoia', 'Sombras Oscuras', 'Manto Tenebroso', 'Carga Desde Las Sombras', 'Omen es un manipulador de las sombras que puede desorientar a los enemigos y teletransportarse a través del mapa.', 'Controlador', 'Desconocida', 'Masculino'),
    ('Sova', 'Flecha Reveladora', 'Flecha Perforadora', 'Flecha de Choque', 'Ira del Cazador', 'Sova es un cazador experto que puede rastrear a los enemigos y proporcionar información vital a su equipo.', 'Iniciador', 'Ruso', 'Masculino'),
    ('Cypher', 'Trampa Cibernética', 'Cámara de Vigilancia', 'Dron de Vigilancia', 'Jaula Cibernética', 'Cypher es un espía maestro que puede controlar áreas y obtener información sobre la posición de los enemigos.', 'Centinela', 'Marroquí', 'Masculino'),
    ('Killjoy', 'Turret', 'Alarma de enjambre', 'Bomba de Nanoenjambre', 'Astillero', 'Killjoy es una ingeniera que puede controlar áreas y obstaculizar el avance enemigo con sus gadgets.', 'Centinela', 'Alemana', 'Femenino'),
    ('Reyna', 'Desafío', 'Curación', 'Orbe Cegador', 'Emperatriz', 'Reyna es una vampira de origen mexicano que puede absorber almas de enemigos derrotados para aumentar temporalmente su poder.', 'Duelista', 'Mexicana', 'Femenino');

-- Inserta datos en la tabla Partidas
INSERT INTO Partidas (modo_juego, duracion, resultado, puntuacion_final, id_mapa, id_personaje, id_arma1, id_arma2, id_arma3)
VALUES
    ('Competitivo', '0:25:30', 'Victoria', '13 a 12', 1, 5, 9, 1, 1),
    ('Competitivo', '0:28:45', 'Victoria', '13 a 9', 3, 7, 6, 2, 1),
    ('Competitivo', '0:22:15', 'Derrota', '8 a 13', 2, 4, 4, 3, 1),
    ('Competitivo', '0:30:00', 'Victoria', '13 a 8', 5, 8, 3, 1, 1),
    ('Competitivo', '0:27:00', 'Derrota', '9 a 13', 6, 9, 2, 1, 1),
    ('No Clasificatoria', '0:25:00', 'Victoria', '13 a 7', 1, 5, 9, 1, 1),
    ('No Clasificatoria', '0:22:20', 'Derrota', '7 a 13', 3, 7, 6, 2, 1),
    ('Competitivo', '0:28:10', 'Victoria', '13 a 11', 6, 9, 2, 1, 1),
    ('Competitivo', '0:29:20', 'Derrota', '7 a 13', 5, 8, 3, 1, 1),
    ('Competitivo', '0:26:30', 'Victoria', '13 a 10', 1, 5, 9, 1, 1),
    ('Competitivo', '0:27:45', 'Derrota', '8 a 13', 3, 7, 6, 2, 1),
    ('Competitivo', '0:24:55', 'Victoria', '13 a 9', 2, 4, 4, 3, 1),
    ('No Clasificatoria', '0:21:40', 'Derrota', '2 a 13', 2, 8, 3, 4, 1),
    ('Competitivo', '0:25:30', 'Derrota', '7 a 13', 4, 3, 5, 2, 1),
    ('Competitivo', '0:34:27', 'Victoria', '13 a 10', 1, 3, 9, 1, 1),
    ('Competitivo', '0:27:45', 'Derrota', '8 a 13', 3, 7, 6, 2, 1),
    ('Competitivo', '0:24:55', 'Victoria', '13 a 9', 2, 4, 4, 3, 1),
    ('Competitivo', '0:25:30', 'Derrota', '7 a 13', 4, 3, 5, 2, 1);

-- Aplicar restricciones a la tabla Partidas

ALTER TABLE Partidas

ADD CONSTRAINT fk_partidas_mapas
FOREIGN KEY (id_mapa) REFERENCES Mapas(id_mapa)
ON DELETE RESTRICT
ON UPDATE RESTRICT,

ADD CONSTRAINT fk_partidas_personajes
FOREIGN KEY (id_personaje) REFERENCES Personajes(id_personaje)
ON DELETE CASCADE
ON UPDATE RESTRICT,

ADD CONSTRAINT fk_partidas_arma1
FOREIGN KEY (id_arma1) REFERENCES Arma1(id_arma1)
ON DELETE RESTRICT
ON UPDATE RESTRICT,

ADD CONSTRAINT fk_partidas_arma2
FOREIGN KEY (id_arma2) REFERENCES Arma2(id_arma2)
ON DELETE RESTRICT
ON UPDATE RESTRICT,

ADD CONSTRAINT fk_partidas_arma3
FOREIGN KEY (id_arma3) REFERENCES Arma3(id_arma3)
ON DELETE RESTRICT
ON UPDATE RESTRICT;

-- Procedimiento InsertarArma1 y ActualizarMapa
DELIMITER //

CREATE PROCEDURE InsertarArma1 (
    IN p_nombre VARCHAR(255),
    IN p_tipo VARCHAR(100),
    IN p_precio INT,
    IN p_cadencia_fuego FLOAT,
    IN p_capacidad_cargador INT,
    IN p_danio_cabeza INT,
    IN p_danio_cuerpo INT,
    IN p_danio_piernas INT
)
BEGIN
    INSERT INTO Arma1 (nombre, tipo, precio, cadencia_fuego, capacidad_cargador, danio_cabeza, danio_cuerpo, danio_piernas)
    VALUES (p_nombre, p_tipo, p_precio, p_cadencia_fuego, p_capacidad_cargador, p_danio_cabeza, p_danio_cuerpo, p_danio_piernas);
END //


    CREATE PROCEDURE ActualizarMapa (
    IN p_id_mapa INT,
    IN p_nombre VARCHAR(255),
    IN p_descripcion TEXT,
    IN p_numero_sites INT
)
BEGIN
    UPDATE Mapas
    SET nombre = p_nombre,
        descripcion = p_descripcion,
        numero_sites = p_numero_sites
    WHERE id_mapa = p_id_mapa;
END //

-- Funciones ActualizarPrecioArma1, ActualizarPrecioArma2  y PartidasJugadasEnMapa
CREATE FUNCTION ActualizarPrecioArma1 (
    p_id_arma1 INT,
    p_nuevo_precio INT
) RETURNS BOOLEAN
BEGIN
    DECLARE rows_affected INT;
    UPDATE Arma1
    SET precio = p_nuevo_precio
    WHERE id_arma1 = p_id_arma1;
    
    SET rows_affected = ROW_COUNT();

    IF rows_affected > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END //



CREATE FUNCTION ActualizarPrecioArma2 (
    p_id_arma2 INT,
    p_nuevo_precio INT
) RETURNS BOOLEAN
BEGIN
    DECLARE rows_affected INT;
    UPDATE Arma2
    SET precio = p_nuevo_precio
    WHERE id_arma2 = p_id_arma2;
    
    SET rows_affected = ROW_COUNT();

    IF rows_affected > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END //

DELIMITER ;

CREATE FUNCTION PartidasJugadasEnMapa (
    p_id_mapa INT
) RETURNS INT
BEGIN
    DECLARE total_partidas INT;
    SELECT COUNT(*)
    INTO total_partidas
    FROM Partidas
    WHERE id_mapa = p_id_mapa;
    RETURN total_partidas;
END //

DELIMITER ;
