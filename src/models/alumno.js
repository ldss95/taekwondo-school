const db = require('./conexion')

let modelo = {}

modelo.get = (id, callback) => {
    db.query(`SELECT * FROM alumnos WHERE id = ${id}`, (error, row) => {
        callback(null, (error) ? error.sqlMessage: row)
    })
}

modelo.gets = (callback) => {
    db.query('SELECT * FROM alumnos ORDER BY id', (error, rows) => {
        callback(null, (error) ? error.sqlMessage: rows)
    })
}

modelo.crear = (datos, callback) => {
    db.query(`INSERT INTO alumnos (imagen, nombres, apellidos, fecha_nacimiento, padre) VALUES ('${datos.imagen}', '${datos.nombres}', '${datos.apellidos}', '${datos.fecha_nacimiento}', '${datos.padre}')`, (error, row) => {
        callback(null, (error) ? error.sqlMessage: row)
    })
}

modelo.actualizar = (datos, callback) => {
    //db.query('UPDATE alumnos SET ')
}

modelo.eliminar = (id, callback) => {
    db.query(`DELETE FROM alumnos WHERE id = ${id}`, (error, row) => {
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