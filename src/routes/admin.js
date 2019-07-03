const express = require('express')
const router = express.Router()
const layout = {
    layout: 'admin.hbs'
}

router.get('/', (req, res) => {
    res.render('./admin/home', layout)
})

module.exports = router