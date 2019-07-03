const Modelo = require('../models/datos')
const Controlador = {}

Controlador.get = (req, res) => {
    Modelo.get((error, result) => {
        if(error)
            res.status(500).send(error)
        else
            res.status(200).send(result)
    })
}

module.exports = Controlador