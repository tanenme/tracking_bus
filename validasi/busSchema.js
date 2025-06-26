import Joi from "joi";

export const updateBusValidate = Joi.object({
    id: Joi.number().required(),
    lat: Joi.number().required(),
    long: Joi.number().required()
})

export const setBus = Joi.object({
    id: Joi.number().required(),
    id_pengemudi: Joi.number().required()
})