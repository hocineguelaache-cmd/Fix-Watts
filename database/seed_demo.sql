

SET NAMES utf8mb4;

-- outillage (28 articles)
SET @cat := (SELECT idCat FROM categorie WHERE intituleCat = 'outillage');
INSERT INTO article (idCat, intitule, prix, nbDispo, marque, photo) VALUES
    (@cat, 'Clé à molette IP65', 740, 44, 'Bosch', 'img/cle-a-molette-IP65.webp'),
    (@cat, 'Clé à molette 50pc', 1620, 57, 'Bosch', 'img/cle_a_molette_50pc.jpg'),
    (@cat, 'Clé à molette 16A', 1500, 39, 'Bosch', 'img/clé_a_mollete_16A.jpg'),
    (@cat, 'Échelle', 6500, 7, 'Bosch', 'img/echelle.jpg'),
    (@cat, 'Échelle aluminium', 4300, 16, 'Bosch', 'img/echelle_aluminium.jpg'),
    (@cat, 'Gants', 560, 42, 'Bosch', 'img/gants.jpg'),
    (@cat, 'Maillet en caoutchouc 20pc', 810, 0, 'Bosch', 'img/maillet-en-caoutchouc-20pc.webp'),
    (@cat, 'Marteau de charpentier', 2800, 9, 'Bosch', 'img/marteau-de-charpentier.jpg'),
    (@cat, 'Marteau', 2300, 59, 'Bosch', 'img/marteau.jpg'),
    (@cat, 'Marteau de menuisier 50pcs', 890, 11, 'Bosch', 'img/Marteau_de_menuisier_50pcs.jpg'),
    (@cat, 'Marteau menuisier Luxe', 1190, 39, 'Bosch', 'img/marteau_minuisier_luxe.jpg'),
    (@cat, 'Mètre ruban 5m', 370, 46, 'Bosch', 'img/métre_rubban_5m.jpg'),
    (@cat, 'Niveau à bulle 100 pcs', 1740, 22, 'Bosch', 'img/niveau_a_bulle_100_pcs.jpg'),
    (@cat, 'Niveau à bulle 20A', 2450, 7, 'Bosch', 'img/niveau_a_bulle_20A.webp'),
    (@cat, 'Niveau à bulle 20pcs', 1590, 26, 'Bosch', 'img/niveau_a_bulle_20pcs.webp'),
    (@cat, 'Niveau à bulle Éco', 1400, 57, 'Bosch', 'img/niveau_a_bulle_eco.jpg'),
    (@cat, 'Pince coupante 20A', 1560, 1, 'Bosch', 'img/pince_coupante_20A.jpg'),
    (@cat, 'Pince coupante Pro', 1870, 31, 'Bosch', 'img/pince_coupante_pro.jpg'),
    (@cat, 'Pince coupante Standard', 2700, 0, 'Bosch', 'img/pince_coupante_standard.jpg'),
    (@cat, 'Pince multiprise', 1260, 1, 'Bosch', 'img/pince_multiprise.jpg'),
    (@cat, 'Ruban adhésif 50m', 480, 18, 'Bosch', 'img/ruban-adhesif-50m.jpg'),
    (@cat, 'Scie à bois 5m', 2850, 28, 'Bosch', 'img/scie_a_bois_5m.jpg'),
    (@cat, 'Scie à bois Pro', 2700, 23, 'Bosch', 'img/scie_a_bois_pro.jpg'),
    (@cat, 'Scie à métaux', 1770, 30, 'Bosch', 'img/scie_a_meteau.jpg'),
    (@cat, 'Scie circulaire', 1330, 33, 'Bosch', 'img/scie_circulaire.jpg'),
    (@cat, 'Tournevis', 600, 45, 'Bosch', 'img/tournevis.jpg'),
    (@cat, 'Tournevis plate Luxe', 730, 10, 'Bosch', 'img/tournevis_plat_luxe.jpg'),
    (@cat, 'Tournevis électrique', 1160, 0, 'Bosch', 'img/tournevis_électrique.jpg');

