import Joi from "joi";

export const pengemudiValidasiSignup = Joi.object({
    pengemudi_id: Joi.number().required(),
    username: Joi.string().min(6).max(12).required(),
    password: Joi.string().min(6).max(20).required()
})

export const pengemudiValidasiSigin = Joi.object({
    username: Joi.string().min(6).max(12).required(),
    password: Joi.string().min(6).max(20).required()
})