import express from "express";
const app = express();

app.get("/", (req, res) => {
  res.json({ status: "API online", domain: "api.blackcorp.me" });
});

app.listen(process.env.PORT || 3000, () => {
  console.log("API running");
});
