const express = require("express")
const controller = require("./controller.js")
const dotenv = require("dotenv")
const router = express.Router()
dotenv.config()

router.get("/login", controller.login)

module.exports = {router}
