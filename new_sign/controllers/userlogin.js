const express = require('express');
 
const router = express.Router();
const path = require('path');
 
const bcrypt = require('bcrypt');
const userModel = require('../models/user');


 

 



exports.postLoginPage=async(req,res)=>{
    ///// here for web
    // try{
    //     console.log("the login post is called");
    //     const{email,password}=req.body;
    //     console.log(email,password);
        
    //     const user=await userModel.findOne({email:email,password:password});
    //     if(user){
    //         req.session.user = { email, email: user.email };
    //         console.log("the name is "+user.username);
    //         res.redirect('/Home');
    //     }else{
    //         console.log('not found');
    //         res.redirect('/');
    //     }
    // }catch(error){
    //     console.log(error);
    // }

    /////here for mobile 
        try {
            const { email, password } = req.body;
            
          const user = await userModel.findOne({ email, password });
          // const match = await bcrypt.compare(password, user.password);
          console.log(email, password);
       
          if (user) {
            // if(match){
            // res.sendStatus(200); // Login successful
            res.status(200).json({
                success: true,
                message: 'Login successful',
                user_name: user.username, // Include username in the response
                // other user details
              });
            // }
              
            
            console.log("Login Successful");
            console.log("the email is : "+email+" the password is : "+password);
           
          } else {
            res.sendStatus(401); // Unauthorized
          }
        } catch (error) {
          console.error(error);
          res.sendStatus(500); // Internal Server Error
        }

    };


 
exports.getLoginPage = async (req, res) => {
    console.log("the login get is called");
    res.render('Login', { errors: {} });
    };


   
      



