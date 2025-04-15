import express from "express";
import cors from "cors";
import UserRoute from "./routes/userRoute.js";
import db from './config/database.js';
// Import all your models
import Pengemudi from './models/pengemudiModel.js';

const app = express();
app.use(cors());
app.use(express.json());
app.use(UserRoute);

app.listen(5000, ()=> console.log('Server up and running...'));

// Sync all models at once
try {
  await db.sync({ alter: true }); // Use { force: true } during development if you want to drop and recreate tables
  console.log('Database synchronized successfully');
} catch (error) {
  console.error('Error synchronizing database:', error);
}