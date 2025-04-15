import Bus from "../models/busModel.js";
import { updateBusValidate, setBus } from "../validasi/busSchema.js";

export const setAktifBus = async(req, res) =>{
    try {

        const {error} = updateBusValidate.validate(req.body)

        if (error) {
            res.status(400).json({success: false,
                 msg: error.details[0].message })
            return;
        }

        const bus = await Bus.findOne({ where: { id: req.body.id_bus } });

        if (!bus) {
            return res.status(401).json({success: false,
                msg: 'bus tidak ditemukan' });
        }

        await bus.update({is_aktif: true, id_pengemudi: req.body.id_pengemudi});
        res.status(200).json({success: true,
            msg: "Bus aktif"});
    } catch (error) {
        res.status(401).json({success: false,
            msg: error });
    }
}

export const setNonaktifBus = async(req, res) =>{
    try {
        const {error} = updateBusValidate.validate(req.body)

        if (error) {
            res.status(400).json({success: false,
                 msg: error.details[0].message })
            return;
        }

        const bus = await Bus.findOne({ where: { id: req.body.id_bus } });

        if (!bus) {
            return res.status(401).json({success: false,
                msg: 'bus tidak ditemukan' });
        }

        await bus.update({is_aktif: false, id_pengemudi: req.body.id_pengemudi});

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

        
        const bus = await Bus.findOne({ where: { id: req.body.bus_id } });

        if (!bus) {
            return res.status(401).json({success: false,
                 msg: 'bus tidak ditemukan' });
        }
        await bus.update( {
            lat: req.body.lat,
            long: req.body.long, 
        });
        res.status(200).json({msg: "Bus lokasi update"});
    } catch (error) {
        console.log(error.message);
    }
}

///////////////////////public func///////////////////////

export const getLokasiBus = async(req, res) =>{
    try {
        const response = await Bus.findAll({
            where: {
                is_aktif: true
            },
            order: [['id', 'ASC']]
        });

        res.status(200).json({
            success: true,
            msg: response
        });
    } catch (error) {
        console.log(error.message);
    }
}

export const getLokasiOneBus = async(req, res) =>{
    try {
        const bus = await Bus.findOne({ where: { id: req.params.bus_id } });

        if (!bus) {
            return res.status(401).json({ msg: 'bus tidak ditemukan' });
        }

        res.status(200).json(bus);
    } catch (error) {
        console.log(error.message);
    }
}