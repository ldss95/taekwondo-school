const Modelo = require('../models/usuarios')
let Controlador = {}

Controlador.login = (req, res) => {
    Modelo.login(req.body.email, req.body.pass, (error, result) => {
        if(error)
            res.status(500).send(error)
        else
            res.status(200).send(result)
    })
}

module.exports = Controlador