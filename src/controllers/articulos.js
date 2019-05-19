const model = require('../models/articulos')
const controller = {}

controller.get = (req, res) => {
    model.get(parseInt(req.query.id), (error, rows) => {
        if(error)
            res.status(500).send(error)
        else
            res.status(200).send(rows)
    })
}

module.exports = controller