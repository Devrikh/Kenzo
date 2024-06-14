const express = require('express');
const UserRouter = require('./Routers/user.route');
const app = express();
app.use(express.json());
app.use('/', UserRouter);
module.exports = app;