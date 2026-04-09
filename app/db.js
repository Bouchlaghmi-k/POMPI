const { Pool } = require("pg");

const dbConfig = {
  host: process.env.DB_HOST || "127.0.0.1",
  port: Number(process.env.DB_PORT) || 5432,
  database: process.env.DB_NAME || "pompi",
  user: process.env.DB_USER || "postgres",
  password: process.env.DB_PASSWORD || "postgres"
};

const pool = new Pool(dbConfig);

async function checkDatabaseConnection() {
  const client = await pool.connect();

  try {
    const result = await client.query("SELECT NOW() AS current_time");
    return {
      ok: true,
      currentTime: result.rows[0].current_time
    };
  } finally {
    client.release();
  }
}

module.exports = {
  pool,
  checkDatabaseConnection
};