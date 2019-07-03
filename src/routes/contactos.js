const express = require('express')
const router = express.Router()
const Controlador = require('../controllers/contactos')

router.post('/', Controlador.guardar)

module.exports = router