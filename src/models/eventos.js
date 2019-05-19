const db = require('./conexion')
const model = {}

model.get = (id, callback) => {
    if(id){
        db.query('SELECT fecha, hora, lugar, nombre, imagen FROM eventos WHERE id = ?', [id], (error, rows) => {
            callback(error, error ? error.sqlMessage: rows[0])
        })
    }else{
        db.query('SELECT fecha, hora, lugar, nombre, imagen FROM eventos', (error, rows) => {
            callback(error, error ? error.sqlMessage: rows)
        })
    }
}

module.exports = model