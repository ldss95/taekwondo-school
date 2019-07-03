const db = require('./conexion')
const Modelo = {}

Modelo.get = (callback) => {
    db.query('SELECT * FROM datos', (error, res) => {
        callback(error, res[0])
    })
}

module.exports = Modelo