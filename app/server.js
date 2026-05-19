require("dotenv").config();

const express = require("express");
const client = require("prom-client");
const { checkDatabaseConnection } = require("./db");

const app = express();
const PORT = process.env.PORT || 3000;

/*
|--------------------------------------------------------------------------
| Prometheus Metrics
|--------------------------------------------------------------------------
*/

const collectDefaultMetrics = client.collectDefaultMetrics;

collectDefaultMetrics({
  prefix: "pompi_",
});

const httpRequestCounter = new client.Counter({
  name: "pompi_http_requests_total",
  help: "Nombre total de requêtes HTTP",
  labelNames: ["method", "route", "status_code"],
});

const httpRequestDuration = new client.Histogram({
  name: "pompi_http_request_duration_seconds",
  help: "Durée des requêtes HTTP",
  labelNames: ["method", "route", "status_code"],
  buckets: [0.1, 0.5, 1, 2, 5],
});

app.use(express.json());

/*
|--------------------------------------------------------------------------
| Metrics Middleware
|--------------------------------------------------------------------------
*/

app.use((req, res, next) => {
  const start = Date.now();

  res.on("finish", () => {
    const duration = (Date.now() - start) / 1000;

    httpRequestCounter.inc({
      method: req.method,
      route: req.path,
      status_code: res.statusCode,
    });

    httpRequestDuration.observe(
      {
        method: req.method,
        route: req.path,
        status_code: res.statusCode,
      },
      duration
    );
  });

  next();
});

/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
*/

app.get("/", (req, res) => {
  res.status(200).json({
    application: "POMPI",
    status: "running",
    message: "Application de demonstration POMPI active",
  });
});

app.get("/health", async (req, res) => {
  try {
    const dbStatus = await checkDatabaseConnection();

    res.status(200).json({
      status: "ok",
      service: "pompi-app",
      database: dbStatus.ok ? "connected" : "disconnected",
      timestamp: new Date().toISOString(),
    });
  } catch (error) {
    res.status(500).json({
      status: "error",
      service: "pompi-app",
      database: "disconnected",
      message: error.message,
    });
  }
});

app.get("/metrics", async (req, res) => {
  res.set("Content-Type", client.register.contentType);
  res.end(await client.register.metrics());
});

/*
|--------------------------------------------------------------------------
| Server
|--------------------------------------------------------------------------
*/

if (require.main === module) {
  app.listen(PORT, () => {
    console.log(`POMPI app running on port ${PORT}`);
  });
}

module.exports = app;