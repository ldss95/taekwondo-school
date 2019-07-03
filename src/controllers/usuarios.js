const Modelo = require('../models/usuarios')
const Controlador = {}

Controlador.login = (req, res) => {
    Modelo.login(req.body.email, req.body.pass, (error, result) => {
        if (error)
            res.status(500).send(error)
        else if (typeof result == 'object') {
            req.session.loggedin = true
            req.session.name = result.nombre
            req.session.imagen = result.imagen
            req.session.email = result.email
            req.session.rol = result.rol
            res.status(200).send(req.session)
        } else
            res.status(200).send(result)
    })
}

Controlador.logout = (req, res) => {
    req.session.destroy()
    res.status(200).send(true)
}

Controlador.session = (req, res) => {
    res.status(200).send(req.session)
}

module.exports = Controlador