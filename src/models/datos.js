const db = require('./conexion')
const modelo = {}

modelo.get = (callback) => {
    db.query('SELECT * FROM datos', (error, res) => {
        callback(error, res[0])
    })
}

module.exports = modelo