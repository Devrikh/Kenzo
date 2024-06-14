const mongoose = require('mongoose');
const bcrypt = require("bcrypt");
const db = require('../config/db');

const {Schema} = mongoose;
const userSchema = new Schema({
    email:{
        type:String,
        required:true,
        unique:true
    },
    password:{
        type:String,
        required:true
    },
    name:{
        type:String,
        required:true
    },
    age:{
        type:Number,
        required:true
    },
    gender:{
        type:String,
        required:true
    },
    roll:{
        type:Number,
        required:true
    },
    room:{
        type:Number,
        required:true
    }
},{timestamps:true});
userSchema.pre("save",async function(){
    try{
        var user = this;
        const salt = await bcrypt.genSalt(10);
        const hash = await bcrypt.hash(user.password,salt);
        user.password = hash;
    }catch(err){
        throw err;
    }
});
userSchema.methods.comparePassword = async function (candidatePassword) {
    try {
        const isMatch = await bcrypt.compare(candidatePassword, this.password);
        return isMatch;
    } catch (error) {
        throw error;
    }
};
userSchema.methods.getName = async function () {
    try {
        return this.name;
    } catch (error) {
        throw error;
    }
};
userSchema.methods.getAge = async function () {
    try {
        return this.age;
    } catch (error) {
        throw error;
    }
};
userSchema.methods.getGender = async function () {
    try {
        return this.gender;
    } catch (error) {
        throw error;
    }
};
userSchema.methods.getRoll = async function () {
    try {
        return this.roll;
    } catch (error) {
        throw error;
    }
};
userSchema.methods.getRoom = async function () {
    try {
        return this.room;
    } catch (error) {
        throw error;
    }
};
const UserModel = db.model('user', userSchema);
module.exports = UserModel;