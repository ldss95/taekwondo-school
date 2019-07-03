const express = require('express')
const router = express.Router()
const Controlador = require('../controllers/usuarios')

router.post('/login', Controlador.login)
router.get('/logout', Controlador.logout)
router.get('/session', Controlador.session)

module.exports = router