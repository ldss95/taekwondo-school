const db = require('./conexion')
const Modelo = {}

Modelo.guardar = (contacto, callback) => {
    db.query('INSERT INTO contacto SET ?', [contacto], (error, res) => {
        callback(error, res)
    })
}

module.exports = Modelo