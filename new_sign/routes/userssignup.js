const express = require("express");
const router = express.Router();
const signup = require("../controllers/usersignup");


router.get('/signup', signup.getSiginupPage);
router.post('/signup', signup.postSiginupPage);




module.exports = router;
