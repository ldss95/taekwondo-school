const express = require('express')
const router = express.Router()
const Controlador = require('../controllers/eventos')

router.get('/', Controlador.get)

module.exports = router