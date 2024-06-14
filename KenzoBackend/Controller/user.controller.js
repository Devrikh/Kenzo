const UserServices = require('../Services/user.services');
exports.register = async(req,res,next)=>{
    try{
        console.log("Enterd");
        const {email, password, name, age, gender, roll, room} = req.body;
        const successRes = await UserServices.registrationUser(email, password, name, age, gender, roll, room);
        res.json({status : true, success: "User registered successfully"});
    }
    catch(err){
        throw err;
    }
}
exports.login = async (req, res, next) => {
    try {
        console.log("logged in");
        const { email, password } = req.body;
        const user = await UserServices.checkUser(email);
        if (!user) {
            throw new Error('User does not exist');
        }
        const isPasswordCorrect = await user.comparePassword(password);
        if (isPasswordCorrect === false) {
            throw new Error(`Username or Password does not match`);
        }
        let tokenData = { _id: user._id, email: user.email };
    
        const token = await UserServices.generateAccessToken(tokenData,"secret",'1h' )
        res.status(200).json({ status: true, success : "User login successfully" });
    } catch (error) {
        next(error);
    }
}
exports.getProfile = async (req, res, next) => {
    try {
        const {email} = req.body;
        const user = await UserServices.checkUser(email);
        if (!user) {
            throw new Error('User does not exist');
        }
        const userName = await user.getName();
        const userAge = await user.getAge();
        const userGender = await user.getGender();
        const userRoll = await user.getRoll();
        const userRoom = await user.getRoom();
        res.status(200).json({ status: true, name:userName, age:userAge, gender:userGender, roll:userRoll, room:userRoom});
    } catch (error) {
        next(error);
    }
}