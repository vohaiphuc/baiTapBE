import express from "express"
import { getLike, getRating, getRestaurantList } from "../controllers/restaurantController.js"

const restaurantRoutes = express.Router()
restaurantRoutes.get("/", getRestaurantList)
restaurantRoutes.get("/get-like", getLike)
restaurantRoutes.get("/get-rating", getRating)


export default restaurantRoutes