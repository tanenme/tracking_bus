import { DataTypes } from "sequelize";
import db from "../config/database.js"

const Bus = db.define('bus', {
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
  is_aktif: {
    type: DataTypes.BOOLEAN,
    allowNull: false
  },
  id_pengemudi: {
    type: DataTypes.INTEGER,
    allowNull: true,
    references: {
      model: 'pengemudi',
      key: 'id'
    }
  }
},{
    freezeTableName: true,
    timestamps: false
    });

export default Bus;

//await db.sync();