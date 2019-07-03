const express = require('express')
const router = express.Router()
const Controlador = require('../controllers/datos')

router.get('/', Controlador.get)

module.exports = router