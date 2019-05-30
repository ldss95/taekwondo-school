const db = require('./conexion')
const Modelo = {}

Modelo.agregar = (email, callback) => {
    db.query('INSERT INTO newsletter SET ?', {email}, (error, result) => {
        if(result)
            callback(null, true)
        else if(error.code == 'ER_DUP_ENTRY')
            callback(null, 'Su correo ya existe en nuestra base de datos.')
        else
            callback(error.sqlMessage, false)
    })
}

module.exports = Modelo