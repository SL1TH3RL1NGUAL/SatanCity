const fs = require('fs');
const path = require('path');
const express = require('express');

const app = express();
const bindingPath = path.join(__dirname, '..', 'identity', 'avatar.binding.json');

app.get('/identity', (req, res) => {
  try {
    const data = fs.readFileSync(bindingPath, 'utf8');
    res.json(JSON.parse(data));
  } catch (e) {
    res.status(500).json({ error: 'Binding not found' });
  }
});

app.listen(3001, () => {
  console.log("Identity node running on http://localhost:3001/identity");
});
