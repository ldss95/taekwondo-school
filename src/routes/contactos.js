const express = require('express')
const router = express.Router()
const controller = require('../controllers/contactos')

router.post('/', controller.guardar)

module.exports = router