-- visserie (26 articles)
SET @cat := (SELECT idCat FROM categorie WHERE intituleCat = 'visserie');
INSERT INTO article (idCat, intitule, prix, nbDispo, marque, photo) VALUES
    (@cat, 'Boulon hexagonal 16A', 590, 60, 'Fischer', 'img/boulon-hexagonal-16A.webp'),
    (@cat, 'Boulon hexagonal Éco', 540, 25, 'Fischer', 'img/boulon_hexagonal_eco.jpg'),
    (@cat, 'Boulon hexagonal IP65', 360, 34, 'Fischer', 'img/boulon_hexagonal_ip65.jpg'),
    (@cat, 'Boulons', 550, 0, 'Fischer', 'img/boulons.jpg'),
    (@cat, 'Boulons MB 50pcs', 900, 39, 'Fischer', 'img/bullons_mb_50pcs.jpg'),
    (@cat, 'Cheville à expansion 10mm', 370, 23, 'Fischer', 'img/cheville_a_expansion_10mm.webp'),
    (@cat, 'Cheville à expansion 20A', 140, 12, 'Fischer', 'img/cheville_a_expansion_20A.jpg'),
    (@cat, 'Chevilles', 420, 31, 'Fischer', 'img/chevilles.jpg'),
    (@cat, 'Chevilles 8mm', 390, 9, 'Fischer', 'img/chevilles_8mm.png'),
    (@cat, 'Clou', 160, 13, 'Fischer', 'img/clou.jpg'),
    (@cat, 'Clou galvanisé', 560, 26, 'Fischer', 'img/clou_galvanieé.webp'),
    (@cat, 'Écrou borgne renforcée', 1080, 18, 'Fischer', 'img/ecrou-borgne-renforcée.jpg'),
    (@cat, 'Fixateur Kndeco', 770, 41, 'Fischer', 'img/fixateur-kndeco.jpg'),
    (@cat, 'Goujon d''ancrage 20A', 680, 12, 'Fischer', 'img/goujon_d''ancrage_20A.jpg'),
    (@cat, 'Goujon d''ancrage Éco', 450, 53, 'Fischer', 'img/goujon_d''ancrage_eco.jpg'),
    (@cat, 'Goujon d''ancrage Luxe', 350, 45, 'Fischer', 'img/goujon_d''ancrage_luxe.jpg'),
    (@cat, 'Goujon d''ancrage Standard', 490, 3, 'Fischer', 'img/goujon_d''ancrage_standard.jpg'),
    (@cat, 'Rondelle plate 20pcs', 180, 0, 'Fischer', 'img/rondelle_plat_20pcs.jpg'),
    (@cat, 'Tirefond 50pcs', 760, 4, 'Fischer', 'img/tirefond_50pcs.webp'),
    (@cat, 'Tirefond Luxe', 320, 22, 'Fischer', 'img/tirefond_luxe.jpg'),
    (@cat, 'Vis à bois 16A', 690, 49, 'Fischer', 'img/vis_a_bois_16A.jpg'),
    (@cat, 'Vis à métaux 100pcs', 630, 18, 'Fischer', 'img/vis_a_metaux_100pcs.png'),
    (@cat, 'Vis autoforeuse', 230, 11, 'Fischer', 'img/vis_autoforeuse.webp'),
    (@cat, 'Vis à métaux Éco', 200, 53, 'Fischer', 'img/vise_a_metaux_eco.jpg'),
    (@cat, 'Vis à métaux Pro', 730, 15, 'Fischer', 'img/vise_a_metaux_pro.jpg'),
    (@cat, 'Vis à métaux 20pcs', 500, 36, 'Fischer', 'img/vise_a_méteau_20pcs.jpg');

-- plomberie (15 articles)
SET @cat := (SELECT idCat FROM categorie WHERE intituleCat = 'plomberie');
INSERT INTO article (idCat, intitule, prix, nbDispo, marque, photo) VALUES
    (@cat, 'Bâche protection', 2000, 34, 'Sika', 'img/batche-protection.jpg'),
    (@cat, 'Colle époxy 200ml', 950, 37, 'Sika', 'img/colle_epoxy_200ml.jpg'),
    (@cat, 'Collier de serrage Pro', 380, 0, 'Sika', 'img/collier_de_serrage_pro.jpg'),
    (@cat, 'Coude PVC Éco', 100, 23, 'Sika', 'img/coude_pvc_eco.jpg'),
    (@cat, 'Manchon cuivre 50pcs', 330, 9, 'Sika', 'img/manchon_cuivre_50pcs.jpg'),
    (@cat, 'Manchon cuivre IP65', 250, 56, 'Sika', 'img/manchon_cuivre_IP65.jpg'),
    (@cat, 'Mastic silicone renforcée', 1000, 34, 'Sika', 'img/mastic_silicone renforcée.jpg'),
    (@cat, 'Mastic silicone Éco', 390, 37, 'Sika', 'img/mastic_silicone_eco.jpg'),
    (@cat, 'Mastic silicone 10mm', 320, 2, 'Sika', 'img/mastic_sislicone_10mm.jpg'),
    (@cat, 'Robinet mitigeur lavabo', 4050, 50, 'Sika', 'img/robinet_mitigeur_lavabo.jpg'),
    (@cat, 'Siphon de lavabo IP65', 1050, 0, 'Sika', 'img/siphon_de_lavbo_ip65.jpg'),
    (@cat, 'Tube PER Luxe', 590, 7, 'Sika', 'img/tube_per_luxe.jpg'),
    (@cat, 'Vanne d''arrét 100pcs', 850, 7, 'Sika', 'img/vanne_d''arrét_100pcs.jpg'),
    (@cat, 'Vanne d''arrét 16A', 1350, 28, 'Sika', 'img/vanne_d''arrét_16A.jpg'),
    (@cat, 'Vanne d''arrét Pro', 1630, 49, 'Sika', 'img/vanne_d''arrét_pro.jpg');

