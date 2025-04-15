import { DataTypes } from 'sequelize';
import db from '../config/database.js';

const Halte = db.define('halte', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  nama: {
    type: DataTypes.STRING,
    allowNull: false
  },
  lat: {
    type: DataTypes.DOUBLE,
    allowNull: false
  },
  long: {
    type: DataTypes.DOUBLE,
    allowNull: false
  },
  alamat: {
    type: DataTypes.STRING,
    allowNull: false
  }
}, {
  freezeTableName: true,
  timestamps: false
});

export default Halte;


//await db.sync();