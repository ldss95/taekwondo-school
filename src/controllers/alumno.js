const Modelo = require('../models/alumno')
const Controlador = {}

Controlador.getAlumno = (req, res) => {
    res.status(200).send('Todo esta funcionando bien')
}

Controlador.get = (req, res) => {
    Modelo.get(req.params.id, (error, row) => {
        if(error){
            res.status(500).send(error)
        }else{
            res.status(200).send(row)
        }
    })
}

Controlador.gets = (req, res) => {
    Modelo.gets((error, rows) => {
        if(error){
            res.status(500).send(error)
        }else{
            res.status(200).send(rows)
        }
    })
}

Controlador.crear = (req, res) => {
    let alumno = {
        id: null,
        fecha_inscripcion: null,
        nombres: req.body.nombres,
        apellidos: req.body.apellidos,
        fecha_nacimiento: req.body.fecha_nacimiento,
        genero: req.body.genero,
        tipo: req.body.tipo,
        clase: req.body.clase,
        cinturon: req.body.cinturon,
        padre: req.body.padre,
        mayores: req.body.mayores,
        observacion: req.body.observacion,
        referencia: req.body.referencia,
        foto: req.body.foto
    }

    Modelo.crear(alumno, (error, row) => {
        if(error){
            res.status(500).send(error)
        }else{
            res.status(201).send(row)
        }
    })
}

Controlador.actualizar = (req, res) => {

}

Controlador.eliminar = (req, res) => {
    Modelo.eliminar(req.params.id, (error, row) => {
        if(error){
            res.status(500).send(error)
        }else{
            res.status(200).send(row)
        }
    })
}

module.exports = Controlador