-- peinture (18 articles)
SET @cat := (SELECT idCat FROM categorie WHERE intituleCat = 'peinture');
INSERT INTO article (idCat, intitule, prix, nbDispo, marque, photo) VALUES
    (@cat, 'Diluant synthétique 16A', 710, 13, 'Dulux', 'img/diluant_synthétique_16A.jpg'),
    (@cat, 'Diluant synthétique 220V', 740, 48, 'Dulux', 'img/diluant_synthétique_220V.jpg'),
    (@cat, 'Diluant synthétique renforcée', 430, 0, 'Dulux', 'img/diluant_synthétique_renforcée.jpg'),
    (@cat, 'Enduit de lissage IP65', 2100, 43, 'Dulux', 'img/enduit_de_lissage_ip65.jpg'),
    (@cat, 'Grattoir Éco', 280, 50, 'Dulux', 'img/grattoir-eco.avif'),
    (@cat, 'Grattoir 220V', 200, 0, 'Dulux', 'img/grattoir_220v.jpg'),
    (@cat, 'Peinture', 2200, 32, 'Dulux', 'img/peinture.jpg'),
    (@cat, 'Peinture acrylique mate 5L', 3750, 54, 'Dulux', 'img/peinture_acrylique_mate_5L.jpg'),
    (@cat, 'Peinture blanche 1L', 3450, 2, 'Dulux', 'img/peinture_blanche_1L.jpg'),
    (@cat, 'Peinture monocouche Luxe', 2750, 4, 'Dulux', 'img/peinture_monocouche_luxe.jpg'),
    (@cat, 'Peinture monocouche renforcée', 5800, 1, 'Dulux', 'img/peinture_monocouche_renforée.jpg'),
    (@cat, 'Peinture monocouche Standard', 3450, 3, 'Dulux', 'img/peinture_monocouche_standard.jpg'),
    (@cat, 'Pinceau rond 20pcs', 1540, 19, 'Dulux', 'img/pinceau_rond_20pcs.jpg'),
    (@cat, 'Pinceau rond Éco', 1500, 10, 'Dulux', 'img/pinceau_rond_eco.jpg'),
    (@cat, 'Pinceau rond Standard', 2450, 1, 'Dulux', 'img/pinceau_rond_standard.jpg'),
    (@cat, 'Rouleau laqueur 100pcs', 370, 24, 'Dulux', 'img/rouleau_laqueur_100pcs.jpg'),
    (@cat, 'Rouleau laqueur IP65', 780, 17, 'Dulux', 'img/rouleau_laqueur_ip65.jpg'),
    (@cat, 'Rouleau peinture 250mm', 570, 7, 'Dulux', 'img/rouleau_peinture_250mm.jpg');

