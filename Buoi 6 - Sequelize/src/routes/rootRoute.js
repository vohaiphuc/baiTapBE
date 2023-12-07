import express from "express"
import foodRoutes from "./foodRoutes.js"
import restaurantRoutes from "./restaurantRoutes.js"
import userRoutes from "./userRoutes.js"

const rootRoute = express.Router()

rootRoute.use("/res", restaurantRoutes)
rootRoute.use("/user", userRoutes)

export default rootRoute