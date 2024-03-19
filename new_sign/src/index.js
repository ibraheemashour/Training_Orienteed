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



// const ExerciseImageSchema = new mongoose.Schema({
//   name: String,
//   imageUrl: String,
// });

// const ExerciseImage = mongoose.model('ExerciseImage', ExerciseImageSchema);

// // Express route for /api/v2/exerciseimage/?limit=2
// app.get('exercises', async (req, res) => {
//   try {
//     const response = await axios.get('https://wger.de/api/v2/exerciseimage/');
//     const exerciseImages = response.data.results;
//     res.render('exercises', { exerciseImages }); // Rendering exercise.ejs
//   } catch (error) {
//     console.error(error);
//     res.status(500).send('Server Error');
//   }
// });


///////////////////////////////////////////////////////



// const exerciseSchema = new mongoose.Schema({
//   id: Number,
 
//   image: String,
 
// },{versionKey:false}
// );


///// this is for fetch and save exercise


// const Exercise = mongoose.model('Exercise', exerciseSchema);

// async function fetchAndSaveExercises(url) {
//   try {
//     const response = await axios.get(url);
//     const exercisesData = response.data.results;

//     // Save each exercise to MongoDB
//     for (const exerciseData of exercisesData) {
//       const exercise = new Exercise({
//         id: exerciseData.id,
 
//         image: exerciseData.image,
   
//       });
//       await exercise.save();
//     }

//     console.log('Exercises saved to MongoDB');

//     // Check if there's a next page
//     if (response.data.next) {
//       const nextOffset = new URL(response.data.next).searchParams.get('offset');
//       const nextUrl = `https://wger.de/api/v2/exerciseimage/?limit=20&offset=${nextOffset}`;
//       await fetchAndSaveExercises(nextUrl); // Recursively fetch next page
//     }
//   } catch (error) {
//     console.error('Error fetching or saving exercises:', error);
//   }
// }





// // Fetch and save exercises if not already present in MongoDB
// async function init() {
//   const count = await Exercise.countDocuments();
//   if (count === 0) {
//     // await fetchAndSaveExercises();

//           // Start fetching exercises from the initial URL
//      await fetchAndSaveExercises('https://wger.de/api/v2/exerciseimage/?limit=20');

//   }
// }

// init();
/////////////// here end the fetch and save exercise




// // Route to render exercises.ejs with pagination
// app.get('/exercises', async (req, res) => {
//   try {
//     const page = parseInt(req.query.page) || 1; // Get current page from query parameter
//     const pageSize = 10; // Number of exercises per page
//     const skip = (page - 1) * pageSize; // Calculate number of exercises to skip

//     const exercises = await Exercise.find().skip(skip).limit(pageSize);
//     const count = await Exercise.countDocuments();

//     // Calculate total number of pages
//     const totalPages = Math.ceil(count / pageSize);

//     res.render('exercises', { exercises, currentPage: page, totalPages });
//   } catch (error) {
//     console.error('Error fetching exercises:', error);
//     res.status(500).send('Server Error');
//   }
// });





// const Category_exercise = new mongoose.Schema({
//   type: {
//     type: String,
//     required: true
// },
// numbers: {
//     type: [Number],
//     default: [],
//     required: true
// }
// },{versionKey:false}
// );

// const Category_exercises = mongoose.model('Category_exercises', Category_exercise);



  // res.render('addexercises.ejs');


// Route to handle form submission

// app.get('/CategoryExercise', (req, res) => {
//   res.render('addexercises.ejs');
// });

// Route to handle form submission for creating a new category exercise
// app.post('/CategoryExercise', async (req, res) => {
//   try {
//       // Create new category exercise document
//       const newCategoryExercise = new Category_exercises({
//           type: req.body.type,
//           numbers: req.body.numbers.split(',').map(num => parseInt(num.trim())) // Assuming numbers are input as comma-separated values
//       });

//       // Save the document to the database
//       await newCategoryExercise.save();

