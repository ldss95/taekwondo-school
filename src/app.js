const express = require('express')
const exphbs = require('express-handlebars')
const path = require('path')
const bodyParser = require('body-parser')
const app = express()

//Settings
app.set('port', process.env.PORT || 3000)
app.set('views', path.join(__dirname, 'views'))
app.engine('.hbs', exphbs({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: 'hbs'
}))
app.set('view engine', '.hbs')

app.use(bodyParser.urlencoded({ extended: true}))
app.use(bodyParser.json())
app.use(express.static(__dirname + '/public'))
app.use(require('./routes/routes'))

module.exports = app