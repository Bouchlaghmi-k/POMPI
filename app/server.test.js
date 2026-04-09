const test = require("node:test");
const assert = require("node:assert/strict");
const http = require("node:http");
const app = require("./server");

test("GET / retourne 200", async () => {
  const server = app.listen(0);
  const port = server.address().port;

  try {
    const response = await new Promise((resolve, reject) => {
      const req = http.get(`http://127.0.0.1:${port}/`, resolve);
      req.on("error", reject);
    });

    assert.equal(response.statusCode, 200);
  } finally {
    server.close();
  }
});