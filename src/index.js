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

// R /drivers + /results
app.get("/drivers", async (req, res) => {
    try {
        const connection = await getDBConnection();
        const sqlQuery = "SELECT * FROM drivers";
        const [driversresults] = await connection.query(sqlQuery);

        connection.end();

        res.status(200).json({
            info: {
                count: driversresults.length,
            },
            results: driversresults,
        });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.get("/results", async (req, res) => {
    try {
        const connection = await getDBConnection();
        const sqlQuery = "SELECT * FROM bahrain_2025_results";
        const [bahrainresults] = await connection.query(sqlQuery);

        connection.end();

        res.status(200).json({
            info: {
                count: bahrainresults.length,
            },
            results: bahrainresults,
        });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// U /drivers + /results
app.put("/drivers/:id", async (req, res) => {
    const connection = await getDBConnection();
    const { id } = req.params;
    const { first_name, last_name, nationality, car_number, team } = req.body;
    const sqlQuery =
        "UPDATE drivers SET first_name = ?, last_name = ?, nationality = ?, car_number = ?, team = ? WHERE id = ?";
    const [result] = await connection.query(sqlQuery, [
        first_name,
        last_name,
        nationality,
        car_number,
        team,
        id,
    ]);
    connection.end();

    res.status(200).json({
        success: true,
        message: "Driver updated",
    });

    app.put("/results/:id", async (req, res) => {
        const connection = await getDBConnection();
        const { id } = req.params;
        const { position, car_number, race_time, points } = req.body;
        const sqlQuery =
            "UPDATE bahrain_2025_results SET position = ?, car_number = ?, race_time = ?, points = ? WHERE id = ?";
        const [result] = await connection.query(sqlQuery, [
            position,
            car_number,
            race_time,
            points,
            id,
        ]);
        connection.end();

        res.status(200).json({
            success: true,
            message: "Race result updated",
        });
    });
});

// D /drivers + /results
app.delete("/drivers/:id", async (req, res) => {
    const connection = await getDBConnection();
    const { id } = req.params;
    const sqlQuery = "DELETE FROM drivers WHERE id = ?";
    const [result] = await connection.query(sqlQuery, [id]);
    connection.end();
    res.status(200).json({
        status: true,
        message: "Driver deleted",
    });
});

app.delete("/results/:id", async (req, res) => {
    const connection = await getDBConnection();
    const { id } = req.params;
    const sqlQuery = "DELETE FROM bahrain_2025_results WHERE id = ?";
    const [result] = await connection.query(sqlQuery, [id]);
    connection.end();
    res.status(200).json({
        success: true,
        message: "Race result deleted",
    });
});
