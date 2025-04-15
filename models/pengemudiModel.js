import { DataTypes } from 'sequelize';
import db from '../config/database.js';

const Pengemudi = db.define('pengemudi', {
  pengemudi_id: {
    type: DataTypes.INTEGER,
    primaryKey: true
  },
  username: {
    type: DataTypes.STRING 
  },
  password: {
    type: DataTypes.STRING
  }
}, {
  freezeTableName: true,
  timestamps: false
});

export default Pengemudi;

await db.sync();

// await Pengemudi.create({
//   pengemudi_id: 1,
//   username: 'ronytan',
//   password: 'password123'
// })
// .then(pengemudi => {
//   console.log('Pengemudi created:', pengemudi);
// })
// .catch(error => {
//   console.error('Error creating pengemudi:', error);
// });

// const find = await Pengemudi.findAll()
// console.log(find)