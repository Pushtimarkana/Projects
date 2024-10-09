const express = require("express");
const User = require('../Schema/Signin');
const router = express.Router();

router.post("/", async (req, res) => {
  try {
    const email = await User.findOne({ Email: req.body.email });
    if (email) {
      res.send("Email is already exits");
    }
    await User.create(...req.body).save();
    res.send("account is created");
  } catch {
    res.send("Server error......");
  }
});

app.get('/home', async (req, res) => {
  try {
    const user = await User.find({});
    res.end()
  }
  catch {
    res.send("Server error......");
  }
})

