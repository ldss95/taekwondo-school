const mysql = require('mysql')
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '*Binar@2018*',
    port: 3306,
    database: 'taekwondo'
})

db.connect((error) => {
    if(error)
        console.log(error)
})

module.exports = db