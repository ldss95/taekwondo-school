const express = require('express')
const path = require('path')
const bodyParser = require('body-parser')
const app = express()
const api = require('./routes/')
const hbs = require('express-handlebars')

app.use(bodyParser.urlencoded({ extended: true}))
app.use(bodyParser.json())
app.engine('.hbs', hbs({
    defaultLayout: 'default',
    extname: '.hbs',
    layoutsDir: path.join(__dirname, 'views/layouts')
}))
app.set('view engine', '.hbs')
app.set('views', path.join(__dirname, 'views'))
app.get('/', (req, res) => {
    res.render('landing')
})
app.use('/api', api)

module.exports = app