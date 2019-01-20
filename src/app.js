const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const api = require('./routes/')
const mysql = require('mysql')
const myConneciont = require('express-myconnection')

app.use(bodyParser.urlencoded({ extended: true}))
app.use(bodyParser.json())
app.use('/api', api)
app.use(myConneciont(mysql, {
    host: 'localhost',
    user: 'root',
    password: '123456',
    port: 3306,
    database: 'taekwondo'
}, 'single'))

module.exports = app