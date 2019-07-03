const db = require('./conexion')
const Modelo = {}

Modelo.gets = (callback) => {
    db.query('SELECT cargo, email, facebook, instagram, nombre, twitter, youtube FROM team', (error, rows) => {
        callback(error, error ? error.sqlMessage : rows)
    })
}

module.exports = Modelo