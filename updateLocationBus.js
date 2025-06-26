import axios from 'axios';

// Token otentikasi
const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzMyMTc1ODc3fQ.PHaR6cqVSBGCbDNjG_FNlmnUfPdDGoNgkHn4QjGCBbc';

// ID bus yang akan diupdate
const busId = 6;

// Daftar koordinat lokasi jalan di Kediri (simulasi rute)
// Format: [latitude, longitude, nama_lokasi] Modified
const locations = [
    [-7.810923128405451, 112.00468696956683, "Jl. Veteran, Kediri"],
    [-7.809605093973484, 112.00457968121354, "Jl. Panglima Sudirman, Kediri"],
    [-7.808648453474779, 112.00457968121354, "Jl. Diponegoro, Kediri"],
    [-7.80811698558455, 112.00464405422552, "Jl. Dhoho, Kediri"],
    [-7.805374600528227, 112.0045153082016, "Jl. Hayam Wuruk, Kediri"],
    [-7.804077807529933, 112.00417198547113, "Jl. Ahmad Yani, Kediri"],
    [-7.803014859449342, 112.00297035591447, "Jl. KH. Wachid Hasyim, Kediri"],
    [-7.801399077108575, 112.00222311428865, "Jl. Patimura, Kediri"],
    [-7.7992731646271, 112.00215874127667, "Jl. Letjen Suprapto, Kediri"],
    [-7.794993025337771, 112.00181551544611, "Jl. Kawi, Kediri"],
    [-7.793292270178033, 112.00632162628354, "Jl. PK. Bangsa, Kediri"],
    [-7.7936536812069805, 112.00981922684922, "Jl. Urip Sumoharjo, Kediri"]
];

// Fungsi untuk mengupdate lokasi bus
async function updateBusLocation(id, lat, long, locationName) {
    try {
        const response = await axios.patch('http://localhost:5000/updatebus',
            {
                id: id,
                lat: lat,
                long: long
            },
            {
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': token
                }
            }
        );

        console.log(`Bus ${id} berhasil diupdate ke lokasi: ${locationName} (${lat}, ${long})`);
        return response.data;
    } catch (error) {
        console.error('Gagal mengupdate lokasi bus:', error.message);
    }
}

// Simulasi pergerakan bus
let currentLocationIndex = 0;

// Fungsi untuk memulai simulasi
function startBusSimulation() {
    // Update lokasi setiap 10 detik
    const interval = setInterval(() => {
        const [lat, long, locationName] = locations[currentLocationIndex];

        updateBusLocation(busId, lat, long, locationName);

        // Pindah ke lokasi berikutnya
        currentLocationIndex = (currentLocationIndex + 1) % locations.length;

    }, 10000); // 10 detik interval

    console.log('Simulasi bus berjalan telah dimulai. Bus akan berpindah lokasi setiap 10 detik.');
    console.log('Tekan Ctrl+C untuk menghentikan simulasi.');

    // Opsional: Hentikan simulasi setelah beberapa lama
    // setTimeout(() => {
    //   clearInterval(interval);
    //   console.log('Simulasi dihentikan setelah 10 menit.');
    // }, 10 * 60 * 1000); // 10 menit
}

// Mengaktifkan bus terlebih dahulu sebelum memulai simulasi (opsional)
async function activateBus() {
    try {
        const response = await axios.patch(`http://localhost:5000/setaktifbus/${busId}`,
            {
                status: true
            },
            {
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': token
                }
            }
        );

        console.log(`Bus ${busId} diaktifkan untuk simulasi.`);
        // Mulai simulasi setelah bus diaktifkan
        startBusSimulation();

    } catch (error) {
        console.error('Gagal mengaktifkan bus:', error.message);
    }
}

// Memulai program
startBusSimulation();