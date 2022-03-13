const express = require('express')
const router = express.Router()

router.post('/signup', (req, req) => {
    const user = User({
        email: req.body.email,
        password: req.body.password
    })
    user.save()
        .then((err) => {
            if (err) {
                console.log(err)
                res.json(err)
            } else {
                console.log(user)
                res.json(user)
            }
        })

})

module.exports = router