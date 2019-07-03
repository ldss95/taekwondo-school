const Modelo = require('../models/newsletter')
const Controlador = {}

Controlador.agregar = (req, res) => {
    Modelo.agregar(req.body.email, (error, result) => {
        if(error)
            res.status(500).send(error)
        else
            res.status(200).send(result)
    })
}

module.exports = Controlador