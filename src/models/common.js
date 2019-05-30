const db = require('./conexion')
const Modelo = {}

Modelo.home = (callback) => {
    let slides = []
    let cursos = []
    let articulo = []
    db.query('SELECT descripcion, imagen, titulo, link_boton, texto_boton FROM slides WHERE estado = 1', (error, rows) => {
        if(error)
            callback(error, false)
        else{
            slides = rows
            let query = `
            SELECT
                cu.descripcion,
                cu.imagen,
                cu.nombre,
                cu.precio_mensualidad,
                cu.precio_inscripcion,
                SUBSTR(cl.fecha_inicio, 1, 10) AS fecha_inicio,
                SUBSTR(cl.fecha_fin, 1, 10) AS fecha_fin,
                cl.hora_entrada,
                cl.hora_salida,
                cl.lugar,
                cl.dias,
                CONCAT(ma.nombres, ' ', ma.apellidos) AS maestro,
                ma.foto AS foto_maestro,
                ma.email,
                cin.color AS cinturon
            FROM
                cursos cu
            LEFT JOIN
                clases cl ON cl.curso = cu.id AND cl.fecha_inicio > DATE(NOW())
            LEFT JOIN
                maestros ma ON cl.maestro = ma.id
            LEFT JOIN
            	cinturones cin ON cin.id = ma.cinturon
            WHERE 
                cu.estado = 1
                GROUP BY cu.id
                ORDER BY cl.fecha_inicio ASC`

            db.query(query, (error, rows) => {
                if(error)
                    callback(error, false)
                else{
                    cursos = rows
                    db.query('SELECT nombre, texto FROM articulos WHERE id = 5', (error, row) => {
                        if(error)
                            callback(error, false)
                        else
                            articulo = row[0]
                            callback(null, {
                                slides,
                                cursos, 
                                articulo
                            })
                    })
                }
            })
        }
    })
}

module.exports = Modelo