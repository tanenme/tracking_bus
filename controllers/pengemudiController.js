import Pengemudi from '../models/pengemudiModel.js';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken'
import { pengemudiValidasiSignup, pengemudiValidasiSigin } from '../validasi/pengemudiSchema.js';
import dotenv from 'dotenv'

dotenv.config({path: '../.env'})

export const signup = async (req, res) => {
    try {

        const {error} = pengemudiValidasiSignup.validate(req.body)

        if (error) {
            res.status(400).json({success: false,
                 msg: error.details[0].message })
            return;
          }

        const countUser = await Pengemudi.count({
            where: {
                username: req.body.username
            }
        });

        if (countUser === 1) {
            res.status(400).json({ success: false,
                msg: 'Username already exits' })
            return;
        }

        req.body.password = await bcrypt.hash(req.body.password, 10);

        await Pengemudi.create(req.body)
        res.status(201).json({success: true,
            msg: 'user created'
        })

    } catch (error) {
        res.status(500).json({success: false,
            msg: error
        })
    }
}

export const signin = async(req, res) =>{
    try {

        const {error} = pengemudiValidasiSigin.validate(req.body)

        if (error) {
            res.status(400).json({success: false,
                 msg: error.details[0].message })
            return;
          }
        
        const pengemudi = await Pengemudi.findOne({ where: { username: req.body.username } });

        if (!pengemudi) {
            return res.status(401).json({ success: false, msg: 'Username tidak ditemukan' });
        }

        const isPasswordValid = await bcrypt.compare(req.body.password, pengemudi.password)
        if (!isPasswordValid) {
            res.status(400).json({success: false, 
                msg: "password not valid "})
            return
        }
        
        const config = { id: pengemudi.pengemudi_id, username: req.body.pengemudi }
        const token = jwt.sign(config, 'iniadalahscretkey');

        res.status(200).json({
            success: true,
            msg: {
                token: token
            }
        });
    } catch (error) {
        console.log(error)
        res.status(500).json({
            success: false,
            msg: error
        });
    }

}