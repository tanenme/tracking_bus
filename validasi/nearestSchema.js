import Joi from "joi";

export const getNearestValidation = Joi.object({
    latitude: Joi.number().required(),
    longitude: Joi.number().required()
})