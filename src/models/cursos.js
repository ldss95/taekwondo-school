const db = require('./conexion')
let modelo = {}

modelo.get = (id, callback) => {
    if(id){
        db.query('SELECT descripcion, imagen, nombre FROM cursos WHERE estado = 1 AND id = ?', [id], (error, result) => {
            callback(error, error ? error.sqlMessage: result)
        })
    }else{
        db.query('SELECT descripcion, imagen, nombre FROM cursos WHERE estado = 1', (error, result) => {
            callback(error, error ? error.sqlMessage: result)
        })
    }
}

module.exports = modelo