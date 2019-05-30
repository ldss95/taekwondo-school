const express = require('express')
const router = express.Router()
const Controlador = require('../controllers/common')

router.get('/home', Controlador.home)

module.exports = router