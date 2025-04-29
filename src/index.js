const express = require("express");
const cors = require("cors");
const mysql = require("mysql2/promise");

const app = express();

async function getDBConnection() {
    const connection = await mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "@dalab",
        database: "f1_bahrain_2025", //DUDAAAAAAA
    });
    connection.connect();
    return connection;
}

app.use(cors());
app.use(express.json());

const port = 5001;
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});

// C /driver + /results
app.post("/drivers", async (req, res) => {
    const connection = await getDBConnection();
    const { first_name, last_name, nationality, car_number, team } = req.body;

    if (!first_name || !last_name || !nationality || !car_number || !team) {
        res.status(400).json({
            success: false,
            message:
                "Bad params. Provide 'first_name', 'last_name', 'nationality', 'car_number', and 'team'",
        });
        return;
    }

    try {
        const sql =
            "INSERT INTO drivers (first_name, last_name, nationality, car_number, team) VALUES (?, ?, ?, ?, ?)";
        const [result] = await connection.query(sql, [
            first_name,
            last_name,
            nationality,
            car_number,
            team,
        ]);
        await connection.end();

        res.status(201).json({
            success: true,
            message: "Driver added",
            id: result.insertId,
        });
    } catch (error) {
        await connection.end();
        res.status(500).json({
            success: false,
            message: "Database error",
            error: error.message,
        });
    }
});

app.post("/results", async (req, res) => {
    const connection = await getDBConnection();
    const { position, car_number, race_time, points } = req.body;

    if (
        position === undefined ||
        !car_number ||
        !race_time ||
        points === undefined
    ) {
        res.status(400).json({
            success: false,
            message:
                "Bad params. Provide 'position', 'car_number', 'race_time', and 'points'",
        });
        return;
    }

    try {
        const sql = `INSERT INTO bahrain_2025_results 
        (position, car_number, race_time, points) 
        VALUES (?, ?, ?, ?)`;
        const [result] = await connection.query(sql, [
            position,
            car_number,
            race_time,
            points,
        ]);
        await connection.end();

        res.status(201).json({
            success: true,
            message: "Race result added",
        });
    } catch (error) {
        await connection.end();
        res.status(500).json({
            success: false,
            message: "Database error",
            error: error.message,
        });
    }
});
