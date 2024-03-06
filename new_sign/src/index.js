const express = require('express');
const app = express();
const path = require('path');
const session = require('express-session');
const cookieParser = require('cookie-parser');
const mongoose=require('mongoose');
const Schema=mongoose.Schema;
const fs = require('fs');

require('dotenv').config();
//////////////////////
// const fetch = require('node-fetch');
const axios = require('axios');

//////////////////////
const bodyParser = require('body-parser'); 
const http = require('http');
////////////////////////////

const multer = require('multer');

const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

const product = require('../models/product');
const userModel = require('../models/user');


 
const home = require('../routes/homes');
const userslogin = require('../routes/userslogin');
const userssignup = require('../routes/userssignup');
const Start = require('../routes/startpage');
const searchsproduct = require('../routes/searchsproduct');
const deletesproduct = require('../routes/deletesproduct');
const addsproduct = require('../routes/addsproduct');
const updatesproduct = require('../routes/updatesproduct');
const showproduct = require('../routes/showsproduct');
const changepassword = require('../routes/changespassword');
const calculatebmi = require('../routes/calculatesbmi');
const calculateBFP = require('../routes/calculatesBFP');


 

app.set('view engine','ejs');
app.use(express.static(__dirname + "/public"));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(express.static("public"));
app.use(bodyParser.json());

// Configure session and cookie middleware
app.use(cookieParser());
app.use(session({
    secret: 'your-secret-key',
    resave: false,
    saveUninitialized: false,
    cookie: { secure: false } // Set secure to true if using HTTPS
}));


 
app.use(Start); 
app.use(home); 
app.use(userssignup)
app.use(userslogin);
app.use(searchsproduct);
app.use(deletesproduct);
app.use(updatesproduct);
app.use(addsproduct,upload.single('image'));
app.use(showproduct);
app.use(changepassword);
app.use(calculatebmi);
app.use(calculateBFP);



 






app.get('/products', async (req, res) => {
  try {
      const products = await product.find();
      res.json(products);
  } catch (error) {
      res.status(500).json({ message: error.message });
  }
});









// app.get('/searchproduct', async (req, res) => {
//     try {
//         // Query the database for product data
//         const products = await product.find();
//         // Render the view and pass the product data to it
//         res.render('searchproduct', { products: products });
//     } catch (error) {
//         console.error('Error fetching products:', error);
//         res.status(500).send('Internal Server Error');
//     }
// });









const uri = process.env.DATA_URL;
const PORT = process.env.PORT || 3000;
async function connect() {
    try {
        await mongoose.connect(uri,{ useNewUrlParser: true, useUnifiedTopology: true });
      console.log("Connected to MongoDB server");
      // Additional code related to your application's logic
    } catch (error) {
      console.error("Error connecting to MongoDB:", error);
    }
  }
  connect();  
  app.listen(PORT, () => {
    console.log(`Server started on port ${PORT}.
  http://localhost:${PORT}`);
  });
  

