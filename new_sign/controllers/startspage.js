const express = require('express');
const router = express.Router();
const path = require('path');

const session = require('express-session');
const cookieParser = require('cookie-parser');


// router.get('/Home',function(req,res){

exports.getStartpage=async(req,res)=>{

    if (req.session.user) {
        // If user data exists, redirect to the home page
        // app.use(home);
        res.redirect('/Home');
    } else {
        // If user data doesn't exist, redirect to the login page
        // res.render('Login');
        // app.use(userslogin);
        res.redirect('/Login'); 
    }
};
