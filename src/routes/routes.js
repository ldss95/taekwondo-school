const express = require('express')
const router = express.Router()

router.get('/', (req, res) => {
    res.render('home')
})

router.get('/login', (req, res) => {
    res.render('login')
})

router.get('/consultas', (req, res) => {
    res.render('consultas')
})

router.get('/sobre_nosotros', (req, res) => {
    res.render('nosotros')
})

router.get('/videos', (req, res) => {
    res.render('videos')
})

router.get('/eventos', (req, res) => {
    res.render('eventos')
})

router.get('/inscripcion', (req, res) => {
    res.render('inscripcion')
})

router.use('/API', require('./api'))

//En caso de no existir la ruta
/*
    Error 404
*/
router.get('/404', (req, res) => {
    res.status(404).render('404')
})

router.get('*', (req, res) => {
    res.status(404).render('404')
})

module.exports = router