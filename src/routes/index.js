const express = require('express')
const alumno = require('../controllers/alumno')
const api = express.Router()

//Rutas para los alumnos
api.get('/alumno/:id', alumno.getAlumno)
api.get('/alumnos', alumno.getAlumnos)

module.exports = api