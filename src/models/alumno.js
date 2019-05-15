const db = require('./conexion')
let modelo = {}

modelo.get = (id, callback) => {
    db.query('SELECT * FROM alumnos WHERE id = ?', [id], (error, row) => {
        callback(null, (error) ? error.sqlMessage: row)
    })
}

modelo.gets = (callback) => {
    db.query('SELECT * FROM alumnos ORDER BY id', (error, rows) => {
        callback(null, (error) ? error.sqlMessage: rows)
    })
}

modelo.crear = (alumno, callback) => {
    db.query('INSERT INTO alumnos SET ?', alumno, (error, result) => {
        callback(null, (error) ? error.sqlMessage: result)
    })
}

modelo.actualizar = (datos, callback) => {
    //db.query('UPDATE alumnos SET ')
}

modelo.eliminar = (id, callback) => {
    db.query('DELETE FROM alumnos WHERE id = ?', [id], (error, row) => {
        callback(
            null, 
            (error) 
                ? error.sqlMessage
                : (row.affectedRows == 0) 
                    ? 'No se ha podido eliminar el alumno, por favor verifique el id'
                    : 'Alumno eliminado'
        )
    })
}

module.exports = modelo