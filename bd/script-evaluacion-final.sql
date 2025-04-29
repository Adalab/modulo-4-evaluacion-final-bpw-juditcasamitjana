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

CREATE TABLE driver_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    driver_id INT NOT NULL,
    age INT,
    photo_driver VARCHAR(255),
    photo_car VARCHAR(255),
    photo_helmet2025 VARCHAR(255),
    FOREIGN KEY (driver_id) REFERENCES drivers(id)
);

INSERT INTO driver_info (driver_id, age, photo_driver, photo_car, photo_helmet2025)
VALUES
	(1, 23, 'https://media.formula1.com/image/upload/f_auto,c_limit,q_auto,w_1320/content/dam/fom-website/drivers/2025Drivers/piastri', 'https://media.formula1.com/image/upload/f_auto,c_limit,w_1440,q_auto/f_auto,c_fill,q_auto,w_1320,t_16by9North,g_faces,ar_16:9/trackside-images/2025/Formula_1_Testing_in_Bahrain___Day_3/2202523504', 'https://media.formula1.com/image/upload/f_auto,c_limit,q_auto,w_1024/fom-website/manual/Helmets2025/piastri'),
    (2, 27, 'https://media.formula1.com/image/upload/f_auto,c_limit,q_auto,w_1320/content/dam/fom-website/drivers/2025Drivers/russell', 'https://media.formula1.com/image/upload/f_auto,c_limit,w_1440,q_auto/f_auto,c_fill,q_auto,w_1320,t_16by9South,g_faces,ar_16:9/trackside-images/2025/Formula_1_Testing_in_Bahrain___Day_3/2202532072','https://media.formula1.com/image/upload/f_auto,c_limit,q_auto,w_1024/fom-website/manual/Helmets2025/russell'),
	(3, 25, 'https://media.formula1.com/image/upload/f_auto,c_limit,q_auto,w_1320/content/dam/fom-website/drivers/2025Drivers/norris', 'https://media.formula1.com/image/upload/f_auto,c_limit,w_1440,q_auto/f_auto,c_fill,q_auto,w_1320,t_16by9Centre,g_faces,ar_16:9/trackside-images/2025/Formula_1_Testing_in_Bahrain___Day_3/2202439875', 'https://media.formula1.com/image/upload/f_auto,c_limit,q_auto,w_1024/fom-website/manual/Helmets2025/norris'),
    (4, 27, 'https://media.formula1.com/image/upload/f_auto,c_limit,q_auto,w_1320/content/dam/fom-website/drivers/2025Drivers/leclerc', 'https://media.formula1.com/image/upload/f_auto,c_limit,w_1440,q_auto/f_auto,c_fill,q_auto,w_1320,t_16by9North,g_faces,ar_16:9/trackside-images/2025/Formula_1_Testing_in_Bahrain___Day_3/2202490999', 'https://media.formula1.com/image/upload/f_auto,c_limit,q_auto,w_1024/fom-website/manual/Helmets2025/leclerc'),
    (5, 40, 'https://media.formula1.com/image/upload/f_auto,c_limit,q_auto,w_1320/content/dam/fom-website/drivers/2025Drivers/hamilton', 'https://media.formula1.com/image/upload/f_auto,c_limit,w_1440,q_auto/f_auto,c_fill,q_auto,w_1320,t_16by9South,g_faces,ar_16:9/trackside-images/2025/Formula_1_Testing_in_Bahrain___Day_3/2202525357', 'https://media.formula1.com/image/upload/f_auto,c_limit,q_auto,w_1024/fom-website/manual/Helmets2025/hamilton'),
    (6, 27, 'https://media.formula1.com/image/upload/f_auto,c_limit,q_auto,w_1320/content/dam/fom-website/drivers/2025Drivers/verstappen', 'https://media.formula1.com/image/upload/f_auto,c_limit,w_1440,q_auto/f_auto,c_fill,q_75,w_1320,g_faces,ar_16:9/content/dam/fom-website/manual/DriverGalleries2023/Verstappen/verstappen-miami-race', 'https://media.formula1.com/image/upload/f_auto,c_limit,q_auto,w_1024/fom-website/manual/Helmets2025/verstappen'),
    (7, 29, 'https://media.formula1.com/image/upload/f_auto,c_limit,q_auto,w_1320/content/dam/fom-website/drivers/2025Drivers/gasly', 'https://media.formula1.com/image/upload/f_auto,c_limit,w_1440,q_auto/f_auto,c_fill,q_auto,w_1320,t_16by9Centre,g_faces,ar_16:9/trackside-images/2025/Formula_1_Testing_in_Bahrain___Day_2/2202231035', 'https://media.formula1.com/image/upload/f_auto,c_limit,q_auto,w_1024/fom-website/manual/Helmets2025/gasly'),
    (8, 28, 'https://media.formula1.com/image/upload/f_auto,c_limit,q_auto,w_1320/content/dam/fom-website/drivers/2025Drivers/ocon', 'https://media.formula1.com/image/upload/f_auto,c_limit,w_1440,q_auto/f_auto,c_fill,q_auto,w_1320,t_16by9North,g_faces,ar_16:9/trackside-images/2025/Formula_1_Testing_in_Bahrain___Day_3/2202523432', 'https://media.formula1.com/image/upload/f_auto,c_limit,q_auto,w_1024/fom-website/manual/Helmets2025/ocon'),
    (9, 24, 'https://media.formula1.com/image/upload/f_auto,c_limit,q_auto,w_1320/content/dam/fom-website/drivers/2025Drivers/tsunoda', 'https://media.formula1.com/image/upload/f_auto,c_limit,w_1440,q_auto/f_auto,c_fill,q_75,w_1320,g_faces,ar_16:9/content/dam/fom-website/manual/DriverAndTeamImages/2024/2048375559_16by9Centre', 'https://media.formula1.com/image/upload/f_auto,c_limit,q_auto,w_1024/fom-website/manual/Helmets2025/tsunoda'),
    (10, 18, 'https://media.formula1.com/image/upload/f_auto,c_limit,q_auto,w_1320/content/dam/fom-website/drivers/2025Drivers/bearman', 'https://media.formula1.com/image/upload/f_auto,c_limit,w_1440,q_auto/f_auto,c_fill,q_auto,w_1320,t_16by9Centre,g_faces,ar_16:9/trackside-images/2025/Formula_1_Testing_in_Bahrain___Day_3/2202485705', 'https://media.formula1.com/image/upload/f_auto,c_limit,q_auto,w_1024/fom-website/manual/Helmets2025/bearman');

