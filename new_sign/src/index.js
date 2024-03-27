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
// const upload = multer({ storage: storage });

const product = require('../models/product');
const userModel = require('../models/user');
const Exercise = require('../models/exerciseSchema');
const Category_exercises = require('../models/Category_exercise');
const Recipe =require('../models/RecipeSchema');
 
const Post =require('../models/PostSchema');

 
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
const excersises = require('../routes/excersises');
const CategoryExcersises = require('../routes/CategoryExercises');
const Filter = require('../routes/filters');
// const exerciseCatogery = require('../routes/excersises');
const recipes = require('../routes/recipes');
const getposts=require('../routes/addsposts');
const category = require('../routes/categorys');

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


// app.use(express.static('src')); // Assuming 'src' is the root directory for your static files


 
app.use(Start); 
app.use(home); 
app.use(userssignup)
app.use(userslogin);
app.use(searchsproduct);
app.use(deletesproduct);
app.use(updatesproduct);
// app.use(addsproduct,upload.single('image'));
app.use(addsproduct);

app.use(showproduct);
app.use(changepassword);
app.use(calculatebmi);
app.use(calculateBFP);
app.use(excersises);
app.use(CategoryExcersises);
app.use(Filter);
// app.use(exerciseCatogery);
app.use(recipes);
app.use(getposts);
app.use(category);





 




 

 



 




 

  
  // Fetch data from MealDB API
  const fetchData = async () => {
    try {
      const response = await axios.get('https://www.themealdb.com/api/json/v1/1/search.php?s=Seafood');
      const meals = response.data.meals;
  
      if (meals && meals.length > 0) {
        meals.forEach(async meal => {
          const recipe = new Recipe({
            name: meal.strMeal,
            description: meal.strInstructions,
            imageUrl: meal.strMealThumb,
            price: Math.floor(Math.random() * 100) + 1 // Random price for demonstration
          });
  
          await recipe.save();
          console.log(`Recipe '${recipe.name}' saved to MongoDB`);
        });
      }
    } catch (error) {
      console.error('Failed to fetch and save recipes:', error);
    }
  };
  
  // Call fetchData function
  // fetchData();

  



 






  const API_KEY = 'Pd5B1BpJtvAsF+X87Udg+A==wUSElVUZ7oQYmUFk'; // Replace 'YOUR_API_KEY' with your actual API key

  app.get('/nutrition', async (req, res) => {
    const query = req.query.query;
  
    if (!query) {
      return res.status(400).json({ error: 'Query parameter is required.' });
    }
  
    try {
      const response = await axios.get('https://api.api-ninjas.com/v1/nutrition', {
        params: { query: query },
        headers: {
          'X-Api-Key': API_KEY
        }
      });
      // console.log(response.data);
      res.json(response.data);
    } catch (error) {
      console.error('Request failed:', error);
      res.status(500).json({ error: 'Internal server error.' });
    }
  });
  


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
  

