const Modelo = require('../models/alumno')

function getAlumno(req, res){
    res.status(200).send('Todo esta funcionando bien')
}

function get(req, res){
    Modelo.get(req.params.id, (error, row) => {
        if(error){
            res.status(500).send(error)
        }else{
            res.status(200).send(row)
        }
    })
}

function gets(req, res){
    Modelo.gets((error, rows) => {
        if(error){
            res.status(500).send(error)
        }else{
            res.status(200).send(rows)
        }
    })
}

function crear(req, res){
    Modelo.creat(req.body, (error, row) => {
        if(error){
            res.status(500).send(error)
        }else{
            res.status(201).send(row)
        }
    })
}

function actualizar(req, res){

}

function eliminar(req, res){
    Modelo.eliminar(req.params.id, (error, row) => {
        if(error){
            res.status(500).send(error)
        }else{
            res.status(200).send(row)
        }
    })
}

module.exports = {
    get,
    gets,
    actualizar,
    eliminar,
    crear
}