//       // Redirect to a success page or any other page as needed
//       // res.redirect('/success');
//       res.redirect('/addexercises');
//   } catch (error) {
//       // Handle error
//       console.error(error);
//       res.status(500).send('Internal Server Error');
//   }
// });



// app.post('/CategoryExercise', async (req, res) => {
//   try {
//       // Find the document in the database based on the type
//       let categoryExercise = await Category_exercises.findOne({ type: req.body.type });

//       // If document is found, update the numbers array
//       if (categoryExercise) {
//           const newNumbers = req.body.numbers.split(',').map(num => parseInt(num.trim()));
          

//           // Filter out numbers that are already present in the array
//           const numbersToAdd = newNumbers.filter(num => !categoryExercise.numbers.includes(num));
          
//           // Add only the new numbers to the array
//           categoryExercise.numbers = categoryExercise.numbers.concat(numbersToAdd);

//           // Save the updated document
//           await categoryExercise.save();
//       } else {
//           // Create new category exercise document if not found
//           categoryExercise = new Category_exercises({
//               type: req.body.type,
//               numbers: req.body.numbers.split(',').map(num => parseInt(num.trim()))
//           });

//           // Save the new document to the database
//           await categoryExercise.save();
//       }

//       // Redirect to a success page or any other page as needed
//       res.render('addexercises.ejs');
//   } catch (error) {
//       // Handle error
//       console.error(error);
//       res.status(500).send('Internal Server Error');
//   }
// });
 
 



// app.get('/filter', async (req, res) => {
//   res.render('filter');
// });

 


// app.get('/exercises/:category', async (req, res) => {
//   const category = req.params.category;
//   let exerciseIds = [];
  
//   try {
//       let categoryExercise = await Category_exercises.findOne({ type: req.params.category });
  
//       if (categoryExercise) {
//           exerciseIdss = categoryExercise.numbers;
//       } else {
//           // Return an error response if the category exercise is not found
//           return res.status(404).json({ error: 'Category exercise not found' });
//           // res.redirect('filter.ejs');
//       }
  
//       // Assign exercise IDs based on the selected category
//       switch (category) {
//           case 'Abs':
//               exerciseIds = categoryExercise.numbers;
//               break;
//           case 'Arms':
//               exerciseIds = categoryExercise.numbers;
//               break;
//           case 'Back':
//               exerciseIds = categoryExercise.numbers;
//               break;
//           case 'Cardio':
//               exerciseIds = categoryExercise.numbers;
//               break;
//           case 'Chest':
//               exerciseIds = categoryExercise.numbers;
//               break;
//           case 'Legs':
//               exerciseIds = categoryExercise.numbers;
//               break;
//           case 'Shoulders':
//               exerciseIds = categoryExercise.numbers;
//               break;
//           // Add cases for other categories
//           default:
//               break;
//       }
  
//       // Fetch exercises from MongoDB based on IDs
//       const exercises = await Exercise.find({ id: { $in: exerciseIds } });
//       res.render('exerciseList', { exercises }); // Render the exerciseList.ejs template with exercises data
//   } catch (error) {
//       console.error('Error fetching exercises:', error);
//       res.status(500).json({ error: 'Internal Server Error' });
//   }
  
// });



// app.post('/removeExercise', async (req, res) => {
//   try {
//       const { type, numberToRemove } = req.body;

//       // Find the document in the database based on the type
//       const categoryExercise = await Category_exercises.findOne({ type });

//       // If document is found, remove the specified number from the array
//       if (categoryExercise) {
//           const number = parseInt(numberToRemove);
          
//           // Filter out the number to be removed
//           categoryExercise.numbers = categoryExercise.numbers.filter(num => num !== number);

//           // Save the updated document
//           await categoryExercise.save();

//           // Redirect to a success page or any other page as needed
//           res.render('addexercises.ejs');
//         } else {
//           // Document not found, handle accordingly (e.g., send error response)
//           res.status(404).send('Category exercise not found.');
//       }
//   } catch (error) {
//       // Handle error
//       console.error(error);
//       res.status(500).send('Internal Server Error');
//   }
// });




