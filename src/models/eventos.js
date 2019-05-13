const db = require('./conexion')
const model = {}

model.get = (id, callback) => {
    let query = (!id) 
        ? 'SELECT * FROM eventos'
        : `SELECT * FROM eventos WHERE id = ${id}`

    db.query(query, (error, rows) => {
        callback(error, error ? error.sqlMessage: rows)
    })

}

module.exports = model