const Alumno = require('../models/alumno')

function getAlumno(req, res){
    res.status(200).send('Todo esta funcionando bien')
}

function getAlumnos(req, res){

}

module.exports = {
    getAlumno,
    getAlumnos
}