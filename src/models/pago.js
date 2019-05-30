const db = require('./conexion')
const Modelo = {}

Modelo.getPagos = (callback) => {
    db.query('SELECT * FROM pagos ORDER BY id', (error, rows) => {
        if(error){
            callback(null, error.sqlMessage)
        }else{
            callback(null, rows)
        }
    })
}

module.exports = Modelo