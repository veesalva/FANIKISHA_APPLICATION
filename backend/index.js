const express = require ('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express ();
const port =5000;

app.use(bodyParser.json());
app.use(cors());
app.use(bodyParser.urlencoded
    (
        {
            extended:true
        })
);

// Database connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'fanikisha_app',

});

db.connect( err =>{
    if (err) throw err;
    console.log('Connected to Mysql database');
});

app.listen(port, () =>{
    console.log(`Server is running on port ${port}`);
});

app.get('/users', function (req,res){
    db.query('SELECT * FROM users', function (error, results, fields ){
        if (!error){
            return res.send({
                error: false,
                data: results,
                message: 'users list.'
            });
        } else {
            throw error;
        }

    });
})
//api to get user with an id
app.get('/user/:id', function (req,res){
    let id = req.params.id;
    if (!id){
        return
        res.status(400).send({
            error: true,
            message: 'Please provide _id'
        });
    }

    db.query('SELECT * FROM users where id=?',id, function (error, results, fields ){
        if (!error){
            return res.send({
                error: false,
                data: results[0],
                message: 'users list.'
            });
        } else {
            throw error;
        }

    });
})


//post api to register users in the database
app.post('/users', (req, res) => {
  const user = req.body; // Assuming the request body contains user data

  // Insert the user into the database
  db.query('INSERT INTO users SET ?', user, (err, result) => {
    if (err) {
      console.error('Error inserting user:', err);
      res.status(500).json({ error: 'Failed to save user' });
      return;
    }

    console.log('User inserted successfully');
    res.status(201).json({ message: 'User saved successfully', userId: result.insertId });
  });
});

//api to login user
app.post('/login', (req, res) => {
  const user = req.body; // Assuming the request body contains user data
  // get the user from the database
  db.query('SELECT * FROM users WHERE email=? AND password=?', [email, password], function (error, results, fields) {
    if (!error) {
      if (results.length > 0) {
        return res.send({
          error: false,
          data: results[0],
          message: 'User authenticated successfully.'
        });
      } else {
        return res.status(401).send({
          error: true,
          message: 'Authentication failed. Email or password is incorrect.'
        });
      }
    } else {
      throw error;
    }
  });

});