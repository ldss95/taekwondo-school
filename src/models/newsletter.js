const db = require('./conexion')
const Modelo = {}

Modelo.agregar = (email, callback) => {
    db.query('INSERT INTO newsletter SET ?', {email}, (error, result) => {
        if(result)
            callback(null, true)
        else if(error.code == 'ER_DUP_ENTRY'){
            db.query('SELECT estado FROM newsletter WHERE email = ?', [email], (error, result) => {
                if(error)
                    callback(error, false)
                else{
                    if(result[0].estado == 0){
                        db.query('UPDATE newsletter SET estado = 1 WHERE email = ?', [email], (error, result) => {
                            if(error)
                                callback(error, false)
                            else if(result.affectedRows == 1)
                                callback(null, true)
                            else
                                callback(null, false)
                        })
                    }else
                        callback(null, 'Su correo ya existe en nuestra base de datos.')
                }
            })
        }else
            callback(error.sqlMessage, false)
    })
}

module.exports = Modelo