const express = require("express");
const router = express.Router();
const category = require("../controllers/category");


router.get('/category', category.getCategory);



module.exports = router;