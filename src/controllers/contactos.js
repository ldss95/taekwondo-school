const Modelo = require('../models/contactos')
const ModeloDatos = require('../models/datos')
const mail = require('nodemailer')
const Controlador = {}

Controlador.guardar = (req, res) => {
    let contacto = {
        nombre: req.body.nombre,
        email: (req.body.email) ? req.body.email: null,
        telefono: (req.body.telefono) ? req.body.telefono: null,
        asunto: (req.body.asunto) ? req.body.asunto: null,
        mensaje: req.body.mensaje
    }

    /*
        Enviamos por correo
    */
    ModeloDatos.get((error, result) => {
        if(error)
            res.status(500).send(error)
        else{
            let transporter = mail.createTransport({
                service: 'Gmail',
                auth: {
                    user: 'luis@binardom.com',
                    pass: '100PRETEAMARE'
                }
            })

            let mailOptions = {
                from: result.url,
                to: result.email,
                subject: 'Contacto desde la WEB',
                html: `
                    <p>
                        <b>Nombre: </b> ${contacto.nombre} <br> 
                        <b>Asunto: </b> ${(contacto.asunto) ? contacto.asunto: ''} <br> 
                        <b>Correo Electronico: </b> ${contacto.email} <br> 
                        <b>Telefono: </b> ${(contacto.telefono) ? contacto.telefono: ''} <br> <hr>
                        ${contacto.mensaje}
                    </p>
                `
            }

            transporter.sendMail(mailOptions, (error, info) => {
                if(error)
                    res.status(500).send(error)
                else{
                    /*
                        Guardamos en la DB
                    */

                    Modelo.guardar(contacto, (error, result) => {
                        if(error)
                            res.status(500).send(error)
                        else
                            res.status(200).send(true)
                    })
                }
            })
        }
    })
}

module.exports = Controlador