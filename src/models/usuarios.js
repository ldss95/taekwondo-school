const db = require('./conexion')
const bcrypt = require('bcrypt-nodejs')
let modelo = {}

modelo.login = (email, pass, callback) => {
    db.query('SELECT * FROM usuarios WHERE email = ?', [email], (error, result) => {
        if(result.length){
            if(result[0].estado){
                bcrypt.compare(pass, result[0].password, (bcError, bcResult) => {
                    if(bcResult)
                        callback(null, true)
                    else
                        callback(bcError, 'Contrseña incorrecta')
                })
            }else
                callback(null, 'Usuario desabilitado')
        }else
            callback(null, 'Email invalido')
    })
}

module.exports = modelo