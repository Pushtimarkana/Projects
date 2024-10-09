const express = require("express");
const mongoose = require("mongoose");
const userRouter = require("./Routes/PlaceRout");
const bodyParser = require("body-parser");
const cors = require('cors');


let port=10000;
mongoose.connect("mongodb+srv://23010101160:Markana%40123@cluster0.wrsmv.mongodb.net/Travel")
.then(() => {
  const app = express();
  app.use(cors());  
  app.use(express.urlencoded())
  app.use(express.json());

     console.log("Mongoose Connected")
     app.use(bodyParser.urlencoded({extended:false}));
     app.use('/place',userRouter)

    
     app.listen(port,(err)=>{
         console.log("Server Stared at :" + port)
       })

})




      