const Modelo = require('../models/eventos')
const Controlador = {}

Controlador.get = (req, res) => {
    Modelo.get(null, (error, rows) => {
        if(error)
            res.status(500).send(error)
        else
            res.status(200).send(rows)
    })
}

module.exports = Controlador