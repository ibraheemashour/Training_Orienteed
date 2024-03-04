const express = require('express');
const app = express();
const path = require('path');
const session = require('express-session');
const cookieParser = require('cookie-parser');
const mongoose=require('mongoose');
const Schema=mongoose.Schema;
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
// const imageModel = require('../models/images');

 
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


////check this part i will comment it after use Model View Controller pattern
// const { nextTick } = require('process');

 

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




// app.get('/products', async (req, res) =>  {
  
//     try {
//         // Fetch all products from the database
//         // const products = await product.find({});
//         const products = await product.find();
//         console.log(products);
//         res.json(products);
//     } catch (error) {
//         console.error('Error fetching products:', error);
//         res.status(500).send('Internal Server Error');
//     }
// });


 

// const API_ID = '4d13d8c6';
// const API_KEY = '1b394870bf724b3e503c4d032e69c363';
// app.get('/analyze', async (req, res) => { 
//   try {
//     const query = req.query.q; // Get the query parameter from the request URL
//     if (!query) {
//       return res.status(400).json({ error: 'Missing query parameter "q"' });
//     }
//     // const measure = req.query.measure || 'gram';
//     const url = `https://api.edamam.com/api/nutrition-data?app_id=${API_ID}&app_key=${API_KEY}&ingr=${encodeURIComponent(query)}`;

//     const response = await fetch(url);
//     const data = await response.json();
//     const calories = data.calories; // Extract the calories value from the response
//     const totalWeight= data.totalWeight; // Extract the totalWeight value from the response
//     const healthLabels = data.healthLabels; // Extract the healthLabels array from the response
//      const totaldaily = data.totalDaily.ENERC_KCAL;
 
//     // res.json({ calories, totalWeight});
  
    
    
//   } catch (error) {
//     console.error('Error fetching data from Edamam API:', error);
//     res.status(500).json({ error: 'An error occurred while fetching data from the API' });
//   }
// });
 



app.get('/fetch',async(req,res)=>{
const options = {
  method: 'GET',
  url: 'https://body-mass-index-bmi-calculator.p.rapidapi.com/metric',
  // params: {
  //   weight: '150',
  //   height: '1.83'
  // },
  headers: {
    'X-RapidAPI-Key': '6919ec8d52msh439a760a744916cp1fb8b9jsnd1140ac3dbfd',
    'X-RapidAPI-Host': 'body-mass-index-bmi-calculator.p.rapidapi.com'
  }
};

try {
	const response = await axios.request(options);
	console.log(response.data);
} catch (error) {
	console.error(error);
}
});





// app.get('/fetch',async(req,res)=>{
//   const options = {
//     method: 'GET',
//     url: 'https://work-out-api1.p.rapidapi.com/search',
//     params: {Muscles: 'biceps'},
//     headers: {
//       'X-RapidAPI-Key': '6919ec8d52msh439a760a744916cp1fb8b9jsnd1140ac3dbfd',
//       'X-RapidAPI-Host': 'work-out-api1.p.rapidapi.com'
//     }
//   };

//   try {
//     const response = await axios.request(options);
    
//     console.log(response.data);
//     const video=response.data[0].Video;
//     console.log(video);
     
//     res.send(video);
    

//   } catch (error) {
//     console.error(error);
//   }
// });

// app.get('/fetch', async (req, res) => {
//   const options = {
//     method: 'GET',
//     url: 'https://work-out-api1.p.rapidapi.com/search',
//     params: { Muscles: 'biceps' },
//     headers: {
//       'X-RapidAPI-Key': '6919ec8d52msh439a760a744916cp1fb8b9jsnd1140ac3dbfd',
//       'X-RapidAPI-Host': 'work-out-api1.p.rapidapi.com'
//     }
//   };

//   try {
//     const response = await axios.request(options);
    
//     console.log(response.data);
//     // Assuming the video URL is available under the "Video" property of the first item
//     const video = response.data[0].Video;
//     console.log(video);
     
//     const videoLink = `<a href="${video}" target="_blank">Watch Video</a>`;
//     res.send(videoLink);
//   } catch (error) {
//     console.error(error);
//     res.status(500).json({ error: 'Internal Server Error' });
//   }
// });



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



// async function connect(){

//     try {
//         await mongoose.connect("mongodb+srv://ibrahim:123@cluster0.wkjxc9o.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0", { useNewUrlParser: true, useUnifiedTopology: true });
//         console.log('connected');
//     } catch (error) {
//         console.log(error);
//     }
// }
// connect();

// app.listen(3000);

////////////////////////////////////////



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
  

