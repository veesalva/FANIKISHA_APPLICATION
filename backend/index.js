const express = require ('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');

const app = express ();
const port =5000;

app.use(bodyParser.json());

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
    database: 'demo',

});

db.connect( err =>{
    if (err) throw err;
    console.log('Connected to Mysql database');
});

app.listen(port, () =>{
    console.log('Server is running on port ${port}')
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


app.get('/users/:id', function (req,res){
    let id = req.params.id;
    if (!id){
        return
        res.status(400).send({
            error: true,
            message: 'Please provide user id'
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