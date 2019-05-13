const model = require('../models/team')
const controller = {}

controller.gets = (req, res) => {
    model.gets((error, rows) => {
        if(error)
            res.status(500).send(error)
        else
            res.status(200).send(rows)
    })
}

module.exports = controller