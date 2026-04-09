require("dotenv").config();
const express = require("express");
const { checkDatabaseConnection } = require("./db");

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

app.get("/", (req, res) => {
  res.status(200).json({
    application: "POMPI",
    status: "running",
    message: "Application de demonstration POMPI active"
  });
});

app.get("/health", async (req, res) => {
  try {
    const dbStatus = await checkDatabaseConnection();

    res.status(200).json({
      status: "ok",
      service: "pompi-app",
      database: dbStatus.ok ? "connected" : "disconnected",
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    res.status(500).json({
      status: "error",
      service: "pompi-app",
      database: "disconnected",
      message: error.message
    });
  }
});

if (require.main === module) {
  app.listen(PORT, () => {
    console.log(`POMPI app running on port ${PORT}`);
  });
}

module.exports = app;