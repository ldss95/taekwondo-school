const Modelo = require('../models/common')
const Controlador = {}

Controlador.home = (req, res) => {
    Modelo.home((error, rows) => {
        if(error)
            res.status(500).send(error)
        else
            res.status(200).send(rows)
    })
}

module.exports = Controlador