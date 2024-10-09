const mongoose = require("mongoose");
const schema = mongoose.Schema({
  UserName: {
    Type:String
  },
  Password: {
    Type:String
},
  Email:{
    Type:String
  }
});
module.exports = mongoose.model("user", schema);