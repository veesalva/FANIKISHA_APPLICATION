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
  const user = req.body;
  // Check if the user exists in a database
 db.query('SELECT * FROM users WHERE email = ?', [user.email], (err, result) => {
    if (err) {
      console.error('Database error:', err);
      res.status(500).json({ error: 'Failed to fetch user' });
      return;
    }

     if (result.length > 0) {
          return res.status(400).json({ message: 'User already exists',exists:true });
        }else{
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
        }
  });


});

//api to login user
app.post('/login', (req, res) => {
  const user = req.body; // Assuming the request body contains user data
  // get the user from the database
  db.query('SELECT * FROM users WHERE email=? AND password=?', [user.email, user.password], function (error, results, fields) {
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


//post api to register user goal in the database
app.post('/goals', (req, res) => {
  const goal = req.body;
  // insert a goal in a database

//todo change
db.query('SELECT * FROM goals WHERE goal_name = ?', [goal.goal_name], (err, result) => {
    if (err) {
      console.error('Database error:', err);
      res.status(500).json({ error: 'Failed to fetch user' });
      return;
    }

     if (result.length > 0) {
          return res.status(400).json({ message: 'goal already exists',exists:true });
        }else{
          // Insert the user into the database
           db.query('INSERT INTO goals SET ?', goal, (err, result) => {
                       if (err) {
                         console.error('Error inserting a goal:', err);
                         res.status(500).json({ error: 'Failed to save goal' });
                         return;
                       }

                       console.log('goal inserted successfully');
                       res.status(201).json({ message: 'goal saved successfully', userId: result.insertId });
                     });
        }
  });
});


// Assuming you already have the Express app and database connection code

// PUT endpoint to update user data
app.put('/user/:userId', (req, res) => {
  const userId = req.params.userId;
  const updatedUserData = req.body;

  // Check if the user exists based on email
  db.query('SELECT * FROM users WHERE id = ?', [userId], (err, result) => {
    if (err) {
      console.error('Database error:', err);
      res.status(500).json({ error: 'Failed to fetch user' });
      return;
    }

    if (result.length === 0) {
      return res.status(404).json({ message: 'User not found' });
    }

    // Update the user's data in the database
    db.query('UPDATE users SET ? WHERE id = ?', [updatedUserData, userId], (err, result) => {
      if (err) {
        console.error('Error updating user:', err);
        res.status(500).json({ error: 'Failed to update user' });
        return;
      }

      console.log('User updated successfully');
      res.status(200).json({ message: 'User updated successfully' });
    });
  });
});

//POST endpoint to create a user bank account in a database
app.post('/bank', (req, res) => {
  const account = req.body;
  // Check if the user exists in a database
  db.query('INSERT INTO accounts SET ?', account, (err, result) => {
             if (err) {
               console.error('Error inserting account info:', err);
               res.status(500).json({ error: 'Failed to save account info' });
               return;
             }

             console.log('account inserted successfully');
             res.status(201).json({ message: 'account saved successfully', userId: result});
           });
});


//an api endpoint to get user goals
app.get('/goals', function (req,res){
    db.query('SELECT * FROM goals', function (error, results, fields ){
        if (!error){
            return res.send({
                error: false,
                data: results,
                message: 'goals list.'
            });
        } else {
            throw error;
        }

    });
})