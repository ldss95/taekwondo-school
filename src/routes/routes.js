const express = require('express')
const path = require('path')
const alumno = require('../controllers/alumno')
const pago = require('../controllers/pago')
const router = express.Router()

router.get('/', (req, res) => {
    res.render('home')
})

//Rutas para los alumnos
router.get('/API/alumno/:id', alumno.get)
router.get('/API/alumnos', alumno.gets)
router.post('/API/alumo', alumno.crear)
router.put('/API/alumno', alumno.actualizar)
router.delete('/API/alumno/:id', alumno.eliminar)

//Rutas para los pagos
router.get('/API/pago/:id', pago.getPago)
router.get('/API/pagos', pago.getPagos)

//En caso de no existir la ruta
/*
    Error 404
*/
router.get('/404', (req, res) => {
    res.status(404).render('404')
})

router.get('*', (req, res) => {
    res.status(404).render('404')
})

module.exports = router