-- jardinage (22 articles)
SET @cat := (SELECT idCat FROM categorie WHERE intituleCat = 'jardinage');
INSERT INTO article (idCat, intitule, prix, nbDispo, marque, photo) VALUES
    (@cat, 'Arrosoir 10L Pro', 1200, 17, 'BibenQuinc', 'img/arrosoir_10L_pro.jpg'),
    (@cat, 'Cisaille haie 5m', 2700, 37, 'BibenQuinc', 'img/cisaille_haie_5m.jpg'),
    (@cat, 'Gant rosier 20pcs', 610, 48, 'BibenQuinc', 'img/gant_rosier_20pcs.jpg'),
    (@cat, 'Gants rosier Pro', 1280, 0, 'BibenQuinc', 'img/gants_rosier_pro.jpg'),
    (@cat, 'Pelle carrée 100pcs', 2450, 0, 'BibenQuinc', 'img/pelle_carrée_100pcs.jpg'),
    (@cat, 'Pelle carrée 10mm', 1780, 55, 'BibenQuinc', 'img/pelle_carrée_10mm.png'),
    (@cat, 'Pelle carrée 16A', 1020, 17, 'BibenQuinc', 'img/pelle_carrée_16A.jpg'),
    (@cat, 'Pelle carrée 20pcs', 1340, 28, 'BibenQuinc', 'img/pelle_carrée_20pcs.jpg'),
    (@cat, 'Pelle carrée Éco', 1060, 51, 'BibenQuinc', 'img/pelle_carrée_eco.jpg'),
    (@cat, 'Pelle carrée Pro', 1790, 32, 'BibenQuinc', 'img/pelle_carrée_pro.png'),
    (@cat, 'Pelle carrée Luxe', 2750, 49, 'BibenQuinc', 'img/pelle_carée_luxe.jpg'),
    (@cat, 'Râteau Luxe', 840, 8, 'BibenQuinc', 'img/ràteau_luxe.jpg'),
    (@cat, 'Sécateur forgé 100pcs', 1690, 53, 'BibenQuinc', 'img/sécateur_forgé_100pcs.jpg'),
    (@cat, 'Sécateur forgé 5m', 1030, 24, 'BibenQuinc', 'img/sécateur_forgé_5m.jpg'),
    (@cat, 'Sécateur forgé Éco', 1090, 28, 'BibenQuinc', 'img/sécateur_forgé_eco.jpg'),
    (@cat, 'Sécateur forgé IP65', 1210, 41, 'BibenQuinc', 'img/sécateur_forgé_ip65.jpg'),
    (@cat, 'Transplantoir Pro', 640, 18, 'BibenQuinc', 'img/transplantoir_pro.jpg'),
    (@cat, 'Transplantoir renforcée', 960, 47, 'BibenQuinc', 'img/transplantoir_renforcée.jpg'),
    (@cat, 'Tuyau micro poreux IP65', 2150, 45, 'BibenQuinc', 'img/tuyau-micro_poreux_ip65.jpg'),
    (@cat, 'Tuyau d''arrosage 20m', 3400, 15, 'BibenQuinc', 'img/tuyau_d''arrosage_20m.jpg'),
    (@cat, 'Tuyau micro poreux 5m', 4350, 14, 'BibenQuinc', 'img/tuyau_micro_poreux_5m.jpg'),
    (@cat, 'Tuyau micro poreux Luxe', 6950, 30, 'BibenQuinc', 'img/tuyau_micro_poreux_luxe.jpg');

-- serrurerie (8 articles)
SET @cat := (SELECT idCat FROM categorie WHERE intituleCat = 'serrurerie');
INSERT INTO article (idCat, intitule, prix, nbDispo, marque, photo) VALUES
    (@cat, 'Cadenas', 1320, 7, 'Yale', 'img/cadenas.jpg'),
    (@cat, 'Cadenas laiton 20A', 1490, 3, 'Yale', 'img/cadenas_laiton_20A.jpg'),
    (@cat, 'Cadenas laiton renforcée', 1970, 44, 'Yale', 'img/cadenas_laiton_renforcée.jpg'),
    (@cat, 'Ferme porte Luxe', 6200, 29, 'Yale', 'img/ferme_porte_luxe.jpg'),
    (@cat, 'Gâche électrique 100pcs', 2050, 24, 'Yale', 'img/gàche_éléctrique_100pcs.jpg'),
    (@cat, 'Judas optique 16A', 760, 37, 'Yale', 'img/judas_optique_16A.jpg'),
    (@cat, 'Judas optique IP65', 1250, 32, 'Yale', 'img/Judas_optique_ip65.jpg'),
    (@cat, 'Serrure multipoints', 1650, 60, 'Yale', 'img/serrure_multipoints.jpg');

