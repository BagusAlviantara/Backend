const mysql = require('mysql');
// make configuration database with connect
const connect = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'course_ms',
    multipleStatements: true
});
// connecting database
connect.connect((err) => {
    if (err) throw err;
    console.log('MySQL Connected...');
});
module.exports = connect;