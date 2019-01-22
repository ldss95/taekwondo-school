const modeloPago = require('../models/pago')

function getPago(req, res){
    res.status(200).send('Todo esta funcionando bien')
}

function getPagos(req, res){
    odeloPago.getPagos((error, rows) => {
        if(error){
            res.status(500).send(error)
        }else{
            res.status(200).send(rows)
        }
    })
}

module.exports = {
    getPago,
    getPagos
}