-- ampoules&eclairage (11 articles)
SET @cat := (SELECT idCat FROM categorie WHERE intituleCat = 'ampoules&eclairage');
INSERT INTO article (idCat, intitule, prix, nbDispo, marque, photo) VALUES
    (@cat, 'Ampoule', 190, 32, 'Philips', 'img/ampoule.jpg'),
    (@cat, 'Ampoule halogène Pro', 950, 11, 'Philips', 'img/ampoule_halogéne_pro.jpg'),
    (@cat, 'Ampoule LED 9W', 900, 53, 'Philips', 'img/ampoule_led_9w.jpg'),
    (@cat, 'Ampoule LED E27 16A', 760, 51, 'Philips', 'img/ampoule_led_E27_16A.jpg'),
    (@cat, 'Ampoule LED RGB', 470, 17, 'Philips', 'img/ampoule_led_rgb.jpg'),
    (@cat, 'Applique murale Luxe', 2650, 45, 'Philips', 'img/applique_murale_luxe.jpg'),
    (@cat, 'Baladeuse chantier', 1180, 34, 'Philips', 'img/baladeuse_chantier.jpg'),
    (@cat, 'Hublot étanche', 810, 47, 'Philips', 'img/hublot_étanche.jpg'),
    (@cat, 'Ruban LED 5m', 2200, 26, 'Philips', 'img/ruban_led_5m.jpg'),
    (@cat, 'Spot encastrable 20A', 800, 21, 'Philips', 'img/spot_encastrable_20A.jpg'),
    (@cat, 'Spot encastrable Éco', 1400, 42, 'Philips', 'img/spot_encastrable_eco.jpg');

-- cables&fils (7 articles)
SET @cat := (SELECT idCat FROM categorie WHERE intituleCat = 'cables&fils');
INSERT INTO article (idCat, intitule, prix, nbDispo, marque, photo) VALUES
    (@cat, 'Câble', 2300, 0, 'Nexans', 'img/cable.jpg'),
    (@cat, 'Câble coaxial 20m', 910, 57, 'Nexans', 'img/cable_coaxial_20m.jpg'),
    (@cat, 'Câble réseau RJ45 16A', 2750, 26, 'Nexans', 'img/cable_réseau_rj45_16A.jpg'),
    (@cat, 'Câble souple 20A', 3250, 37, 'Nexans', 'img/cable_souple_20A.jpg'),
    (@cat, 'Câble électrique 10m', 3750, 21, 'Nexans', 'img/cable_éléctrique_10m.jpg'),
    (@cat, 'Collier colson IP65', 420, 45, 'Nexans', 'img/collier_colson_ip65.jpg'),
    (@cat, 'Domino raccordement Éco', 50, 46, 'Nexans', 'img/domino_raccordement_eco.jpg');

-- disjoncteurs (11 articles)
SET @cat := (SELECT idCat FROM categorie WHERE intituleCat = 'disjoncteurs');
INSERT INTO article (idCat, intitule, prix, nbDispo, marque, photo) VALUES
    (@cat, 'Contacteur jour nuit 10mm', 1420, 1, 'Legrand', 'img/contacteur_jour_nuit_10mm.jpg'),
    (@cat, 'Disjoncteur 16A Legrand', 1250, 38, 'Legrand', 'img/disjoncteur_16A_legrand.jpg'),
    (@cat, 'Disjoncteur différentielle', 6000, 30, 'Legrand', 'img/disjoncteur_défferentielle.jpg'),
    (@cat, 'Disjoncteur moteur Pro', 3100, 23, 'Legrand', 'img/disjoncteur_moteur_pro.jpg'),
    (@cat, 'Fusible', 180, 46, 'Legrand', 'img/fusible.jpg'),
    (@cat, 'Fusible 10A', 160, 0, 'Legrand', 'img/fusible_10A.jpg'),
    (@cat, 'Interrupteur différentielle 220V', 390, 8, 'Legrand', 'img/interrumpteur_differentielle_220v.jpg'),
    (@cat, 'Legrand A16', 1180, 24, 'Legrand', 'img/legrand-a16.jpg'),
    (@cat, 'Porte fusible 20A', 620, 53, 'Legrand', 'img/porte_fusible_20A.jpg'),
    (@cat, 'Relais contrôle', 2950, 17, 'Legrand', 'img/relais_controle.jpg'),
    (@cat, 'Télérupteur Standard', 3000, 57, 'Legrand', 'img/télérrupteur_standard.jpg');

