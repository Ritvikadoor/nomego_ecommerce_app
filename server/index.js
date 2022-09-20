//IMPORT FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");

//IMPORT FROM OTHER FILES
const authRouter=require("./routes/auth");

//MIDDLEWARE 
//CLIENTSIDE->>>>>>SERVER
//INIT

const PORT = process.env.PORT || 3000;
const app = express();
app.listen(PORT, () => {
  console.log(`connected at port ${PORT}`);
});
