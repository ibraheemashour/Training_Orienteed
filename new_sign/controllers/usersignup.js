const express = require('express');
const validator = require("validator");
const router = express.Router();
const path = require('path');
const bcrypt = require('bcrypt');

const userModel = require('../models/user');





exports.postSiginupPage=async(req,res)=>{
    try{
        const{username,password,email,firstname,lastname}=req.body;
        console.log(username,password,email,firstname,lastname);
        
        // const user=await userModel.findOne({email:email});

        const user = await userModel.findOne({ $or: [{ email: email }, { username: username }] });


        if (username.toLowerCase().includes('admin')) {
            return res.status(400).json('username cannot contain the word "admin"' );
          }
       
       
          if (
            !validator.isStrongPassword(password, {
              minLength: 8,
              maxLength: 20,
              minLowercase: 1,
              minUppercase: 1,
              minNumbers: 1,
              minSymbols: 1,
            })
          ) {
            // errors.password =
            //   "Password must be between 8 and 20 characters and contain at least one lowercase letter, one uppercase letter, one number, and one symbol.";
              return res.status(400).json(' Password must be between 8 and 20 characters and contain at least one lowercase letter, one uppercase letter, one number, and one symbol.' );

          }
          if (!validator.isEmail(email)) {
            // errors.email = "Invalid email format.";
            return res.status(400).json(  'Invalid email format.' );
          }

        
        if(!user){

          const saltRounds = 10;
          const hashedPassword = await bcrypt.hash(password, saltRounds);
          // console.log(hashedPassword);

            

            let lastid = await userModel.findOne({}, { iduser: 1 }).sort({ iduser: -1 }).exec();
                // Generate a new unique ID for the next product
                const new_Id = lastid ? lastid.iduser + 1 : 1;
             
            let usermodel=new userModel({
                iduser:new_Id,
                username,
                password:hashedPassword,
                email,
                firstname,
                lastname
            });
           await usermodel.save();
           res.sendStatus(200);
            res.redirect('/Home');
        }else{
            console.log('user already exist');
            return res.status(400).json(  'user already exist' );
            res.redirect('/signup');
        }
      }catch(error){
        console.log("The Error is :"+error);
      }
    };


    //for web
    exports.postSiginupWebPage=async(req,res)=>{
      try{
          const{username,password,email,firstname,lastname}=req.body;
          console.log(username,password,email,firstname,lastname);
          
          // const user=await userModel.findOne({email:email});
  
          const user = await userModel.findOne({ $or: [{ email: email }, { username: username }] });
  
  
          if (username.toLowerCase().includes('admin')) {
              // return res.status(400).json('username cannot contain the word "admin"' );
            }
         
         
            if (
              !validator.isStrongPassword(password, {
                minLength: 8,
                maxLength: 20,
                minLowercase: 1,
                minUppercase: 1,
                minNumbers: 1,
                minSymbols: 1,
              })
            ) {
              // errors.password =
              //   "Password must be between 8 and 20 characters and contain at least one lowercase letter, one uppercase letter, one number, and one symbol.";
                // return res.status(400).json(' Password must be between 8 and 20 characters and contain at least one lowercase letter, one uppercase letter, one number, and one symbol.' );
  
            }
            if (!validator.isEmail(email)) {
              // errors.email = "Invalid email format.";
              // return res.status(400).json(  'Invalid email format.' );
            }
  
          
          if(!user){
  
            const saltRounds = 10;
            const hashedPassword = await bcrypt.hash(password, saltRounds);
            // console.log(hashedPassword);
  
              
  
              let lastid = await userModel.findOne({}, { iduser: 1 }).sort({ iduser: -1 }).exec();
                  // Generate a new unique ID for the next product
                  const new_Id = lastid ? lastid.iduser + 1 : 1;
               
              let usermodel=new userModel({
                  iduser:new_Id,
                  username,
                  password:hashedPassword,
                  email,
                  firstname,
                  lastname
              });
             await usermodel.save();
            //  res.sendStatus(200);
              res.redirect('/Home');
          }else{
              console.log('user already exist');
              // return res.status(400).json(  'user already exist' );
              res.redirect('/signup');
          }
        }catch(error){
          console.log("The Error is :"+error);
        }
      };
  


 
exports.getSiginupPage = async (req, res) => {
    console.log("the login get is called");
    res.render('signup', { errors: {} });
    };








