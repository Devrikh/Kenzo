const UserModel = require('../Model/user.model');
const jwt = require('jsonwebtoken');
class UserServices{
    static async registrationUser(email, password, name, age, gender, roll, room){
        try{
            const createUser = new UserModel({email, password, name, age, gender, roll, room});
            return await createUser.save();
        }
        catch(err){
            throw err;
        }
    }
    static async checkUser(email){
        try {
            return await UserModel.findOne({email});
        } catch (error) {
            throw error;
        }
    }
    static async generateAccessToken(tokenData,JWTSecret_Key,JWT_EXPIRE){
        return jwt.sign(tokenData, JWTSecret_Key, { expiresIn: JWT_EXPIRE });
    }
}
module.exports = UserServices;