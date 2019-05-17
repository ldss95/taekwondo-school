const express = require('express')
const router = express.Router()
const controller = require('../controllers/cursos')

router.get('/', controller.get)

module.exports = router