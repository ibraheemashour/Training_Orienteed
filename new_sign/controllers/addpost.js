const express = require('express');
const router = express.Router();
const path = require('path');
const bodyParser = require('body-parser');
const session = require('express-session');
const cookieParser = require('cookie-parser');
const fs = require('fs');

 
const multer = require('multer');

const storage = multer.memoryStorage();
const upload = multer({ storage: storage });


const Post =require('../models/PostSchema');

exports.Add = async (req, res) => {
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
      
     
};




exports.getlike = async (req, res) => {
    const { idPost } = req.params;
    const { likes } = req.body;
  
    try {
      const post = await Post.findOneAndUpdate({ idPost }, { likes }, { new: true });
      res.json(post.likes);
    } catch (err) {
      res.status(500).send('Error updating likes');
    }
};


exports.getcomment = async (req, res) => {


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

};




exports.getposts = async (req, res) => {

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
      
}


 

exports.deletePost = async (req, res) => {
  try {
      const { idPost } = req.params;
      
      // Ensure idPost is converted to a number
      const postId = parseInt(idPost);

      // Check if postId is a valid number
      if (isNaN(postId)) {
          return res.status(400).send('Invalid postId');
      }

      // Find the post by postId and delete it
      const deletedPost = await Post.findOneAndDelete({ idPost: postId });
      
      // Check if the post exists
      if (!deletedPost) {
          return res.status(404).send('Post not found');
      }

      // Return a success message
      res.status(200).send('Post deleted successfully');
  } catch (error) {
      console.error(error);
      res.status(500).send('Failed to delete post');
  }
};
