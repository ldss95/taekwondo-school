const db = require('./conexion')
const model = {}

model.gets = (callback) => {
    db.query('SELECT * FROM articulos', (error, rows) => {
        callback(error, (error) ? error.sqlMessage: rows)
    })
}

module.exports = model