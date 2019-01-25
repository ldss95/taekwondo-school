const express = require('express')
const path = require('path')
const bodyParser = require('body-parser')
const app = express()

app.use(bodyParser.urlencoded({ extended: true}))
app.use(bodyParser.json())
app.use(express.static(__dirname + '/public'))
app.use('/api', require('./routes/'))

module.exports = app