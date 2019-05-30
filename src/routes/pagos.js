const express = require('express')
const router = express.Router()
const Controlador = require('../controllers/pago')

router.get('/API/pago/:id', Controlador.getPago)
router.get('/API/pagos', Controlador.getPagos)

module.exports = router