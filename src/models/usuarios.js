const db = require('./conexion')
const bcrypt = require('bcrypt-nodejs')
const Modelo = {}

Modelo.login = (email, pass, callback) => {
    let query = `
        SELECT 
            u.nombre, 
            u.email, 
            u.rol, 
            u.estado,
            u.password,
            u.imagen,
            r.nombre AS rol
        FROM 
            usuarios u
        INNER JOIN
            roles r
        ON
            r.id = u.rol
        WHERE u.email = ?`

    db.query(query, [email], (error, user) => {
        if(error)
            callback(error, null)
        else if(user.length){
            if(user[0].estado){
                bcrypt.compare(pass, user[0].password, (bcError, bcResult) => {
                    if(bcResult)
                        callback(null, user[0])
                    else
                        callback(null, 'Contrseña incorrecta')
                })
            }else
                callback(null, 'Usuario desabilitado')
        }else
            callback(null, 'Email invalido')
    })
}

module.exports = Modelo