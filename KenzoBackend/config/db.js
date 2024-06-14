const mongoose = require('mongoose');
const connection = mongoose.createConnection('mongodb+srv://dhruvbhalodia0204:dhruv0204@cluster0.stbzvtx.mongodb.net/user').on('open',()=> {
    console.log("MongoDB connected");
}).on('error',()=> {
    console.log("MongoDB not connected");
});
module.exports=connection;

