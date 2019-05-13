const express = require('express')
const router = express.Router()
const controller = require('../controllers/articulos')

router.get('/', controller.gets)

module.exports = router