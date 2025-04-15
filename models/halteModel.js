import { DataTypes } from 'sequelize';
import db from '../config/database.js';

const Halte = db.define('halte', {
  halte_id: {
    type: DataTypes.INTEGER,
    primaryKey: true
  },
  nama_halte: {
    type: DataTypes.STRING,
    allowNull: false
  },
  lokasi_halte: {
    type: DataTypes.STRING,
    allowNull: false
  }
}, {
  freezeTableName: true,
  timestamps: false
});

export default Halte;


await db.sync();