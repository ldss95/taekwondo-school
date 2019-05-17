const Modelo = require('../models/cursos')
let Controlador = {}

Controlador.get = (req, res) => {
    Modelo.get(req.query.id, (error, result) => {
        if(error)
            res.status(500).send(error)
        else
            res.status(200).send(result)
    })   
}

module.exports = Controlador