// app.get('/exercisesmobile/:category', async(req, res) => {
//   // const category = req.params.category;
//   // const exerciseIds = exercisesData[category];

  
//   const category = req.params.category;
//   let exerciseIds = [];
  
//   try {
//       let categoryExercise = await Category_exercises.findOne({ type: req.params.category });
  
//       // if (!exerciseIds) {
//       //   return res.status(404).json({ error: 'Category exercise not found' });
//       // }
    

//       if (categoryExercise) {
//           exerciseIdss = categoryExercise.numbers;
//       } else {
//           // Return an error response if the category exercise is not found
//           return res.status(404).json({ error: 'Category exercise not found' });
//           // res.redirect('filter.ejs');
//       }
  
//       // Assign exercise IDs based on the selected category
//       switch (category) {
//           case 'Abs':
//               exerciseIds = categoryExercise.numbers;
//               break;
//           case 'Arms':
//               exerciseIds = categoryExercise.numbers;
//               break;
//           case 'Back':
//               exerciseIds = categoryExercise.numbers;
//               break;
//           case 'Cardio':
//               exerciseIds = categoryExercise.numbers;
//               break;
//           case 'Chest':
//               exerciseIds = categoryExercise.numbers;
//               break;
//           case 'Legs':
//               exerciseIds = categoryExercise.numbers;
//               break;
//           case 'Shoulders':
//               exerciseIds = categoryExercise.numbers;
//               break;
//           // Add cases for other categories
//           default:
//               break;
//       }
  
//       // Fetch exercises from MongoDB based on IDs
//       const exercises = await Exercise.find({ id: { $in: exerciseIds } });
//       // res.render('exerciseList', { exercises }); // Render the exerciseList.ejs template with exercises data
//       // console.log({ exercises });
//       res.json({ exercises });
//   } catch (error) {
//       console.error('Error fetching exercises:', error);
//       res.status(500).json({ error: 'Internal Server Error' });
//   }

//   // Here you would typically query your database based on the exercise IDs
//   // For demonstration, I'm just sending back the exercise IDs
//   // res.json({ exercises: exerciseIds });
// });

// const exercisesData = {
//   Abs: [1, 2, 3],
//   Arms: [4, 5, 6],
//   Back: [7, 8, 9],
//   Cardio: [10, 11, 12],
//   Chest: [13, 14, 15],
//   Legs: [16, 17, 18],
//   Shoulders: [19, 20, 21]
// };


// app.get('/exercisess/:category', (req, res) => {
//   const category = req.params.category;
//   const exerciseIds = exercisesData[category];

//   if (!exerciseIds) {
//     return res.status(404).json({ error: 'Category exercise not found' });
//   }
//   console.log(res.json({ exercises: exerciseIds }));
//   // Here you would typically query your database based on the exercise IDs
//   // For demonstration, I'm just sending back the exercise IDs
//   res.json({ exercises: exerciseIds });
// });


// const imageSchema = new mongoose.Schema({
//   data: Buffer,
//   contentType: String
// });

// const Image = mongoose.model('Image', imageSchema);

// const upload = multer({ dest: 'uploads/' });



// app.post('/upload', upload.single('image'), async (req, res) => {
//   try {
//     if (!req.file) {
//       return res.status(400).send('No file uploaded');
//     }

//     const newImage = new product();
//     newImage.data = fs.readFileSync(req.file.path);
//     newImage.contentType = req.file.mimetype;
//     await newImage.save();
//     fs.unlinkSync(req.file.path); // Delete temporary file after saving to DB
//     res.status(200).send('Image uploaded successfully');
//   } catch (error) {
//     console.error(error);
//     res.status(500).send('Error uploading image');
//   }
// });

// app.get('/products', async (req, res) => {
//   try {
//     const images = await product.find();
//     res.json(images);
//   } catch (error) {
//     console.error(error);
//     res.status(500).send('Error fetching images');
//   }
// });


