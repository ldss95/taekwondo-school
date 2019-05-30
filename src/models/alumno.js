const db = require('./conexion')
const Modelo = {}

Modelo.get = (id, callback) => {
    db.query('SELECT * FROM alumnos WHERE id = ?', [id], (error, row) => {
        callback(null, (error) ? error.sqlMessage: row)
    })
}

Modelo.gets = (callback) => {
    db.query('SELECT * FROM alumnos ORDER BY id', (error, rows) => {
        callback(null, (error) ? error.sqlMessage: rows)
    })
}

Modelo.crear = (alumno, callback) => {
    db.query('INSERT INTO alumnos SET ?', alumno, (error, result) => {
        callback(null, (error) ? error.sqlMessage: result)
    })
}

Modelo.actualizar = (datos, callback) => {
    //db.query('UPDATE alumnos SET ')
}

Modelo.eliminar = (id, callback) => {
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

module.exports = Modelo