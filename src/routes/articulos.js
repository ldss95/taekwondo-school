const express = require('express')
const router = express.Router()
const Controlador = require('../controllers/articulos')

router.get('/', Controlador.get)

module.exports = router