const express = require('express')
const router = express.Router()
const Controlador = require('../controllers/newsletter')

router.post('/', Controlador.agregar)

module.exports = router