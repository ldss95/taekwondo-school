const app = require('./app')
app.listen(process.env.PORT || 3000, () => {
    console.log(`Corriendo en http://localhost:3000`)
})