-- prises&interrupteurs (13 articles)
SET @cat := (SELECT idCat FROM categorie WHERE intituleCat = 'prises&interrupteurs');
INSERT INTO article (idCat, intitule, prix, nbDispo, marque, photo) VALUES
    (@cat, 'Boîte dérivation', 210, 24, 'Schneider', 'img/boite-deriv.jpg'),
    (@cat, 'Boîte encastrement Éco', 330, 9, 'Schneider', 'img/boite_encastrement_eco.jpg'),
    (@cat, 'Bouton poussoir 50pcs', 270, 15, 'Schneider', 'img/bouton_poussoir_50pcs.jpg'),
    (@cat, 'Interrupteur', 680, 41, 'Schneider', 'img/interrupteur.jpg'),
    (@cat, 'Interrupteur va et vient', 410, 18, 'Schneider', 'img/interrupteur_va_et_vient.jpg'),
    (@cat, 'Multiprise 4 prises', 2100, 36, 'Schneider', 'img/multiprise_4prise.jpg'),
    (@cat, 'Plaque finition 50pc', 300, 29, 'Schneider', 'img/plaque _finition_50pc.jpg'),
    (@cat, 'Prise', 760, 30, 'Schneider', 'img/prise.jpg'),
    (@cat, 'Prise courant 2P+T', 440, 47, 'Schneider', 'img/prise_courant_2P+T.jpg'),
    (@cat, 'Prise RJ45 5m', 390, 0, 'Schneider', 'img/prise_rj45_5m.jpg'),
    (@cat, 'Prise TV Luxe', 630, 41, 'Schneider', 'img/prise_tv_luxe.jpg'),
    (@cat, 'Rallonge', 1200, 35, 'Schneider', 'img/rallonge.jpg'),
    (@cat, 'Rallonge électrique 5m', 1720, 0, 'Schneider', 'img/rallonge_électrique_5m.jpg');

-- projecteurs (2 articles)
SET @cat := (SELECT idCat FROM categorie WHERE intituleCat = 'projecteurs');
INSERT INTO article (idCat, intitule, prix, nbDispo, marque, photo) VALUES
    (@cat, 'Projecteur', 7000, 32, 'Osram', 'img/projecteur.jpg'),
    (@cat, 'Projecteur LED', 3350, 22, 'Osram', 'img/projecteur_led.jpg');

-- comptage (7 articles)
SET @cat := (SELECT idCat FROM categorie WHERE intituleCat = 'comptage');
INSERT INTO article (idCat, intitule, prix, nbDispo, marque, photo) VALUES
    (@cat, 'Compteur', 6500, 50, 'Siemens', 'img/compteur.jpg'),
    (@cat, 'Compteur divisionnaire', 4450, 38, 'Siemens', 'img/compteur_divisionnaire.jpg'),
    (@cat, 'Compteur électrique', 7600, 49, 'Siemens', 'img/compteur_électrique.jpg'),
    (@cat, 'Horloge programmable', 8050, 8, 'Siemens', 'img/horloge_programmable.jpg'),
    (@cat, 'Pince ampèremétrique', 6800, 55, 'Siemens', 'img/pince_amperemetrique.jpg'),
    (@cat, 'Sous compteur modulaire', 11450, 19, 'Siemens', 'img/sous_compteur_modulaire.jpg'),
    (@cat, 'Transformateur 220V', 2950, 23, 'Siemens', 'img/transformateur_220V.jpg');

-- Promotions de démonstration (8)
INSERT INTO promo (idArt, oldPrice, newPrice) SELECT idArt, prix, 130 FROM article WHERE intitule = 'Clou' LIMIT 1;
INSERT INTO promo (idArt, oldPrice, newPrice) SELECT idArt, prix, 1680 FROM article WHERE intitule = 'Enduit de lissage IP65' LIMIT 1;
INSERT INTO promo (idArt, oldPrice, newPrice) SELECT idArt, prix, 360 FROM article WHERE intitule = 'Goujon d''ancrage Éco' LIMIT 1;
INSERT INTO promo (idArt, oldPrice, newPrice) SELECT idArt, prix, 3000 FROM article WHERE intitule = 'Peinture acrylique mate 5L' LIMIT 1;
INSERT INTO promo (idArt, oldPrice, newPrice) SELECT idArt, prix, 500 FROM article WHERE intitule = 'Porte fusible 20A' LIMIT 1;
INSERT INTO promo (idArt, oldPrice, newPrice) SELECT idArt, prix, 610 FROM article WHERE intitule = 'Prise' LIMIT 1;
INSERT INTO promo (idArt, oldPrice, newPrice) SELECT idArt, prix, 310 FROM article WHERE intitule = 'Prise RJ45 5m' LIMIT 1;
INSERT INTO promo (idArt, oldPrice, newPrice) SELECT idArt, prix, 580 FROM article WHERE intitule = 'Tournevis plate Luxe' LIMIT 1;
