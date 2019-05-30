const express = require('express')
const router = express.Router()

router.use('/alumnos', require('./alumnos'))
router.use('/pagos', require('./pagos'))
router.use('/articulos', require('./articulos'))
router.use('/team', require('./team'))
router.use('/eventos', require('./eventos'))
router.use('/cursos', require('./cursos'))
router.use('/datos', require('./datos'))
router.use('/contactos', require('./contactos'))
router.use('/usuarios', require('./usuarios'))
router.use('/common', require('./common'))
router.use('/newsletter', require('./newsletter'))

module.exports = router