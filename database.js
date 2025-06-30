import { Sequelize } from 'sequelize';
import dotenv from 'dotenv';

// Load environment variables
dotenv.config();

// Get the database connection string from environment variables
const dbConnectionString = process.env.DB;

// Create Sequelize instance using the connection string
const db = new Sequelize(dbConnectionString, {
    dialect: 'postgres',
    logging: false, // Set to true if you want to see SQL queries in console
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
});

// Test connection function
export const testConnection = async () => {
    try {
        await db.authenticate();
        console.log('Connection to database has been established successfully.');
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
};

export default db;