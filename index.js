import express from "express";
import cors from "cors";
import ngrok from "ngrok";
import UserRoute from "./routes/userRoute.js";
import db from './config/database.js';
// Import all your models
import Pengemudi from './models/pengemudiModel.js';

const app = express();
const port = 5000; // Tentukan port Anda

// GANTIKAN DENGAN AUTHTOKEN NGROK ANDA
const NGROK_AUTHTOKEN = "1xXnLvJOnrYBhppIJ19jPsnF85O_4MzP2pumLv1j6wugBCEdi";

app.use(cors());
app.use(express.json());

app.use((req, res, next) => {
  console.log(`[${new Date().toISOString()}] ${req.method} ${req.url}`);
  next();
});

app.use(UserRoute);

// Sinkronisasi semua model sekaligus
try {
  await db.sync({ alter: true });
  console.log('Database synchronized successfully');
} catch (error) {
  console.error('Error synchronizing database:', error);
}

app.listen(port, () => {
  console.log(`Server up and running on port ${port}...`);

  // Pastikan token sudah diisi sebelum mencoba koneksi
  if (!NGROK_AUTHTOKEN) {
    console.error('Ngrok Authtoken is missing. Please add it to the code.');
    return;
  }

  // Mulai tunnel ngrok dengan authtoken
  (async function() {
    try {
      const url = await ngrok.connect({
        proto: 'http',
        addr: port,
        authtoken: NGROK_AUTHTOKEN,
      });
      console.log(`Ngrok tunnel established at: ${url}`);
    } catch (error) {
      console.error('Error starting ngrok:', error);
    }
  })();
});