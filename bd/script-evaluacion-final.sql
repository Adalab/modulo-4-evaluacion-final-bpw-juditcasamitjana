CREATE DATABASE f1_bahrain_2025;
USE f1_bahrain_2025;

CREATE TABLE drivers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    nationality VARCHAR(50),
    car_number INT UNIQUE,
    team VARCHAR(100)
);

CREATE TABLE bahrain_2025_results (
    position INT PRIMARY KEY,
    car_number INT,
    race_time VARCHAR(20),
    points INT,
    FOREIGN KEY (car_number) REFERENCES drivers(car_number)
);

INSERT INTO drivers (first_name, last_name, nationality, car_number, team) 
VALUES
	('Oscar', 'Piastri', '🇦🇺', 81, 'McLaren'),
	('George', 'Russell', '🇬🇧', 63, 'Mercedes'),
	('Lando', 'Norris', '🇬🇧', 4, 'McLaren'),
	('Charles', 'Leclerc', '🇲🇨', 16, 'Ferrari'),
	('Lewis', 'Hamilton', '🇬🇧', 44, 'Ferrari'),
	('Max', 'Verstappen', '🇳🇱', 1, 'Red Bull'),
	('Pierre', 'Gasly', '🇫🇷', 10, 'Alpine'),
	('Esteban', 'Ocon', '🇫🇷', 31, 'Haas'),
	('Yuki', 'Tsunoda', '🇯🇵', 22, 'Red Bull'),
	('Oliver', 'Bearman', '🇬🇧', 87, 'Haas');

INSERT INTO bahrain_2025_results (position, car_number, race_time, points) 
VALUES
	(1, 81, '1:35:39.435', 25),
	(2, 63, '+15.499', 18),
	(3, 4, '+16.273', 15),
	(4, 16, '+19.679', 12),
	(5, 44, '+27.993', 10),
	(6, 1, '+34.395', 8),
	(7, 10, '+36.002', 6),
	(8, 31, '+44.244', 4),
	(9, 22, '+45.061', 2),
	(10, 87, '+47.594', 1);
