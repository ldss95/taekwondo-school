const db = require('./conexion')
let modelo = {}

modelo.get = (id, callback) => {
    if(id){
        db.query('SELECT * FROM cursos WHERE id = ?', [id], (error, result) => {
            callback(error, error ? error.sqlMessage: result)
        })
    }else{
        db.query('SELECT * FROM cursos', (error, result) => {
            callback(error, error ? error.sqlMessage: result)
        })
    }
}

module.exports = modelo