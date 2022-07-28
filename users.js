const createError = require('http-errors');
const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const cors = require('cors');
const indexRouter = require('./usersrouter.js');
const db = require('./config/database');
const app = express();

app.use(express.json());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());

app.use('/course_ms', indexRouter);

// Handling Errors
app.use((err, req, res, next) => {
    // console.log(err);
    err.statusCode = err.statusCode || 500;
    err.message = err.message || "Internal Server Error";
    res.status(err.statusCode).json({
        message: err.message,
    });
});

// read data / get data
app.get('/course_ms/users', (req, res) => {
    // make query sql
    const querySql = 'SELECT * FROM users';

    // run query
    db.query(querySql, (err, rows, field) => {
        // error handling
        if (err) {
            return res.status(500).json({ message: 'Ada kesalahan', error: err });
        }

        // if request success
        res.status(200).json({ success: true, data: rows });
    });
});

app.listen(3000, () => console.log('Server is running on port 3000'));