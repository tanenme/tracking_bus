import Joi from "joi";

export const updateBusValidate = Joi.object({
    bus_id: Joi.number().required(),
    latitude: Joi.number().required(),
    longitude: Joi.number().required()
})