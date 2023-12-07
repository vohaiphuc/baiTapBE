import { responseData } from "../config/Response.js"
import { sequelize } from "../models/connect.js"
import initModels from "../models/init-models.js"

const model = initModels(sequelize)

export const getRestaurantList = async (req, res) => {
    const data = await model.restaurant.findAll({})
    responseData(res, "Done", data, 200)
}

export const getLike = async (req, res) => {
    try {
        const { res_id } = req.body
        const data = await model.like_res.findAll({
            where: {
                res_id,
                unlike: false
            },
            include: ['user']
        })
        responseData(res, "", data, 200)
    } catch (error) {
        console.log("🚀 ~ file: restaurantController.js:23 ~ getLike ~ error:", error)
        responseData(res, "Err", error, 500)
    }
}

export const getRating = async (req, res) => {
    try {
        const { res_id } = req.body
        const data = await model.rate_res.findAll({
            where: {
                res_id
            },
            include: ['user']
        })
        responseData(res, "Rating list", data, 200)
    } catch (error) {
        console.log("🚀 ~ file: userController.js:69 ~ getRating ~ error:", error)
        responseData(res, "Err", error, 500)
    }
}