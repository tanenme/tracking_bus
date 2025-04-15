import Halte from '../models/halteModel.js';
import { getNearestValidation } from '../validasi/nearestSchema.js';

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
                halte_id: req.params.halte_id
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
        
        const titikA = {
            latitude: req.body.latitude,
            longitude: req.body.longitude
          };

        
        const halteCoord = await Halte.findAll();

        function haversineDistance(lat1, lon1, lat2, lon2) {
            const R = 6371; // Radius bumi dalam kilometer
            const toRad = (degree) => (degree * Math.PI) / 180;
        
            const dLat = toRad(lat2 - lat1);
            const dLon = toRad(lon2 - lon1);
            const a =
            Math.sin(dLat / 2) * Math.sin(dLat / 2) +
            Math.cos(toRad(lat1)) *
                Math.cos(toRad(lat2)) *
                Math.sin(dLon / 2) *
                Math.sin(dLon / 2);
            const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            const distance = R * c;
        
            return distance;
        }

        // Menghitung jarak ke setiap halte
        const distances = halteCoord.map((halte) => ({
            halte_id: halte.halte_id,
            nama_halte: halte.nama_halte,

            distance: haversineDistance(
                titikA.latitude,
                titikA.longitude,
                parseFloat(halte.lokasi_halte.split(", ")[0]),
                parseFloat(halte.lokasi_halte.split(", ")[1])
            )
        }));

        // Menampilkan hasil
        // console.log("Jarak ke setiap halte:");
        // distances.forEach((distance) => {
        // console.log(
        //     `Halte ${distance.nama_halte} (ID: ${distance.halte_id}): ${distance.distance.toFixed(
        //     2
        //     )} km`
        // );
        // });

        const shortestDistance = distances.reduce((minDistance, distance) => {
            return distance.distance < minDistance.distance ? distance : minDistance;
          }, distances[0]);
          
          res.status(200).json({
            succcess: true,
            msg: {
                halteId: shortestDistance.halte_id,
                halteNama: shortestDistance.nama_halte,
                halte_Lat: shortestDistance.halte_lat,
                halte_long: shortestDistance.halte_long,
                jarak: `${shortestDistance.distance.toFixed(2)} km`
            }
        });

    } catch (error) {
        console.log(error.message);
    }
}
