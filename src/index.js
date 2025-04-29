const express = require("express");
const cors = require("cors");
const myspl2 = require("mysql2/promise");

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
