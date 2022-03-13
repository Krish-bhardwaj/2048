const mongoose = require('mongoose')

const Schema = mongoose.Schema

const newSchema = newSchema({
    email: String,
    password: String
})
module.exports = mongoose.model('User', newSchema)