import { DataTypes } from "sequelize";
import db from "../config/database.js"

const Bus = db.define('bus', {
    bus_id: {
      type: DataTypes.INTEGER,
      primaryKey: true
    },
    lokasi_bus: {
      type: DataTypes.STRING,
      allowNull: false
    },
    status: {
      type: DataTypes.BOOLEAN,
      allowNull: false
    }
  }, {
    freezeTableName: true,
    timestamps: false
    });

export default Bus;

await db.sync();