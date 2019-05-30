const Modelo = require('../models/articulos')
const Controlador = {}

Controlador.get = (req, res) => {
    Modelo.get(parseInt(req.query.id), (error, rows) => {
        if(error)
            res.status(500).send(error)
        else
            res.status(200).send(rows)
    })
}

module.exports = Controlador