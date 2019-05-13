const model = require('../models/eventos')
const controller = {}

controller.get = (req, res) => {
    model.get(null, (error, rows) => {
        if(error)
            res.status(500).send(error)
        else
            res.status(200).send(rows)
    })
}

module.exports = controller