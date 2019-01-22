const express = require('express')
const path = require('path')
const alumno = require('../controllers/alumno')
const pago = require('../controllers/pago')
const api = express.Router()

//Rutas para los alumnos
api.get('/alumno/:id', alumno.get)
api.get('/alumnos', alumno.gets)
api.post('/alumo', alumno.crear)
api.put('/alumno', alumno.actualizar)
api.delete('/alumno/:id', alumno.eliminar)

//Rutas para los pagos
api.get('/pago/:id', pago.getPago)
api.get('/pagos', pago.getPagos)

//En caso de no existir la ruta
api.get('*', (req, res) => {
    res.status(404).sendFile(path.join(__dirname, '../' + 'views/404.html'))
})

module.exports = api