// models/jadwalModel.js
// FILE INI YANG DIPERBAIKI

import { DataTypes } from 'sequelize';
import db from '../config/database.js';
import Halte from './halteModel.js';
import Bus from './busModel.js';

const Jadwal = db.define('jadwal', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  id_halte: {
    type: DataTypes.INTEGER,
    allowNull: false
    // Opsi 'references' di sini tidak wajib jika Anda mendefinisikan asosiasi di bawah
  },
  id_bus: {
    type: DataTypes.INTEGER,
    allowNull: false
    // Opsi 'references' di sini tidak wajib jika Anda mendefinisikan asosiasi di bawah
  },
  jadwal_datang: {
    type: DataTypes.CHAR,
    allowNull: false
  }
}, {
  freezeTableName: true,
  timestamps: false
});

// --- DEFINISI ASOSIASI YANG BENAR ---

// Hubungan dari Jadwal ke Halte
Jadwal.belongsTo(Halte, {
  foreignKey: 'id_halte', // Kolom di tabel 'jadwal' yang menjadi foreign key
  as: 'halte'
});
Halte.hasMany(Jadwal, {
  foreignKey: 'id_halte'
});


// Hubungan dari Jadwal ke Bus
Jadwal.belongsTo(Bus, {
  foreignKey: 'id_bus', // Kolom di tabel 'jadwal' yang menjadi foreign key
  as: 'bus'
});
Bus.hasMany(Jadwal, {
  foreignKey: 'id_bus'
});


//await db.sync()

export default Jadwal;