import Jadwal from "../models/jadwalModel.js"; // Pastikan path benar
import Bus from "../models/busModel.js";       // Pastikan path benar

export const getJadwal = async(req, res) =>{
    try {
        const {halte_id} = req.params;

        const response = await Jadwal.findAll({
            where:{
                id_halte: halte_id,
            },
            include: [{
                model: Bus,
                as: 'bus',
                // Sesuaikan dengan kolom yang ada di model Bus Anda: 'nama'
                attributes: ['nama', 'no_plat']
            }],
            order: [['id_bus','ASC'], ['jadwal_datang', 'ASC']],
        });

        if (!response || response.length === 0) {
            return res.status(404).json({
                message: "Jadwal tidak ditemukan untuk halte ini.",
                id_halte: halte_id,
                daftar_bus: []
            });
        }

        const groupedByBus = {};

        response.forEach(jadwal => {
            const { id_bus, jadwal_datang, bus } = jadwal;

            if (!groupedByBus[id_bus]) {
                groupedByBus[id_bus] = {
                    id_bus: id_bus,
                    // Ubah nama properti sesuai model Bus Anda (bus.nama)
                    // Kita tetap menampilkannya sebagai 'nama_bus' di JSON untuk konsistensi
                    nama_bus: bus.nama,
                    no_plat: bus.no_plat,
                    jadwal_datang: []
                };
            }

            groupedByBus[id_bus].jadwal_datang.push(jadwal_datang.trim());
        });

        const daftar_bus = Object.values(groupedByBus);

        const finalResponse = {
            id_halte: parseInt(halte_id),
            daftar_bus: daftar_bus
        };

        res.status(200).json(finalResponse);

    } catch (error) {
        console.log(error.message);
        res.status(500).json({ message: "Terjadi kesalahan pada server." });
    }
}