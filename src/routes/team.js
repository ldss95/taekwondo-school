const express = require('express')
const router = express.Router()
const Controlador = require('../controllers/team')

router.get('/', Controlador.gets)

module.exports = router