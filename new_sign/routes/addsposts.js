const express = require("express");
const router = express.Router();
const AddPost = require("../controllers/addpost");
 
const multer = require('multer');

 

const upload = multer({ dest: 'uploads/' });
 



router.post('/posts',upload.single('image'), AddPost.Add); 

router.put('/posts/:idPost/likes',AddPost.getlike);  


router.post('/posts/:idPost/comments' , AddPost.getcomment); 


router.delete('/deleteposts/:idPost', AddPost.deletePost);



router.delete('/posts/:idPost/comments/:commentIndex', AddPost.deleteComment);



router.get('/posts', AddPost.getposts); 






module.exports = router;



 