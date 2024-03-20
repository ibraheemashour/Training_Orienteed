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
  


  const postSchema = new mongoose.Schema({
    idPost:{type:Number ,unique:true},
    title: String,
    content: String,
    author: String,
    image: String,
    data: Buffer,
    contentType: String,
    // likes: [{ type: mongoose.Schema.Types.ObjectId, ref: 'User' }] // Array to store user IDs who liked the post
    likes: {
      type: [String],
      default: [],
      required: true
  },
//   comments: {
//     type: [String],
//     default: [],
//     required: true
// },
comments: [{ username: String, text: String }], // Modify comments field

  },{versionKey:false});
  
  // Define Post model
  const Post = mongoose.model('Post', postSchema);

  const upload = multer({ dest: 'uploads/' });

  //now i want to write code for add post system like social media app 

  app.post('/posts',upload.single('image'), async (req, res) => {
    try {
      // Check if an image file was uploaded
      if (!req.file) {
          return res.status(400).send('No file uploaded');
      }
        //user model extract username from who is uploading the post 
        // let user ;

      // Extract product details from the request body
      const { title, content } = req.body;
      const name = req.body.name;
      // Check if a product with the same name and price already exists
      let existingPost = await Post.findOne({ title, content });

      if (!existingPost) {
          // If the product doesn't exist, create a new one

          // Find the last inserted product
          let lastPost = await Post.findOne({}, { idPost: 1 }).sort({ idPost: -1 }).exec();

          // Generate a new unique ID for the next product
          const newId = lastPost ? lastPost.idPost + 1 : 1;

          // Create a new post object
          let newPost = new Post({
            idPost: newId,
            title,
            content,
            author: name,
            likes: [],
            comments: [],
            //   comments: [{
            //   username: name,
            //   text: comment
            // }],
              // countproduct: 1, // Initialize countproduct to 1 for the new product
              data: fs.readFileSync(req.file.path), // Read the uploaded file
              contentType: req.file.mimetype // Set the MIME type of the file
          });

          // Save the new product to the database
          await newPost.save();
          console.log('Post added successfully!');

          // Return the added product details including the image
          res.status(200).json({
            idPost: newPost.idPost,
            title: newPost.title,
            content: newPost.content,
              // countproduct: newPost.countproduct,
              imageData: {
                  data: newPost.data.toString('base64'), // Convert buffer to base64 string
                  contentType: newPost.contentType
              }
          });
      } else {
          // If the product exists, increment its count
          // existingProduct.countproduct += 1;
          // await existingProduct.save();
          // console.log('Product count increased');

          // // Return the existing product details
          // res.status(200).json({
          //     idproduct: existingProduct.idproduct,
          //     nameproduct: existingProduct.nameproduct,
          //     priceproduct: existingProduct.priceproduct,
          //     countproduct: existingProduct.countproduct,
          //     imageData: {
          //         data: existingProduct.data.toString('base64'), // Convert buffer to base64 string
          //         contentType: existingProduct.contentType
          //     }
          // });
      }
  } catch (error) {
      console.error(error);
      res.status(500).send('Error uploading image');
  }
    
  })



 

  app.put('/posts/:idPost/likes', async (req, res) => {
    const { idPost } = req.params;
    const { likes } = req.body;
  
    try {
      const post = await Post.findOneAndUpdate({ idPost }, { likes }, { new: true });
      res.json(post.likes);
    } catch (err) {
      res.status(500).send('Error updating likes');
    }
  });


 



    app.post('/posts/:idPost/comments', async (req, res) => {
  const { idPost } = req.params;
  const { username, comment } = req.body; // Retrieve username and comment from the request body

  try {
    const post = await Post.findOne({ idPost });
    if (!post) {
      return res.status(404).send('Post not found');
    }

    post.comments.push({ username, text: comment }); // Store the username along with the comment
    await post.save();

    res.status(200).send('Comment added successfully');
  } catch (err) {
    res.status(500).send('Error adding comment');
  }
});






  
 
   


  app.get('/posts', async (req, res) => {
    try {
      // Retrieve all posts from the database
      const posts = await Post.find();
      // console.log(posts);
      // Return the list of posts as JSON data
      res.status(200).json(posts);
    } catch (error) {
      console.error(error);
      res.status(500).send('Error retrieving posts');
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
  

