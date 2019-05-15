const express = require('express')
const router = express.Router()
const controller = require('../controllers/alumno')

router.get('/alumno/:id', controller.get)
router.get('/alumnos', controller.gets)
router.post('/', controller.crear)
router.put('/alumno', controller.actualizar)
router.delete('/alumno/:id', controller.eliminar)

module.exports = router