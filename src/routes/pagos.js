const express = require('express')
const router = express.Router()
const controller = require('../controllers/pago')

router.get('/API/pago/:id', controller.getPago)
router.get('/API/pagos', controller.getPagos)

module.exports = router