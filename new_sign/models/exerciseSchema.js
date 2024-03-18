const mongoose = require('mongoose');
const exerciseSchema = new mongoose.Schema({
    id: Number,
   
    image: String,
   
  },{versionKey:false}
  );


module.exports=mongoose.model("Exercise",exerciseSchema);