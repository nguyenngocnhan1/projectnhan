const express = require('express');
const app = express();
const port = 86;

app.get('/api/hello', (req, res) => {
  res.send('Hello from Node.js API with Docker & CI/CD!');
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
