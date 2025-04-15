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


INSERT INTO halte (nama_halte, lat, long, alamat) VALUES 
('Terminal tamanan', -7.828865, 111.984321, 'Jln Gatot subroto no 10, Depan Terminal tamanan'),
('halte campurejo', -7.827173, 111.985232, 'Jln Campurejo no 25, Samping Pasar Campurejo'),
('pemberhentian bus campurejo', -7.816647, 111.989263, 'Jln Campurejo Raya km 3, Depan Toko Makmur'),
('pemberhentian bus veteran', -7.811331, 111.991980, 'Jln Veteran no 45, Depan Universitas Veteran'),
('pemberhentian bus veteran 2', -7.811245, 111.997347, 'Jln Veteran Timur no 12, Samping Mall Veteran'),
('pemberhentian bus kawi', -7.808672, 112.001889, 'Jln Gunung Kawi no 78, Depan Kantor Pos'),
('pemberhentian bus ahmad dahlan', -7.803411, 112.003425, 'Jln Ahmad Dahlan no 34, Depan Sekolah Dasar Dahlan'),
('pemberhentian bus j.a suprapto', -7.807681, 112.004613, 'Jln J.A Suprapto no 56, Samping Rumah Sakit Umum'),
('pemberhentian bus sudanco supriadi', -7.812697, 112.006034, 'Jln Sudanco Supriadi no 90, Depan Pasar Tradisional'),
('halte diponegoro', -7.810881, 112.009495, 'Jln Diponegoro no 123, Depan Taman Kota'),
('halte diponegoro 2', -7.811404, 112.013123, 'Jln Diponegoro Timur no 45, Samping Stasiun Kereta'),
('halte hasanudin', -7.811707, 112.015278, 'Jln Hasanudin no 67, Depan Masjid Agung'),
('halte hasanudin 2', -7.812218, 112.018717, 'Jln Hasanudin Selatan no 32, Samping Perpustakaan Kota'),
('pemberhentian bus pemuda', -7.813877, 112.020212, 'Jln Pemuda no 89, Depan Gedung Olahraga'),
('pemberhentian bus joyoboyo', -7.816823, 112.019652, 'Jln Joyoboyo no 54, Samping Taman Bermain'),
('pemberhentian bus joyoboyo 2', -7.820701, 112.018904, 'Jln Joyoboyo Selatan no 21, Depan Pusat Perbelanjaan'),
('pemberhentian bus hoscokroaminoto', -7.822992, 112.021967, 'Jln Hoscokroaminoto no 76, Samping Kantor Kelurahan'),
('pemberhentian bus hoscokroaminoto 2', -7.823942, 112.025691, 'Jln Hoscokroaminoto Timur no 43, Depan Sekolah Menengah'),
('pemberhentian bus letjen suprapto', -7.819601, 112.028609, 'Jln Letjen Suprapto no 112, Samping Taman Teknologi'),
('halte banjaran', -7.817533, 112.026812, 'Jln Banjaran no 65, Depan Pasar Banjaran'),
('pemberhentian bus erlangga', -7.815885, 112.021156, 'Jln Erlangga no 87, Samping Universitas Erlangga'),
('halte hayam wuruk', -7.815464, 112.019073, 'Jln Hayam Wuruk no 29, Depan Pusat Kuliner');


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