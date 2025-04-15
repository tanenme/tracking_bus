import { DataTypes } from 'sequelize';
import db from '../config/database.js';
import Halte from './halteModel.js';
import Bus from './busModel.js';

const Jadwal = db.define('jadwal', {
  jadwal_id: {
    type: DataTypes.INTEGER,
    primaryKey: true
  },
  halte_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'halte',
      key: 'halte_id' 
    }
  },
  bus_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'bus',
      key: 'bus_id'
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

Jadwal.belongsTo(Halte, { foreignKey: 'halte_id' });  // Establish relationship with Halte
Jadwal.belongsTo(Bus, { foreignKey: 'bus_id' });    // Establish relationship with Bus

await db.sync()

export default Jadwal;