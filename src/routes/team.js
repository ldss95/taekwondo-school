const express = require('express')
const router = express.Router()
const controller = require('../controllers/team')

router.get('/', controller.gets)

module.exports = router