const express = require('express')
const router = express.Router()
const Controlador = require('../controllers/alumno')

router.get('/alumno/:id', Controlador.get)
router.get('/alumnos', Controlador.gets)
router.post('/', Controlador.crear)
router.put('/alumno', Controlador.actualizar)
router.delete('/alumno/:id', Controlador.eliminar)

module.exports = router