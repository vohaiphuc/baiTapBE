import { response } from "express"
import { responseData } from "../config/Response.js"
import { sequelize } from "../models/connect.js"
import initModels from "../models/init-models.js"

const model = initModels(sequelize)

export const like = async (req, res) => {
    const { user_id, res_id } = req.body
    // 1 user can like many restaurant
    // 1 user can like a restaurant 1 time
    try {
        const existedLike = await model.like_res.findOne({
            where: {
                user_id, res_id,
            },
        })
        // exist: unlike
        // non: like
        if (existedLike) {
            const newData = {
                date_like: new Date(),
                unlike: !existedLike.unlike,
            }
            await existedLike.update(newData)
            responseData(res, newData.unlike ? "Unliked" : "Liked", "", 200)
        } else {
            await model.like_res.create({
                user_id, res_id,
            })
            responseData(res, "Liked", "", 200)
        }
    } catch (error) {
        console.log("🚀 ~ file: userController.js:20 ~ like ~ error:", error)
        responseData(res, "Err", error, 500)
    }
}

export const getLike = async (req, res) => {
    try {
        const { user_id } = req.body
        const data = await model.like_res.findAll({
            where: {
                user_id,
                unlike: false
            },
            include: ['re']
        })
        responseData(res, "", data, 200)
    } catch (error) {
        console.log("🚀 ~ file: userController.js:42 ~ getLike ~ error:", error)
        responseData(res, "Err", error, 500)
    }
}

export const rate = async (req, res) => {
    try {
        const { user_id, res_id, amount } = req.body
        const existedRating = await model.rate_res.findOne({
            where: {
                user_id, res_id
            }
        })
        if (existedRating) {
            const newRate = {
                amount,
                date_rate: new Date()
            }
            existedRating.update(newRate)
            responseData(res, "Edited the old rating", newRate, 200)
        } else {
            const newRate = {
                user_id, res_id, amount,
                date_rate: new Date()
            }
            await model.rate_res.create({
                user_id, res_id, amount
            })
            responseData(res, "Created a new rating", newRate, 200)
        }
    } catch (error) {
        console.log("🚀 ~ file: userController.js:59 ~ rate ~ error:", error)
        responseData(res, "Err", error, 500)
    }
}

export const getRating = async (req, res) => {
    try {
        const { user_id } = req.body
        const data = await model.rate_res.findAll({
            where: {
                user_id
            },
            include: ['re']
        })
        responseData(res, "Rating list", data, 200)
    } catch (error) {
        console.log("🚀 ~ file: userController.js:69 ~ getRating ~ error:", error)
        responseData(res, "Err", error, 500)
    }
}

export const order = async (req, res) => {
    try {
        const { user_id, food_list } = req.body
        const arr_sub_id = Date.now()
        const newOrders = food_list.map(food => {
            return {
                user_id,
                food_id: food.food_id,
                amount: food.amount,
                code: food.code,
                arr_sub_id
            }
        })
        await model.orders.bulkCreate(newOrders)
        responseData(res, "Created a new order", newOrders, 200)
    } catch (error) {
        console.log("🚀 ~ file: userController.js:107 ~ order ~ error:", error)
        responseData(res, "Err", error, 500)
    }
}
