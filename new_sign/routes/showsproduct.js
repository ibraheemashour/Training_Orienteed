const express = require("express");
const router = express.Router();
const Showproduct = require("../controllers/showproduct");


router.get('/showproducts', Showproduct.getShowproduct);



module.exports = router;