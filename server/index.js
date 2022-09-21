//IMPORT FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");

//IMPORT FROM OTHER FILES
const authRouter=require("./routes/auth");


//INIT

const PORT = process.env.PORT || 3000;
const app = express();
const DB= "mongodb+srv://ritvik:526621@cluster0.abb5a8a.mongodb.net/?retryWrites=true&w=majority"

//MIDDLEWARE 
app.use(express.json())
app.use(authRouter);

//connections
mongoose.connect(DB)
.then(()=>{
    console.log('Connection Succesful');
}).catch((e)=>{console.log(e);
})
//CLIENTSIDE->>>MIDDLE WARA->>>SERVER->>>>>>>>CLIENT

app.listen(PORT, "0.0.0.0",() => {
  console.log(`connected at port ${PORT}`);
});
