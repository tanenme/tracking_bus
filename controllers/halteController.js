import Halte from '../models/halteModel.js';
import { getNearestValidation } from '../validasi/nearestSchema.js';
import { haversineDistance } from '../config/harvesine.js';

export const getLokasiHalte = async(req, res) =>{
    try {
        const response = await Halte.findAll();
        res.status(200).json({
            succcess: true,
            msg: response
        });
    } catch (error) {
        res.status(400).json({
            succcess: false,
            msg: "Bad request"
        })
    }
}

export const getLokasiOneHalte = async(req, res) =>{
    try {
        const response = await Halte.findOne({
            where:{
                if: req.params.halte_id
            }
        });
        res.status(200).json({
            succcess: true,
            msg: response
        });
    } catch (error) {
        res.status(400).json({
            succcess: false,
            msg: "Bad request"
        })
    }
}

export const getNearestHalte = async(req, res) =>{
    try {
        const {error} = getNearestValidation.validate(req.body)

        if (error) {
            res.status(400).json({success: false,
                 msg: error.details[0].message })
            return;
          }
        
        const userkoordinat = {
            latitude: req.body.latitude,
            longitude: req.body.longitude
          };

        const halteCoord = await Halte.findAll();

        // Menghitung jarak ke setiap halte
        const distances = halteCoord.map((halte) => ({
            id_halte: halte.id,
            nama_halte: halte.nama,
            alamat_halte: halte.alamat,
            lat: halte.lat,
            long: halte.long,
            distance: haversineDistance(
                userkoordinat.latitude,
                userkoordinat.longitude,
                parseFloat(halte.lat),
                parseFloat(halte.long)
            )
        }));

        const shortestDistance = distances.reduce((minDistance, distance) => {
            return distance.distance < minDistance.distance ? distance : minDistance;
        }, distances[0]);
          
          res.status(200).json({
            succcess: true,
            msg: {
                id_halte: shortestDistance.id_halte,
                nama_halte: shortestDistance.nama_halte,
                alamat_halte: shortestDistance.alamat_halte,
                Lat: shortestDistance.lat,
                long: shortestDistance.long,
                jarak: `${shortestDistance.distance.toFixed(2)} km`
            }
        });

    } catch (error) {
        console.log(error.message);
    }
}
