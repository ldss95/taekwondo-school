const db = require('./conexion')
const model = {}

model.guardar = (contacto, callback) => {
    db.query('INSERT INTO contacto SET ?', [contacto], (error, res) => {
        callback(error, res)
    })
}

module.exports = model