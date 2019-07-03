const Modelo = require('../models/pago')
const Controlador =  {}

Controlador.getPago = (req, res) => {
    res.status(200).send('Todo esta funcionando bien')
}

Controlador.getPagos = (req, res) => {
    Modelo.getPagos((error, rows) => {
        if(error){
            res.status(500).send(error)
        }else{
            res.status(200).send(rows)
        }
    })
}

module.exports = Controlador