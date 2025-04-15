############################DATABASE############################

pengemudi
-pengemudi_id int(pk)
-username varchar
-password varchar

bus
-bus_id int(pk)
-lokasi_bus varchar
-status boolean

halte
-halte_id int (pk)
-nama_halte varchar
-lokasi_halte varchar

jadwal
-jadwal_id int (pk)
-halte_id int (fk halte)
-bus_id int (fk bus)
-waktu_datang time

###############################################################
insert into bus (bus_id, lokasi_bus, status) values (1, '-7.810881, 112.009495', false),(2, '-7.810881, 112.009495', true), (3, '-7.810881, 112.009495', false);


INSERT INTO halte (halte_id, nama_halte, lokasi_halte) VALUES 
(1, 'Terminal tamanan', '-7.828865, 111.984321'),
(2, 'halte campurejo', '-7.827173, 111.985232'),
(3, 'pemberhentian bus campurejo', '-7.816647, 111.989263'),
(4, 'pemberhentian bus veteran', '-7.811331, 111.991980'),
(5, 'pemberhentian bus veteran 2', '-7.811245, 111.997347'),
(6, 'pemberhentian bus kawi', '-7.808672, 112.001889'),
(7, 'pemberhentian bus ahmad dahlan', '-7.803411, 112.003425'),
(8, 'pemberhentian bus j.a suprapto', '-7.807681, 112.004613'),
(9, 'pemberhentian bus sudanco supriadi', '-7.812697, 112.006034');

(10, "halte diponegoro", "-7.810881, 112.009495"),
(11, "halte diponegoro 2", "-7.811404, 112.013123"),
(12, "halte hasanudin", "-7.811707, 112.015278"),
(13, "halte hasanudin 2", "-7.812218, 112.018717"),
(14, "pemberhentian bus pemuda", "-7.813877, 112.020212"),
(15, "pemberhentian bus joyoboyo", "-7.816823, 112.019652"),
(16, "pemberhentian bus joyoboyo 2", "-7.820701, 112.018904"),
(17, "pemberhentian bus hoscokroaminoto", "-7.822992, 112.021967"),
(18, "pemberhentian bus hoscokroaminoto 2", "-7.823942, 112.025691"),
(19, "bpemberhentian bus letjen suprapto", "-7.819601, 112.028609"),
(20, "halte banjaran", "-7.817533, 112.026812"),
(21, "pemberhentian bus erlangga", "-7.815885, 112.021156"),
(22, "halte hayam wuruk", "-7.815464, 112.019073");


insert into jadwal (jadwal_id, halte_id, bus_id, jadwal_datang) values 
(1, 1, 1, '07:30'), (2, 1, 1, '09:07'), (3, 1, 1, '17:00'), (4, 1, 1, '18:41'),
(5, 1, 2, '08:00'), (6, 1, 2, '09:39'), (7, 1, 2, '17:30'), (8, 1, 2, '19:11'), 
(9, 1, 3, '08:30'), (10, 1, 3, '10:05'), (11, 1, 3, '18:00'), (12, 1, 3, '19:41');



################################BACKEND###########################
api publik
pengemudi
-signin POST
-signout POST

bus
-findoallbus GET
-findonebus GET

halte
-findallhalte GET
-findonehalte GET
-getnearesthalte GET
-getjadwabyhalte GET


api private
bus
-updatebus PATCH
-setaktif PATCH
-setnonaktif PATCH


################################FRONT END#########################

user
-loading
-accept gps
-homepage
-maps
-show all bus
-show all halte
-halte terdekat
-jadwal halte