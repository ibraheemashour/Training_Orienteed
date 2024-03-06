const express = require('express');
const router = express.Router();
const path = require('path');
const bodyParser = require('body-parser');
const session = require('express-session');
const cookieParser = require('cookie-parser');

 
const multer = require('multer');

const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

const product = require('../models/product');

exports.getAdd=async(req,res)=>{

    try {
        if (!req.file) {
            return res.status(400).send('No image uploaded.');
        }

        // Create a new Image document
        // const newImage = new imageModel({
        //     data: req.file.buffer,
        //     contentType: req.file.mimetype
        // });

        // // Save the image to MongoDB
        // await newImage.save();
        
        const { nameproduct, priceproduct } = req.body;


        const base64ImageData = req.file.buffer.toString('base64');

        // Check if a product with the same name and price already exists
        let existingProduct = await product.findOne({ nameproduct, priceproduct });

        if (!existingProduct) {
            // If the product doesn't exist, create a new one
            // Find the last inserted product
            let lastProduct = await product.findOne({}, { idproduct: 1 }).sort({ idproduct: -1 }).exec();
            // Generate a new unique ID for the next product
            const newId = lastProduct ? lastProduct.idproduct + 1 : 1;
            
            // Create a new product object
            let newProduct = new product({
                idproduct: newId,
                nameproduct,
                priceproduct,
                countproduct: 1,// Initialize countproduct to 1 for the new product
                data: base64ImageData,
                contentType: req.file.mimetype
            });
           console.log('Image uploaded successfully!');

            // Save the new product to the database
            await newProduct.save();
            res.redirect('/Home');
        } else {
            // If the product exists, increment its count
            existingProduct.countproduct += 1;
            await existingProduct.save();
            console.log('Product count increased');
            res.redirect('/Home');
        }
    } catch (error) {
        console.error('Error adding product:', error);
        res.status(500).send('Internal Server Error');
    }
};

