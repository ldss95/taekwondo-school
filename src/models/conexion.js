const mysql = require('mysql')

const db = mysql.createConnection(require('./mysql_connection_params'))

db.connect((error) => {
    if(error)
        console.log(error)
})

module.exports = db