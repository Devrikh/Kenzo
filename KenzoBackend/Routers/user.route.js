const router = require('express').Router();
const UserController = require('../Controller/user.controller');
router.post('/signin', UserController.register);
router.post("/login", UserController.login);
router.post("/profile", UserController.getProfile);
module.exports = router;