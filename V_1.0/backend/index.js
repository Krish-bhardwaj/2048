const express = require('express')

const app = require()

const port = 8080 || process.env.port

const cors = require('cors')

const bodyParser = require('body-parser')
const mongoose = require('mongoose')

mongoose.connect("mongodb://localhost:27017/db", { useNewUrlParser: true, useUnifiedTopology: true })
app.use(cors())

app.use(bodyParser.urlencoded({ extended: true }))

app.use(bodyParser.json())

app.listen(port, () => {
    console.log('port running on ' + port)
})