const express = require("express");
const router = express.Router();
const login = require("../controllers/userlogin");


router.get('/login', login.getLoginPage);
router.post('/login', login.postLoginPage);


module.exports = router;