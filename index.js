const express = require('express');
const app = express();
const port = 86;

app.get("/api/hello", (req, res) => {
  res.json({ message: "🚀 CI/CD wdsfsafsldflssdsadasorkdslfmakdsmfdsming! Version 2 deployed." });
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
