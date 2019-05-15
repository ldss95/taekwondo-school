const express = require('express')
const session = require('express-session')
const MySqlStore = require('express-mysql-session')(session)
const exphbs = require('express-handlebars')
const path = require('path')
const bodyParser = require('body-parser')
const app = express()
const sessionStore = new MySqlStore(require('./models/mysql_connection_params'))

//Settings
app.set('port', process.env.PORT || 4000)
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
app.use(session({
    secret: 'ytqutdqtv',
    store: sessionStore,
    resave: true,
    saveUninitialized: true
}))
app.use(require('./routes/routes'))

module.exports = app