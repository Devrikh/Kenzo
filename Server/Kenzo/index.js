const app = require('./app');
const db = require('./config/db');
const UserModel = require('./Model/user.model');
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello, this is the root route!');
})

app.listen(port, () => {
  console.log(`Server Listening on port  http://192.168.56.1:${port}`);
});