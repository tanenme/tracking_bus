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
    allowNull: false,
    references: {
      model: 'halte',
      key: 'id' 
    }
  },
  id_bus: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'bus',
      key: 'id'
    }
  },
  jadwal_datang: {
    type: DataTypes.TIME,
    allowNull: false
  }
}, {
  freezeTableName: true,
  timestamps: false
});

Jadwal.belongsTo(Halte, { foreignKey: 'id' });  // Establish relationship with Halte
Jadwal.belongsTo(Bus, { foreignKey: 'id' });    // Establish relationship with Bus

//await db.sync()

export default Jadwal;