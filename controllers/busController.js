import Bus from "../models/busModel.js";
import { updateBusValidate } from "../validasi/busSchema.js";

export const setAktifBus = async(req, res) =>{
    try {

        const bus = await Bus.findOne({ where: { bus_id: req.params.bus_id } });

        if (!bus) {
            return res.status(401).json({success: false,
                msg: 'bus tidak ditemukan' });
        }

        await bus.update({status: true});
        res.status(200).json({success: true,
            msg: "Bus aktif"});
    } catch (error) {
        res.status(401).json({success: false,
            msg: error });
    }
}

export const setNonaktifBus = async(req, res) =>{
    try {
        const bus = await Bus.findOne({ where: { bus_id: req.params.bus_id } });

        if (!bus) {
            return res.status(401).json({success: false,
                msg: 'bus tidak ditemukan' });
        }

        await bus.update({status: false
        });
        res.status(200).json({success: true,
            msg: "Bus nonaktif"});
    } catch (error) {
        res.status(401).json({success: false,
            msg: error });
    }
}

export const updateLokasiBus = async(req, res) =>{
    try {

        const {error} = updateBusValidate.validate(req.body)

        if (error) {
            res.status(400).json({success: false,
                 msg: error.details[0].message })
            return;
          }

        
        const bus = await Bus.findOne({ where: { bus_id: req.body.bus_id } });

        if (!bus) {
            return res.status(401).json({success: false,
                 msg: 'bus tidak ditemukan' });
        }

        const lokasi = `${req.body.latitude} ${req.body.longitude}` 

        await bus.update( {lokasi_bus:lokasi 
        });
        res.status(200).json({msg: "Bus lokasi update"});
    } catch (error) {
        console.log(error.message);
    }
}

///////////////////////public func///////////////////////

export const getLokasiBus = async(req, res) =>{
    try {
        const response = await Bus.findAll();
        res.status(200).json(response);
    } catch (error) {
        console.log(error.message);
    }
}

export const getLokasiOneBus = async(req, res) =>{
    try {
        const bus = await Bus.findOne({ where: { bus_id: req.params.bus_id } });

        if (!bus) {
            return res.status(401).json({ msg: 'bus tidak ditemukan' });
        }

        const response = await Bus.findOne({
            where:{
                bus_id: req.params.bus_id
            }
        });
        res.status(200).json(response);
    } catch (error) {
        console.log(error.message);
    }
}