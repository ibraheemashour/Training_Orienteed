const express = require("express");
const router = express.Router();
const Add = require("../controllers/addproduct");
 
const multer = require('multer');

const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

router.post('/addproduct', upload.single('image'), Add.getAdd);




module.exports = router;



 