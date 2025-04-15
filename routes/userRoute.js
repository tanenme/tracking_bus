import express from "express";
import {
    getLokasiBus,
    getLokasiOneBus,
    setAktifBus,
    setNonaktifBus,
    updateLokasiBus, 
} from "../controllers/busController.js";

import {
    signin,
    signup
} from "../controllers/pengemudiController.js"

import {
    getLokasiHalte,
    getLokasiOneHalte,
    getNearestHalte
} from "../controllers/halteController.js"

import {
    getJadwal
} from "../controllers/jadwalController.js"

import { authMiddleware } from "../middleware/authMiddleware.js";

const router = express.Router();

router.post('/signin', signin);
router.post('/signup', signup);

router.get('/getlokasihalte', getLokasiHalte);
router.get('/getlokasihalte/:halte_id', getLokasiOneHalte);
router.post('/getnearesthalte', getNearestHalte)

router.post('/getjadwal/:halte_id', getJadwal);

router.get('/getlokasibus', getLokasiBus);
router.get('/getlokasibus/:bus_id', getLokasiOneBus);

router.use(authMiddleware)

router.patch('/setaktifbus/:bus_id', setAktifBus);
router.patch('/setnonaktifbus/:bus_id', setNonaktifBus);
router.patch('/updatebus', updateLokasiBus);



export default router;