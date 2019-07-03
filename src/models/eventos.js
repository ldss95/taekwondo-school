const db = require('./conexion')
const Modelo = {}

Modelo.get = (id, callback) => {
    if(id){
        db.query('SELECT fecha, hora, lugar, nombre, descripcion, imagen FROM eventos WHERE id = ?', [id], (error, rows) => {
            callback(error, error ? error.sqlMessage: rows[0])
        })
    }else{
        db.query('SELECT fecha, hora, lugar, nombre, descripcion, imagen FROM eventos', (error, rows) => {
            callback(error, error ? error.sqlMessage: rows)
        })
    }
}

module.exports = Modelo