const Modelo = require('../models/team')
const Controlador = {}

Controlador.gets = (req, res) => {
    Modelo.gets((error, rows) => {
        if(error)
            res.status(500).send(error)
        else
            res.status(200).send(rows)
    })
}

module.exports = Controlador