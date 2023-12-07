import express from "express"
import { getLike, getRating, like, order, rate } from "../controllers/userController.js"

const userRoutes = express.Router()
userRoutes.post("/like", like)
userRoutes.get("/get-like", getLike)
userRoutes.post("/rate", rate)
userRoutes.get("/get-rating", getRating)
userRoutes.post("/order", order)

export default userRoutes