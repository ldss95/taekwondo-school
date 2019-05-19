const db = require('./conexion')
const model = {}

model.get = (id, callback) => {
    if(id){
        db.query('SELECT nombre, texto FROM articulos WHERE id = ?', [id], (error, rows) => {
            callback(error, (error) ? error.sqlMessage: rows[0])
        })
    }else{
        db.query('SELECT nombre, texto FROM articulos', (error, rows) => {
            callback(error, (error) ? error.sqlMessage: rows[0])
        })
    }
}

module.exports = model