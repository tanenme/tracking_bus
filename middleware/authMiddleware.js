import dotenv from 'dotenv';
import jwt from 'jsonwebtoken'
dotenv.config({ path: '../.env' });
const secret = process.env.secretme

console.log(secret)

export const authMiddleware = async (req, res, next) => {
    let token = req.get('Authorization');
    if (!token) {
        res.status(401).json({
            errors: "Unauthorized"
        }).end();
    } else {
        
        jwt.verify(token, secret, (err) => {
            if (err) {
                res.status(403).json({ errors: 'Invalid token' }).end();
                return;
            } else {
                next();
            }
        });

    }
}