app.get('/products', async (req, res) => {
  try {
    // Fetch all products from the database
    const products = await product.find();

    // Return the products as JSON response
    res.json(products);
  } catch (error) {
    // If an error occurs, log the error and send a 500 status response
    console.error(error);
    res.status(500).send('Error fetching products');
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





const RecipeSchema = new mongoose.Schema({
    name: String,
    description: String,
    imageUrl: String,
    price: Number
  });
  
  const Recipe = mongoose.model('Recipe', RecipeSchema);
  
  // Fetch data from MealDB API
  const fetchData = async () => {
    try {
      const response = await axios.get('https://www.themealdb.com/api/json/v1/1/search.php?s=Goat');
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

  app.get('/recipes', async (req, res) => {
    try {
      const recipes = await Recipe.find();
      res.json(recipes);
    } catch (error) {
      res.status(500).json({ error: 'Failed to fetch recipes' });
    }
  });




  app.get('/recipesmobile', async (req, res) => {
    try {
      let recipes;
      
      // Check if the request query contains 'foodName' parameter
      if (req.query.foodName) {
        // Use regex to find recipes with name containing the provided foodName
        recipes = await Recipe.find({ name: { $regex: req.query.foodName, $options: 'i' } });
      } else {
        // If no foodName parameter provided, return all recipes
        recipes = await Recipe.find();
      }
      
      res.json(recipes);
    } catch (err) {
      console.error('Error fetching recipes:', err);
      res.status(500).send('Internal Server Error');
    }
  });






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


  // app.post('/posts/:idPost/comments', async (req, res) => {
  //   const { idPost } = req.params;
  //   const { comment, username } = req.body;
  //   // console.log(username);
  
  //   try {
  //     const post = await Post.findOne({ idPost });
  //     if (!post) {
  //       return res.status(404).send('Post not found');
  //     }
  
  //     post.comments.push(comment);
  //     await post.save();
  
  //     res.status(200).send('Comment added successfully');
  //   } catch (err) {
  //     res.status(500).send('Error adding comment');
  //   }
  // });



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






  // app.post('/posts/:idPost/comments', async (req, res) => {
  //   const { idPost } = req.params;
  //   const { username, comment } = req.body; // Add username to request body
  
  //   try {
  //     const post = await Post.findOne({ idPost });
  //     if (!post) {
  //       return res.status(404).send('Post not found');
  //     }
  
  //     post.comments.push({ username, text: comment }); // Save username along with the comment
  //     await post.save();
  
  //     res.status(200).send('Comment added successfully');
  //   } catch (err) {
  //     res.status(500).send('Error adding comment');
  //   }
  // });

  


 

 
  // app.post('/posts', upload.single('image'), async (req, res) => {
  //   try {
  //     // Extract product details from the request body
  //     const { title, content } = req.body;
  
  //     // Check if a product with the same title and content already exists
  //     let existingPost = await Post.findOne({ title, content });
  
  //     if (!existingPost) {
  //       // If the post doesn't exist, create a new one
  
  //       // Create a new post object
  //       let newPost = new Post({
  //         title,
  //         content,
  //         author: "Admin",
  //       });
  
  //       // Check if an image file was uploaded
  //       if (req.file) {
  //         // If an image was uploaded, add it to the post
  //         newPost.data = fs.readFileSync(req.file.path); // Read the uploaded file
  //         newPost.contentType = req.file.mimetype; // Set the MIME type of the file
  //       }
  
  //       // Save the new post to the database
  //       await newPost.save();
  //       console.log('Post added successfully!');
  
  //       // Return the added post details
  //       res.status(200).json({
  //         idPost: newPost.idPost,
  //         title: newPost.title,
  //         content: newPost.content,
  //         author: newPost.author,
  //         // Check if imageData is available before returning
  //         ...(newPost.data && {
  //           imageData: {
  //             data: newPost.data.toString('base64'), // Convert buffer to base64 string
  //             contentType: newPost.contentType
  //           }
  //         })
  //       });
  //     } else {
  //       // If the post exists, return an error message
  //       res.status(400).json({ error: 'Post with the same title and content already exists' });
  //     }
  //   } catch (error) {
  //     console.error(error);
  //     res.status(500).send('Error adding post');
  //   }
  // });
   


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
  

