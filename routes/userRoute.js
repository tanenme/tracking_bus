import express from "express";
import {
    getLokasiBus,
    getNonaktifBus,
    getLokasiOneBus,
    setAktifBus, setNonaktif,
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

router.get('/getjadwal/:halte_id', getJadwal);

router.get('/getnonaktifbus', getNonaktifBus);
router.get('/getlokasibus', getLokasiBus);
router.get('/getlokasibus/:bus_id', getLokasiOneBus);

router.use(authMiddleware)

router.patch('/setaktifbus/', setAktifBus);
router.patch('/setnonaktifbus/', setNonaktif);
router.patch('/updatebus', updateLokasiBus);



export default router;