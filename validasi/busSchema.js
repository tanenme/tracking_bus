import Joi from "joi";

export const updateBusValidate = Joi.object({
    id_bus: Joi.number().required(),
    latitude: Joi.number().required(),
    longitude: Joi.number().required()
})

export const setBus = Joi.object({
    id_bus: Joi.number().required(),
    id_pengemudi: Joi.number().required()
})