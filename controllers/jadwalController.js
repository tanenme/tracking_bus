import Jadwal from '../models/jadwalModel.js';
import { Op } from 'sequelize';


export const getJadwal = async(req, res) =>{
    try {
        const {halte_id} = req.params

        const waktu = req.body.jadwal_datang

        const response = await Jadwal.findAll({
            where:{
                halte_id: halte_id,
                jadwal_datang: {
                    [Op.gt]: waktu
                }
            }
        });
        res.status(200).json(response);
    } catch (error) {
        console.log(error.message);
    }
}
