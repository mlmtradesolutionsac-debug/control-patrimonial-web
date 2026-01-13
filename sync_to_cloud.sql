-- ========================================
-- SINCRONIZACION DE DATOS A CLOUD
-- ========================================

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746460850654', '1788', 'MODULO DE MADERA PARA MICROCOMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'PAZ MORENO PABLO MIGUEL', NULL, 5, 293, 'm',
    'CAL2023-11524,CAL2022-06607,CAL2021-04165,_x000D_
CAL2020-06051', 0, 4130, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119L377', '327462', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'PAZ MORENO PABLO MIGUEL', NULL, 5, 293, 'm',
    'CAL2023-11536,CAL2022-10544,CAL2021-02463,_x000D_
CAL2020-08885', 0, 4131, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377776', '469270', 'MONITOR LED', 'HEWLETT PACKARD', '6CM85220DX', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12227,CAL2022-04722,CAL2021-04670,CAL2020-02205,CAL2019-03595', 0, 3083, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437120457', '1655', 'ESCRITORIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUAMANI MUÑOZ JAVIER WILFREDO', NULL, 4, 240, 'm',
    'CAL2023-03108,CAL2022-06222,CAL2021-03547,CAL2020-04168', 0, 3398, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895002142', '443885', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SK-8827',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-06053,CAL2022-00862,CAL2021-09146,CAL2020-08562,CAL2019-07654', 0, 2659, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003201', '451179', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13541,CAL2022-02632,CAL2021-04859,CAL2020-004684', 0, 2815, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500N781', '508150', 'TECLADO - KEYBOARD', 'DELL EMC', 'CN0G4D2WM6D0006H0FR3A01', 'KB-216D',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13659,CAL2022-06200,CAL2021-08936,LIM2020-62739', 0, 2399, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375362', '433826', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168T1J6U', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12228,CAL2022-05958,CAL2021-03233,CAL2020-04352', 0, 2982, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003067', '451045', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-13557,CAL2022-02607,CAL2021-04893,CAL2020-04638', 0, 2632, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O473', '434893', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'm',
    'CAL2023-03050,CAL2022-06262,CAL2021-03573,CAL2020-04135', 0, 3378, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746406261482', '436409', 'ARMARIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'r',
    'CAL2023-03294,CAL2022-05091,CAL2021-02895,CAL2020-03187', 0, 3626, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376802', '452081', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12139,CAL2022-02090,CAL2021-08352,CAL2020-05920', 0, 2695, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500O957', '505242', 'TECLADO - KEYBOARD', 'DELL', 'CN01GN56M6D0004I01G6A01', 'KB-216D',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-09401,CAL2022-02146,CAL2021-06623', 0, 2840, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376992', '452271', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-09956,CAL2022-07756,_x000D_
CAL2021-02697,CAL2020-02544', 0, 2777, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746489330277', '2345', 'SILLON GIRATORIO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ARPASI CRUZ MARTA VIRGINIA', NULL, 4, 261, 'r',
    'CAL2023-09781,CAL2022-09786,CAL2021-00710,CAL2020-02902', 0, 3252, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481194883', '434956', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'm',
    'CAL2023-03281,CAL2022-05119,CAL2021-03568,CAL2020-04141,CAL 2019-01201', 0, 3646, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880373370', '408678', 'MONITOR LED', 'LENOVO', 'SV5643698', 'LT2013S',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12012,CAL2022-02370,CAL2021-6473,CAL2020-03273,CAL2019-09362', 0, 2775, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003185', '451163', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-13502,CAL2022-05384,CAL2021-01842,CAL2020-05544,CAL2019-02432', 0, 2617, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500P584', '507770', 'TECLADO - KEYBOARD', 'HP', 'SIN SERIE', 'KU-1156',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13866,CAL2022-06616, CAL2021-04171,_x000D_
LIM2020-61481,', 0, 2944, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J594', '433628', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03379,CAL2022-10896,CAL2021-02337,CAL2020-01092', 0, 2836, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K608', '467782', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0BVBC01XO', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-005688,CAL2022-01125,CAL2021-09538CAL2020-010360', 0, 2936, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746459830428', '520304', 'MÓDULO DE CÓMPUTO DE MELAMINA 50 cm X 70 cm X 78 cm', 'SIN MARCA', 'SIN SERIE', 'S/M',
    'CRIBILLERO GUILLEN JIMMY POOL', NULL, 4, 265, 'b',
    'CAL2023-07533,CAL2022-05462,CAL2021-06408', 0, 3524, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970129', '97651', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-11009,CAL2022-08475,CAL2021-02585,CAL2020-02012', 0, 4616, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003188', '451166', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03901,CAL2022-04157,CAL2021-06271,CAL2020-03770', 0, 2884, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375406', '433870', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168T1H9U', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12060,CAL2022-04385,CAL2021-05668,CAL2020-00568,CAL2019-00559,CAL2018-00108', 0, 2988, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746441520425', '431208', 'ESTANTE DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03083,CAL2022-05195,CAL2021-03601,CAL2020-04112', 0, 3366, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K599', '467814', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0B5YB92HS', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04300,CAL2022-04953,CAL2021-08079,CAL2020-006511', 0, 2949, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377892', '469582', 'MONITOR LED', 'HEWLETT PACKARD', '6CM85220HF', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03911,CAL2022-04133,CAL2021-06196,CAL2020-06743', 0, 3061, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O417', '434837', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'CAL2023-09808,CAL2022-09740,CAL2021-00341,CAL2020-02938', 0, 3261, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376964', '452243', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-07212,CAL2022-04021,CAL2021-04946,_x000D_
CAL2020-04606', 0, 2724, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376814', '452093', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12282,CAL2022-08536,CAL2021-03116,CAL2020-07124', 0, 3122, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376959', '452238', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-07677,CAL2022-04373,CAL2021-05655,CAL2020-000655,CAL2019-002024', 0, 3094, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746489333816', '433061', 'SILLON GIRATORIO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUAMANI MUÑOZ JAVIER WILFREDO', NULL, 4, 240, 'r',
    'CAL2023-03216,CAL2022-06276,CAL2021-10195,CAL2020-04055', 0, 3744, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120924', '463628', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12350,CAL2022-10378,CAL2021-00931,_x000D_
CAL2020-04524,CAL2019-10376', 0, 4328, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K556', '467736', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0B5YB92TD', 'KU-1469',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03055,CAL2022-01290,CAL2021-07015_x000D_', 0, 3394, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120932', '463636', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12353,CAL2022-10396,CAL2021-00932,_x000D_
CAL2020-04553,CAL2019-10385', 0, 4324, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376973', '452252', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12158,AL2022-04347,CAL2021-05612,CAL2020-00636,CAL2019-03068,CAL2018-06394', 0, 2765, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746458140010', '1183', 'MESITA DE METAL PARA TELEFONO', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ ZAMORA LIDIA MERCEDES', NULL, 4, 241, 'r',
    'CAL2023-03175,CAL2022-05092, CAL2021-02839,CAL2020-04025', 0, 3597, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376893', '452172', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12142,CAL2022-02207,CAL2021-07540,CAL2020-06422', 0, 2690, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746483901430', '152484', 'SILLA GIRATORIA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'PAZ MORENO PABLO MIGUEL', NULL, 5, 293, 'm',
    'CAL2023-08827,CAL2022-00047,CAL2021-05903,_x000D_
CAL2020-11187,CAL2019-04818,CAL2018-03371', 0, 4139, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554320', '301019', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'CORONADO ARAUJO JULIO JOSE', NULL, 7, 192, 'm',
    'S-CAL2025-00198, CAL2023-00618,CAL2022-03785,CAL2021-06777,CAL2020-11759, CAL2016-04215', 1, 3486, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037G497', '0', 'MONITOR LED 27 in', 'HP', 'CNC4370T7Q', 'HP P27 G5',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3184, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746403550404', '431407', 'ARCHIVADOR DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'PAZ MORENO PABLO MIGUEL', NULL, 5, 293, 'r',
    'CAL2023-11528,CAL2022-05511,CAL2021-03979,_x000D_
CAL2020-08213', 0, 4134, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377894', '469724', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011HQP', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-10718,CAL2022-02721,_x000D_
CAL2021-06820,CAL2020-05050', 0, 3016, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376351', '451630', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12147,CAL2022-3002,CAL2021-05598,CAL2020-00550,CAL2019-00532', 0, 2712, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037D448', '0', 'MONITOR LED 23.8 in', 'DELL', 'CN0787XXFCC0025QEJJXA01', 'E2422H',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 5, 252, 'b',
    'CAL2023-11369,CAL2022-11441', 1, 4152, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037F583', '0', 'MONITOR LED 27 in', 'HP', 'CNC3321YJC', 'E27 G5',
    'NAVARRO PAJUELO MONICA MAXIMINA', NULL, 4, 265, 'b',
    'CAL2023-09132, NUEVO 2024', 0, 3535, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K634', '467799', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0BVBBX1CH', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13709,CAL2022-04810,CAL2021-06260,CAL2020-06728,CAL2019-8315', 0, 2937, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746403551043', '475391', 'ARCHIVADOR DE MELAMINA', 'SIN MARCA', '', '',
    'HUAMANI MUÑOZ JAVIER WILFREDO', NULL, 4, 240, 'r',
    'CAL2023-03217,CAL2022-06281,CAL2021-10184,CAL2020-04060', 0, 3727, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J498', '433532', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-08452,CAL2022-07247,CAL2021-01201,CAL2020-007083,CAL2019-002215', 0, 2972, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950X619', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE436BPNR', 'HP PRO SFF 400 G9',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 2787, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481876630', '443683', 'SILLA FIJA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'm',
    'CAL2023-04483,LIM2022-14188,LIM2021-25883,LIM2020-23767', 0, 3579, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873448', '249254', 'MONITOR PLANO', 'LENOVO', 'V3K2672', '9227-AE1',
    'CARDENAS TRUJILLO BLANCA HILDA', NULL, 4, 257, 'r',
    'CAL2023-01653,CAL2022-01362, CAL2021-08987, _x000D_
CAL 2020-009583, CAL 2019-008929', 0, 3758, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037F648', '0', 'MONITOR LED 27 in', 'HP', 'CNC33225Q2', 'E27 G5',
    'PUMACHAY RUIZ RAUL FRANCISCO', NULL, 4, 261, 'r',
    'NUEVO 2024', 0, 3309, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746460855498', '277160', 'MODULO DE MADERA PARA MICROCOMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-01045,CAL2022-01194,CAL2021-08759,CAL2020-10947', 0, 3687, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O575', '464134', 'SILLA FIJA DE MADERA', 'SIN MARCA.', 'S/S', 'S/M',
    'MARQUEZ PORTOCARRERO LUIS MIGUEL', NULL, 4, 261, 'b',
    'CAL2023-09865,CAL2022-09741,CAL2021-00721,CAL2020-07017', 0, 3237, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500C340', '379741', 'TECLADO - KEYBOARD', 'ADVANCE', 'G2370000002', '5137-AU',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'b',
    'CAL2023-04457,CAL2022-00554,CAL2021-07637,CAL 2020-05756,CAL 2019-05944,CAL 2018-05782', 0, 3821, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O391', '434811', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ARPASI CRUZ MARTA VIRGINIA', NULL, 4, 261, 'b',
    'CAL2023-9793,CAL2022-09768,CAL2021-00749,CAL2020-03805', 0, 3250, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950X590', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE436BPT2', 'HP PRO SFF 400 G9',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3216, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '536410020489', '0', 'BIOMBO DE METAL DE 2 CUERPOS', 'SIN MARCA', 'S/S', 'S/M',
    'ASTORAYME PINCHI LUIGUI GIANCARLO PIERRE', NULL, 6, 252, 'b',
    'S-CAL2025-00164, CAL2023-09712,CAL2022-03743', 0, 3585, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376838', '452117', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-07565,CAL2022-10030,CAL2021-04634,_x000D_
CAL2020-03170,CAL2019-02476,CAL2018-03913', 0, 3093, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376909', '452188', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03288,CAL2022-05106,CAL2021-02826,CAL2020-04008', 0, 2769, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950Q760', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE250B6DH', 'PRO 400 G9 SFF',
    'BALOIS CRISPIN MIGUEL ANGEL', NULL, 4, 240, 'b',
    'CAL2023-03118', 0, 3705, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437453288', '431494', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'm',
    'CAL2023-03301,CAL2022-05076,CAL2021-02850,CAL2020-03176', 0, 3630, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O425', '434845', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RIVERA TRUJILLO ALBERTH ANTHONY', NULL, 4, 241, 'm',
    'CAL2023-03187,CAL2022-05083, CAL2021-02883,CAL2020-04005', 0, 3783, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882225250993', '165727', 'EXTINTOR', 'AMEREX', 'X-425160', '332',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10005,CAL2022-08486,_x000D_
CAL2021-02659,CAL2020-08321', 0, 4264, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037F595', '0', 'MONITOR LED 27 in', 'HP', 'CNC24712XP', 'E27 G5',
    'YUPANQUI URETA JOHN JAMES', NULL, 4, 264, 'b',
    'NUEVO', 0, 3559, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740824500846', '0', 'DUPLICADOR DE PUERTOS', 'HP', '5CG249XC93', 'HSN - IX02',
    'CORREA MARREROS LAURA RAQUEL', NULL, 4, 241, 'b',
    'CAL2023-03222', 0, 3599, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K591', '467823', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0BTJBU85U', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03476,CAL2022-09168,CAL2021-02962,CAL2020-02815', 0, 2927, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970145', '97667', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10938,CAL2022-07734,CAL2021-02531,CAL2020-02013', 0, 4632, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950G535', '433267', 'UNIDAD CENTRAL DE PROCESO - CPU', 'DELL', 'SIN SERIE', 'OPTIPLEX 7040 SFF',
    'VARGAS GIL EDILBERTA YOLANDA', NULL, 4, 264, 'b',
    'CAL2023-08454,CAL2022-07249,CAL2021-01202,CAL2020-07090,CAL2019-02212', 0, 3466, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377781', '469276', 'MONITOR LED', 'HEWLETT PACKARD', '6CM8521YVB', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13620, CAL2022-05864, CAL2021-01982, CAL2020-05371', 0, 3172, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003321', '451299', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-13549,CAL2022-02618,CAL2021-04883,CAL 2020-04668', 0, 2602, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746406264830', '0', 'ARMARIO DE MELAMINA', 'EDGAR', '', '',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'r',
    'CAL2023-05211', 0, 3652, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873171', '248964', 'MONITOR PLANO', 'LENOVO', 'V3F2189', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12211,CAL2022-6823,CAL2021-03797,CAL2020-07524', 0, 3176, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '462200509890', '430159', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', 'FORZA', '161133300450', 'NT-1002U',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03090,CAL2022-05190,CAL2021-03597,CAL2020-04108', 0, 3370, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500E893', '397008', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BDMEP0AHH6U0TF', 'PS/2',
    'ZAPATA ZULOETA EDINSON SMITH', NULL, 4, 261, 'm',
    'CAL2023-09794,CAL2022-09769,CAL2021-00753,CAL2020-03803', 0, 3307, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375366', '433830', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168T1JGU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12100,CAL2022-03346,CAL2021-03164,CAL2020-02107,CAL2019-00125', 0, 2975, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437450239', '223978', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'SERTZEN BELLIDO WAGNER', NULL, 7, 198, 'r',
    'CAL2023-09791,CAL2022-09767,CAL2021-00752,CAL 2020-03804', 0, 3255, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003576', '451554', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13485,CAL2022-03322,CAL2021-05140,CAL2020-02137,CAL2019-00196', 0, 2915, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740805006409', '0', 'COMPUTADORA PERSONAL PORTATIL', 'HP', '5CD248CLRS', 'ProBook 450 G9',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'b',
    'CAL2023-03300', 0, 3629, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377787', '469348', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011HB1', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03499,CAL2022-04151,CAL2021-06274,CAL2020-06673', 0, 3059, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950W717', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE325BCYG', 'PRO SFF 400 G9',
    'ROMAN SALAS ESTELA DEL ROCIO', NULL, 4, 264, 'b',
    '14/08/2024, ACT. PECOSA Y FECHA ALTA - SOL. POR: YCHUMPITAZ', 0, 3450, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O492', '434912', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ANDIA BARRUETO STEFANI MILUSKA', NULL, 4, 240, 'm',
    'CAL2023-03132,CAL2022-05160,CAL2021-03509,CAL2020-04047', 0, 3708, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '462200509931', '430200', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', 'FORZA', '161133300391', 'NT-1002U',
    'ARPASI CRUZ MARTA VIRGINIA', NULL, 4, 261, 'b',
    'CAL2023-09795,CAL2022-09772,CAL2021-00756,CAL2020-03806', 0, 3249, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376835', '452114', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02858,CAL2022-02263,CAL2021-07463,CAL2020-05974', 0, 2767, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K620', '467786', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0BVBC007K', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03372,CAL2022-07586,CAL2021-00876,CAL2020-01590', 0, 2860, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881870114', '193096', 'MONITOR PLANO', 'ADVANCE', 'M6788JA004749', 'TFT17W80PS',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12164,CAL2022-07202,CAL2021-03280,CAL2020-05587', 0, 3042, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742223584909', '0', 'EQUIPO MULTIFUNCIONAL COPIADORA IMPRESORA SCANNER Y/O FAX', 'KYOCERA', 'H6H4800413', 'TASKALFA 7004I',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'NUEVO 2024', 0, 3283, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873174', '248967', 'MONITOR PLANO', 'LENOVO', 'V3K1140', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13781,CAL2022-05911,CAL2021-03232,CAL2020-04826', 0, 3131, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K530', '467711', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0A9PBF0RC', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03482,CAL2022-09197,CAL2021-02977,CAL2020-02848', 0, 2857, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037G504', '0', 'MONITOR LED 27 in', 'HP', 'CNC4370TRG', 'HP P27 G5',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3181, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648390H576', '0', 'SILLA GIRATORIA DE METAL CON BRAZOS', 'SIN MARCA', '', '',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'r',
    'CAL2023-13165', 0, 3631, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742223585028', '0', 'EQUIPO MULTIFUNCIONAL COPIADORA IMPRESORA SCANNER Y/O FAX', 'KYOCERA', 'H6J4901808', 'TASKALFA 6004i',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'NUEVO 2025', 0, 3221, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950W688', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE325BC5J', 'PRO SFF 400 G9',
    'ARPASI CRUZ MARTA VIRGINIA', NULL, 4, 261, 'r',
    'NUEVO 2024', 0, 3247, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376910', '452189', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12266,CAL2022-07090,CAL2021-10520,CAL2020-01524', 0, 2688, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895006167', '251616', 'TECLADO - KEYBOARD', 'LENOVO', '697785', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03568,CAL2022-07686,CAL2021-00818,CAL2020-02653', 0, 2664, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037F699', '0', 'MONITOR LED 27 in', 'HP', 'CNC3321K7P', 'E27 G5',
    'ROMAN SALAS ESTELA DEL ROCIO', NULL, 4, 264, 'b',
    '', 0, 3449, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003661', '455169', 'TECLADO - KEYBOARD', 'LENOVO', '103958', 'KU-1619',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-06027,CAL2022-00418,CAL2021-09195,CAL2020-08589,CAL2019-07647', 0, 2656, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880370612', '379368', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'LS1922',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13446,CAL2022-07108,CAL2021-03033,CAL2020-002641', 0, 2693, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881872415', '247304', 'MONITOR PLANO', 'LENOVO', 'V3K1563', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13452,CAL2022-07774,CAL2021-00283,CAL2020-01913', 0, 3142, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554151', '300850', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'MARQUEZ PORTOCARRERO LUIS MIGUEL', NULL, 4, 261, 'r',
    'CAL2023-09862,CAL2022-09719,CAL2021-00747,CAL2020-002989', 0, 3240, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003228', '451206', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-08368,CAL2022-06381,CAL2021-01728,CAL2020-006904,CAL2019-002264', 0, 2341, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J521', '433555', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03462,CAL2022-06545,CAL2021-04342,CAL2020-04840,CAL2019-01440', 0, 2829, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377874', '469526', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011GLF', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-00588,CAL2022-03983,CAL2021-07869,CAL2020-05333', 0, 3077, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500CC52', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', 'BKTAR0CCPJNEB3', 'TPA-P001K',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3215, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970141', '97663', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10990,CAL2022-08455,CAL2021-02613,CAL2020-002584', 0, 4610, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375539', '434003', 'MONITOR LED', 'DELL', 'SIN SERIE', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12115,CAL2022-06247,CAL2021-03284,CAL2020-06925', 0, 3000, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881874150', '334249', 'MONITOR PLANO', 'HEWLETT PACKARD', 'CNC116QSBW', 'S1933',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-01803,CAL2022-01049,CAL2021-09062,CAL2020-07903,CAL2019-10178,CAL2018-5202', 0, 3087, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746460850647', '80066', 'MODULO DE MADERA PARA MICROCOMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'PAZ MORENO PABLO MIGUEL', NULL, 5, 293, 'm',
    'CAL2023-11519,CAL2022-05485,CAL2021-03953,_x000D_
CAL2020-08302', 0, 4147, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740800500664', '509451', 'CAPTURADOR DE IMAGEN - SCANNER', 'FUJITSU', '', 'FI-7700',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'CAL2023-07515,CAL2022-10786,CAL2021-06014-CAL2020-24634', 0, 3521, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970122', '97644', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10964,CAL2022-07899,CAL2021-02611,CAL2020-02591', 0, 4624, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970182', '97704', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-11010,CAL2022-08421,CAL2021-02617,CAL2020-01970', 0, 4606, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U519', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '7CL248008L', 'HSA - C001K',
    'MENDOZA GALINDO KATTIA ESTRELLA', NULL, 4, 240, 'b',
    'CAL2023-03113', 0, 3745, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U652', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '7CL24800AW', 'HSA - C001K',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03102', 0, 3335, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950H188', '443759', 'UNIDAD CENTRAL DE PROCESO - CPU', 'LENOVO', 'SIN SERIE', 'THINKCENTRE M910S',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'r',
    'CAL2023-05844,CAL2022-00495,CAL2021-08507_x000D_
CAL2020-08509', 0, 3611, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K607', '467776', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0BVBC00JH', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03436,CAL2022-09185,CAL2021-03021,CAL2020-01495', 0, 2950, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950Q637', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE250BSMN', 'PRO 400 G9 SFF',
    'ANDIA BARRUETO STEFANI MILUSKA', NULL, 4, 240, 'b',
    'CAL2023-03129', 0, 3729, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376832', '452111', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'GUTIERREZ CHUMPITAZ LUCIO JUAN', NULL, 4, 261, 'b',
    'CAL2023-09859,CAL2022-09688,CAL2021-00768,CAL2020-02974', 0, 3254, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500C265', '378678', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-06159,CAL2022-00654,CAL2021-09293,CAL2020-10660', 0, 2345, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003262', '451240', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13505,CAL2022-04511,CAL202105941,CAL2020-01362,CAL2019-03303', 0, 2626, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746428980610', '505947', 'CASILLERO DE METAL - LOCKER', 'SIN MARCA', '', '',
    'SERTZEN BELLIDO WAGNER', NULL, 5, 254, 'b',
    'CAL2023-12534,CAL2022-09443,CAL2021-00044,_x000D_
CAL2020-60513 / VESTIDORES', 0, 4457, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500CD44', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', 'BKTAR0CCPJN9DB', 'TPA-P001K',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 2799, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554352', '301051', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-10777,CAL2022-09681,CAL2021-00682,CAL2020-01780', 0, 3313, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037A627', '488992', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION T2224D',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12267,CAL2022-06964,CAL2021-01565,CAL2020-48559', 0, 2744, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742223585037', '0', 'EQUIPO MULTIFUNCIONAL COPIADORA IMPRESORA SCANNER Y/O FAX', 'KYOCERA', 'H6J4901774', 'TASKALFA 6004i',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'NUEVO 2025', 0, 2797, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J464', '433498', 'TECLADO - KEYBOARD', 'DELL', 'SN-08NYJV-73826-696-05C6-A02', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13657,CAL2022-03427,CAL2021-05239,CAL2020-00871,CAL2019-00003', 0, 2971, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950W686', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE325BC9G', 'PRO SFF 400 G9',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'b',
    'NUEVO 2024', 0, 3447, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746452031632', '437578', 'MESA DE REUNIONES', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ROCHA FLORINDEZ ANDREA DEL PILAR', NULL, 16, 292, 'r',
    'CAL2023-05385,CAL2022-00447, CAL2021-07659,CAL2020-05772, CAL 2019-008828,', 0, 3853, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481871557', '98159', 'SILLA FIJA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'm',
    'CAL2023-03273,CAL2022-06271,CAL2021,10187,CAL2020-04007', 0, 3665, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437120469', '1551', 'ESCRITORIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'GONZALES FARFAN JORGE SANTIAGO', NULL, 7, 192, 'm',
    'CAL2023-03237,CAL2022-05145,CAL2021-02869,CAL2020-11038', 0, 3683, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500H214', '409716', 'TECLADO - KEYBOARD', 'LENOVO', '54Y94240002251', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03409,CAL2022-02419,CAL2021-07188,CAL2020-03307,CAL 2019-09335', 0, 2851, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375334', '433798', 'MONITOR LED', 'DELL', 'CN0Y01GT7426167T2YHU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12055,CAL2022-05382,CAL2021-03290,CAL2020-07038,CAL2019-02313', 0, 2979, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500P242', '505525', 'TECLADO - KEYBOARD', 'DELL', 'CN01GN56M6D0004I00SJA01', 'KB-219B',
    'SERNAQUE CHIROQUE CARLOS ALBERTO', NULL, 4, 300, 'b',
    'CAL2023-13247,CAL2022-06175.CAL2021-06377', 0, 3425, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746461240497', '436589', 'MODULO DE MELAMINA PARA COMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'MALAVER AYALA PAMELA CECILIA', NULL, 4, 242, 'm',
    'CAL2023-03268,CAL2022-06229,CAL2021-03554,CAL2020-03199,CAL 2019-001306', 0, 3651, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970071', '97593', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-09960,CAL2022-05521,CAL2021-03965,CAL2020-08300', 0, 4297, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375939', '443955', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-05843,CAL2022-00493,CAL2021-08506CAL2020-08508', 0, 2761, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873287', '249088', 'MONITOR PLANO', 'LENOVO', 'V3K2667', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13451,CAL2022-07006,CAL2021-01571,CAL2020-02494', 0, 3139, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003325', '451303', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-01945,CAL2022-08251,CAL2021-01713,CAL2020-10460,CAL2019-03582', 0, 2649, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377779', '469274', 'MONITOR LED', 'HEWLETT PACKARD', '6CM85220BL', 'V203P',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03054,CAL2022-01286,CAL2021-07018', 0, 3395, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J530', '433564', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03395,CAL2022-02020,CAL2021-05391,CAL2020-03678', 0, 2967, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740824500843', '0', 'DUPLICADOR DE PUERTOS', 'HP', '5CG249X9L2', 'HSN - IX02',
    'LA ROSA MACHADO WALTER WILTINHO', NULL, 4, 242, 'b',
    'CAL2023-03256', 0, 3655, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554141', '300840', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 5, 252, 'r',
    'CAL2023-10784,CAL2022-10670,CAL2021-00748,CAL2020-02924', 0, 4442, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500C566', '381649', 'TECLADO - KEYBOARD', 'LENOVO', '4474317', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-05050,CAL2022-00705,CAL2021-07020,CAL2020-07729,CAL2019-08778,CAL2018-05835', 0, 2850, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K559', '467739', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0B5YB90VF', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-05463,CAL2022-00931,CAL2021-08223,', 0, 2852, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K581', '467764', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0BVBC01XB', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02654,CAL2022-02982,CAL2021007280,CAL2020-06284', 0, 2946, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746435760079', '472146', 'ESCALERA METALICA', 'SIN MARCA', 'S/S', 'S/M',
    'CORONADO ARAUJO JULIO JOSE', NULL, 4, 192, 'b',
    'CAL2023-01962,CAL2022-09441,CAL2021-00183,CAL2020-10916', 0, 3578, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970204', '97726', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-11024,CAL2022-08414,CAL2021-02640,CAL2020-01956', 0, 4630, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437455572', '464278', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', '', '',
    'MENDOZA GALINDO KATTIA ESTRELLA', NULL, 4, 240, 'm',
    'CAL2023-03115,CAL2022-05175,CAL2021-03514,CAL2020-04078', 0, 3722, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746406600994', '101449', 'ARMARIO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'r',
    'CAL2023-12486,CAL2022-08269,CAL2021-00437,_x000D_
CAL2020-02348', 0, 4432, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375349', '433813', 'MONITOR LED', 'DELL', 'CN0Y01GT7426167T33AU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12205,CAL2022-06416,CAL2021-04094,CAL2020-03497', 0, 3008, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74087700B582', '0', 'MONITOR A COLOR', 'HP', 'CN443110TP', 'PRO 524PF FHD',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3732, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877002560', '0', 'MONITOR A COLOR 27 in', 'HP', 'CNK23203GW', 'E27 G4 FHD',
    'SULCA MOGOLLON JUANA DEYANIRA', NULL, 4, 239, 'b',
    'CAL2023-03052', 0, 3333, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873415', '249219', 'MONITOR PLANO', 'LENOVO', 'V3K3178', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-06332,CAL2022-01706,CAL2021-09238,CAL2020-09800,CAL2019-08521', 0, 2771, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377824', '469448', 'MONITOR LED', 'HEWLETT PACKARD', '6CM852209J', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12221,CAL2022-04708,CAL2021-04777,CAL2020-02286,CAL2019-05540', 0, 3098, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003299', '451277', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13525,CAL2022-04596,CAL2021-05072,CAL2020-00367,CAL2019-03361', 0, 2899, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742208971683', '441366', 'CAMARA FOTOGRAFICA DIGITAL', 'CANON', 'SIN SERIE', 'SX620HS',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'b',
    'CAL2023-04468,CAL2022-00558,CAL2021-07661,CAL-008827 -2019', 0, 3846, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '536410020502', '0', 'BIOMBO DE METAL DE 3 CUERPOS', 'SIN MARCA', '', '',
    'ASTORAYME PINCHI LUIGUI GIANCARLO PIERRE', NULL, 6, 252, 'b',
    'NUEVO 2024', 0, 3589, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742223585038', '0', 'EQUIPO MULTIFUNCIONAL COPIADORA IMPRESORA SCANNER Y/O FAX', 'KYOCERA', 'H6J4901737', 'TASKALFA 6004i',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'NUEVO 2025', 0, 3220, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437456531', '507986', 'ESCRITORIO DE MELAMINA 60 cm X 78 cm X 1.20 m CON PORTA TECLADO Y PORTA CPU', 'EDGAR', '', '',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'b',
    'CAL2023-04460,CAL2022-00548,CAL2021-07642,LIM2020-55752,', 0, 3822, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895001841', '440603', 'TECLADO - KEYBOARD', 'HALION', 'SIN SERIE', '682',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04916,CAL2022-01047,CAL2021-09069,CAL2020-07911', 0, 2885, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376799', '452078', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-00642,CAL2022-01639,CAL2021-07931,CAL2020-05213', 0, 2757, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376936', '452215', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12218,CAL2022-5940,CAL2021-03248-CAL2020-04341', 0, 3157, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437456010', '477742', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', '', '',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'r',
    'CAL2023-03253,CAL2022-09427,CAL2021-00004_x000D_', 0, 3669, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500P516', '507702', 'TECLADO - KEYBOARD', 'HP', '', 'KU-1156',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'CAL2023-07529,CAL2022-05466,CAL2021-06411,CAL2020-61411', 0, 3543, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377851', '469496', 'MONITOR LED', 'HEWLETT PACKARD', '6CM85220DB', 'V203P',
    'SHIMABUKURO ARAKAKI DANIEL TSUNEO', NULL, 9, 185, 'b',
    'CAL2023-13609, CAL2022-05854 - PJJR', 0, 3819, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376826', '452105', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12003,CAL2022-02287,CAL2021-07553,CAL2020-06443', 0, 2677, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377842', '469487', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011H93', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-08995,CAL2022-04899,CAL2021-08042,CAL 2020-06607', 1, 3075, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003339', '451317', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13504,CAL2022-09977,CAL2021-07538,CAL2020-06426', 0, 2618, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746461240493', '436585', 'MODULO DE MELAMINA PARA COMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'SULCA MOGOLLON JUANA DEYANIRA', NULL, 4, 239, 'm',
    'CAL2023-03049,CAL2022-05179,CAL2021-03591,CAL2020-04119', 0, 3353, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746406261557', '436524', 'ARMARIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUAMANI MUÑOZ JAVIER WILFREDO', NULL, 4, 240, 'r',
    'CAL2023-03122,CAL2022-05142,CAL2021-02875,CAL2020-04062', 0, 3725, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377013', '452292', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12263,CAL2022-07540,CAL2021-01374,CAL2020-01654', 0, 2699, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376803', '452082', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03124,CAL2022-05156,CAL2021-03506,CAL2020-04071', 0, 2710, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746405923274', '319047', 'ARMARIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CORREA MARREROS LAURA RAQUEL', NULL, 4, 241, 'r',
    'CAL2023-03173,CAL2022-05140,CAL2021-02873,CAL2020-04042', 0, 3605, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500A578', '358077', 'TECLADO - KEYBOARD', 'LENOVO', '1S41A53123223980E', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03469,CAL2022-02934,CAL2021-02938,CAL2020-01500', 0, 2870, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375374', '433838', 'MONITOR LED', 'DELL', 'CN0Y01GT74261682331U', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12156,CAL2022-02298,CAL2021-05385,CAL2020-03685', 0, 2977, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742223582867', '496036', 'EQUIPO MULTIFUNCIONAL COPIADORA IMPRESORA SCANNER Y/O FAX', 'HEWLETT PACKARD', 'CNC1M1T05Q', 'LASERJET E82560DN',
    'RIEGA COLACCI JAIME RONALD', NULL, 4, 300, 'b',
    'CAL2023-13250,CAL2022-06154,CAL2021-06380,CAL2020-058561', 0, 3413, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437453425', '436557', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'MEZA FERNANDEZ RUBEN ERNESTO', NULL, 4, 257, 'r',
    'CAL2023-02367,CAL2022-04440, CAL2021-05882,CAL2020-06148, CAL2019-04782', 0, 3558, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J493', '433527', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03531,CAL2022-3858,CAL2021-05742,CAL2020-01177', 0, 2828, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500B270', '367146', 'TECLADO - KEYBOARD', 'LENOVO', '1S41A53123497013E', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-10109, CAL2022-07920, CAL2021-02188, CAL 2020-003136, CAL 2019-009151', 0, 2396, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950J148', '465816', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HEWLETT PACKARD', 'MXL85035NZ', 'PRODESK 600 G4 SFF',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03056,CAL2022-00966,CAL2021-08399,CAL 2020-06540,', 0, 3361, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742208971571', '431338', 'CAMARA FOTOGRAFICA DIGITAL', 'CANON', '302061001688', 'SX620HS',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03099,CAL2022-05198,CAL2021-10382,CAL2020-03164', 0, 3385, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481876621', '443674', 'SILLA FIJA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'm',
    'CAL2023-04484,LIM2022-14183LI2021-25882,LIM2020-23766', 0, 3580, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376834', '452113', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12121,CAL2022-01662,CAL2021-07952,CAL2020-05234', 0, 2743, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873301', '249104', 'MONITOR PLANO', 'LENOVO', 'V3K2640', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-07980,CAL2022-03610,CAL2021-03443,CAL2020-00070,CAL2018-00298,CAL2019-331', 0, 3128, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375787', '440634', 'MONITOR LED', 'LG', '709NTYT4J514', '25UM58',
    'NAVARRO PAJUELO MONICA MAXIMINA', NULL, 4, 265, 'b',
    'CAL2023-08680,CAL2022-04419,CAL2021-05898,CAL2020-08635,CAL2019-04292,CAL2018-06195', 0, 3533, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746473051404', '449411', 'PIZARRA ACRILICA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'b',
    'CAL2023-03293,CAL2022-09435,CAL2021-00049_x000D_', 0, 3632, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437120436', '1369', 'ESCRITORIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RIVERA TRUJILLO ALBERTH ANTHONY', NULL, 4, 241, 'm',
    'CAL2023-03188,CAL2022-05132,CAL2021-02837,CAL2020-04029', 0, 3778, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481871567', '86983', 'SILLA FIJA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'CAL2023-09827,CAL2022-09712,CAL2021-00746, CAL 2020-002922', 0, 3329, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050E053', '0', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', '@ FASE INTERNET PROTECTION', 'EL6324802021', 'AUR-1000',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 10, 252, 'b',
    '', 0, 3406, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003323', '451301', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-13501,CAL2022-02219,CAL2021-07476,CAL2020-05997', 0, 2607, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J586', '433620', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03397,CAL2022-02313,CAL2021-05364,CAL2020-03638', 0, 2968, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003328', '451306', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2022-07602,CAL2021-01311,CAL2020-01604', 0, 2393, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376855', '452134', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12273,CAL2022-07639,CAL2021-00891,CAL2020-01573', 0, 3175, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K578', '467761', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0BVBBZ1VS', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03625,CAL2022-04875,_x000D_
CAL2021-08035,CAL2020-06625', 0, 2947, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119M456', '340813', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'm',
    'S-CAL2025-00226, CAL2023-001041,CAL2022-02471,CAL2021-01618,CAL2020-02549', 0, 3625, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375407', '433871', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168T2NMU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12098,CAL2022-06393,CAL2021-01210,CAL2020-06919,CAL2019-02221,CAL2018-04337', 0, 3027, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895005608', '250355', 'TECLADO - KEYBOARD', 'LENOVO', '697913', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03575,CAL2022-07831,CAL2021-00467', 0, 2911, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882225253308', '0', 'EXTINTOR', 'SIN MARCA', 'S/S', 'S/M',
    'MENDOZA VIVANCO ROCIO VIOLETA', NULL, 5, 252, 'b',
    'CAL2023-13306,CAL2022-07991', 0, 4151, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120991', '464443', 'DETECTOR DE HUMO', 'MIRCOM', '', '',
    'SERTZEN BELLIDO WAGNER', NULL, 5, 254, 'b',
    'S-CAL2025-00400, CAL2022-11621,CAL2021-00959,CAL2020-04493', 0, 4329, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554360', '301059', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'PUMACHAY RUIZ RAUL FRANCISCO', NULL, 4, 261, 'r',
    'S-CAL2025-00200,CAL2023-12577,CAL2021-00407,CAL2020-01782', 0, 3262, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746405923358', '319136', 'ARMARIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'VILLAR AMASIFEN GERALDO JACOMO', NULL, 4, 239, 'r',
    'CAL2023-03066,CAL2022-06207,CAL2021-03529,CAL2020-04100', 0, 3365, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746459830427', '520303', 'MÓDULO DE CÓMPUTO DE MELAMINA 50 cm X 70 cm X 78 cm', 'SIN MARCA', '', 'S/M',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'CAL2023-07516,CAL2022-05450,CAL2021-02787', 0, 3541, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873478', '249297', 'MONITOR PLANO', 'LENOVO', 'V3K0212', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13604,CAL2022-00427,CAL2021-07594,CAL2020-04939,CAL2019-04681,CAL2018-05098', 0, 2730, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746405920229', '1394', 'ARMARIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RUIZ HURTADO ORLANDO AUGUSTO', NULL, 4, 261, 'r',
    'CAL2023-09845,CAL2022-09726,CAL2021-00335,CAL2020-002962,', 0, 3230, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377904', '469813', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011H38', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03491,CAL2022-05218,CAL2021-05092,CAL2020-01485,CAL2019-03425', 0, 3053, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U142', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP2273GYX', 'TPA - P001K',
    'ANDIA BARRUETO STEFANI MILUSKA', NULL, 4, 240, 'b',
    'CAL2023-03135', 0, 3733, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554294', '300993', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'GONZALES PEÑA YOVANA YERI', NULL, 8, 252, 'r',
    'CAL2023-10787,CAL2022-10661,CAL2021-00685,CAL2020-06070', 0, 4447, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J478', '433512', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-07701,CAL2022-04322,_x000D_
CAL2021-05648,CAL2020-00632,CAL2019-02060', 0, 2958, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437455582', '464288', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', '', '',
    'MAIZ SIENFUEGOS MARCIA DANIELA', NULL, 4, 264, 'r',
    'CAL2023-011743,CAL2022-07988,CAL2021-01490,_x000D_
CAL2020-03827', 0, 3473, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873442', '249247', 'MONITOR PLANO', 'LENOVO', 'V3K3130', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-01046,CAL2022-08131,CAL2021-01439,CAL2020-03935', 0, 3132, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375414', '433878', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168T2PWU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12116,CAL2022-06324,CAL2021-01295,CAL2020-06966,CAL2019-03177,CAL2018-04435', 0, 3018, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376362', '451641', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-05917,CAL2022-01551,CAL2021-09366,CAL2020-08804', 0, 2760, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375353', '433817', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168T2PTU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12178,CAL2022-06408,CAL2021-04326,CAL2020-04906', 0, 3019, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877002436', '0', 'MONITOR A COLOR 27 in', 'HP', 'CNK2321605', 'E27 G4 FHD',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'b',
    'CAL2023-03298', 0, 3623, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376940', '452219', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02619,CAL2022-02557,CAL2021-04909,CAL2020-02773', 0, 2752, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648390B967', '471297', 'SILLA GIRATORIA DE METAL', 'SIN MARCA', 'S/S', 'S/M',
    'YUPANQUI URETA JOHN JAMES', NULL, 4, 264, 'b',
    'CAL2022-10584,CAL2021-00064,CAL2020-01045_x000D_', 0, 3563, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120937', '463641', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12361,CAL2022-10405,CAL2021-00941,_x000D_
CAL2020-04531,CAL2019-09509', 0, 4313, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895005622', '250377', 'TECLADO - KEYBOARD', 'LENOVO', '696825', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-01049,CAL2022-08132,CAL2021-01437,CAL2020-03934', 0, 2605, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037B503', '502030', 'MONITOR LED', 'DELL', '', 'E2220H',
    'RIEGA COLACCI JAIME RONALD', NULL, 4, 300, 'b',
    'CAL2023-13252,CAL2022-06156,CAL2021-06365,CAL2020-60248', 0, 3415, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '326404620001', '372017', 'ALACENA DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'SERTZEN BELLIDO WAGNER', NULL, 7, 198, 'r',
    'S-CAL2025-00140, CAL2023-05596,CAL2022-00157,CAL2021-08843,CAL2020-06809', 0, 3265, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746405920250', '79883', 'ARMARIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'r',
    'CAL2023-03021,CAL2022-06219,CAL2021-03531,CAL2020-04103', 0, 3356, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U515', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP249NTVV', 'HSA - P010K',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-08109', 0, 2954, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050E036', '0', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', '@ FASE INTERNET PROTECTION', 'EL6324802202', 'AUR-1000',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 10, 252, 'b',
    '', 0, 3198, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376926', '452205', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-10692,CAL2022-02700,_x000D_
CAL2021-06909,CAL2020-05120', 0, 2720, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873443', '249248', 'MONITOR PLANO', 'LENOVO', 'V3K3090', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-02874,CAL2022-03760,CAL2021-02725,CAL2020-03841', 0, 2733, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742229930243', '318141', 'GUILLOTINA', 'FELLOWES', '0005130', 'SIN MODELO',
    'CARDENAS TRUJILLO BLANCA HILDA', NULL, 4, 257, 'r',
    'S-CAL2025-00230, CAL2023-05290,CAL2022-01673, CAL2021-08972, _x000D_
CAL 2020-009579, CAL 2019-008940', 0, 3700, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037F650', '0', 'MONITOR LED 27 in', 'HP', 'CNC33225FR', 'E27 G5',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    '', 0, 3502, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377412', '457911', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12171,CAL2022-04090,CAL2021-06151,CAL2020-003752', 0, 3144, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O375', '434795', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'm',
    'CAL2023-03161,CAL2022-05146, CAL2021-02870,CAL2020-04030', 0, 3593, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740899508811', '365397', 'UNIDAD CENTRAL DE PROCESO - CPU', 'LENOVO', 'SMJWPVTH', 'THINKCENTRE M82',
    'PAZ MORENO PABLO MIGUEL', NULL, 5, 293, 'r',
    'CAL2023-11482,CAL2022-05564,CAL2021-03526,_x000D_
CAL2020-04149', 0, 4144, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500BP81', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP252RWSG', 'H5A-P010K',
    'VELÁSQUEZ ZÚÑIGA BERNABÉ ALFREDO', NULL, 4, 261, 'r',
    'NUEVO 2024', 0, 3269, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746460853162', '206445', 'MODULO DE MADERA PARA MICROCOMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CORONADO ARAUJO JULIO JOSE', NULL, 4, 192, 'r',
    'CAL2023-05030,-00986,CAL2021-09082,CAL2020-10445', 0, 3679, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376979', '452258', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-08398,CAL2022-06367,_x000D_
CAL2021-05424,CAL2020-07119', 0, 2784, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '112279705672', '529601', 'VENTILADOR ELECTRICO PARA MESA O DE PIE', 'MIRAY', 'S/S', 'VMP-701',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'b',
    'CAL2023-09825,CAL2022-10712', 0, 3318, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375371', '433835', 'MONITOR LED', 'DELL', 'CN0Y01GT742616822YAU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-05086,CAL2022-06307,CAL2021-07117,_x000D_
CAL2020-07844,CAL2019-08792,CAL2018-05753', 0, 3025, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120938', '463642', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12330,CAL2022-10389,CAL2021-00939,_x000D_
CAL2020-04515,CAL2019-10378', 0, 4317, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376858', '452137', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12278,CAL2022-05514,CAL2021-03984,CAL2020-00821', 0, 3155, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003440', '451418', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03174,CAL2022-05136,CAL2021-02836,CAL2020-04028', 0, 2662, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377857', '469502', 'MONITOR LED', 'HEWLETT PACKARD', '6CM852201X', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13612,CAL2022-01507,CAL2021-08579,CAL2020-09839', 0, 3078, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K604', '467810', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0B5YB92UD', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-10705,CAL2022-02744,CAL2021-06798,CAL2020-05056', 0, 2930, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376897', '452176', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12154,CAL2022-05240,CAL2021-06726,CAL2020-01413,CAL2019-03405', 0, 2685, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376390', '451669', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12123,CAL2022-04907,CAL2021-08027,CAL2020-003794', 0, 2668, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873201', '248994', 'MONITOR PLANO', 'LENOVO', 'V3K2974', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12190,CAL2022-5933,CAL2021-01897,CAL2020-04316', 0, 2731, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895005549', '250257', 'TECLADO - KEYBOARD', 'LENOVO', '694982', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13545,CAL2022-06400,CAL2021-01288,CAL2020-06929,CAL2019-02277,CAL2018-04394', 0, 2805, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003421', '451399', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-11909,CAL2022-06411,CAL2021-01867,CAL 2020-005405', 0, 2643, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U730', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP249NT63', 'HSA - P010K',
    'ARMAS TORRES PIERO ANDRE', NULL, 4, 242, 'b',
    'CAL2023-03252', 0, 3668, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J480', '433514', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-11910,CAL2022-06544,CAL2021-04379,CAL 2020-004863,CAL2019-001476', 0, 2830, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648390F426', '512038', 'SILLA GIRATORIA DE METAL CON BRAZOS', 'SIN MARCA', '', '',
    'SERNAQUE CHIROQUE CARLOS ALBERTO', NULL, 4, 300, 'b',
    'CAL2023-13249,CAL2022-06150,CAL2021-06370', 0, 3427, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120929', '463633', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12324,CAL2022-10416,CAL2021-00923,_x000D_
CAL2020-04514,CAL2019-09504', 0, 4312, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746427620029', '0', 'CARRO DE METAL TRANSPORTADOR PLEGABLE CON PLATAFORMA DE METAL', 'TOLSEN', 'S/S', 'S/M',
    'MENDOZA VIVANCO ROCIO VIOLETA', NULL, 10, 252, 'b',
    '', 0, 3576, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880373507', '414446', 'MONITOR LED', 'LENOVO', 'V5916642', '60AB-AAR1-WW',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12172,CAL2022-01011,CAL2021-09072,CAL2020-07917', 0, 2751, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003217', '451195', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-08005,CAL2022-02812,CAL2021-03456,CAL2020-00233', 0, 2342, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881874149', '334248', 'MONITOR PLANO', 'HEWLETT PACKARD', 'CNC116QS1J', 'S1933',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13774,CAL2022-00758,CAL2021-09090,_x000D_
CAL2020-07939', 0, 3104, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377840', '469485', 'MONITOR LED', 'HEWLETT PACKARD', '6CM8522009', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13613,CAL2022-02270,CAL2021-07408,CAL2020-06486', 0, 3052, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740805006320', '0', 'COMPUTADORA PERSONAL PORTATIL', 'HP', '5CD248CMKH', 'ProBook 450 G9',
    'VILLAR AMASIFEN GERALDO JACOMO', NULL, 4, 239, 'b',
    'CAL2023-03082', 0, 3392, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003198', '451176', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'SERTZEN BELLIDO WAGNER', NULL, 5, 254, 'b',
    'CAL2023-12503,CAL2022-10320,CAL2021-00417,_x000D_
CAL2020-02358,CAL2019-07914', 0, 4437, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376918', '452197', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12189,CAL2022-05975,CAL2021-03214,CAL2020-04375', 0, 2722, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K609', '467784', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0BVBBZ0E8', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13565,CAL2022-05216,CAL2021-05094,CAL2020-01487,CAL2019-03427', 0, 2952, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003183', '451161', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13521,CAL2022-02072,CAL2021-07549,CAL2020-06429', 0, 2890, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376871', '452150', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-10072,CAL2022-10501,_x000D_
CAL2021-00640,CAL2020-01793', 0, 3112, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881878589', '391912', 'MONITOR PLANO', 'HEWLETT PACKARD', '6CM4330K6Q', 'LV1911',
    'MARQUEZ PORTOCARRERO LUIS MIGUEL', NULL, 4, 261, 'r',
    'CAL2023-09812,CAL2022-09756,CAL2021-02407,CAL2020-02331', 0, 3300, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481194860', '434933', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'm',
    'CAL2023-03023,CAL2022-06213,CAL2021-02879,CAL2020-04164', 0, 3337, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375301', '433765', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168T1GLU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13442,CAL2022-07159,CAL2021-02339,CAL2020-01090', 0, 3036, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437453260', '431466', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'm',
    'CAL2023-0396,CAL2022-05189,CAL2021-03598,CAL2020-04109', 0, 3377, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '952255290214', '322203', 'MICROFONO INALAMBRICO', 'SENNHEISER', '4021014621', 'EW100-G3',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-09990,CAL2022-08495,CAL2021-02638,CAL2020-08309', 0, 4274, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003066', '451044', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03399,CAL2022-04092,CAL2021-06156,CAL2020-03751', 0, 2841, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877004101', '0', 'MONITOR A COLOR DE 24 in', 'HP', 'CN4242085Y', 'E24 G4 FHD',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'b',
    'CAL2023-03239', 0, 3660, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377853', '469498', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011GL5', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-08987,CAL2022-04120,CAL2021-06164,CAL2020-03745', 0, 3084, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950Q761', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE250BVTM', 'PRO 400 G9 SFF',
    'PAREDES SALOME OLGA JANNET', NULL, 4, 242, 'b',
    'CAL2023-03278', 0, 3634, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376801', '452080', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12152,CAL2022-02066,CAL2021-07527,CAL2020-06449', 0, 3150, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003429', '451407', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13532,CAL2022-04930,CAL2021-05029,CAL2020-04778,CAL2019-01793', 0, 2360, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K598', '467815', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0B5YB80UP', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03483,CAL2022-06417,CAL2021-02746,CAL2020-06136', 0, 2919, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970084', '97606', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-11019,CAL2022-08470,CAL2021-02615,CAL2020-01992', 0, 4609, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377020', '452299', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-07252,CAL2022-04931,CAL2021-05027,_x000D_
CAL2020-04779,CAL-01795', 0, 3095, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746461240701', '458720', 'MODULO DE MELAMINA PARA COMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'PUMACHAY RUIZ RAUL FRANCISCO', NULL, 4, 261, 'r',
    'CAL2023-09372,CAL2022-04950,CAL2021-08083,CAL2020-06514', 0, 3315, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950W650', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE325BCJX', 'PRO SFF 400 G9',
    'NAVARRO PAJUELO MONICA MAXIMINA', NULL, 4, 265, 'b',
    'CAL2023-09135/NUEVO 2024', 0, 3534, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437453492', '437079', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'm',
    'CAL2023-03025,CAL2022-06212,CAL2021-03535,CAL2020-04156', 0, 3390, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U145', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP2273GYY', 'TPA - P001K',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'b',
    'CAL2023-03148', 0, 3787, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895005529', '250207', 'TECLADO - KEYBOARD', 'LENOVO', '0696414', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-06328,CAL2022-01715,CAL2021-09242,CAL2020-09799,CAL2019-08518', 0, 2644, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481199908', '259410', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'VILLANUEVA BRUNO WILLIAMS', NULL, 4, 261, 'r',
    'CAL2023-09833,CAL2022-09773,CAL2021-00765,CAL2020-01808', 0, 3238, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648390B956', '471276', 'SILLA GIRATORIA DE METAL', 'SIN MARCA', 'S/S', 'S/M',
    'VARGAS GIL EDILBERTA YOLANDA', NULL, 4, 264, 'b',
    'CAL2023-11738,CAL2022-10577,CAL2021-00063', 0, 3469, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376845', '452124', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12118,CAL2022-02214,CAL2021-07478,CAL2020-05998', 0, 2748, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376854', '452133', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02880,CAL2022-03305,CAL2021-03181,CAL2020-00894,CAL2019-00034', 0, 2679, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746403550470', '436500', 'ARCHIVADOR DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUAMANI MUÑOZ JAVIER WILFREDO', NULL, 4, 240, 'r',
    'CAL2023-03213,CAL2022-06270,CAL2021,10188,CAL2020-04059', 0, 3717, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376890', '452169', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-07548,CAL2022-09991,CAL2021-04653,CAL2020-004177,CAL2019-02484CAL2018-3900', 0, 2686, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970170', '97692', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10937,CAL2022-08433,CAL2021-02563,CAL2020-01984', 0, 4294, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003431', '451409', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03060,CAL2022-01304,CAL2021-06996,CAL2020-06553,CAL2019-07692', 0, 2355, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895001881', '441462', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-05978,CAL2022-00375,CAL2021-09407,CAL2020-08840', 0, 2653, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377777', '469271', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011GV1', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04227,CAL2022-02498,_x000D_
CAL2021-00784,CAL2020-05372', 0, 3047, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740824500851', '0', 'DUPLICADOR DE PUERTOS', 'HP', '5CG250X16Y', 'HSN - IX02',
    'VILLAR AMASIFEN GERALDO JACOMO', NULL, 4, 239, 'b',
    'CAL2023-03080', 0, 3393, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895006092', '251520', 'TECLADO - KEYBOARD', 'LENOVO', '697633', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-06463,CAL2022-01570,CAL2021-08746,_x000D_
CAL2020-10938', 0, 2638, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088187A410', '357420', 'MONITOR PLANO', 'LENOVO', 'SV8HA245', 'THINKVISIONLT 1952PWD',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12232, CAL2021-11668', 0, 2718, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746489333786', '433031', 'SILLON GIRATORIO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'b',
    'CAL2023-03150,CAL2022-05022, CAL2021-02864,CAL2020-06320', 0, 3794, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '536410020503', '0', 'BIOMBO DE METAL DE 3 CUERPOS', 'SIN MARCA', '', '',
    'ASTORAYME PINCHI LUIGUI GIANCARLO PIERRE', NULL, 6, 252, 'b',
    'NUEVO 2024', 0, 3588, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377806', '469376', 'MONITOR LED', 'HEWLETT PACKARD', '6CM85220HH', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04787,CAL2022-01280,CAL2021-08450,CAL2020-06560', 0, 3171, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037F638', '0', 'MONITOR LED 27 in', 'HP', 'CNC3321K69', 'E27 G5',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'NUEVO 2024', 0, 3286, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J474', '433508', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03524,CAL2022-3235,CAL2021-05723,CAL2020-01264', 0, 2819, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970157', '97679', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10949,CAL2022-08312,CAL2021-02630,CAL2020-01949', 0, 4288, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481876148', '437370', 'SILLA FIJA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CARDENAS TRUJILLO BLANCA HILDA', NULL, 4, 257, 'r',
    'CAL2023-04449,CAL2022-00487,CAL2021-07652,CAL2020-05749,CAL2019-05941', 0, 3693, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J523', '433557', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03466,CAL2022-06582,CAL2021-03889,CAL2020-004289', 0, 2859, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740800500523', '440125', 'CAPTURADOR DE IMAGEN - SCANNER', 'FUJITSU', 'SIN SERIE', 'FI-6770',
    'PAZ MORENO PABLO MIGUEL', NULL, 5, 293, 'r',
    'CAL2023-11520,CAL2022-06608,CAL2021-04169,_x000D_
CAL2020-06054', 0, 4146, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500CD42', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', 'BKTAR0CCPJNAMI', 'TPA-P001K',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 2786, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746406261774', '444228', 'ARMARIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'r',
    'CAL2023-04462,CAL2022-00547,CAL2021-07660,CAL 2020-05767,CAL 2019-05954,CAL 2018-05797', 0, 3811, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746450560265', '513765', 'MESA DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'b',
    'CAL2023-10009,CAL2022-08403,LIM2021-38038', 0, 4271, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746405920272', '93658', 'ARMARIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'CAL2023-09770,CAL2022-09791,CAL2021-00789,CAL2020-002942', 0, 3317, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050A996', '459687', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', 'FORZA', 'SIN SERIE', 'SL-1012UL',
    'NAVARRO PAJUELO MONICA MAXIMINA', NULL, 4, 265, 'b',
    'CAL2023-08665,CAL2022-04433,CAL2021-04479,CAL2020-11335,CAL2019-08673', 0, 3553, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037F574', '0', 'MONITOR LED 27 in', 'HP', 'CNC3321YFV', 'E27 G5',
    'ARPASI CRUZ MARTA VIRGINIA', NULL, 4, 261, 'r',
    'NUEVO 2024', 0, 3246, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437459151', '524902', 'ESCRITORIO DE MELAMINA 60 cm X 78 cm X 1.20 m CON PORTA TECLADO Y PORTA CPU', 'SIN MARCA', 'SIN SERIE', 'S/M',
    'CHAVEZ LEGUIA MARIA SANDRA MILAGROS', NULL, 4, 261, 'r',
    'CAL2023-08777,CAL2022-09446,CAL2021-10943', 0, 3275, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K560', '467740', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0ALAAE2OW', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-09728,CAL2022-04115,CAL2021-06174,CAL2020-003735', 0, 2923, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877002550', '0', 'MONITOR A COLOR 27 in', 'HP', 'CNK2330MW8', 'E27 G4 FHD',
    'ARMAS TORRES PIERO ANDRE', NULL, 4, 242, 'b',
    'CAL2023-03250', 0, 3666, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376906', '452185', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-19192,CAL2022-6899,CAL2021-03681,CAL2020-07542', 0, 2745, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376978', '452257', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12181,CAL2022-06476,CAL2021-04077,CAL2020-003487', 0, 2674, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003592', '451570', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03402,CAL2022-03942,CAL2021-07320,CAL2020-5313', 0, 2848, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377845', '469490', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011H1J', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-08229,CAL2022-03230,_x000D_
CAL2021-05764,CAL2020-01250', 0, 3071, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003316', '451294', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13519,CAL2022-02104,CAL2021-08365,CAL2020-05904', 0, 2888, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375372', '433836', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168238YU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12160,CAL2022-02314,CAL202105367,CAL2020-03639', 0, 3023, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003072', '451050', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03470,CAL2022-04737,CAL2021-04726,CAL2020-02254,CAL2019-03523', 0, 2905, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375418', '433882', 'MONITOR LED', 'DELL', 'CN0Y01GT742616822WWU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12101,CAL2022-08233,CAL2021-01703,CAL2020-08151,', 0, 3010, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375559', '434023', 'MONITOR LED', 'DELL', 'SIN SERIE', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12045,CAL2022-06272,CAL2021,10191,CAL2020-04050', 0, 3028, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437458222', '518772', 'ESCRITORIO DE MELAMINA 60 cm X 78 cm X 1.20 m CON 4 GAVETAS', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'b',
    'CAL2023-03280,CAL2022-09433,LIM2021-40472', 0, 3637, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437453283', '431489', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'NAVARRO PAJUELO MONICA MAXIMINA', NULL, 4, 265, 'b',
    'CAL2023-01081,CAL2022-06820,CAL2021-02785,CAL2020-10483,CAL2019-04854', 0, 3537, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500BP70', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP252RW98', 'H5A-P010K',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    '', 0, 3517, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481876553', '443606', 'SILLA FIJA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'm',
    'CAL2023-04464,LIM2022-14141,LIM2021-25887,LIM2020-23813', 0, 3818, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873663', '254731', 'MONITOR PLANO', 'ADVANCE', 'K3384JA000635', 'TFT19W80PS',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12166,CAL2022-00410,CAL2021-07987,CAL2020-05714,CAL2019-06058', 0, 3043, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437456532', '507987', 'ESCRITORIO DE MELAMINA 60 cm X 78 cm X 1.20 m CON PORTA TECLADO Y PORTA CPU', 'EDGAR', '', '',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'b',
    'CAL2023-04459,CAL2022-00553,CAL2021-07639,CAL2020-05751,', 0, 3825, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950Q722', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE250BST1', 'PRO 400 G9 SFF',
    'SULCA MOGOLLON JUANA DEYANIRA', NULL, 4, 239, 'b',
    'CAL2023-03053', 0, 3351, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554159', '300858', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'SERTZEN BELLIDO WAGNER', NULL, 5, 254, 'r',
    'CAL2023-13312,CAL2022-10658,CAL2021-00698,CAL2020-06080', 0, 4446, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437120530', '1130', 'ESCRITORIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'VILLANUEVA BRUNO WILLIAMS', NULL, 4, 261, 'r',
    'CAL2023-09855,CAL2022-09704,CAL2021-06652,CAL2020-05631', 0, 3242, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K528', '467709', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0B5YB92HL', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03922,CAL2022-04112,CAL2021-06179,CAL2020-03730', 0, 2918, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050E011', '0', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', '@ FASE INTERNET PROTECTION', 'EL6324802203', 'AUR-1000',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 10, 252, 'b',
    '', 0, 3401, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500CC23', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', 'BKTAR0CCPJNAMO', 'TPA-P001K',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 2796, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037C308', '507071', 'MONITOR LED', 'HP', 'CNC9482XRC', 'ELITEDISPLAY E223',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'CAL2022-05464,CAL2021-06413,CAL2020-62364', 0, 3545, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376357', '451636', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-06901,CAL2022-05253,CAL2021-06736, _x000D_
CAL2020-01386,CAL2019-03434', 0, 3111, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U465', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP249NTCX', 'HSA - P010K',
    'RUIZ HURTADO ORLANDO AUGUSTO', NULL, 4, 261, 'r',
    'CAL2023-09849', 0, 3227, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500H218', '409720', 'TECLADO - KEYBOARD', 'LENOVO', '54Y94240000299', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03404,CAL2022-02399,CAL2021-07181,CAL2020-03269,CAL2019-09375', 0, 2846, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '676447390003', '26022', 'PEDESTAL PARA MICROFONO', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-09996,CAL2022-09509,CAL2021-02578,CAL2020-11052', 0, 4276, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877002378', '0', 'MONITOR A COLOR 27 in', 'HP', 'CNK23215BT', 'E27 G4 FHD',
    'RUIZ HURTADO ORLANDO AUGUSTO', NULL, 4, 261, 'r',
    'CAL2023-09847', 0, 3225, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J593', '433627', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'YUCRA TRUJILLO JULIO CESAR', NULL, 4, 261, 'b',
    'CAL2023-09803,CAL2022-09760,CAL2021-00759,CAL2020-02998', 0, 3280, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895001834', '440596', 'TECLADO - KEYBOARD', 'HALION', 'SIN SERIE', '682',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03587,CAL2022-07769,CAL2021-00287,CAL2020-01915', 0, 2953, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O355', '434775', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'm',
    'CAL2023-03228,CAL2022-05131, CAL2021-02838,CAL2020-04070', 0, 3618, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746483902949', '229409', 'SILLA GIRATORIA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'PALACIOS MEDINA JOSE ANTULY', NULL, 4, 261, 'r',
    'CAL2023-01981,CAL2022-01233,CAL2021-08627,_x000D_
CAL2020-09654,CAL2019-05534,CAL2018-05383', 0, 3308, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970178', '97700', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10940,CAL2022-08304,CAL2021-02561,CAL2020-02010', 0, 4296, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377838', '469483', 'MONITOR LED', 'HEWLETT PACKARD', '6CM852200B', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12173,CAL2022-05270,CAL2021-04701,CAL2020-02256,CAL2019-04986', 0, 3099, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873266', '249066', 'MONITOR PLANO', 'LENOVO', 'V3K3350', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13793,CAL2022-01043,CAL2021-09348,CAL2020-07981,CAL2019-9077,CAL2018-6031', 0, 2763, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877002603', '0', 'MONITOR A COLOR 27 in', 'HP', 'CNK23203MM', 'E27 G4 FHD',
    'PAREDES SALOME OLGA JANNET', NULL, 4, 242, 'b',
    'CAL2023-03277', 0, 3635, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003274', '451252', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-13553,CAL2022-02623,CAL2021-04875,CAL2020-04674', 0, 2609, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J495', '433529', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13649,CAL2022-03698,CAL2021-03385,CAL2020-00043', 0, 2960, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970089', '97611', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10981,CAL2022-08463,CAL2021-02562,CAL2020-02009', 0, 4611, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740824500849', '0', 'DUPLICADOR DE PUERTOS', 'HP', '5CG250ZL10', 'HSN - IX02',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03093', 0, 3375, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003332', '451310', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-00643,CAL2022-04002,CAL2021-04984,CAL2020-004615', 0, 2808, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037G501', '0', 'MONITOR LED 27 in', 'HP', 'CNC4370T7H', 'HP P27 G5',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3185, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K589', '467772', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0BTJBUCTU', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04819,CAL2022-00906,CAL2020-07706,CAL2019-08728', 0, 2929, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970186', '97708', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10979,CAL2022-08314,CAL2021-02554,CAL2020-01987', 0, 4602, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003309', '451287', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'MEZA FERNANDEZ RUBEN ERNESTO', NULL, 4, 257, 'b',
    'CAL2023-03579, CAL2022-05562,CAL2021-04018,CAL2020-08183', 0, 3557, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J614', '433648', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03406,CAL2022-02020,CAL2021-05353,CAL2020-003664', 0, 2821, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970118', '97640', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10951,CAL2022-08394,CAL2021-02666,CAL2020-01963', 0, 4293, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746428980357', '323947', 'CASILLERO DE METAL - LOCKER', 'ITALICA', 'SIN SERIE', 'MEL 79',
    'SERTZEN BELLIDO WAGNER', NULL, 5, 254, 'r',
    'CAL2023-11669,CAL2022-06648,CAL2021-04184,CAL2020-08135', 0, 4459, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '952285140124', '134393', 'TELEVISOR A COLORES', 'IMACO', '00203', 'I29B5C',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'r',
    'CAL2023-005763,CAL2022-01576,CAL2021-08681_x000D_
CAL2020-10994', 0, 3440, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U138', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP2273GYT', 'TPA - P001K',
    'VILLAR AMASIFEN GERALDO JACOMO', NULL, 4, 239, 'b',
    'CAL2023-03079', 0, 3389, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873329', '249132', 'MONITOR PLANO', 'LENOVO', 'V3K2624', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-05087,CAL2022-00627,CAL2021-09585,CAL2020-07836,CAL2019-08786,CAL2018-05861', 0, 2737, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746441520392', '431175', 'ESTANTE DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUAMANI MUÑOZ JAVIER WILFREDO', NULL, 4, 240, 'b',
    'CAL2023-03211,CAL2022-06277,CAL2021-10451', 0, 3710, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500O958', '505243', 'TECLADO - KEYBOARD', 'DELL', 'CN01GN56M6D0004I0765A01', 'KB-216D',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04282,CAL2022-02524,CAL2021-05297', 0, 2839, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877002312', '0', 'MONITOR A COLOR 27 in', 'HP', 'CNK23203K5', 'E27 G4 FHD',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03105', 0, 3360, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377887', '469577', 'MONITOR LED', 'HEWLETT PACKARD', '6CM8522075', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13646,CAL2022-04858,CAL2021-10159,CAL2020-06643', 0, 3054, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746441520397', '431180', 'ESTANTE DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LA ROSA MACHADO WALTER WILTINHO', NULL, 4, 242, 'b',
    'CAL2023-03265,CAL2022-05080,CAL2021-02852,CAL2019-03179', 0, 3658, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740899508375', '356852', 'UNIDAD CENTRAL DE PROCESO - CPU', 'LENOVO', 'MJTPZLF', 'THINKCENTRE M82',
    'MARQUEZ PORTOCARRERO LUIS MIGUEL', NULL, 4, 261, 'r',
    'CAL2023-09810,CAL2022-09750,CAL2021-00724,CAL2020-02992', 0, 3301, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K622', '467788', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0BVBC00GY', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-4061,CAL2022-05843,CAL2021-07823,CAL2020-05809', 0, 2922, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376961', '452240', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12135,CAL2022-04553,CAL2021-05083,CAL2020-00382,CAL2019-03347', 0, 3143, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375347', '433811', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168T2PCU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12217,CAL2022-06447,CAL2021-04060,CAL2020-04262', 0, 3011, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746450560281', '513781', 'MESA DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'b',
    'CAL2023-10007,CAL2022-08404,LIM2021-38039', 0, 4270, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376840', '452119', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-08228,CAL2022-03188, CAL2021-05752, CAL2020-01291', 0, 3110, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882225251509', '238681', 'EXTINTOR', 'AMEREX', 'L589307', 'B456',
    'GONZALES FARFAN JORGE SANTIAGO', NULL, 4, 252, 'r',
    'CAL2023-09706,CAL2022-01113,CAL2021-09540,CAL2020-09754', 0, 3489, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221122129', '516111', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'SERTZEN BELLIDO WAGNER', NULL, 5, 254, 'b',
    'CAL2023-12367,CAL2022-10413,CAL2021-00903 ALMACEN', 0, 4337, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500B058', '366881', 'TECLADO - KEYBOARD', 'LENOVO', '1S41A53123498146E', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03563,CAL2022-08366,CAL2021-00473,CAL2020-02067', 0, 2912, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877004097', '0', 'MONITOR A COLOR DE 24 in', 'HP', 'CN42450LDR', 'E24 G4 FHD',
    'MALAVER AYALA PAMELA CECILIA', NULL, 4, 242, 'b',
    'CAL2023-03266', 0, 3644, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500C277', '378691', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-005723,CAL2022-01117,CAL2021-09448_x000D_
CAL2020-10355', 0, 2665, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500BQ27', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP252RXVN', 'H5A-P010K',
    'ARPASI CRUZ MARTA VIRGINIA', NULL, 4, 261, 'r',
    'NUEVO 2024', 0, 3248, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880373343', '408651', 'MONITOR LED', 'LENOVO', 'SV5643402', 'LT2013S',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12163,CAL2022-02406,CAL2021-06426,CAL2020-03321,CAL2019-09395', 0, 2687, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376353', '451632', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12223,CAL2022-06579,CAL2021-04072,CAL2020-04281', 0, 2692, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950H194', '443769', 'UNIDAD CENTRAL DE PROCESO - CPU', 'LENOVO', 'SIN SERIE', 'THINKCENTRE M910S',
    'MAIZ SIENFUEGOS MARCIA DANIELA', NULL, 4, 264, 'b',
    'CAL2023-06075,CAL2022-00859, CAL2021-09147, _x000D_
CAL 2020-008564, CAL 2019-007652', 0, 3470, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950N299', '504057', 'UNIDAD CENTRAL DE PROCESO - CPU', 'DELL', '79Y7773', 'OPTIPLEX 7080 SFF',
    'ROJAS ROJAS SANDY KARIN', NULL, 4, 300, 'b',
    'CAL2023-13266,CAL2022-06163,CAL2021-06373,CAL2020-477261', 0, 3429, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746405923407', '319191', 'ARMARIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 192, 'r',
    'CAL2023-11534,CAL2022-10545,CAL2021-02462,_x000D_
CAL2020-08883', 0, 3641, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880373340', '408647', 'MONITOR LED', 'LENOVO', 'SV5642193', 'LT2013S',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12130,CAL2022-04672,CAL2021-06455,CAL2020-03365,CAL2019-09385', 0, 2694, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500CD45', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', 'BKTAR0CCPJN9J4', 'TPA-P001K',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3207, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375941', '443957', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-06117,CAL2022-00889,CAL2021-09221,CAL2020-010275,CAL2019-07670', 0, 2717, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950G625', '433357', 'UNIDAD CENTRAL DE PROCESO - CPU', 'DELL', 'SIN SERIE', 'OPTIPLEX 7040 SFF',
    'YUCRA TRUJILLO JULIO CESAR', NULL, 4, 261, 'b',
    'CAL2023-09802,CAL2022-09759,CAL2021-00758,CAL2020-02999', 0, 3278, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003425', '451403', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13493,CAL2022-04468,CAL2021-06750,CAL2020-01392,CAL2019-03464', 0, 2621, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003345', '451323', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03581,CAL2022-07562,CAL2021-00888,CAL2020-02649', 0, 2394, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003380', '451358', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03598,CAL2022-08521,CAL2021-03130,CAL2020-07143', 0, 2865, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500H032', '409519', 'TECLADO - KEYBOARD', 'LENOVO', '54Y94240004734', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-06415,CAL2022-01421,CAL2021-11096,CAL2020-10453', 0, 2652, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003264', '451242', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03472,CAL2022-5942,CAL2021-03245,CAL2020-04344', 0, 2615, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377783', '469299', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011HVK', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12244,CAL2022-07560,CAL2021-00886,CAL2020-01560', 0, 3072, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376971', '452250', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12275,CAL2022-07548,CAL2021-01364,CAL2020-01638', 0, 3166, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375388', '433852', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168T1GRU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12229,CAL2022-06420,CAL2021-04086,CAL2020-03492,', 0, 3039, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970160', '97682', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'r',
    'CAL2023-03065,CAL2022-06221,CAL2021-03546,CAL2020-04170', 0, 3364, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376819', '452098', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13789,CAL2022-02221,CAL2021-07547,CAL2020-06435', 0, 3114, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950Q678', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE250BSVB', 'PRO 400 G9 SFF',
    'HUAMANI MUÑOZ JAVIER WILFREDO', NULL, 4, 240, 'b',
    'CAL2023-03219', 0, 3400, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740805006354', '0', 'COMPUTADORA PERSONAL PORTATIL', 'HP', '5CD248CM9N', 'ProBook 450 G9',
    'RUBIO VALLE JOSE OCTAVIO', NULL, 4, 240, 'b',
    'CAL2023-03142', 0, 3712, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500CD46', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', 'BKTAR0CCPJNEE1', 'TPA-P001K',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 2788, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500B106', '366964', 'TECLADO - KEYBOARD', 'LENOVO', '1S41A53123495996E', 'KU-0225',
    'GARCIA VALENZUELA LUIS ALBERTO', NULL, 9, 185, 'r',
    'CAL2023-13490,CAL2022-06289, CAL2021-01763, CAL 2020-008121,', 0, 3817, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500B010', '366826', 'TECLADO - KEYBOARD', 'LENOVO', '1S41A53123497650E', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03481,CAL2022-6830,CAL2021-03776,CAL2020-04365', 0, 2869, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J608', '433642', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12918,CAL2022-5972,CAL2021-03220,CAL2020-01049', 0, 2827, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037B290', '501817', 'MONITOR LED', 'DELL', 'CN0KK3PRBO30009A17EI', 'E2220H',
    'RECUENCO COICO FLOR DE MARIA', NULL, 4, 300, 'b',
    'CAL2023-13259,CAL2022-06170,CAL2021-06374,CAL2020-60075', 0, 3435, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '676457820227', '386922', 'RACK PARA RADIO, TV, LUCES Y TELECINE', 'TOYAMA', 'SIN SERIE', 'EDAGT',
    'QUISPE PUJAICO BRITT LISSETH', NULL, 5, 294, 'b',
    'CAL2023-08967,CAL2022-03788,CAL2021-01485,_x000D_
CAL2020-03966', 0, 4455, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950Q812', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE250BSZV', 'PRO 400 G9 SFF',
    'ARMAS TORRES PIERO ANDRE', NULL, 4, 242, 'b',
    'CAL2023-03251_x000D_', 0, 3667, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037G696', '0', 'MONITOR LED 27 in', 'HP', 'CNC4370TTH', 'HP P27 G5',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3193, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376966', '452245', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-06782,CAL2022-04613,CAL2021-05981,CAL2020-01343,CAL2019-03309,CAL2018-02501', 0, 3108, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873325', '249128', 'MONITOR PLANO', 'LENOVO', 'V3K2612', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-02877,CAL2022-00008,CAL2021-06684,CAL2020-05662,CAL2019-06157', 0, 2729, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376889', '452168', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-07025,CAL2022-02541,CAL2021-04817,_x000D_
CAL2020-02760,CAL2019-01631', 0, 2707, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740805006340', '0', 'COMPUTADORA PERSONAL PORTATIL', 'HP', '5CD248CNGG', 'ProBook 450 G9',
    'MALAVER AYALA PAMELA CECILIA', NULL, 4, 242, 'b',
    'CAL2023-03271', 0, 3642, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119J847', '287427', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'MALAVER AYALA PAMELA CECILIA', NULL, 4, 242, 'm',
    'CAL2023-03264,CAL2022-09426,CAL2021-06833,CAL2020-05098', 0, 3675, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950I127', '450530', 'UNIDAD CENTRAL DE PROCESO - CPU', 'LENOVO', 'SIN SERIE', 'THINKCENTRE M910S',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'b',
    'CAL2023-09766,CAL2022-09794,CAL2021-00781,CAL2020-002950', 0, 3480, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120920', '463624', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12326,CAL2022-10399,CAL2021-00904,_x000D_
CAL2020-04513,CAL2019-10372', 0, 4331, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895006086', '251511', 'TECLADO - KEYBOARD', 'LENOVO', '701357', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-07412,CAL2022-03373,CAL2020-000913,CAL2019-000088, CAL2018-008723', 0, 2346, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740899504018', '245109', 'UNIDAD CENTRAL DE PROCESO - CPU', 'LENOVO', 'MJHV945', '3285-A16',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'r',
    'CAL2023-04458,CAL2022-00555,CAL2021-07638,CAL 2020-05775,CAL 2019-05945,CAL 2018-05784', 0, 3820, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950H875', '450278', 'UNIDAD CENTRAL DE PROCESO - CPU', 'LENOVO', 'SIN SERIE', 'THINKCENTRE M910S',
    'DEL PINO GUTARRA JHON ANTONY', NULL, 4, 299, 'r',
    'CAL2023-12314,CAL2022-02010, CAL2021-05377,CAL2020-03647,CAL2019-4907', 0, 3828, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003249', '451227', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13492,CAL2022,11357,CAL2021-07466,CAL2020-05983', 0, 2623, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746489333826', '433071', 'SILLON GIRATORIO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'CAL2023-1901,CAL2022-10930,CAL2021-06582,CAL2020-00411,CAL2019-01939,CAL2018-0430', 0, 3291, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950N300', '504058', 'UNIDAD CENTRAL DE PROCESO - CPU', 'DELL', '4X0T673', 'OPTIPLEX 7080 SFF',
    'RECUENCO COICO FLOR DE MARIA', NULL, 4, 300, 'b',
    'CAL2023-13260,CAL2022-06171,CAL2021-06385,CAL2020-047764', 0, 3434, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375312', '433776', 'MONITOR LED', 'DELL', 'CN0Y01GT7426167T30FU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12106,CAL2022-03037,CAL2021-06608,CAL2020-00598,CAL2019-02146,CAL2018-00451', 0, 3029, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003585', '451563', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03450,CAL2022-06527,CAL2021-04362,CAL2020-04835', 0, 2910, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970082', '97604', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CARDENAS TRUJILLO BLANCA HILDA', NULL, 4, 257, 'r',
    'S-CAL2025-00203, CAL2023-05298,CAL2022-01681, CAL2021-08981,_x000D_
CAL2020-09563, CAL 2019-008924', 0, 3769, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877002598', '0', 'MONITOR A COLOR 27 in', 'HP', 'CNK23506HH', 'E27 G4 FHD',
    'MENDOZA GALINDO KATTIA ESTRELLA', NULL, 4, 240, 'b',
    'CAL2023-03111', 0, 3719, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J567', '433601', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'VARGAS GIL EDILBERTA YOLANDA', NULL, 4, 264, 'r',
    'CAL2023-011749,CAL2022-6872,CAL2021-03748,_x000D_
CAL2020-04900', 0, 3467, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003239', '451217', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'UBICADO2024,CAL2022-03307,CAL2021-03179,CAL2020-00892,CAL2019-00036', 0, 2645, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481876851', '455550', 'SILLA FIJA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'VELASQUEZ CABRERA MIGUEL ERNESTO', NULL, 9, 194, 'm',
    'CAL2023-04809,CAL2022-00952,CAL2021-08225,CAL2020-06576,CAL 2019-07707,', 0, 3696, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '112279706230', '0', 'VENTILADOR ELECTRICO DE PIE DE 3 VELOCIDADES', 'IMACO', 'S/S', 'FS1645P',
    'ARPASI CRUZ MARTA VIRGINIA', NULL, 4, 261, 'r',
    'NUEVO 2024', 0, 3251, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037B608', '502135', 'MONITOR LED', 'DELL', 'CN0KK3PRBO30009A0ETI', 'E2220H',
    'ROJAS ROJAS SANDY KARIN', NULL, 4, 300, 'b',
    'CAL2023-13265,CAL2022-06164,CAL2021-06386,CAL2020-060245', 0, 3428, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881879453', '400178', 'MONITOR PLANO', 'HEWLETT PACKARD', '6CM4291Y3F', 'LV1911',
    'ZAPATA ZULOETA EDINSON SMITH', NULL, 4, 261, 'b',
    'CAL2023-09863,CAL2022-09771,CAL2021-10161,CAL2020-03001', 0, 3305, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500A864', '366655', 'TECLADO - KEYBOARD', 'LENOVO', '1S41A53123496249E', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-13494,CAL2022-05174,CAL2021-03512,CAL2020-04077', 0, 2631, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746406261773', '444227', 'ARMARIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'r',
    'CAL2023-04435,CAL2022-00477,CAL2021-07654,CAL 2020-05781,CAL 2019-05974,CAL 2018-05770', 0, 3812, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895005519', '250193', 'TECLADO - KEYBOARD', 'LENOVO', '0713380', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13711,CAL2022-01045,CAL2021-09349,CAL2020-07982,CAL2019-09076,CAL2018-06033', 0, 2660, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377004', '452283', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'MAIZ SIENFUEGOS MARCIA DANIELA', NULL, 4, 264, 'r',
    'CAL2023-11746,CAL2022-05579,CAL2021-04031,_x000D_
CAL2020-08203', 0, 3472, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376937', '452216', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'CARDENAS TRUJILLO BLANCA HILDA', NULL, 4, 257, 'r',
    'S-CAL2025-00231, CAL2023-05293,CAL2022-01687, CAL2021-08962, _x000D_
CAL 2020-009555, CAL 2019-008917', 0, 3761, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500BQ14', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CT310002B', 'H5A-P010K',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'NUEVO 2024', 0, 3288, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037G695', '0', 'MONITOR LED 27 in', 'HP', 'CNC4370V2Z', 'HP P27 G5',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3183, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950Q547', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE250BT0G', 'PRO 400 G9 SFF',
    'RUIZ HURTADO ORLANDO AUGUSTO', NULL, 4, 261, 'r',
    'CAL2023-09848', 0, 3226, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003195', '451173', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'VILLANUEVA BRUNO WILLIAMS', NULL, 4, 261, 'b',
    'CAL2023-08727,CAL2022-04406,CAL2021-05862,CAL2020-11176,CAL2019-09802,CAL2018-10043', 0, 3244, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746448420024', '186788', 'MESA (OTRAS)', 'DURAPLAST', 'SIN SERIE', 'SIN MODELO',
    'RUIZ HURTADO ORLANDO AUGUSTO', NULL, 4, 261, 'r',
    'CAL2023-09836,CAL2022-09731,CAL2021-00775,CAL2020-02935', 0, 3323, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437455583', '464289', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', '', '',
    'PEREZ SALAZAR MARITA', NULL, 4, 241, 'm',
    'CAL2023-03160,CAL2022-09431,CAL2021-00005_x000D_', 0, 3782, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437453475', '437062', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'VILLAR AMASIFEN GERALDO JACOMO', NULL, 4, 239, 'm',
    'CAL2023-03077,CAL2022-06261,CAL2021-03574,CAL2020-04140', 0, 3369, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746411180368', '433029', 'BANCA DE ASIENTOS MULTIPLES', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'SERTZEN BELLIDO WAGNER', NULL, 7, 198, 'm',
    'CAL2023-01347,CAL2022-06653,CAL2021-00410,CAL2020-08133 / 0.42X2.00X0.88', 0, 3575, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437456052', '477784', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', '', '',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'CAL2023-07513,CAL2022-05454,CAL2021-06389,CAL2020-00954,CAL2019-43285LIN', 0, 3506, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437453268', '431474', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUAMANI MUÑOZ JAVIER WILFREDO', NULL, 4, 240, 'm',
    'CAL2023-03212,CAL2022-06275,CAL2021-10196,CAL2020-04054', 0, 3743, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J602', '433636', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13658,CAL2022-3238,CAL2021-05812,CAL2020-00194', 0, 2961, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050E031', '0', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', '@ FASE INTERNET PROTECTION', 'EL6324802227', 'AUR-1000',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 10, 252, 'b',
    '', 0, 3197, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970106', '97628', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-11016,CAL2022-08474,CAL2021-02626,CAL2020-02011', 0, 4620, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '462247854367', '0', 'EQUIPO DE ILUMINACION DE EMERGENCIA', 'OPALUX.', 'SIN SERIE', '9101-220',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'NUEVO 2024', 0, 4257, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740800500940', '509418', 'CAPTURADOR DE IMAGEN - SCANNER', 'FUJITSU', '', 'FI-7700',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'b',
    'CAL2023-07509,CAL2022-05461,CAL2021-06407,CAL2020-24644', 0, 3539, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950Q671', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE250BW1Q', 'PRO 400 G9 SFF',
    'LA ROSA MACHADO WALTER WILTINHO', NULL, 4, 242, 'b',
    'CAL2023-03245', 0, 3672, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377870', '469518', 'MONITOR LED', 'HEWLETT PACKARD', '6CM85220GM', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12194,CAL2022-09199,CAL2021-02973,CAL2020-02847', 0, 3107, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740824500850', '0', 'DUPLICADOR DE PUERTOS', 'HP', '5CG250Z7MG', 'HSN - IX02',
    'RUBIO VALLE JOSE OCTAVIO', NULL, 4, 240, 'b',
    'CAL2023-03140', 0, 3716, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375325', '433789', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168T2R3U', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13449,CAL2022-07083,CAL2021-03056,CAL2020-01699', 0, 3009, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377820', '469444', 'MONITOR LED', 'HEWLETT PACKARD', '6CM8521YV6', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-4060,CAL2022-05844, CAL2021-07821,CAL2020-05807', 0, 3096, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377897', '469727', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011HVN', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-10629,CAL2022-01907,_x000D_
CAL2021-06936,CAL2020-05082', 0, 3065, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500CC08', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', 'BKTAR0CCPJN9I7', 'TPA-P001K',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3209, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376796', '452075', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03182,CAL2022-05135,CAL2021-02834,CAL2020-04026', 0, 2708, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375377', '433841', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168T1GJU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12105,CAL2022-05364,CAL2021-01827,CAL2020-005484,CAL2019-001362', 0, 2994, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K623', '467791', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0BVBC004C', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03464,CAL2022-04714,CAL2021-04756,CAL2020-002182,CAL2019-003609', 0, 2858, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881871912', '218677', 'MONITOR PLANO', 'LENOVO', 'SV1Ta805', '4434-HE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12281,CAL2022-07045,CAL2021-01588,CAL2020-002516', 0, 3174, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377791', '469357', 'MONITOR LED', 'HEWLETT PACKARD', '6CM85220QS', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12243,CAL2022-07697,CAL2021-00805,CAL2020-02676', 0, 3118, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O337', '434757', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ARMAS TORRES PIERO ANDRE', NULL, 4, 241, 'm',
    'CAL2023-03254,CAL2022-05128,CAL2021-02858,CAL2020-04039', 0, 3670, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740805002115', '500389', 'COMPUTADORA PERSONAL PORTATIL', 'LENOVO', 'PF20JJXA', 'THINKPADL15GEN1',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'b',
    'CAL2023-09726,LIM2022-55013,LIM2021-36653', 0, 3836, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746403550475', '436505', 'ARCHIVADOR DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'r',
    'CAL2023-03067,CAL2022-05197,CAL2021-03600,CAL2020-04113', 0, 3386, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895006874', '294890', 'TECLADO - KEYBOARD', 'IBM', '1S42C00600328012B', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03410,CAL2022-03759,CAL2021-02726,CAL2020-03840', 0, 2636, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500BQ63', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP252RY6L', 'H5A-P010K',
    'PUMACHAY RUIZ RAUL FRANCISCO', NULL, 4, 261, 'r',
    'NUEVO 2024', 0, 3311, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050E041', '0', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', '@ FASE INTERNET PROTECTION', 'EL6324800784', 'AUR-1000',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 10, 252, 'b',
    '', 1, 3407, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554292', '300991', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'm',
    'CAL2023-05393,CAL2022-00551, CAL2021-07656, CAL 2020-005780, CAL 2019-005972, CAL 2018-005891', 0, 3852, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746461240508', '436600', 'MODULO DE MELAMINA PARA COMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'b',
    'CAL2023-09776,CAL2022-09782,CAL2021-00706,CAL2020-02903', 0, 3290, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500C351', '379752', 'TECLADO - KEYBOARD', 'ADVANCE', 'G5805379832', '5137-AU',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03447,CAL2022-06837,CAL2021-03781,CAL2020-07559', 0, 2877, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746461240468', '433001', 'MODULO DE MELAMINA PARA COMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'm',
    'CAL2023-01001,CAL2022-07890,CAL2021-02514,CAL2020-01944', 0, 4258, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119N976', '414871', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'b',
    'CAL2023-02441,CAL2022-02410,CAL2021-05599,CAL2020-03327,CAL2019-09652', 0, 3236, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500BV01', '0', 'TECLADO - KEYBOARD CON PUERTO USB', 'LOGITECH', '2341MR10EF68', 'K120',
    'HUAMANI MUÑOZ JAVIER WILFREDO', NULL, 4, 240, 'b',
    '', 0, 3701, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050E062', '0', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', '@ FASE INTERNET PROTECTION', 'EL6324802071', 'AUR-1000',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 10, 252, 'b',
    '', 0, 3200, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377007', '452286', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-00587,CAL2022-05557,CAL2021-04020,CAL2020-08180', 0, 3167, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003337', '451315', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13530,CAL2022-04017,CAL2021-04976,CAL2020-004773', 0, 2891, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377907', '469818', 'MONITOR LED', 'HEWLETT PACKARD', '6CM852206Y', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-00590,CAL2022-02605,CAL2021-04831,CAL2020-04652', 0, 3055, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120944', '463648', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12352,CAL2022-10406,CAL2021-00934,_x000D_
CAL2020-04538,CAL2019-10377', 1, 4332, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119F524', '273473', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'r',
    'CAL2023-011747,CAL2022-09462,CAL2021-11098, _x000D_
CAL2020-10454', 0, 3457, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003244', '451222', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13527,CAL2022-05225,CAL2021-09762,CAL2020-001460,CAL2019-03370', 0, 2897, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880373349', '408657', 'MONITOR LED', 'LENOVO', 'SV5643053', 'LT2013S',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-02635,CAL2022-02948,CAL2021-07289,CAL2020-06270', 0, 2702, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950Q705', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE250B72B', 'PRO 400 G9 SFF',
    'PEREZ SALAZAR MARITA', NULL, 4, 241, 'b',
    'CAL2023-03164', 0, 3781, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003973', '457848', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216T',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13653,CAL2022-O2829,CAL2021-03481,CAL2020-0', 0, 2963, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376990', '452269', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02865,CAL2022-04573,CAL2021-05075,CAL2020-01372,CAL2019-03326', 0, 3149, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375373', '433837', 'MONITOR LED', 'DELL', 'CN0Y01GT742616821F9U', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-07702,CAL2022-04292,_x000D_
CAL2021-06505,CAL2020-00427,CAL2019-01921', 0, 3034, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U143', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP2273GZ0', 'TPA - P001K',
    'HUAMANI MUÑOZ JAVIER WILFREDO', NULL, 4, 240, 'b',
    'CAL2023-03210', 0, 3739, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U139', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP2273GYW', 'TPA - P001K',
    'PANDURO OSORIO JORGE LUIS', NULL, 4, 239, 'b',
    'CAL2023-03070', 0, 3381, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740805004531', '0', 'COMPUTADORA PERSONAL PORTATIL', 'LENOVO', '', '21CS-S0HX00',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03106,CAL2022-05188', 0, 3367, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881878149', '366365', 'MONITOR PLANO', 'LENOVO', 'SV8LM216', 'THINKVISIONLT1952PWD',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12184,CAL2022-06453, CAL2021-02247, CAL 2020-001100', 0, 2754, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K544', '467725', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0B5YB93GD', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03369,CAL2022-07652,CAL2021-00845,CAL2020-02665', 0, 2945, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554374', '301073', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'NAVARRO PAJUELO MONICA MAXIMINA', NULL, 4, 252, 'r',
    'CAL2023-06320,CAL2022-01733, CAL2021-09266, _x000D_
CAL 2020-009776, CAL 2019-008537,', 0, 3536, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037A772', '501299', 'MONITOR LED', 'DELL', 'CN0KK3PRBO30009A1KII', 'E2220H',
    'DEL PINO GUTARRA JHON ANTONY', NULL, 4, 299, 'b',
    'CAL2023-04263,CAL2022-02481,CAL2021-05312', 0, 3827, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970105', '97627', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10933,CAL2022-08309,CAL2021-02539,CAL2020-02588', 0, 4633, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437453293', '431499', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'm',
    'CAL2023-03151,CAL2022-05123, CAL2021-02863,CAL2020-06319', 0, 3791, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K595', '467819', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0BVBC00HP', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03984,CAL2022-04075,CAL2021-06205, CAL 2020-03705', 0, 2920, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746452031526', '337014', 'MESA DE REUNIONES', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RUIZ HURTADO ORLANDO AUGUSTO', NULL, 4, 261, 'r',
    'CAL2023-09841,CAL2022-09729,CAL2021-00340,CAL2020-02936', 0, 3245, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746405923297', '319070', 'ARMARIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'r',
    'CAL2023-03152,CAL2022-05129,CAL2021-02854,CAL2020-06312', 0, 3790, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '952281171657', '474574', 'SWITCH PARA RED', 'TP-LINK', '2191291002752', 'TL-SG1024',
    'YUPANQUI URETA JOHN JAMES', NULL, 4, 257, 'b',
    'CAL2023-06380,CAL2022-06763,CAL2021-04459,CAL2020-09197,CAL2019-09779', 0, 3564, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746475090104', '508012', 'PIZARRA MURAL - FRANELÓGRAFO DE ALUMINIO 1.00 m X 1.20 m', 'EDGAR', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 7, 192, 'b',
    'CAL2023-04482,CAL2022-11158,CAL2021-07695,LIM2020-55698', 0, 3772, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437455584', '464290', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', '', '',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'r',
    'CAL2023-011751,CAL2021-00058,CAL2020-06194', 0, 3444, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970205', '97727', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-11015,CAL2022-08423,CAL2021-02551,CAL2020-01988', 0, 4287, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376200', '445000', 'MONITOR LED', 'DELL', 'SIN SERIE', 'E2016H',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'b',
    'CAL2023-04445,CAL2022-00485,CAL2021-07646,CAL 2020-05750,CAL 2019-05965,CAL 2018-05787', 0, 3835, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376848', '452127', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12126,CAL2022-01654,CAL2021-07941,CAL2020-05229', 0, 2742, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376859', '452138', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-11334,CAL2022-08157,_x000D_
CAL2021-00514,CAL2020-03914', 0, 3057, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K574', '467757', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0B5YB93G4', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03457,CAL2022-04783,CAL2021-04677,CAL2020-002189,CAL2019-005547', 0, 2862, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500C589', '381676', 'TECLADO - KEYBOARD', 'LENOVO', '04700797', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-06018,CAL2022-00847,CAL2021-09151,CAL2020-008568,CAL2019-09031', 0, 2354, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740800501011', '0', 'CAPTURADOR DE IMAGEN - SCANNER', 'AVISION', '107336838760086', 'AD8150',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'NUEVO', 0, 3509, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050E058', '0', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', '@ FASE INTERNET PROTECTION', 'EL6324802013', 'AUR-1000',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 10, 252, 'b',
    '', 1, 3411, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '676454340027', '313860', 'RACK (OTROS)', 'SIN MARCA', 'S/M', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10003,CAL2022-08493,CAL2021-02661,CAL2020-08318', 0, 4263, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742223583940', '509933', 'EQUIPO MULTIFUNCIONAL COPIADORA IMPRESORA SCANNER A3 MONOCROMATICA', 'HEWLETT PACKARD', 'CNC1MCX03J', 'LASERJET E82560Z',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'r',
    'CAL2023-01903,CAL2022-09415,CAL2021-00189,CAL2020-58975', 0, 3514, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003312', '451290', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2022-07212,CAL2021-03271,CAL2020-05579', 0, 2613, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120950', '463654', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12356,CAL2022-10388,CAL2021-00944,_x000D_
CAL2020-04549,CAL2019-10400', 0, 4334, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500P781', '517239', 'TECLADO - KEYBOARD', 'HP', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03374,CAL2022-09129,CAL2021-02350', 0, 2916, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119A385', '260054', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ZAPATA BENAVENTE ENRIQUE ARTURO', NULL, 4, 261, 'r',
    'CAL2023-09856,CAL2022-09753,CAL2021-00203,CAL2020-00060', 0, 3324, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003292', '451270', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13526,CAL2022-04544,CAL2021-10730,CAL2020-001370,CAL2019-003328', 0, 2895, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746406600999', '101450', 'ARMARIO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'r',
    'CAL2023-12488,CAL2022-08267,CAL2021-00440, _x000D_
CAL2020-02346', 0, 4434, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003149', '451127', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'CORONADO ARAUJO JULIO JOSE', NULL, 4, 192, 'b',
    'CAL2023-13543,CAL2022-02202,CAL2021-07444,CAL2020-06465', 0, 2810, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003303', '451281', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13495,CAL2022-05241,CAL2021-06728,CAL2020-01411,CAL2019-03407', 0, 2619, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746473050046', '22521', 'PIZARRA ACRILICA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'S-CAL2025-00141,CAL2023-05398,CAL2022-00792,CAL2021-08128,CAL2020-08000', 0, 3322, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746403212344', '236865', 'ARCHIVADOR DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'PAZ MORENO PABLO MIGUEL', NULL, 5, 293, 'r',
    'CAL2023-11532,CAL2022-05596,CAL2021-04129,_x000D_
CAL2020-06128', 0, 4138, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746406600996', '101458', 'ARMARIO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CARDENAS TRUJILLO BLANCA HILDA', NULL, 4, 257, 'r',
    'S-CAL2025-00228, CAL2023-05284,CAL2022-01674, CAL2021-08971, _x000D_
CAL 2020-009564, CAL 2019-008925', 0, 3699, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375392', '433856', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168T2NVU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12111,CAL2022-03319,CAL2021-05143,CAL2020-02141,CAL2019-00185', 0, 2996, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376384', '451663', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03167,CAL2022-05138,CAL202102831,CAL2020-04031', 0, 2704, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970166', '97688', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10957,CAL2022-08437,CAL2021-02646,CAL2020-01985', 0, 4608, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950N301', '504059', 'UNIDAD CENTRAL DE PROCESO - CPU', 'DELL', '5D5V673', 'OPTIPLEX 7080 SFF',
    'SERNAQUE CHIROQUE CARLOS ALBERTO', NULL, 4, 300, 'b',
    'CAL2023-13246,CAL2022-06152,CAL2021-06378', 0, 3424, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970163', '97685', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'NAVARRO PAJUELO MONICA MAXIMINA', NULL, 4, 252, 'r',
    'CAL2023-06321,CAL2022-01701, CAL2021-09265,_x000D_
CAL2020-09777,CAL 2019-008539', 0, 3531, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950W617', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE325BC19', 'PRO SFF 400 G9',
    'CARDENAS TRUJILLO BLANCA HILDA', NULL, 4, 257, 'b',
    '', 0, 3690, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437126987', '278785', 'ESCRITORIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'PAZ MORENO PABLO MIGUEL', NULL, 5, 293, 'm',
    'CAL2023-11518,CAL2022-05594,CAL2021-04132,_x000D_
CAL2020-06130', 0, 4142, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437458219', '518769', 'ESCRITORIO DE MELAMINA 60 cm X 78 cm X 1.20 m CON 4 GAVETAS', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUAMANI MUÑOZ JAVIER WILFREDO', NULL, 4, 240, 'b',
    'CAL2023-03127,CAL2022-09447,LIM2021-40469', 0, 3702, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037G602', '0', 'MONITOR LED 27 in', 'HP', 'CNC4370THP', 'HP P27 G5',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3186, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003382', '451360', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-06903,CAL2022-05248,CAL2021-06738, _x000D_
CAL2020-01384,CAL2019-03436', 0, 2357, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970100', '97622', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10954,CAL2022-08315,CAL2021-02599,CAL2020-02018', 0, 4617, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O465', '434885', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'r',
    'CAL2023-07518,CAL2022-05467,CAL2021-06506,CAL2020-00440,CAL2019-1940,CAL2018-0573', 0, 3513, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003287', '451265', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-07027,CAL2022-02542,CAL2021-04818,_x000D_
CAL2020-02762', 0, 2348, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377207', '454018', 'MONITOR LED', 'LENOVO', 'VKK57896', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-06022,CAL2022-00419,CAL2021-09202,CAL2020-010256,CAL2019-07636', 0, 2711, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950X618', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE436BPN3', 'HP PRO SFF 400 G9',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3206, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375557', '434021', 'MONITOR LED', 'DELL', 'SIN SERIE', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03076,CAL2022-06254,CAL2021-03570,CAL2020-04137', 0, 3038, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742223585033', '0', 'EQUIPO MULTIFUNCIONAL COPIADORA IMPRESORA SCANNER Y/O FAX', 'KYOCERA', 'H6J4901801', 'TASKALFA 6004i',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'NUEVO 2025', 0, 3219, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375940', '443956', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-005736,CAL2022-01437,CAL2021-07160,CAL2020-10322', 0, 2768, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O374', '434794', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'CAL2023-07503,CAL2022-05470,CAL2021-05052,CAL2020-11758.CAL2019-01718,CAL2018-01908', 0, 3522, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882225250670', '102329', 'EXTINTOR', 'FADEX', 'SIN SERIE', 'FI-2',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'r',
    'S-CAL2025-00206, CAL2023-09699,CAL2022-10748,CAL2021-10180,CAL2020-03814', 0, 3764, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742223584701', '0', 'EQUIPO MULTIFUNCIONAL COPIADORA IMPRESORA SCANNER', 'KYOCERA', 'H6J3Y01314', 'TASKALFA 6004I',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    '', 0, 3332, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950Q601', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE250B63F', 'PRO 400 G9 SFF',
    'MENDOZA GALINDO KATTIA ESTRELLA', NULL, 4, 240, 'b',
    'CAL2023-03112', 0, 3720, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376993', '452272', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12222,CAL2022-04982,CAL2021-04303,CAL2020-03443,CAL2019-01486', 0, 3124, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376947', '452226', 'MONITOR LED', 'LENOVO', 'VKL02892', 'THINKVISION E2054',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'b',
    'CAL2023-02615,CAL2022-02578, CAL2021-04921, CAL 2020-04621', 0, 3479, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003583', '451561', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-0864,CAL2022-06127,CAL2021-03854,CAL2020-04224', 0, 2641, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746450560282', '513782', 'MESA DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'b',
    'CAL2023-10006,CAL2022-08490,LIM2021-38042', 0, 4269, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437456525', '507980', 'ESCRITORIO DE MELAMINA 60 cm X 78 cm X 1.20 m CON PORTA TECLADO Y PORTA CPU', 'EDGAR', '', '',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'b',
    'CAL2023-04439,CAL2022-00418,CAL2021-07651,LIM2020-55707', 0, 3830, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877004095', '0', 'MONITOR A COLOR DE 24 in', 'HP', 'CN42411Q5W', 'E24 G4 FHD',
    'RODRIGUEZ ZAMORA LIDIA MERCEDES', NULL, 4, 241, 'b',
    'CAL2023-03196', 0, 3590, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746460855445', '277104', 'MODULO DE MADERA PARA MICROCOMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'm',
    'CAL2023-03176,CAL2022-05118,CAL2021-02820,CAL2020-04004,CAL 2019-01294', 0, 3613, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648390B944', '471253', 'SILLA GIRATORIA DE METAL', 'SIN MARCA', 'S/S', 'S/M',
    'RAMIREZ ROJAS REINA ROZARIA', NULL, 4, 265, 'b',
    'CAL2023-07500,CAL2022-05469,CAL2021-06409,CAL2020-00939', 0, 3496, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U467', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP249NTHY', 'HSA - P010K',
    'GALLARDO OBREGON GRECIA DEL ROSARIO', NULL, 4, 239, 'b',
    'CAL2023-03040', 0, 3340, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050D476', '0', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', 'LEGRAND', 'W09TH01189', '',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'NUEVO 2025', 0, 3552, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '952281171457', '440473', 'SWITCH PARA RED', 'DELL', 'SIN SERIE', 'X1026',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'b',
    'S-CAL2025-00219, CAL2023-09162, CAL2022-04409, CAL2021-05865,CAL2020-11168, CAL 2019-010287', 0, 3484, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '112279705579', '510569', 'VENTILADOR ELECTRICO PARA MESA O DE PIE', 'RECCO', '', 'RD-40G-3',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03101,CAL2022-05194,CAL2021-00237_x000D_', 0, 3359, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554324', '301023', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'NOLAZCO CEVALLOS IVETH DEL SOCORRO', NULL, 8, 252, 'b',
    'CAL2023-01413,CAL2022-10557, CAL2021-00695, CAL 2020-003821, CAL 2019-007869, CAL 2018-005801', 0, 3851, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437453848', '442823', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'm',
    'CAL2023-04452,CAL2022-00556,CAL2021-07669,CAL 2020-05760,CAL 2019-05962,CAL 2018-05772', 0, 3837, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648390B957', '471277', 'SILLA GIRATORIA DE METAL', 'SIN MARCA', 'S/S', 'S/M',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'CAL2023-07514,CAL2022-10789,CAL2021-00066,CAL2020-01048,CAL2019-10920', 0, 3499, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648390F423', '512035', 'SILLA GIRATORIA DE METAL CON BRAZOS', 'SIN MARCA', '', '',
    'RECUENCO COICO FLOR DE MARIA', NULL, 4, 300, 'b',
    'CAL2023-13263,CAL2022-06174,CAL2021-06382', 0, 3438, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746406261494', '436421', 'ARMARIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'PANDURO OSORIO JORGE LUIS', NULL, 4, 239, 'm',
    'CAL2023-03026,CAL2022-06218,CAL2021-03530,CAL2020-04102', 0, 3355, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003439', '451417', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13503,CAL2022-05257,CAL2021-06721,CAL2020-001403,CAL2019-003469', 0, 2628, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377408', '457907', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12280,CAL2022-08519,CAL2021-03131,CAL2020-007123', 0, 2689, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119C107', '263668', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'r',
    'CAL2023-06451,CAL2022-01204,CAL2021-08766,_x000D_
CAL2020-10954', 0, 3455, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437457900', '518450', 'ESCRITORIO DE MELAMINA 60 cm X 78 cm X 1.20 m CON 4 GAVETAS', 'SIN MARCA', '', '',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13270,CAL2022-06168,CAL2021-06376', 0, 3566, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895001032', '158600', 'TECLADO - KEYBOARD', 'ADVANCE', 'KB0001476', 'I200-1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-04920,CAL2022-00791,CAL2021-09063,CAL2020-07886', 0, 2879, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554372', '301071', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'PALOMINO CRUZ JEAN', NULL, 4, 261, 'r',
    'CAL2023-09861,CAL2022-09717,CAL2021-00773,CAL2020-002925', 0, 3239, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881874173', '334487', 'MONITOR PLANO', 'DELL', 'CN046NYG641801810ANB', 'E2211HC',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13758,CAL2022-06054,CAL2021-01686,CAL2020-03563', 0, 2983, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120957', '463661', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12366,CAL2022-10367,CAL2021-00914,_x000D_
CAL2020-04532,CAL2019-10384', 0, 4321, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377895', '469725', 'MONITOR LED', 'HEWLETT PACKARD', '6CM85220RP', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03495,CAL2022-04238,CAL2021-06585,CAL2020-00409,CAL2019-03592', 0, 3177, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376833', '452112', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12502,CAL2022-10312,CAL2021-00562,_x000D_
CAL2020-03903,CAL2019-10447', 0, 4435, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970156', '97678', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-11020,CAL2022-07897,CAL2021-02532,CAL2020-01948', 0, 4281, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740805006362', '0', 'COMPUTADORA PERSONAL PORTATIL', 'HP', '5CD248CLR5', 'ProBook 450 G9',
    'PANDURO OSORIO JORGE LUIS', NULL, 4, 239, 'b',
    'CAL2023-03072', 0, 3380, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950W675', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE319CYMX', 'PRO SFF 400 G9',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'NUEVO 2024', 0, 3287, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746461240496', '436588', 'MODULO DE MELAMINA PARA COMPUTADORA', 'MABE', 'SIN SERIE', 'SIN MODELO',
    'ANDIA BARRUETO STEFANI MILUSKA', NULL, 4, 240, 'm',
    'CAL2023-03131,CAL2022-05159,CAL2021-03510,CAL2020-04074', 0, 3731, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037A771', '501298', 'MONITOR LED', 'DELL', 'CN0KK3PRBO30009A15XI', 'E2220H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-09402,CAL2022-02092,CAL2021-06632', 0, 3006, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003333', '451311', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-10754,CAL2022-02736,CAL2021-06827,CAL2020-05043', 0, 2356, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970209', '97732', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10955,CAL2022-08430,CAL2021-02518,CAL2020-01945', 0, 4607, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '952255290412', '0', 'MICROFONO INALAMBRICO DE MANO', 'EW 100 G4-835-S-B', '5183050079', 'EW G4',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-11511_x000D_', 0, 4279, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377812', '469435', 'MONITOR LED', 'HEWLETT PACKARD', '6CM852206H', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03855,CAL2022-04185,_x000D_
CAL2021-06233,CAL2020-06659', 0, 3051, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003199', '451177', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03405,CAL2022-01987,CAL2021-05376,CAL2020-03646', 0, 2843, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U640', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP249NTH6', 'HSA - P010K',
    'SULCA MOGOLLON JUANA DEYANIRA', NULL, 4, 239, 'b',
    'CAL2023-03051', 0, 3352, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877004262', '0', 'MONITOR A COLOR DE 24 in', 'HP', 'CN42450Z9V', 'E24 G4 FHD',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-11598', 0, 3373, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895005570', '250298', 'TECLADO - KEYBOARD', 'LENOVO', '0700211', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13523,CAL2022-03020,CAL2021-05660,CAL2020-00583,CAL2019-00546', 0, 2898, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746406601000', '101459', 'ARMARIO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'r',
    'CAL2023-06438,CAL2022-01579,CAL2021-08684,_x000D_
CAL2020-11005', 0, 3476, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437120482', '1205', 'ESCRITORIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'm',
    'CAL2023-03206,CAL2022-05139,CAL2021-02832,CAL2020-04034', 0, 3610, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003434', '451412', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-08400,CAL2022-07273, CAL2021-01734,CAL2020-005596, CAL 2019-002258', 0, 2339, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003277', '451255', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03473,CAL2022-05265,CAL2021-04684,CAL2020-02300,CAL2019-05025', 0, 2873, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O333', '434753', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'PUMACHAY RUIZ RAUL FRANCISCO', NULL, 4, 261, 'r',
    'CAL2023-09830,CAL2022-09736,CAL2021-00350,CAL2020-02929', 0, 3303, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003307', '451285', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03089,CAL2022-05187,CAL2021-03589,CAL2020-04117', 0, 2648, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880370689', '379446', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12271,CAL2022-07763,CAL2021-00251,CAL2020-01149', 0, 3116, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K561', '467741', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0B5YB93G8', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03463,CAL2022-05274,CAL2021-04700,CAL2020-02257,CAL2019-04990', 0, 2931, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740805001563', '434084', 'COMPUTADORA PERSONAL PORTATIL', 'LENOVO', 'SIN SERIE', 'THINKPAD L460',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'b',
    'CAL2023-03158,CAL2022-05130,CAL2021-02856,CAL2020-06322', 0, 3796, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950X494', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE436BPN4', 'HP PRO SFF 400 G9',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3212, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877002317', '0', 'MONITOR A COLOR 27 in', 'HP', 'CNK2320CNC', 'E27 G4 FHD',
    'HUAMANI MUÑOZ JAVIER WILFREDO', NULL, 4, 240, 'b',
    'CAL2023-03220', 0, 3399, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120996', '484389', 'DETECTOR DE HUMO', 'MIRCOM', '', '',
    'PAZ MORENO PABLO MIGUEL', NULL, 5, 293, 'b',
    'S-CAL2025-00318,', 0, 4141, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J562', '433596', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-05093,CAL2022-00683,CAL2021-07052,CAL2020-07820,CAL2019-08116,CAL2018-05813', 0, 2400, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377844', '469489', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011GTY', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02580,CAL2022-01988,CAL2021-05372,CAL2020-03643', 0, 3169, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873507', '249327', 'MONITOR PLANO', 'LENOVO', 'V3K0552', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13757,CAL2022-06048,CAL2021-01679,CAL2020-03557', 0, 3135, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746406600997', '101453', 'ARMARIO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'r',
    'CAL2023-12487,CAL2022-08268,CAL2021-00439,_x000D_
CAL2020-02347', 0, 4433, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003352', '451330', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13510,CAL2022-00246,CAL2021-10912,CAL2020-07664', 0, 2913, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376888', '452167', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02617,CAL2022-04016,CAL2021-04974,CAL 2020-04771', 0, 2709, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746428980607', '505944', 'CASILLERO DE METAL - LOCKER', 'SIN MARCA', '', '',
    'SERTZEN BELLIDO WAGNER', NULL, 5, 254, 'b',
    'CAL2023-12535,CAL2022-09442,CAL2021-00055,_x000D_
CAL2020-6O514', 0, 4456, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376902', '452181', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'VILLANUEVA BRUNO WILLIAMS', NULL, 4, 261, 'b',
    'CAL2023-08688,CAL2022-04429,CAL2021-02754,CAL2020-10488,CAL2019-04239,CAL2018-03337', 0, 3241, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877002573', '0', 'MONITOR A COLOR 27 in', 'HP', 'CNK23816GM', 'E27 G4 FHD',
    'PEREZ SALAZAR MARITA', NULL, 4, 241, 'b',
    'CAL2023-03162', 0, 3779, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003319', '451297', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-060706,CAL2022-00854,CAL2021-09213,CAL2020-010267,CAL2019-07604', 0, 2353, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895006224', '251691', 'TECLADO - KEYBOARD', 'LENOVO', '697719', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03468,CAL2022-06825,CAL2021-03796,CAL2020-07526', 0, 2864, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970063', '97585', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-11021,CAL2022-08302,CAL2021-02545,CAL2020-01964', 0, 4289, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742223582866', '496035', 'EQUIPO MULTIFUNCIONAL COPIADORA IMPRESORA SCANNER Y/O FAX', 'HEWLETT PACKARD', 'CNC1M1T040', 'LASERJET E82560DN',
    'RIEGA COLACCI JAIME RONALD', NULL, 4, 300, 'b',
    'CAL2023-13258,CAL2022-06169,CAL2021-06381', 0, 3414, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500O955', '505240', 'TECLADO - KEYBOARD', 'DELL', 'CN0F2JV2LO30004709M0', 'KB-216D',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04231,CAL2022-02509,CAL2021-05303', 0, 2833, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895001845', '440607', 'TECLADO - KEYBOARD', 'HALION', 'SIN SERIE', '682',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03365,CAL2022-05531,CAL2021-03994,CAL2020-08227', 0, 2882, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '112279704871', '434120', 'VENTILADOR ELECTRICO PARA MESA O DE PIE', 'WURDEN', 'SIN SERIE', 'GMS-18-3B2',
    'CARDENAS TRUJILLO BLANCA HILDA', NULL, 4, 257, 'r',
    'S-CAL2025-00235, CAL2023-05294,CAL2022-01371,CAL2021-08982, _x000D_
CAL2020-009567,CAL 2019-008935', 0, 3695, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950I054', '450457', 'UNIDAD CENTRAL DE PROCESO - CPU', 'LENOVO', 'SIN SERIE', 'THINKCENTRE M910S',
    'CARDENAS TRUJILLO BLANCA HILDA', NULL, 4, 257, 'r',
    'S-CAL2025-00234, CAL2023-05292,CAL2022-01685, CAL2021-08963, _x000D_
CAL 2020-009556, CAL 2019-008918', 0, 3757, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376891', '452170', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12213,CAL2022-04736,CAL2021-04727,CAL2020-02250,CAL2019-03074', 0, 3154, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746473051283', '435128', 'PIZARRA ACRILICA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RIEGA COLACCI JAIME RONALD', NULL, 4, 300, 'r',
    'CAL2023-05077,CAL2022-00628,CAL2021-07061,CAL2020-07829,CAL 2019-08782,', 0, 3422, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J510', '433544', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'VILLAR AMASIFEN GERALDO JACOMO', NULL, 4, 239, 'b',
    'CAL2023-03044,CAL2022-06264,CAL2021-03572,CAL2020-04139', 0, 3362, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376815', '452094', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12174,CAL2022-04681,CAL2021-04767,CAL2020-02194,CAL2019-05001,', 0, 2700, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481876899', '455598', 'SILLA FIJA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'CAL2023-07519,CAL2022-05456,CAL2021-06388,CAL2020-10912,CAL2019-10683', 0, 3519, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500C263', '378676', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03600,CAL2022-02681,CAL2021-06782,CAL2020-05013', 0, 2914, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003383', '451361', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13531,CAL2022-04643,CAL2021-09752,CAL2020-001446,CAL2019-003387', 0, 2892, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376908', '452187', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12046,CAL2022-03008,CAL2021-06617,CAL2020-00555,CAL2019-00525,CAL2018-08972', 0, 2681, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746459830438', '520314', 'MÓDULO DE CÓMPUTO DE MELAMINA 50 cm X 70 cm X 78 cm', 'SIN MARCA', 'SIN SERIE', 'S/M',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'CAL2023-09714,CAL2022-09414', 0, 3520, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003276', '451254', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13488,CAL2022-06361,CAL2021-01265,CAL2020-06977,CAL2019-03521,CAL2018-08816', 0, 2909, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500P243', '505526', 'TECLADO - KEYBOARD', 'DELL', 'CN01GN56M6D0004I03CJA01', 'KB-219B',
    'RIEGA COLACCI JAIME RONALD', NULL, 4, 300, 'b',
    'CAL2023-13254,CAL2022-06157,CAL2021-06367,CAL2020-47767', 0, 3417, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742223583759', '506958', 'EQUIPO MULTIFUNCIONAL COPIADORA IMPRESORA SCANNER A3 MONOCROMATICA', 'KYOCERA', 'RMU0100723', 'TASKALFA 6003I',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'm',
    'CAL2023-03205,CAL2022-09484,CAL2021-00031,CAL2020-55941', 0, 3608, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375344', '433808', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168239JU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12096,CAL2022-03598,CAL2021-03194,CAL2020-00834,CAL2019-00071', 0, 3037, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376983', '452262', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12155,CAL2022-05227,CAL2021-09760,CAL2020-01462,CAL2019-03368', 0, 2684, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O359', '434779', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CORREA MARREROS LAURA RAQUEL', NULL, 4, 241, 'm',
    'CAL2023-03225,CAL2022-06246, CAL2021-03578,CAL2020-04087', 0, 3604, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U144', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP2273GZ2', 'TPA - P001K',
    'RODRIGUEZ ZAMORA LIDIA MERCEDES', NULL, 4, 241, 'b',
    'CAL2023-03194', 0, 3595, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746406601095', '137477', 'ARMARIO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CARDENAS TRUJILLO BLANCA HILDA', NULL, 4, 257, 'r',
    'S-CAL2025-00229,CAL2023-05285,CAL2022-01370,CAL2021-08983,CAL2020-09569,CAL2019-08933', 0, 3698, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J519', '433553', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'MAIZ SIENFUEGOS MARCIA DANIELA', NULL, 4, 264, 'r',
    'CAL2023-11744,CAL2022-08554,CAL2021-01095, _x000D_
CAL2020-001068', 0, 3471, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003971', '457846', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216T',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13650,CAL2022-03044,CAL2021-06537,CAL2020-07135,CAL2019-03723', 0, 2398, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746461240491', '436583', 'MODULO DE MELAMINA PARA COMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'GALLARDO OBREGON GRECIA DEL ROSARIO', NULL, 4, 239, 'm',
    'CAL2023-03039,CAL2022-06202,CAL2021-03521,CAL2020-04146', 0, 3341, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376882', '452161', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12159,CAL2022-03337,CAL2021-03157,CAL2020-02150,CAL2019-00167', 0, 3141, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500BQ04', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP252RWBJ', 'H5A-P010K',
    'RAMIREZ ROJAS REINA ROZARIA', NULL, 4, 265, 'b',
    '', 0, 3494, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873156', '248949', 'MONITOR PLANO', 'LENOVO', 'V3K2357', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12242,CAL2022-07118,CAL2021-03072,CAL2020-01505', 0, 2762, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377861', '469506', 'MONITOR LED', 'HEWLETT PACKARD', '6CM85220RF', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13619,CAL2022-03989,CAL2021-07871,CAL2020-05361', 0, 2726, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375423', '433887', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168212JU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02832,CAL2022-05745,CAL2021-10342,CAL2020-05446,CAL2019-02435', 0, 3145, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003246', '451224', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02918,CAL2022-05644,CAL2021-04415,CAL2020-07056,CAL2019-02405', 0, 2646, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003424', '451402', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03444,CAL2022-04684,CAL2021-04769,CAL2020-02229,CAL2019-05003', 0, 2868, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500A536', '358028', 'TECLADO - KEYBOARD', 'LENOVO', '1S41A53123219002E', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13517,CAL2022-00231,CAL2021-07756,CAL2020-07613', 0, 2351, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375320', '433784', 'MONITOR LED', 'DELL', 'CN0Y01GT742616822MYU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12165,CAL2022-01998,CAL2021-05355,CAL2020-03702', 0, 3017, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742223583939', '509932', 'EQUIPO MULTIFUNCIONAL COPIADORA IMPRESORA SCANNER A3 MONOCROMATICA', 'HEWLETT PACKARD', 'CNC1MCX049', 'LASERJET E82560Z',
    'PAZ MORENO PABLO MIGUEL', NULL, 5, 293, 'b',
    'CAL2023-1416,CAL2022-06665, CAL2021-00188,CAL2020-58974', 0, 4129, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376917', '452196', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04985,CAL2022-00804,CAL2021-08116,CAL2020-08010', 0, 2672, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746459830429', '520305', 'MÓDULO DE CÓMPUTO DE MELAMINA 50 cm X 70 cm X 78 cm', 'SIN MARCA', '', 'S/M',
    'RAMIREZ ROJAS REINA ROZARIA', NULL, 4, 265, 'b',
    'CAL2023-07508,CAL2022-10794,CAL2021-00009_x000D_', 0, 3497, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740824500848', '0', 'DUPLICADOR DE PUERTOS', 'HP', '5CG250Z7WQ', 'HSN - IX02',
    'ANDIA BARRUETO STEFANI MILUSKA', NULL, 4, 240, 'b',
    'CAL2023-03136', 0, 3736, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500BQ25', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP252RWCM', 'H5A-P010K',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'b',
    'NUEVO 2024', 0, 3446, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437457898', '518448', 'ESCRITORIO DE MELAMINA 60 cm X 78 cm X 1.20 m CON 4 GAVETAS', 'SIN MARCA', '', '',
    'RECUENCO COICO FLOR DE MARIA', NULL, 4, 300, 'b',
    'CAL2023-13262,CAL2022-06173,CAL2021-06371', 0, 3437, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376935', '452214', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03291,CAL2022-05115,CAL2021-02819,CAL2020-03200,CAL2019-01290,CAL2018-03748', 0, 2774, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742223585034', '0', 'EQUIPO MULTIFUNCIONAL COPIADORA IMPRESORA SCANNER Y/O FAX', 'KYOCERA', 'H6J4901732', 'TASKALFA 6004i',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'NUEVO 2025', 0, 3223, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O503', '434923', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'GALLARDO OBREGON GRECIA DEL ROSARIO', NULL, 4, 239, 'm',
    'CAL2023-03042,CAL2022-06267,CAL2021-03534,CAL2020-04157', 0, 3347, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037G505', '0', 'MONITOR LED 27 in', 'HP', 'CNC4370TR0', 'HP P27 G5',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3195, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74087700B588', '0', 'MONITOR A COLOR', 'HP', 'CN443110B4', 'PRO 524PF FHD',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3387, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003605', '451583', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03453,CAL2022-04763,CAL2021-04791,CAL2019-05031', 0, 2867, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950W665', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE325BCZS', 'PRO SFF 400 G9',
    'RAMIREZ ROJAS REINA ROZARIA', NULL, 4, 265, 'b',
    '14/08/2024, ACT. PECOSA Y FECHA ALTA - SOL. POR: YCHUMPITAZ', 0, 3492, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970174', '97696', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10962,CAL2022-08458,CAL2021-02629,CAL2020-02592', 0, 4605, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500O864', '505151', 'TECLADO - KEYBOARD', 'DELL', 'CN01GN56M6D0004I0049A01', 'KB-216D',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04309,CAL2022-02494,CAL2021-05276', 0, 2835, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950N475', '507313', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HEWLETT PACKARD', 'SIN SERIE', 'PRODESK 400 G7 SFF',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'CAL2023-10480,CAL2022-06995,CAL2021-02499', 0, 3544, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K630', '467797', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0BVBC01VL', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02581,CAL2022-02013,CAL2021-05370,CAL2020-03644', 0, 2921, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482550236', '186789', 'SILLA FIJA DE OTRO MATERIAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'S-CAL2025-00199, UBICADO 2023 ,CAL2022-08840', 0, 3573, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554314', '301013', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'm',
    'CAL2023-05394,CAL2022-00483, CAL2021-07657, CAL 2020-005771 , CAL 2019-008995, CAL 2018-005804', 0, 3854, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375403', '433867', 'MONITOR LED', 'DELL', 'CN0Y01GT74261682396U', 'E2016H',
    'VARGAS GIL EDILBERTA YOLANDA', NULL, 4, 264, 'r',
    'CAL2023-011748,CAL2022-6870,CAL2021-03747,_x000D_
CAL2020-04895', 0, 3465, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120955', '463659', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12334,CAL2022-10407,CAL2021-00954,_x000D_
CAL2020-04521,CAL2019-02165', 0, 4339, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003297', '451275', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03571,CAL2022-07537,CAL2021-00871,CAL2020-02697', 0, 2866, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500CB90', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', 'BKTAR0CCPJN9GB', 'TPA-P001K',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3211, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554377', '301076', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'm',
    'CAL2023-05395,CAL2022-00562,CAL2021-07623,CAL2020-006828,CAL2019-005948', 0, 3855, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003270', '451248', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03398,CAL2022-03883,CAL2021-07921,CAL2020-05210', 0, 2844, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970200', '97722', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10989,CAL2022-08465,CAL2021-02602,CAL2020-02024', 0, 4621, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950Q614', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE250BSZ9', 'PRO 400 G9 SFF',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03034', 0, 3344, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882225250300', '2152', 'EXTINTOR', 'SIN MARCA', 'MP-117', 'SIN MODELO',
    'GONZALES PEÑA YOVANA YERI', NULL, 4, 252, 'b',
    'S-CAL2025-00215, CAL2023-09705,CAL2022-010751,CAL2021-10143,CAL2019-09782', 0, 3565, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970097', '97619', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-11030,CAL2022-08457,CAL2021-02614,CAL2020-02007', 0, 4603, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377797', '469364', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011HB8', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-01050,CAL2022-07666,CAL2021-00826,CAL2020-01583', 0, 3076, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881877225', '357141', 'MONITOR PLANO', 'LENOVO', 'SV8GZ920', 'THINKVISIONLT1952PWD',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12169,CAL2022-00027,CAL2021-06671,CAL2020-05680,CAL2019-06143,', 0, 2736, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376963', '452242', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02868,CAL2022-07213,CAL2021-03273,CAL2020-05580', 0, 2758, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375332', '433796', 'MONITOR LED', 'DELL', 'CN0Y01GT7426167T319U', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12091,CAL2022-03359,CAL2021-05108,CAL2020-02131,CAL2019-00200', 0, 3001, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377037', '452316', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12137,CAL2022-03936,CAL2021-07802,CAL2020-05305', 0, 3164, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746441182237', '324683', 'ESTANTE DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'b',
    'CAL2023-03283,CAL2022-05079,CAL2021-02851,CAL2019-03178', 0, 3640, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895001855', '440617', 'TECLADO - KEYBOARD', 'HALION', 'SIN SERIE', '682',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03416,CAL2022-3844,CAL2021-03403,CAL2020-00313', 0, 2883, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500H219', '409721', 'TECLADO - KEYBOARD', 'LENOVO', '54Y94240006595', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03408,CAL2022-02404,CAL2021-06425,CAL2020-03326,CAL2019-09396', 0, 2845, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120921', '463625', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12371,CAL2022-10375,CAL2021-00951,_x000D_
CAL2020-04509,CAL2019-09501', 0, 4325, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895004989', '218966', 'TECLADO - KEYBOARD', 'LENOVO', '184961', 'SK-8825',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-13556,CAL2022-07207,CAL2021-03279,CAL2020-05586', 0, 2608, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877004094', '0', 'MONITOR A COLOR DE 24 in', 'HP', 'CN42420G5D', 'E24 G4 FHD',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'b',
    'CAL2023-03146', 0, 3785, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554333', '301032', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'SERTZEN BELLIDO WAGNER', NULL, 5, 254, 'r',
    'CAL2023-12540,CAL2022-10560,CAL2021-00315,_x000D_
CAL2020-06070', 0, 4454, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895005518', '250190', 'TECLADO - KEYBOARD', 'LENOVO', '697581', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-03570,CAL2022-08325,_x000D_
CAL2021-01555,CAL2020-02086', 0, 2344, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740841000270', '143451', 'IMPRESORA LASER', 'HEWLETT PACKARD', 'JPSFH00590', 'LASER JET 4250N',
    'CARDENAS TRUJILLO BLANCA HILDA', NULL, 4, 257, 'r',
    'S-CAL2025-00237, CAL2023-05291,CAL2022-01684, CAL2021-08965, _x000D_
CAL 2020-009557, CAL 2019-008920', 0, 3694, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895005527', '250204', 'TECLADO - KEYBOARD', 'LENOVO', '694994', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13481,CAL2022-03282,CAL2021-00294,CAL2020-01927,CAL2019-03238', 0, 2908, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K549', '467729', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0B5YB93DU', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03363,CAL2022-08511,CAL2021-03140,CAL2020-07141', 0, 2940, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746456780490', '80067', 'MESITA DE METAL PARA MAQUINA DE ESCRIBIR', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CARDENAS TRUJILLO BLANCA HILDA', NULL, 4, 257, 'r',
    'S-CAL2025-00236, CAL2023-05295,CAL2022-01683, CAL2021-08968,_x000D_
CAL2020-09559, CAL 2019-008923', 0, 3692, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881877351', '357290', 'MONITOR PLANO', 'LENOVO', 'SV8HA445', 'THINKVISIONLT1952PWD',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12215,CAL2022-09250,CAL2021-02998,CAL2020-02832', 0, 3138, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '112240100358', '311790', 'EQUIPO PARA AIRE ACONDICIONADO TIPO INDUSTRIAL', 'LG', '010TAAC00088', 'SJ242CD',
    'PAZ MORENO PABLO MIGUEL', NULL, 5, 293, 'r',
    'CAL2023-11526,CAL2022-8223,CAL2021-01081,_x000D_
CAL2020-02310', 0, 4132, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881878381', '366639', 'MONITOR PLANO', 'LENOVO', 'SVDNFF60', 'THINKVISIONLT1952PWD',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12185,CAL2022-5965,CAL2021-03228,CAL2020-04363', 0, 2680, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '462247854366', '0', 'EQUIPO DE ILUMINACION DE EMERGENCIA', 'OPALUX.', 'SIN SERIE', '9101-220',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'NUEVO 2024', 0, 4255, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375309', '433773', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168232TU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12207,CAL2022-06565,CAL2021-03942,CAL2020-04274', 0, 3024, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746406600998', '101441', 'ARMARIO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'r',
    'CAL2023-005765,CAL2022-01578,CAL2021-08682_x000D_
CAL2020-11004', 0, 3770, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K532', '467713', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0ALAAE0JB', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04228,CAL2021-07843,CAL2020-05284', 0, 2933, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881872894', '247856', 'MONITOR PLANO', 'LENOVO', 'V3K1981', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-01804,2022-01025,CAL2021-09315,CAL2020-07929,CAL2019-9088,CAL2018-5928', 0, 2728, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '536410020490', '0', 'BIOMBO DE METAL DE 2 CUERPOS', 'SIN MARCA', '', 'S/M',
    'ASTORAYME PINCHI LUIGUI GIANCARLO PIERRE', NULL, 6, 252, 'b',
    'S-CAL2025-00163, CAL2022-06676,', 0, 3584, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003342', '451320', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13486,CAL2022-04481,CAL2021-06770,CAL2020-01398,CAL2019-03401', 0, 2901, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375540', '434004', 'MONITOR LED', 'DELL', 'SIN SERIE', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12063,CAL2022-06299,CAL2021-01271,CAL2020-06985,', 0, 2978, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377906', '469817', 'MONITOR LED', 'HEWLETT PACKARD', '6CM85220RV', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04125,CAL2022-05837,_x000D_
CAL2021-07354,CAL2020-05852', 0, 2779, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970125', '97647', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-11006,CAL2022-08444,CAL2021-02651,CAL2020-02601', 0, 4292, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895000994', '147395', 'TECLADO - KEYBOARD', 'ACER', 'KBKUS03241735510140', 'KU-0355',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03375,CAL2022-07057,CAL2021-03092,CAL2020-001510', 0, 2878, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377025', '452304', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'b',
    'CAL2023-11322,CAL2022-08162,CAL2021-01057,CAL2020-03847', 0, 3325, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003243', '451221', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02847,CAL2022-06794,CAL2021-10333,CAL2020-05415,CAL2019-02301', 0, 2657, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003295', '451273', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03287,CAL2022-11185,CAL2021-02827,CAL2020-04010', 0, 2350, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481876801', '455500', 'SILLA FIJA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CRIBILLERO GUILLEN JIMMY POOL', NULL, 4, 265, 'b',
    'CAL2023-07531,CAL2022-05455,CAL2021-06403,CAL2020-10902,CAL2019-10703', 0, 3529, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437122142', '141575', 'ESCRITORIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ROMAN SALAS ESTELA DEL ROCIO', NULL, 4, 264, 'r',
    'CAL2023-06460,CAL2022-01208,CAL2021-08751,CAL2020-10933', 0, 3452, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050E033', '0', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', '@ FASE INTERNET PROTECTION', 'EL6324802207', 'AUR-1000',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 10, 252, 'b',
    '', 1, 3196, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J571', '433605', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13655,CAL2022-03851,CAL2021-03360,CAL2020-00011', 0, 2964, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746403550472', '436502', 'ARCHIVADOR DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ARPASI CRUZ MARTA VIRGINIA', NULL, 4, 261, 'r',
    'CAL2023-09799,CAL2022-09765,CAL2021-00745,CAL2020-002921', 0, 3253, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375430', '433894', 'MONITOR LED', 'DELL', 'CN0Y01GT7426167T33TU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12103,CAL2022-03413,CAL2021-05178,CAL2020-00880,CAL2019-00018', 0, 2976, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003378', '451356', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'CARDENAS TRUJILLO BLANCA HILDA', NULL, 4, 257, 'r',
    'S-CAL2025-00232, CAL2023-05299,CAL2022-01688, CAL2021-08966, _x000D_
CAL 2020-009561, CAL 2019-008919', 0, 3760, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J622', '433656', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-00809,CAL2022-02320,CAL2021-07389,CAL2020-03693', 0, 2820, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950G557', '433289', 'UNIDAD CENTRAL DE PROCESO - CPU', 'DELL', 'SIN SERIE', 'OPTIPLEX 7040 SFF',
    'LA ROSA MACHADO WALTER WILTINHO', NULL, 4, 242, 'b',
    'CAL2023-03262,CAL2022-05087,CAL2021-03551,CAL2020-03181,CAL2019-01281,CAL2018-03735', 0, 3677, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882225250298', '2153', 'EXTINTOR', 'SIN MARCA', 'MPI-120', 'SIN MODELO',
    'GONZALES FARFAN JORGE SANTIAGO', NULL, 4, 252, 'r',
    'CAL2023-09697,CAL2022-10746,CAL2021-10181,CAL2020-03888,CAL2019-7409', 0, 3685, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881877237', '357153', 'MONITOR PLANO', 'LENOVO', 'SV8GZ930', 'THINKVISIONLT1952PWD',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13599,CAL2022-00332,CAL2021-06664,CAL2020-04992', 0, 3152, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746459830431', '520307', 'MÓDULO DE CÓMPUTO DE MELAMINA 50 cm X 70 cm X 78 cm', 'SIN MARCA', '', 'S/M',
    'GONZALES FARFAN JORGE SANTIAGO', NULL, 4, 252, 'b',
    'CAL2023-09710,CAL2022-03745,CAL2021-00011_x000D_', 0, 3583, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500B939', '378323', 'TECLADO - KEYBOARD', 'LENOVO', '4409872', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-06499,CAL2022-01923,CAL2021-09689,CAL2020-08087', 0, 2666, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003219', '451197', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-11469,CAL2022-10507,CAL2021-01170,CAL2020-03892', 0, 2642, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970070', '97592', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10988,CAL2022-08305,CAL2021-02526,CAL2020-02600', 0, 4634, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J621', '433655', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-11443,CAL2022-10565,CAL2021-00556,CAL2020-01813', 0, 2834, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970114', '97636', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10942,CAL2022-08425,CAL2021-02523,CAL2020-02008', 0, 4612, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881879284', '399898', 'MONITOR PLANO', 'HEWLETT PACKARD', '6CM4291XNS', 'LV1911',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02982,CAL2022-05324,CAL2021-01801,CAL2020-05508,CAL2019-02352', 0, 3067, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003300', '451278', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-02932,CAL2022-05622,CAL2021-01881,CAL2020-03986,CAL2019-02379', 0, 2352, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881871486', '214313', 'MONITOR PLANO', 'ADVANCE', '65894BA013266', 'C19L185W',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13444,CAL2022-07681,CAL2021-00813,CAL2020-01677', 0, 3045, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J473', '433507', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-3154,CAL2022-05121,CAL2021-02862,CAL2020-06317', 0, 2817, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746436440047', '0', 'ESCALERA DE ALUMINIO TIPO TIJERA DE 4 PASOS', 'SIN MARCA', 'S/S', 'S/M',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'b',
    'NUEVO 2024', 0, 3766, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037G600', '0', 'MONITOR LED 27 in', 'HP', 'CNC4370T8S', 'HP P27 G5',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3191, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '952213350080', '313857', 'CAJA ACUSTICA', 'PERFECTION', 'SIN SERIE', 'U8',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10002,CAL2022-08485,_x000D_
CAL2021-02515,CAL2020-03405', 0, 4265, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500BQ40', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP252RW4M', 'H5A-P010K',
    'CRIBILLERO GUILLEN JIMMY POOL', NULL, 4, 265, 'b',
    '', 0, 3526, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K633', '467802', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0B5YB81QR', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03561,CAL2022-07647,CAL2021-00851,CAL2020-02690', 0, 2924, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376360', '451639', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12136,CAL2022-05259,CAL2021-06719,CAL2020-01405,CAL2019-03467', 0, 2741, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950W566', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE325BCFK', 'PRO SFF 400 G9',
    'YUPANQUI URETA JOHN JAMES', NULL, 4, 264, 'b',
    'NUEVO', 0, 3560, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500H212', '409714', 'TECLADO - KEYBOARD', 'LENOVO', '54Y94240006646', 'SIN MODELO',
    'ALIAGA DEL PINO DANIEL ENRIQUE', NULL, 9, 185, 'r',
    'CAL2023-03451,CAL2022-02391, CAL2021-06468, CAL 2020-003288, CAL 2019-009355', 0, 3840, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376932', '452211', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12120,CAL2022-02229,CAL2021-07566,CAL2020-06438', 0, 2747, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500C226', '378631', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'MARQUEZ PORTOCARRERO LUIS MIGUEL', NULL, 4, 261, 'r',
    'CAL2023-09811,CAL2022-09749,CAL2021-00727,CAL2020-02993', 0, 3302, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746460850635', '1975', 'MODULO DE MADERA PARA MICROCOMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RUIZ HURTADO ORLANDO AUGUSTO', NULL, 4, 261, 'r',
    'CAL2023-09842,CAL2022-09728,CAL2021-00337,CAL2020-02931', 0, 3229, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037F557', '0', 'MONITOR LED 27 in', 'HP', 'CNC33225FQ', 'E27 G5',
    'CRIBILLERO GUILLEN JIMMY POOL', NULL, 4, 265, 'b',
    '', 0, 3528, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746460851600', '127211', 'MODULO DE MADERA PARA MICROCOMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'MARQUEZ PORTOCARRERO LUIS MIGUEL', NULL, 4, 261, 'r',
    'CAL2023-09823,CAL2022-09747,CAL2021-00725,CAL2020-02930', 0, 3299, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003379', '451357', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'b',
    'CAL2023-11398,CAL2022-09678,CAL2021-00777,CAL2020-01805', 0, 3481, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950Q724', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE250B62S', 'PRO 400 G9 SFF',
    'RIVERA TRUJILLO ALBERTH ANTHONY', NULL, 4, 241, 'b',
    'CAL2023-03190', 0, 3621, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003071', '451049', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-13561,CAL2022-04057,CAL2021-04993,CAL2020-04755', 0, 2634, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500A858', '366648', 'TECLADO - KEYBOARD', 'LENOVO', '1S41A53123488442E', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13520,CAL2022-05306,CAL2021-01778,CAL2020-005566,CAL2019-001380', 0, 2896, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740841002845', '448131', 'IMPRESORA LASER', 'KYOCERA', 'VW7770046', 'P3060DN',
    'HUAMANI MUÑOZ JAVIER WILFREDO', NULL, 4, 240, 'b',
    'CAL2023-03109,CAL2022-05170,CAL2021-02778,CAL 2020-009752,CAL 2019-004351,CAL 2018-003346', 0, 3397, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970203', '97725', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10995,CAL2022-08478,CAL2021-02601,CAL2020-02581', 0, 4628, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873472', '249291', 'MONITOR PLANO', 'LENOVO', 'V3K2692', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13605,CAL2022-07243,CAL2021-01189,CAL2020-08106,CAL2019-02236,CAL2018-04380', 0, 3133, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895005551', '250260', 'TECLADO - KEYBOARD', 'LENOVO', '713617', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-06100,CAL2022-00837,CAL2021-09188,CAL2020-08551,CAL2019-07619', 0, 2663, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740805006324', '0', 'COMPUTADORA PERSONAL PORTATIL', 'HP', '5CD248CM9B', 'ProBook 450 G9',
    'RODRIGUEZ ZAMORA LIDIA MERCEDES', NULL, 4, 241, 'b',
    'CAL2023-03197', 0, 3591, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377805', '469374', 'MONITOR LED', 'HEWLETT PACKARD', '6CM8522063', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12224,CAL2022-09177,CAL2021-02933,CAL2020-02890', 0, 3100, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375340', '433804', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168T2PEU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13450,CAL2022-07150,CAL2021-02330,CAL2020-01116', 0, 3013, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003436', '451414', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13500,CAL2022-02257,CAL2021-07455,CAL2020-05944', 0, 2624, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742223582039', '463306', 'EQUIPO MULTIFUNCIONAL COPIADORA IMPRESORA SCANNER Y/O FAX', 'KYOCERA', '1102NK4US0VFT8X01658', 'TASKALFA 6002I',
    'RUIZ HURTADO ORLANDO AUGUSTO', NULL, 4, 261, 'b',
    'CAL2023-06143,CAL2022-01973,CAL2021-09703,CAL2020-08431', 0, 3234, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500CD49', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', 'BKTAR0CCPJNE7S', 'TPA-P001K',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3203, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500BP56', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP252RXQD', 'H5A-P010K',
    'CARDENAS TRUJILLO BLANCA HILDA', NULL, 4, 257, 'b',
    '', 0, 3689, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500BP05', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP252RWRZ', 'H5A-P010K',
    'YUPANQUI URETA JOHN JAMES', NULL, 4, 264, 'b',
    'NUEVO', 0, 3561, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500CC11', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', 'BKTAR0CCPJNFTF', 'TPA-P001K',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 2790, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437454673', '460239', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CARDENAS TRUJILLO BLANCA HILDA', NULL, 4, 257, 'r',
    'S-CAL2025-00238, CAL2023-01651,CAL2022-01682, CAL2021-08967, _x000D_
CAL 2020-009560, CAL 2019-008922', 0, 3691, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375439', '433903', 'MONITOR LED', 'DELL', 'CN0Y01GT742616822N2U', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'UBICADO2025,CAL2022-02321,CAL2021-05399,CAL2020-03667', 0, 3007, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746483904091', '276062', 'SILLA GIRATORIA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'r',
    'CAL2023-04690,CAL2022-00083,CAL2021-07992,CAL 2020-05691,CAL 2019-06039', 0, 3483, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003598', '451576', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03290,CAL2022-05117,CAL2021-02821,CAL2020-04002,CAL2019-01293,CAL2018-003750', 0, 2397, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U642', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '7CL24800AK', 'HSA - C001K',
    'RIVERA TRUJILLO ALBERTH ANTHONY', NULL, 4, 241, 'b',
    'CAL2023-03189_x000D_', 0, 3620, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J487', '433521', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-07704,CAL2022-04311,_x000D_
CAL2021-06567,CAL2020-00644,CAL2019-02076', 0, 2973, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882225252595', '434230', 'EXTINTOR', 'BUCKEYE', 'B78703304', '456 10CD',
    'GONZALES FARFAN JORGE SANTIAGO', NULL, 4, 252, 'r',
    'S-CAL2025-00227, CAL2023-09703,CAL2022-02527,CAL2021-00126', 0, 3686, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746461240498', '436590', 'MODULO DE MELAMINA PARA COMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ ZAMORA LIDIA MERCEDES', NULL, 4, 241, 'm',
    'CAL2023-03192,CAL2022-06259, CAL2021-03585,CAL2020-04128', 0, 3594, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950Q734', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE250BVTC', 'PRO 400 G9 SFF',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03103', 0, 3334, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740800501010', '0', 'CAPTURADOR DE IMAGEN - SCANNER', 'AVISION', '107336838310055', 'AD8150',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'NUEVO', 0, 3505, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895006254', '251757', 'TECLADO - KEYBOARD', 'LENOVO', '697703', 'KU-0225',
    'PAZ MORENO PABLO MIGUEL', NULL, 5, 293, 'r',
    'CAL2023-11483,CAL2022-05565,CAL2021-03525,_x000D_
CAL2020-04150', 0, 4143, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377772', '469244', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011GV9', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03492,CAL2022-04197,CAL2021-06135,CAL2020-06716', 0, 3090, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877002589', '0', 'MONITOR A COLOR 27 in', 'HP', 'CNK2320CNL', 'E27 G4 FHD',
    'GALLARDO OBREGON GRECIA DEL ROSARIO', NULL, 4, 239, 'b',
    'CAL2023-03036', 0, 3338, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003318', '451296', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13499,CAL2022-04476,CAL2021-06758,CAL2020-01415,CAL2019-03412', 0, 2625, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003331', '451309', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'CORONADO ARAUJO JULIO JOSE', NULL, 4, 192, 'b',
    'CAL2023-13537, CAL2022-02647, CAL2021-05009, CAL 2020-002800', 0, 2806, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376358', '451637', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12141,CAL2022-06360,CAL2021-01267,CAL2020-06980,CAL2019-03094,CAL2018-09848', 0, 2676, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740805001556', '434077', 'COMPUTADORA PERSONAL PORTATIL', 'LENOVO', 'SPF0S4TF1', 'THINKPAD L460',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03061,CAL2022-05196,CAL2021-10383,CAL2020-04123', 0, 3368, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950X615', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE436BPFT', 'HP PRO SFF 400 G9',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 2785, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950X517', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE436BPDF', 'HP PRO SFF 400 G9',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 2800, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877002619', '0', 'MONITOR A COLOR 27 in', 'HP', 'CNK232039B', 'E27 G4 FHD',
    'BALOIS CRISPIN MIGUEL ANGEL', NULL, 4, 240, 'b',
    'CAL2023-03117', 0, 3704, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950G600', '433332', 'UNIDAD CENTRAL DE PROCESO - CPU', 'DELL', 'SIN SERIE', 'OPTIPLEX 7040 SFF',
    'GUTIERREZ CHUMPITAZ LUCIO JUAN', NULL, 4, 261, 'b',
    'CAL2023-09860,CAL2022-09702,CAL2021-00353,CAL2020-002971', 0, 3256, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120942', '463646', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12340,CAL2022-10401,CAL2021-00908,_x000D_
CAL2020-04540,CAL2019-10367', 0, 4315, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U656', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP249NTDQ', 'HSA - P010K',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'b',
    'CAL2023-03241', 0, 3673, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '952213350081', '313858', 'CAJA ACUSTICA', 'PERFECTION', 'SIN SERIE', 'U8',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-9988,CAL2022-08489,_x000D_
CAL2021-02660,CAL2020-03406', 0, 4262, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037G604', '0', 'MONITOR LED 27 in', 'HP', 'CNC4370THB', 'HP P27 G5',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3188, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740805006464', '0', 'COMPUTADORA PERSONAL PORTATIL', 'HP', '5CD248CM9C', 'ProBook 450 G9',
    'LA ROSA MACHADO WALTER WILTINHO', NULL, 4, 242, 'b',
    'CAL2023-03259', 0, 3656, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437456045', '477777', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', '', '',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'CAL2023-07520,CAL2022-10788,CAL2021-06387,CAL2020-00950,CAL2019-13353LIN', 0, 3498, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437459130', '524881', 'ESCRITORIO DE MELAMINA 60 cm X 78 cm X 1.20 m CON PORTA TECLADO Y PORTA CPU', 'SIN MARCA', '', 'S/M',
    'SERNAQUE CHIROQUE CARLOS ALBERTO', NULL, 4, 300, 'b',
    'CAL2023-13248,CAL2022-06151,CAL21-10922', 0, 3426, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881877306', '357240', 'MONITOR PLANO', 'LENOVO', 'SV8GZ184', 'THINKVISIONLT1952PWD',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12129,CAL2022-00056,CAL2021-08517,CAL2020-05703,CAL2019-06092', 0, 2746, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K590', '467773', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0BVBBZ13T', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2022-05890,CAL2021-07831,CAL2020-05272', 0, 2928, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U146', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP2273GYZ', 'TPA - P001K',
    'CORREA MARREROS LAURA RAQUEL', NULL, 4, 241, 'b',
    'CAL2023-03223', 0, 3600, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377891', '469581', 'MONITOR LED', 'HEWLETT PACKARD', '6CM852200C', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12575,CAL2022-05820,CAL2021-07368,_x000D_
CAL2020-05394', 0, 3064, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746403212337', '236858', 'ARCHIVADOR DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'PAZ MORENO PABLO MIGUEL', NULL, 5, 293, 'r',
    'CAL2023-11527,CAL2022-05597,CAL2021-04128-_x000D_
CAL2020-06127', 0, 4133, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375359', '433823', 'MONITOR LED', 'DELL', 'CN0Y01GT7426167T324U', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12200,CAL2022-09183,CAL2021-03019,CAL2020-01497', 0, 2981, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746483902161', '221056', 'SILLA GIRATORIA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'VELA MAYHUIRE LUISA YULMA', NULL, 6, 189, 'm',
    'CAL2023-08018,CAL2022-03640,CAL2021-03448,CAL2020-00320', 0, 3574, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970140', '97662', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10944,CAL2022-08391,CAL2021-02667,CAL2020-01976', 0, 4300, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437457899', '518449', 'ESCRITORIO DE MELAMINA 60 cm X 78 cm X 1.20 m CON 4 GAVETAS', 'SIN MARCA', '', '',
    'ROJAS ROJAS SANDY KARIN', NULL, 4, 300, 'b',
    'CAL2023-13268,CAL2022-06165,CAL2021-06383', 0, 3431, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481199468', '258796', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'm',
    'CAL2023-03193,CAL2022-10968, CAL2021-10363,CAL2020-05434', 0, 3784, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882225250597', '102328', 'EXTINTOR', 'PRODEX', 'MPI-01', 'SIN MODELO',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'r',
    'S-CAL2025-00207, CAL2023-05538,CAL2022-00152,CAL2020-06823', 0, 3762, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481194997', '437827', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'MENDOZA CORREA CARLOS VALENTIN', NULL, 4, 261, 'b',
    'CAL2023-12448,CAL2022-07291,CAL2021-00890,CAL2020-01637', 0, 3263, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950W731', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE325BCFG', 'PRO SFF 400 G9',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    '', 0, 3503, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377889', '469579', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011J27', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03986,CAL2022-04072,_x000D_
CAL2021-06203,CAL2020-03707', 0, 3106, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037G491', '0', 'MONITOR LED 27 in', 'HP', 'CNC4370TRV', 'HP P27 G5',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3187, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881877299', '357232', 'MONITOR PLANO', 'LENOVO', 'SV8HA452', 'THINKVISIONLT1952PWD',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13600,CAL2022-00230,CAL2021-07755,CAL2020-07610', 0, 3161, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437121199', '110743', 'ESCRITORIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'CAL2023-09834,CAL2022-09735,CAL2021-00351,CAL2020-002969', 0, 3328, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U556', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP249NSZX', 'HSA - P010K',
    'CORREA MARREROS LAURA RAQUEL', NULL, 4, 241, 'b',
    'CAL2023-03229', 0, 3614, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746489334074', '472070', 'SILLON GIRATORIO DE METAL', 'SIN MARCA', 'S/S', 'S/M',
    'RUBIO VALLE JOSE OCTAVIO', NULL, 4, 240, 'b',
    'CAL2023-03144,CAL20CAL2022-06241,CAL2021-00069_x000D_', 0, 3715, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375300', '433764', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168239RU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12196,CAL2022-05946,_x000D_
CAL2021-03249,CAL2020-04347', 0, 2990, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740824500852', '0', 'DUPLICADOR DE PUERTOS', 'HP', '5CG250X14Y', 'HSN - IX02',
    'PANDURO OSORIO JORGE LUIS', NULL, 4, 239, 'b',
    'CAL2023-03073', 0, 3384, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375381', '433845', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168232YU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12054,CAL2022-03407,CAL2021-05115,CAL2020-00996,CAL2019-00132', 0, 2997, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376927', '452206', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-11093,CAL2022-07578,_x000D_
CAL2021-00880,CAL2020-01554', 0, 3069, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481194879', '434952', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'm',
    'CAL2023-03069,CAL2022-05104,CAL2021-02841,CAL2020-04152, CAL 2019-000255,', 0, 3383, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376852', '452131', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12219,CAL2022-04759,CAL2021-04788,CAL2020-02221,CAL2019-05028', 0, 3121, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120958', '463662', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12369,CAL2022-10394,CAL2021-00907,_x000D_
CAL2020-04510,CAL2019-10387', 0, 4319, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481193233', '151018', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'm',
    'CAL2023-01948,CAL2022-09466,CAL2021-09660,CAL2020-08082CAL2019-7745', 0, 3596, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003298', '451276', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13544,CAL2022-02225,CAL2021-07549,CAL2020-06433', 0, 2811, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950X496', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE436BPN9', 'HP PRO SFF 400 G9',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 2795, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950H959', '450362', 'UNIDAD CENTRAL DE PROCESO - CPU', 'LENOVO', 'SIN SERIE', 'THINKCENTRE M910S',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'b',
    'CAL2023-11321,CAL2022-08163,CAL2021-01059,CAL2020-03846', 0, 3326, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746406601059', '135068', 'ARMARIO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'r',
    'CAL2023-12489,CAL2022-08266, CAL2021-00422, CAL 2020-002349', 0, 4440, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377795', '469362', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011H39', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13614,CAL2022-02055,CAL2021-07517,CAL2020-05948', 0, 3062, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742223585036', '0', 'EQUIPO MULTIFUNCIONAL COPIADORA IMPRESORA SCANNER Y/O FAX', 'KYOCERA', 'H6J4901807', 'TASKALFA 6004i',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'NUEVO 2025', 0, 3218, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481195695', '455289', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'MALAVER AYALA PAMELA CECILIA', NULL, 4, 242, 'm',
    'CAL2023-13773,CAL2022-09458,CAL2021-02066,_x000D_
CAL2020-10619', 0, 3645, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050E014', '0', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', '@ FASE INTERNET PROTECTION', 'EL6324801209', 'AUR-1000',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 10, 252, 'b',
    '', 0, 3408, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003242', '451220', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13497,CAL2022-03768,CAL2021-01633,CAL2020-08233', 0, 2622, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O445', '434865', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'MENDOZA GALINDO KATTIA ESTRELLA', NULL, 4, 240, 'm',
    'CAL2023-03114,CAL2022-05165,CAL2021-03513,CAL2020-04162', 0, 3740, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003377', '451355', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03446,CAL2022-06821,CAL2021-02777,CAL2020-10479,CAL2019-03529', 0, 2874, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '952213350004', '87345', 'CAJA ACUSTICA', 'ZEUZ', 'SIN SERIE', 'MEDICOM',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10012,CAL2022-08492,_x000D_
CAL2021-02516,CAL01951', 0, 4253, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003187', '451165', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03376,CAL2022-07300,CAL2021-10170,CAL2020-02711', 0, 2611, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746452030666', '261803', 'MESA DE REUNIONES', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'r',
    'CAL2023-06453,CAL2022-01203,CAL2021-08767,_x000D_
CAL2020-10952', 0, 3456, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J532', '433566', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02981,CAL2022-05368,CAL2021-01824,CAL2020-05483,CAL2019-01364', 0, 2831, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880373290', '408594', 'MONITOR LED', 'LENOVO', 'SV5758137', 'LT2013S',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12186,CAL2022-02392,CAL2021-06467,CAL2020-03283,CAL2019-09354', 0, 3115, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950N302', '504060', 'UNIDAD CENTRAL DE PROCESO - CPU', 'DELL', '5D4W673', 'OPTIPLEX 7080 SFF',
    'RIEGA COLACCI JAIME RONALD', NULL, 4, 300, 'b',
    'CAL2023-13253,CAL2022-06158,CAL2021-06366,CAL2020-47768', 0, 3416, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '952255290374', '420211', 'MICROFONO INALAMBRICO', 'SHURE', '3NI2488491', 'SVX 24',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'r',
    'CAL2023-05423,LIM2022-24016', 0, 3849, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880372925', '408227', 'MONITOR LED', 'LENOVO', 'SV5759368', 'LT2013S',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12170,CAL2022-02401,CAL2021-07183,CAL2020-03267,CAL2019-09374', 0, 2740, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376911', '452190', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12133,CAL2022-04491,CAL2021-09767,CAL2020-01436,CAL2019-03392', 0, 3146, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970130', '97652', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-11022,CAL2022-08393,CAL2021-02607,CAL2020-02585', 0, 4299, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J620', '433654', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03559,CAL2022-05605,CAL2021-03645,CAL2020-03992,CAL2019-02362', 0, 2957, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037G698', '0', 'MONITOR LED 27 in', 'HP', 'CNC4370TJP', 'HP P27 G5',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3189, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950W724', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE325BBRK', 'PRO SFF 400 G9',
    'PUMACHAY RUIZ RAUL FRANCISCO', NULL, 4, 261, 'r',
    'NUEVO 2024', 0, 3310, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873977', '294783', 'MONITOR PLANO', 'ADVANCE', '7319BBA002368', 'C19L185',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-05078,CAL2022-00723,CAL2021-07049,CAL2020-07810,CAL2019-08108,CAL2018-05840', 0, 3041, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375350', '433814', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168T33UU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12241,CAL2022-06559,CAL2021-04054,CAL2020-04268', 0, 2992, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881879437', '400162', 'MONITOR PLANO', 'HEWLETT PACKARD', '6CM4291Y3V', 'LV1911',
    'GONZALES PEÑA YOVANA YERI', NULL, 8, 252, 'b',
    'CAL2023-03234,CAL2022-06749,CAL2021-00657,CAL2020-03065,CAL 2019-003233', 0, 3680, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740800500657', '509445', 'CAPTURADOR DE IMAGEN - SCANNER', 'FUJITSU', '', 'FI-7700',
    'CRIBILLERO GUILLEN JIMMY POOL', NULL, 4, 265, 'b',
    'CAL2023-07532,CAL2022-05445,CAL2021-06400,CAL2020-024637', 0, 3523, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050D466', '0', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', 'LEGRAND', 'W09TH01220', '',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 192, 'b',
    '', 0, 3551, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U532', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP249NT2H', 'HSA - P010K',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03033', 0, 3345, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500A872', '366663', 'TECLADO - KEYBOARD', 'LENOVO', '1S41A53123496171E', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-005729,CAL2022-01396,CAL2021-08723,CAL2020-10405', 0, 2658, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970183', '97705', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10966,CAL2022-08460,CAL2021-02605,CAL2020-01977', 0, 4629, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500CD48', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', 'BKTAR0CCPJNE8K', 'TPA-P001K',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 2792, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003212', '451190', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13528,CAL2022-03302,CAL2021-05201,CAL2020-00899,CAL2019-00041', 0, 2893, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376912', '452191', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02917,CAL2022-05646,CAL2021-04411,CAL2020-07055,CAL2019-02403', 0, 2781, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437120450', '1010', 'ESCRITORIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-09813,CAL2022-09752,CAL2021-00342,CAL2020-002941', 0, 3572, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437456047', '477779', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', '', '',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'CAL2023-07499,CAL2022-05443,CAL2021-06396,CAL2020-00936,CAL2019-043363', 0, 3542, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376354', '451633', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-0862,CAL2022-06128,CAL2021-03856,CAL2020-04222', 0, 2673, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746428980314', '323891', 'CASILLERO DE METAL - LOCKER', 'ITALICA', 'SIN SERIE', 'MEL 79',
    'CURINUQUI MAITAHUARI JOSE', NULL, 5, 254, 'r',
    'CAL2023-12533,CAL2022-08272,CAL2021-00436, _x000D_
CAL2020-002351', 0, 4458, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003268', '451246', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2022-03010,CAL2021-05589,CAL2020-00557,CAL2019-00526,CAL2018-08936', 0, 2612, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873452', '249259', 'MONITOR PLANO', 'LENOVO', 'V3K2629', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-02875,CAL2022-3199,CAL2021-05766,CAL2020-01236', 0, 2734, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746403550523', '444200', 'ARCHIVADOR DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'r',
    'CAL2023-04444,CAL2022-00544,CAL2021-07653,CAL 2020-05747,CAL 2019-05973', 0, 3810, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895005502', '250164', 'TECLADO - KEYBOARD', 'LENOVO', '700055', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13752,CAL2022-06049,CAL2021-01680,CAL2020-03559', 0, 2650, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375337', '433801', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168238DU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-06236,CAL2022-01949,CAL2021-09680,CAL2020-08407', 0, 2776, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376900', '452179', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12162,CAL2022-02011,CAL2021-05378,CAL2020-03651', 0, 3140, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877004092', '0', 'MONITOR A COLOR DE 24 in', 'HP', 'CN42420G66', 'E24 G4 FHD',
    'PANDURO OSORIO JORGE LUIS', NULL, 4, 239, 'b',
    'CAL2023-03071', 0, 3357, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U555', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP249NTVY', 'HSA - P010K',
    'ANDIA BARRUETO STEFANI MILUSKA', NULL, 4, 240, 'b',
    'CAL2023-03130', 0, 3730, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746406264832', '0', 'ARMARIO DE MELAMINA', 'EDGAR', '', '',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'r',
    'CAL2023-05212', 0, 3793, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437453294', '431500', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ANDIA BARRUETO STEFANI MILUSKA', NULL, 4, 240, 'm',
    'CAL2023-03137,CAL2022-06235,CAL2021-03569,CAL2020-04097', 0, 3735, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377858', '469503', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011GLD', 'V203P',
    'GARCIA VALENZUELA LUIS ALBERTO', NULL, 9, 185, 'b',
    'CAL2023-13643,CAL2022-03929 - PJJR', 0, 3815, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037F720', '0', 'MONITOR LED 27 in', 'HP', 'CNC24712WX', 'E27 G5',
    'VELÁSQUEZ ZÚÑIGA BERNABÉ ALFREDO', NULL, 4, 261, 'r',
    'NUEVO 2024', 0, 3267, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881872454', '247348', 'MONITOR PLANO', 'LENOVO', 'V3K0623', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12198,CAL2022-6834,CAL2021-03783,CAL2020-07558', 0, 2678, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877002555', '0', 'MONITOR A COLOR 27 in', 'HP', 'CNK23215C0', 'E27 G4 FHD',
    'RIVERA TRUJILLO ALBERTH ANTHONY', NULL, 4, 241, 'b',
    'CAL2023-03191', 0, 3622, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500CC21', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', 'BKTAR0CCPJN9G1', 'TPA-P001K',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3213, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377811', '469382', 'MONITOR LED', 'HEWLETT PACKARD', '6CM8522079', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13634,CAL2022-03996,CAL2021-07895,CAL2020-05349', 0, 3170, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740805006352', '0', 'COMPUTADORA PERSONAL PORTATIL', 'HP', '5CD248CNDK', 'ProBook 450 G9',
    'HUAMANI MUÑOZ JAVIER WILFREDO', NULL, 4, 240, 'b',
    'CAL2023-03209', 0, 3742, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950W678', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE325BC4K', 'PRO SFF 400 G9',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    '14/08/2024, ACT. PECOSA Y FECHA ALTA - SOL. POR: YCHUMPITAZ', 0, 3516, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037G500', '0', 'MONITOR LED 27 in', 'HP', 'CNC4370TRM', 'HP P27 G5',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3194, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481195834', '455428', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'b',
    'CAL2023-06452,CAL2022-11355,CAL2021-08754,_x000D_
CAL2020-10934', 0, 3458, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873219', '249012', 'MONITOR PLANO', 'LENOVO', 'V3K2980', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13453,CAL2022-08323,CAL2021-01552,CAL2020-02084', 0, 2738, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740805006372', '0', 'COMPUTADORA PERSONAL PORTATIL', 'HP', '5CD248CL6Q', 'ProBook 450 G9',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03100', 0, 3374, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970092', '97614', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10960,CAL2022-08469,CAL2021-02528,CAL2020-01982', 0, 4623, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950H935', '450338', 'UNIDAD CENTRAL DE PROCESO - CPU', 'LENOVO', 'SIN SERIE', 'THINKCENTRE M910S',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12501,CAL2022-10313,CAL2021-00563,_x000D_
CAL2020-03900,CAL2019-10448', 0, 4436, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J576', '433610', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03177,CAL2022-06244,CAL2021-03558,CAL2020-04084', 0, 2822, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '952282874432', '309869', 'TELEFONO', 'CISCO', 'FCH14478Rsm', 'CP-7911G',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'r',
    'CAL2023-12505,CAL2022-10314,CAL2021-00442,_x000D_
CAL2020-02341,CAL2019-07921', 0, 4438, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481195698', '455292', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'DE LA CUBA AIVAR JULIO CESAR', NULL, 4, 264, 'b',
    'CAL2023-06481,CAL2022-01205,CAL2021-00101,_x000D_
CAL2020-03260', 0, 3460, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377798', '469365', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011HQT', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04090,CAL2022-05827,_x000D_
CAL2021-07347,CAL2020-05831', 0, 2725, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746406261513', '436440', 'ARMARIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'r',
    'CAL2023-03057,CAL2022-06208,CAL2021-03528,CAL2020-04101', 0, 3348, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037A043', '475925', 'MONITOR LED', 'HEWLETT PACKARD', 'SIN SERIE', 'PRODISPLAY P203',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-05855,CAL2022-00502,CAL2021-08479CAL2020-08478', 0, 3068, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500R358', '0', 'TECLADO - KEYBOARD', 'DELL', 'CN019M93LO3001BK07L1A00', 'KB216T1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-11272,CAL2022-11462', 0, 2837, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877004102', '0', 'MONITOR A COLOR DE 24 in', 'HP', 'CN42430V7C', 'E24 G4 FHD',
    'RUBIO VALLE JOSE OCTAVIO', NULL, 4, 240, 'b',
    'CAL2023-03139', 0, 3711, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500M851', '471945', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216T',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03955,CAL2021-11667', 0, 2824, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742208971669', '439085', 'CAMARA FOTOGRAFICA DIGITAL', 'CANON', '462061012520', 'POWERSHOT ELPH190 IS',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'b',
    'CAL2023-04469,CAL2022-23910,CAL2021-26525CAL2020,50188', 0, 3847, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120931', '463635', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12331,CAL2022-10390,CAL2021-00948,_x000D_
CAL2020-04528', 0, 4323, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O453', '434873', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'VILLAR AMASIFEN GERALDO JACOMO', NULL, 4, 239, 'm',
    'CAL2023-03035,CAL2022-05184,CAL2021-02824,CAL2020-04012', 0, 3354, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746483904088', '276059', 'SILLA GIRATORIA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 7, 192, 'm',
    'CAL2023-11703,CAL2022-07849,CAL2021-00373,_x000D_
CAL2020-02430', 0, 3577, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375346', '433810', 'MONITOR LED', 'DELL', 'CN0Y01GT742616822MKU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12088,CAL2022-05797,CAL2021-01851,CAL2020-05430,CAL2019-02345', 0, 3040, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375402', '433866', 'MONITOR LED', 'DELL', 'CN0Y01GT742616822Y1U', 'E2016H',
    'CORONADO ARAUJO JULIO JOSE', NULL, 4, 192, 'b',
    'CAL2023-03180CAL2022-06242, CAL2021-03556,CAL2020-04082', 0, 3612, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377019', '452298', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12146,CAL2022-04472,CAL2021-06761,CAL2020-01420,CAL2019-03448', 0, 2749, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437453464', '437051', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RUBIO VALLE JOSE OCTAVIO', NULL, 4, 240, 'm',
    'CAL2023-03143,CAL2022-06240,CAL2021-03564,CAL2020-04091', 0, 3714, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376392', '451671', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-06267,CAL2022-01266,CAL2021-09643,CAL2020-08073', 0, 2675, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554281', '300980', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'SERTZEN BELLIDO WAGNER', NULL, 5, 254, 'r',
    'CAL2023-10785,CAL2022-10558,CAL2021-00697,CAL2020-03815', 0, 4450, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003444', '451422', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-13562,CAL2022-02044,CAL2021-07421,CAL2020-05893', 0, 2603, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003616', '451594', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-13560,CAL2022-02242,CAL2021-07432,CAL2020-06470', 0, 2614, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003186', '451164', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-07214,CAL2022-04022, CAL2021-04948,_x000D_
CAL2020-04608,CAL2018-02024', 0, 2349, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376870', '452149', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02612,CAL2022-02054,CAL2021-07489,CAL2020-06419', 0, 2683, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970066', '97588', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10952,CAL2022-08459,CAL2021-02537,CAL2020-02577', 0, 4626, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881878369', '366626', 'MONITOR PLANO', 'LENOVO', 'SV8MM089', 'THINKVISIONLT1952PWD',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12168,CAL2022-3179,CAL2021-04524,CAL2020-01725', 0, 2735, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050A864', '459555', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', 'FORZA', 'SIN SERIE', 'SL-1012UL',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'b',
    'CAL2023-06746,CAL2022-04606,CAL2021-05926, _x000D_
CAL2020-01359,CAL2019-00883,LIM2018-62727', 0, 3554, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376345', '451624', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12276,CAL2022-07535,CAL2021-00869,CAL2020-02694', 0, 3156, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376996', '452275', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-02721,CAL2022-2983,CAL2021-07260,CAL2020-06212', 0, 2701, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873526', '249354', 'MONITOR PLANO', 'LENOVO', 'V3K1923', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13456,CAL2022-09725,CAL2021-00326,CAL2020-02966', 0, 3147, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375401', '433865', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168T2R1U', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-09846,CAL2022-09701,CAL2021-00354,CAL 2020-02972', 0, 3060, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003255', '451233', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03126,CAL2022-05158,CAL2021-03508,CAL2020-04073', 0, 2392, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746403550530', '444209', 'ARCHIVADOR DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'r',
    'CAL2023-04443,CAL2022-00543,CAL2021-07665,CAL 2020-05764,CAL 2019-05957', 0, 3809, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481190809', '98364', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'MAIZ SIENFUEGOS MARCIA DANIELA', NULL, 4, 264, 'r',
    'CAL2023-06477,CAL2022-01254,CAL2021-08175,_x000D_
CAL2020-09660', 0, 3474, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746461240513', '436605', 'MODULO DE MELAMINA PARA COMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LA ROSA MACHADO WALTER WILTINHO', NULL, 4, 242, 'm',
    'CAL2023-03258,CAL2022-05084,CAL2021-02900,CAL2020-03184', 0, 3653, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377821', '469445', 'MONITOR LED', 'HEWLETT PACKARD', '6CM85220BJ', 'V203P',
    'ALIAGA DEL PINO DANIEL ENRIQUE', NULL, 9, 185, 'b',
    'CAL2023-03493,CAL2022-04099, CAL2021-06158, CAL 2020-003761', 0, 3839, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003334', '451312', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'CORONADO ARAUJO JULIO JOSE', NULL, 4, 192, 'b',
    'CAL2023-03403, CAL2022-04909, CAL2021-08029, CAL 2020-003792', 0, 2842, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375335', '433799', 'MONITOR LED', 'DELL', 'CN0Y01GT7426167T2YKU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13448,CAL2022-08543,CAL2021-02223,CAL2020-01074', 0, 3056, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377000', '452279', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12277,CAL2022-07601,CAL2021-01310,CAL2020-01606', 0, 3136, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746483904810', '354538', 'SILLA GIRATORIA DE METAL', NULL, NULL, NULL,
    'RUIZ HURTADO ORLANDO AUGUSTO', 'RUIZ HURTADO ORLANDO AUGUSTO', 4, 261, 'r',
    NULL, 1, 3331, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376939', '452218', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12279,CAL2022-07529,CAL2021-01385,CAL2020-01646', 0, 2764, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437122617', '149775', 'ESCRITORIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'DE LA CUBA AIVAR JULIO CESAR', NULL, 4, 264, 'r',
    'CAL2023-06478,CAL2022-01569,CAL2021-08745,_x000D_
CAL2020-10939', 0, 3461, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970133', '97655', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-11032,CAL2022-07892,CAL2021-02534,CAL2020-01975', 0, 4625, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J564', '433598', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'b',
    'CAL2023-03261,CAL2022-05109,CAL2021-02899,CAL2020-003197,CAL2019-001305', 0, 3676, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '952281171479', '444369', 'SWITCH PARA RED', 'DELL', 'SIN SERIE', 'SIN MODELO',
    'GONZALES PEÑA YOVANA YERI', NULL, 4, 253, 'r',
    'CAL2023 - 09129,CAL2022-07384, CAL2021-00157,CAL2020-00776 / INFORMATICA 120', 0, 3841, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437126808', '278546', 'ESCRITORIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CARDENAS TRUJILLO BLANCA HILDA', NULL, 4, 257, 'r',
    'S-CAL2025-00242,CAL2023-05286,CAL2022-01373,CAL2021-09140,CAL2020-09570,CAL2019-08928', 0, 3562, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003335', '451313', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13524,CAL2022-03065,CAL2021-05638,CAL2020-000488,CAL2019-000518,CAL2018-488', 0, 2900, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437458218', '518768', 'ESCRITORIO DE MELAMINA 60 cm X 78 cm X 1.20 m CON 4 GAVETAS', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03022,CAL2022-09429,LIM2021-40468', 0, 3349, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950X525', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE436BPD6', 'HP PRO SFF 400 G9',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3214, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050E040', '0', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', '@ FASE INTERNET PROTECTION', 'EL6324802219', 'AUR-1000',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 10, 252, 'b',
    '', 0, 3410, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970151', '97673', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10993,CAL2022-08431,CAL2021-02633,CAL2020-02586', 0, 4618, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376944', '452223', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02878,CAL2022-07228,CAL2021-01217,CAL2020-07085,CAL2019-02201,CAL2018-04311', 0, 2721, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648390F534', '512146', 'SILLA GIRATORIA DE METAL CON BRAZOS', 'SIN MARCA', '', '',
    'PASION CAPCHA PAMELA MILAGROS', NULL, 14, 233, 'b',
    'CAL2023-03302,CAL2022-03483,CAL2021-06035', 0, 3638, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377872', '469524', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011HB5', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12253,CAL2022-07645,CAL2021-00849,CAL2020-02688', 0, 3119, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437124577', '226548', 'ESCRITORIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'VARGAS GIL EDILBERTA YOLANDA', NULL, 4, 264, 'r',
    'CAL2023-06465,CAL2022-01197,CAL2021-08761,_x000D_
CAL2020-10946', 0, 3468, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375305', '433769', 'MONITOR LED', 'DELL', 'CN0Y01GT742616822MMU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12053,CAL2022-03160,CAL2021-04495,CAL2020-01713', 0, 2995, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877002334', '0', 'MONITOR A COLOR 27 in', 'HP', 'CNK235064J', 'E27 G4 FHD',
    'DE LA CUBA AIVAR JULIO CESAR', NULL, 4, 264, 'r',
    'CAL2023-06469', 0, 3464, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742223585041', '0', 'EQUIPO MULTIFUNCIONAL COPIADORA IMPRESORA SCANNER Y/O FAX', 'KYOCERA', 'H6J4901778', 'TASKALFA 6004i',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'NUEVO 2025', 0, 3412, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950N478', '507316', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HEWLETT PACKARD', 'SIN SERIE', 'PRODESK 400 G7 SFF',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'b',
    'CAL2023-03313,CAL2022-06984,CAL2021-01568', 0, 3832, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376863', '452142', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12042,CAL2022-04268,CAL2021-00856,CAL2020-01595,CAL2019-03814,CAL2018-03509', 0, 3160, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481195732', '455326', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ROMAN SALAS ESTELA DEL ROCIO', NULL, 4, 264, 'b',
    'CAL2023-06461,CAL2022-01564,CAL2021-08749,_x000D_
CAL2020-10940', 0, 3453, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377803', '469371', 'MONITOR LED', 'HEWLETT PACKARD', '6CM852205V', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12210,CAL2022-06526,CAL2021-04360,CAL2020-04838', 0, 3085, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746403550480', '436510', 'ARCHIVADOR DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'r',
    'CAL2023-03107,CAL2022-06216,CAL2021-03549,CAL2020-04104', 0, 3358, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950H881', '450284', 'UNIDAD CENTRAL DE PROCESO - CPU', 'LENOVO', 'SIN SERIE', 'THINKCENTRE M910S',
    'GARCIA VALENZUELA LUIS ALBERTO', NULL, 9, 185, 'b',
    'CAL2023-12015, CAL2022-01656 - PJJR', 0, 3816, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003272', '451250', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13518,CAL2022-04232,CAL2021-05566,CAL2020-00467,CAL2019-00593,CAL2018-08848', 0, 2894, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895005586', '250320', 'TECLADO - KEYBOARD', 'LENOVO', '0699705', 'KU-0225',
    'CORONADO ARAUJO JULIO JOSE', NULL, 4, 192, 'm',
    'CAL2023-13487,CAL2022-06350, CAL2021-01284, CAL 2020-06923, CAL 2019-003107', 0, 2667, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120922', '463626', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12351,CAL2022-10410,CAL2021-00930,_x000D_
CAL2020-04546,CAL2019-10390', 0, 4333, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375764', '437538', 'MONITOR LED', 'HEWLETT PACKARD', '3CQ7013N2S', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-05979,CAL2022-00373,CAL2021-09413,CAL2020-08845', 0, 3088, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950X622', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE436BPS1', 'HP PRO SFF 400 G9',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3202, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376862', '452141', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-07071,CAL2022-02650,CAL2021-04846,_x000D_
CAL2020-04682,CAL2019-01784', 0, 3109, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050E055', '0', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', '@ FASE INTERNET PROTECTION', 'EL6324802031', 'AUR-1000',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 10, 252, 'b',
    '', 0, 3409, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881877943', '366128', 'MONITOR PLANO', 'LENOVO', 'SVDNDW14', 'THINKVISIONLT1952PWD',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13441,CAL2022-07023,CAL2021-01594,CAL2020-02501', 0, 3137, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881877912', '366093', 'MONITOR PLANO', 'LENOVO', 'SVDNFF39', 'THINKVISIONLT1952PWD',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12157,CAL2022-04378,CAL2021-05675,CAL2020-00573,CAL2019-00564,CAL2018-00407', 0, 3134, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375409', '433873', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168T1H8U', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12061,CAL2022-03103,CAL2021-04568,CAL2020-01275', 0, 3033, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O393', '434813', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CORREA MARREROS LAURA RAQUEL', NULL, 4, 241, 'm',
    'CAL2023-03248,CAL2022-06204,CAL2021-03540,CAL2020-04079', 0, 3795, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500N073', '477227', 'TECLADO - KEYBOARD', 'HP DESKJET', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-01830,CAL2022-01311,CAL2021-08448,CAL2020-007970,CAL2019-044904', 0, 2938, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003252', '451230', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-09942,CAL2022-07754,CAL2021-02700,CAL2020-02554', 0, 2358, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376895', '452174', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12149,CAL2022-08253,CAL2021-01715,CAL2020-08167,', 0, 2756, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950C527', '394325', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HEWLETT PACKARD', 'MXL44610XL', 'SIN MODELO',
    'ZAPATA ZULOETA EDINSON SMITH', NULL, 4, 261, 'b',
    'CAL2023-9792,CAL2022-09770,CAL2021-00754,CAL2020-03802', 0, 3306, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377826', '469463', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011J2V', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13632,CAL2022-04104,CAL2021-06185,CAL2020-03753', 0, 2723, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119I181', '285252', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'PAREDES SALOME OLGA JANNET', NULL, 4, 242, 'm',
    'S-CAL2025-00225, CAL2023-12506,CAL2022-10316,CAL2019-09198', 0, 3659, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003442', '451420', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03576,CAL2022-07623,CAL2021-01322,CAL2020-01533', 0, 2906, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746460852323', '151476', 'MODULO DE MADERA PARA MICROCOMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ZAPATA ZULOETA EDINSON SMITH', NULL, 4, 261, 'r',
    'CAL2023-09796,CAL2022-09766,CAL2021-00733,CAL2020-02982', 0, 3304, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500CD17', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', 'BKTAR0CCPJN9J2', 'TPA-P001K',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3217, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '112240100068', '135185', 'EQUIPO PARA AIRE ACONDICIONADO TIPO INDUSTRIAL', 'COLD POINT', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10014,CAL2022-07886,_x000D_
CAL2021-02508,CAL2020-01943', 0, 4252, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500BP89', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP252RWK3', 'H5A-P010K',
    'NAVARRO PAJUELO MONICA MAXIMINA', NULL, 4, 265, 'b',
    'CAL2023-09137 /NUEVO 2024', 0, 3532, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500BQ70', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP252RWFM', 'H5A-P010K',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    '', 0, 3504, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481871569', '86985', 'SILLA FIJA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-11653,CAL2022-06005,CAL2021-02769,CAL2020-06020', 0, 3487, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500A968', '366780', 'TECLADO - KEYBOARD', 'LENOVO', '1S41A53123497784E', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-06327,CAL2022-01714,CAL2021-09248,CAL2020-09794,CAL2019-08515', 0, 2647, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882225253315', '0', 'EXTINTOR', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'b',
    'CAL2023-06470,CAL2022-01202', 0, 3478, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037F622', '0', 'MONITOR LED 27 in', 'HP', 'CNC3321YSV', 'E27 G5',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    '', 0, 3508, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037G591', '0', 'MONITOR LED 27 in', 'HP', 'CNC4370TVY', 'HP P27 G5',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3190, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K632', '467798', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0B5YB80QD', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-10719,CAL2022-02746,CAL2021-06821,CAL2020-05047', 0, 2943, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377843', '469488', 'MONITOR LED', 'HEWLETT PACKARD', '6CM852209Q', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12247,CAL2022-07690,CAL2021-00797,CAL2020-02669', 0, 3101, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895007842', '339814', 'TECLADO - KEYBOARD', 'DELL', 'CN-0KHCC7-71616-1C3-010U', 'KB212-B',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-03539,CAL2022-03401,CAL2021-05174,CAL2020-00878,CAL2019-00027', 0, 2962, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740800500644', '509432', 'CAPTURADOR DE IMAGEN - SCANNER', 'FUJITSU', '', 'FI-7700',
    'PUMACHAY RUIZ RAUL FRANCISCO', NULL, 4, 261, 'b',
    'CAL2023-09762,CAL2022-05449,CAL2021-06393,CAL2020-24638', 0, 3314, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '952278340467', '415525', 'SISTEMA DE PROYECCION MULTIMEDIA - PROYECTOR MULTIMEDIA', 'EPSON', 'SIN SERIE', 'SIN MODELO',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'b',
    'CAL2023-04470,CAL2022-00560,CAL2021-07663,CAL2020-0579,CAL 2019-08825', 0, 3843, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746427620026', '0', 'CARRO DE METAL TRANSPORTADOR PLEGABLE', 'REDLINE', 'S/S', 'PH 150',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'NUEVO 2024', 0, 3284, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970148', '97670', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-11027,CAL2022-08442,CAL2021-02546,CAL2020-01974', 0, 4619, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120914', '463618', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12321,CAL2022-10369,CAL2021-00913,_x000D_
CAL2020-04539,CAL2019-09505', 0, 4320, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500O954', '505239', 'TECLADO - KEYBOARD', 'DELL', 'CN01GN56M6D0004I074TA01', 'KB-216D',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04261,CAL2022-02487,CAL2021-05313', 0, 2838, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950H890', '450293', 'UNIDAD CENTRAL DE PROCESO - CPU', 'LENOVO', 'SIN SERIE', 'THINKCENTRE M910S',
    'CHAVEZ LEGUIA MARIA SANDRA MILAGROS', NULL, 4, 261, 'b',
    'CAL2023-05553,CAL2022-00275,CAL2021-08208,CAL2020-06757', 0, 3273, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376883', '452162', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12274,CAL2022-07183,CAL2021-03100,CAL2020-07129', 0, 3159, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500P720', '509740', 'TECLADO - KEYBOARD', 'MICRONICS', '', '',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-06784,CAL2022-04611,CAL2021-05983', 0, 2881, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050E034', '0', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', '@ FASE INTERNET PROTECTION', 'EL6324802209', 'AUR-1000',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 10, 252, 'b',
    '', 0, 3405, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877004099', '0', 'MONITOR A COLOR DE 24 in', 'HP', 'CN42420G6W', 'E24 G4 FHD',
    'LA ROSA MACHADO WALTER WILTINHO', NULL, 4, 242, 'b',
    'CAL2023-03244', 0, 3671, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746436440049', '0', 'ESCALERA METALICA TIPO TIJERA DE 3 PASOS', 'SIN MARCA', '', '',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'b',
    'NUEVO 2024', 0, 3767, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003190', '451168', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-13554,CAL2022-03004,CAL2021-05596,CAL2020-00552,CAL2019-00530', 0, 2610, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873169', '248962', 'MONITOR PLANO', 'LENOVO', 'V3K1549', '9227-AE1',
    'CARDENAS TRUJILLO BLANCA HILDA', NULL, 4, 257, 'r',
    'CAL2023-05175,CAL2022-01363, CAL2021-08984, _x000D_
CAL 2020-009581, CAL 2019-008931', 0, 3759, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003273', '451251', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13522,CAL2022-04490,CAL2021-09766,CAL2020-001434,CAL2019-003394', 0, 2887, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221121805', '476144', 'DETECTOR DE HUMO', 'MIRCOM', '', '',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12374,CAL2022-10472, CAL2021-00909,CAL2020-04559', 0, 4338, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119N288', '342565', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'GUTIERREZ CHUMPITAZ LUCIO JUAN', NULL, 4, 261, 'r',
    'CAL2023-09814,CAL2022-09716,CAL2021-01428,CAL2020-03806', 0, 3259, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377804', '469372', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011J2C', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12256,CAL2022-07584,CAL2021-00874,CAL2020-01588', 0, 3091, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377862', '469507', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011GQF', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04737,CAL2022-00921,CAL2021-08233,CAL2020-07708,', 0, 3049, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746405920713', '111654', 'ARMARIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'r',
    'CAL2023-06456,CAL2022-01572,CAL2021-08743,_x000D_
CAL2020-10927', 0, 3475, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U147', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP2273FH8', 'TPA - P001K',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'b',
    'CAL2023-03299', 0, 3628, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746403210890', '148507', 'ARCHIVADOR DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'PAZ MORENO PABLO MIGUEL', NULL, 5, 293, 'r',
    'CAL2023-11529,CAL2022-05599,CAL2021-01521,_x000D_
CAL2020-03097', 0, 4135, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375433', '433897', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168T1HGU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12204,CAL2022-06841,CAL2021-03790,CAL2020-04387', 0, 2998, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554270', '300969', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-10778,CAL2O22-10662,CAL2021-01068,CAL2020-03869', 0, 3569, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '462247854409', '0', 'EQUIPO DE ILUMINACION DE EMERGENCIA', 'OPALUX;', 'SIN SERIE', '9101-220',
    'MENDOZA VIVANCO ROCIO VIOLETA', NULL, 5, 252, 'b',
    '', 0, 3808, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500BQ56', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP252RXZ8', 'H5A-P010K',
    'ROMAN SALAS ESTELA DEL ROCIO', NULL, 4, 264, 'b',
    '', 0, 3451, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554366', '301065', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'SERTZEN BELLIDO WAGNER', NULL, 5, 254, 'r',
    'CAL2023-10794,CAL2022-10550,CAL2021-00691,CAL2020-06069', 0, 4451, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003313', '451291', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03459,CAL2022-06588,CAL2021-04064,CAL2020-04259', 0, 2871, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377896', '469726', 'MONITOR LED', 'HEWLETT PACKARD', '6CM852205Y', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03004,CAL2022-05320,CAL2021-01807,CAL2020-05506,CAL2019-03598', 0, 3073, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742223585027', '0', 'EQUIPO MULTIFUNCIONAL COPIADORA IMPRESORA SCANNER Y/O FAX', 'KYOCERA', 'H6J4901772', 'TASKALFA 6004i',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'NUEVO 2025', 0, 3224, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950Q539', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE250BVVF', 'PRO 400 G9 SFF',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'b',
    'CAL2023-03200', 0, 3775, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746459830433', '520309', 'MÓDULO DE CÓMPUTO DE MELAMINA 50 cm X 70 cm X 78 cm', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'CAL2023-08774,CAL2022-09428,CAL2021-00008_x000D_', 0, 3500, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377340', '457676', 'MONITOR LED', 'LENOVO', 'VKM54979', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-10724,CAL2022-02767,_x000D_
CAL2021-06867,CAL2020-05863', 0, 2705, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376370', '451649', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02616,CAL2022-02624,CAL2021-04873,CAL2020-004672', 0, 2719, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970139', '97661', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10958,CAL2022-08439,CAL2021-02555,CAL2020-01980', 0, 4627, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487290191', '497070', 'SILLON FIJO DE MADERA', 'SIN MARCA', '', '',
    'GONZALES FARFAN JORGE SANTIAGO', NULL, 4, 252, 'b',
    'CAL2023-09713,AL2022-03747,CAL2021-05996', 0, 3581, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895001947', '442930', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'b',
    'CAL2023-04438,CAL2022-00480,CAL2021-07668,CAL 2020-05752,CAL 2019-05966,CAL 2018-05786', 0, 3829, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376823', '452102', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-06072,CAL2022-00855,CAL2021-09211,CAL2020-010264,CAL2019-007602', 0, 2716, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '952254910279', '359550', 'MICROFONO (OTROS)', 'SHURE', '2JK0495995', 'SM58',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'b',
    'CAL2023-05422,LIM2022-23898,LIM2021-26032,LIM2020-50045', 0, 3845, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554296', '300995', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'SERTZEN BELLIDO WAGNER', NULL, 5, 254, 'r',
    'CAL2023-12537,CAL2022-10552,CAL2021-01488,_x000D_
CAL2020-08888', 0, 4449, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375417', '433881', 'MONITOR LED', 'DELL', 'CN0Y01GT7426167T33UU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12049,CAL2022-3239,CAL2021-05810,CAL2020-00191', 0, 3032, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377871', '469523', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011H1N', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02779,CAL2022-05375,CAL2021-01837,CAL2020-05552,CAL2019-03585', 0, 2773, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746450560161', '480800', 'MESA DE MELAMINA', 'SIN MARCA', '', '',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'b',
    'CAL2023-04392,CAL2022-00450,CAL2021-07584,CAL2020-04925', 0, 3813, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O409', '434829', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'm',
    'CAL2023-03024,CAL2022-06279,CAL2021-03593,CAL2020-04121', 0, 3371, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K593', '467821', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0BVBC01G0', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-10630,CAL2022-01909,CAL2021-06934,CAL2020-05077', 0, 2926, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970184', '97706', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10977,CAL2022-08473,CAL2021-02634,CAL2020-02017', 0, 4291, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '462247854408', '0', 'EQUIPO DE ILUMINACION DE EMERGENCIA', 'OPALUX;', 'SIN SERIE', '9101-220',
    'MENDOZA VIVANCO ROCIO VIOLETA', NULL, 5, 252, 'b',
    '', 0, 3773, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881878518', '391840', 'MONITOR PLANO', 'HEWLETT PACKARD', '6CM4330JX6', 'LV1911',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12175,CAL2022-09258,CAL2021-02988,CAL2020-02824', 0, 3086, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375369', '433833', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168232UU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-08146,CAL2022-3120,_x000D_
CAL2021-04564,CAL2020-01161', 0, 2984, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003282', '451260', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'b',
    'CAL2023-11323,CAL2022-08167,CAL2021-01058,CAL2020-03845', 0, 3327, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376808', '452087', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12206,CAL2022-04797,CAL2021-05425,CAL2020-07115,CAL2019-03091', 0, 3125, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554308', '301007', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 5, 252, 'r',
    'CAL2023-11671,CAL2022-10690,CAL2021-01432,CAL2020-03870', 0, 3567, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881872536', '247435', 'MONITOR PLANO', 'LENOVO', 'SIN SERIE', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-02873,CAL2022-02807,CAL2021-07039,CAL2020-07791', 0, 2783, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J604', '433638', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03544,CAL2022-06309,CAL2021-01285,CAL2020-06909,', 0, 2832, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '112240100892', '431155', 'EQUIPO PARA AIRE ACONDICIONADO TIPO INDUSTRIAL', 'COLD POINT', '12287NG9480G92100025', 'CH41A-024-H3U2C',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'b',
    'CAL2023-10022,CAL2022-08484,_x000D_
CAL2021-02658,CAL2020-03404', 0, 4260, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895005542', '250242', 'TECLADO - KEYBOARD', 'LENOVO', '699638', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-06220,CAL2022-01967,CAL2021-09696,CAL2020-08102', 0, 2347, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873466', '249278', 'MONITOR PLANO', 'LENOVO', 'V3K2690', '9227-AE1',
    'PAZ MORENO PABLO MIGUEL', NULL, 5, 293, 'b',
    'CAL2023-11481,CAL2022-05563,CAL2021-03524,_x000D_
CAL2020-04148', 0, 4145, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881879404', '400126', 'MONITOR PLANO', 'HEWLETT PACKARD', '6CM4291YLP', 'LV1911',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12254,CAL2022-07864,CAL2021-00398,CAL2020-02413', 0, 3058, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003346', '451324', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-07040,CAL2022-02587,CAL2021-04933,_x000D_
CAL 2020-02747,CAL2019-01603,CAL2018-02007', 0, 2340, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376878', '452157', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02879,CAL2022-04482,CAL2021-06768,CAL2020-01396,CAL2019-03399', 0, 2671, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881871898', '218662', 'MONITOR PLANO', 'LENOVO', 'SV1TB638', '4434-HE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12127,CAL2022-03420,CAL2021-05232,CAL2020-00851,CAL2019-00045', 0, 2727, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970192', '97714', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-11011,CAL2022-08462,CAL2021-02643,CAL2020-02016', 0, 4604, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740805003390', '528379', 'COMPUTADORA PERSONAL PORTATIL', 'LENOVO', 'SPF3CNWBJ', 'THINKPAD E14 GEN 2',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'b',
    'CAL2023-09727,LIM2022-38582, ACT. PECOSA Y FECHA ALTA - SOL. POR: YCHUMPITAZ', 0, 3826, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376887', '452166', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12182,CAL2022-5929,CAL2021-03213,CAL2020-04332', 0, 2706, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377813', '469436', 'MONITOR LED', 'HEWLETT PACKARD', '6CM8522002', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03497,CAL2022-04080,CAL2021-06210,CAL2020-03724', 0, 3089, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746459830435', '520311', 'MÓDULO DE CÓMPUTO DE MELAMINA 50 cm X 70 cm X 78 cm', 'SIN MARCA', '', 'S/M',
    'RIEGA COLACCI JAIME RONALD', NULL, 4, 300, 'b',
    'CAL2023-13257,CAL2022-06160,CAL2021-00010_x000D_', 0, 3421, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050E060', '0', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', '@ FASE INTERNET PROTECTION', 'EL6324802105', 'AUR-1000',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 10, 252, 'b',
    '', 0, 3402, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500C910', '383898', 'TECLADO - KEYBOARD', 'LENOVO', '04570695', 'SK-8825',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-06416,CAL2022-01420,CAL2021-07140,_x000D_
CAL2020-10381', 0, 2651, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437455982', '477705', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', '', '',
    'RAMIREZ ROJAS REINA ROZARIA', NULL, 4, 265, 'b',
    'CAL2023-07507,CAL2022-05439,CAL2021-06402,CAL2020-00949', 0, 3495, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746427620027', '0', 'CARRO DE METAL TRANSPORTADOR PLEGABLE', 'REDLINE', 'S/S', 'PH 150',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'NUEVO 2024', 0, 3282, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895006301', '251812', 'TECLADO - KEYBOARD', 'LENOVO', '0699993', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03485,CAL2022-6944,CAL2021-03759,CAL2020-06119', 0, 2875, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376955', '452234', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02866,CAL2022-04644,CAL2021-09750,CAL2020-01448,CAL2019-03385', 0, 3163, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375420', '433884', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168T1GKU', 'E2016H',
    'MEZA FERNANDEZ RUBEN ERNESTO', NULL, 4, 257, 'b',
    'CAL2023-12112,CAL2022-02017,CAL2021-05393,CAL2020-03674', 0, 3555, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877002602', '0', 'MONITOR A COLOR 27 in', 'HP', 'CNK232038F', 'E27 G4 FHD',
    'CORREA MARREROS LAURA RAQUEL', NULL, 4, 241, 'b',
    'CAL2023-03232', 0, 3616, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746456780492', '1094', 'MESITA DE METAL PARA MAQUINA DE ESCRIBIR', 'TECNIART', 'SIN SERIE', 'SIN MODELO',
    'PUMACHAY RUIZ RAUL FRANCISCO', NULL, 4, 261, 'r',
    'CAL2023-09777,CAL2022-09775,CAL2021-00712,CAL2020-02911', 0, 3316, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J491', '433525', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-09725,CAL2022-00715,CAL2021-07076,CAL2020-07781,CAL2019-08071,CAL2018-05738', 0, 2823, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376894', '452173', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12150,CAL2022-03436,CAL2021-05188,CAL2020-00861,CAL2019-000097', 0, 2714, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481871560', '98152', 'SILLA FIJA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'PANDURO OSORIO JORGE LUIS', NULL, 4, 239, 'm',
    'CAL2023-03104,CAL2022-06248,CAL2021-10388', 0, 3350, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376929', '452208', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12226,CAL2022-5951,CAL2021-01892,CAL2020-07529', 0, 3158, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437453443', '437030', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RUIZ HURTADO ORLANDO AUGUSTO', NULL, 4, 261, 'b',
    'CAL2023-09850,CAL2022-09721,CAL2021-00334,CAL2020-002963', 0, 3228, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U678', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '7CL2480156', 'HSA - C001K',
    'BALOIS CRISPIN MIGUEL ANGEL', NULL, 4, 240, 'b',
    'CAL2023-03119', 0, 3706, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742223584910', '0', 'EQUIPO MULTIFUNCIONAL COPIADORA IMPRESORA SCANNER Y/O FAX', 'KYOCERA', 'H6H4800474', 'TASKALFA 7004I',
    'RUIZ HURTADO ORLANDO AUGUSTO', NULL, 4, 261, 'r',
    'NUEVO 2024', 0, 3233, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877002558', '0', 'MONITOR A COLOR 27 in', 'HP', 'CNK23203BL', 'E27 G4 FHD',
    'ANDIA BARRUETO STEFANI MILUSKA', NULL, 4, 240, 'b',
    'CAL2023-03128', 0, 3728, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '462200509877', '430146', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', 'FORZA', '161133300397', 'NT-1002U',
    'LA ROSA MACHADO WALTER WILTINHO', NULL, 4, 242, 'b',
    'CAL2023-03260,CAL2022-06266,CAL2021-02886,CAL2020-003191,CAL 2019-01300', 0, 3657, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375421', '433885', 'MONITOR LED', 'DELL', 'CN0Y01GT74261682394U', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-08003,CAL2022-02853,_x000D_
CAL2021-03453,CAL2020-00284', 0, 3012, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881879372', '400024', 'MONITOR PLANO', 'HEWLETT PACKARD', '6CM4291VVW', 'LV1911',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-07747,CAL2022-04259,_x000D_
CAL2021-01230,CAL2020-07071,CAL2019-03142', 0, 3105, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950H952', '450355', 'UNIDAD CENTRAL DE PROCESO - CPU', 'LENOVO', 'SIN SERIE', 'THINKCENTRE M910S',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 7, 192, 'm',
    'CAL2023-12313,CAL2022-01661,CAL2021-07951,CAL2020-05238', 0, 3433, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375367', '433831', 'MONITOR LED', 'DELL', 'CN0Y01GT74261682300U', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12099,CAL2022-3123,CAL2021-04558,CAL2020-01168', 0, 3030, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375548', '434012', 'MONITOR LED', 'DELL', 'SIN SERIE', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12097,CAL2022-3154,CAL2021-04502,CAL2020-01707', 0, 3014, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377815', '469438', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011HQB', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03498,CAL2022-04915,CAL2021-08060,CAL2020-06612', 0, 3050, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003214', '451192', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'CHAVEZ LEGUIA MARIA SANDRA MILAGROS', NULL, 4, 261, 'b',
    'CAL2023-05554,CAL2022-00274,CAL2021-08209,CAL2020-06755', 0, 3274, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375338', '433802', 'MONITOR LED', 'DELL', 'CN0Y01GT7426167T2YFU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12108,CAL2022-03365,CAL2021-05129,CAL2020-00992,CAL2019-00139', 0, 2993, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950W701', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE325BCG8', 'PRO SFF 400 G9',
    'CRIBILLERO GUILLEN JIMMY POOL', NULL, 4, 265, 'b',
    '14/08/2024, ACT. PECOSA Y FECHA ALTA - SOL. POR: YCHUMPITAZ', 0, 3527, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '462200509977', '430246', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', 'FORZA', '161133300393', 'NT-1002U',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03092,CAL2022-05182,CAL2021-03592,CAL2020-04118', 0, 3372, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437456543', '507998', 'ESCRITORIO DE MELAMINA 60 cm X 78 cm X 1.20 m CON PORTA TECLADO Y PORTA CPU', 'EDGAR', '', '',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'b',
    'CAL2023-04447,CAL2022-00488,CAL2021-07648,LIM2020-55747,', 0, 3833, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U620', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP249NT5D', 'HSA - P010K',
    'DE LA CUBA AIVAR JULIO CESAR', NULL, 4, 264, 'b',
    'CAL2023-06466', 0, 3462, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895001958', '442944', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'r',
    'CAL2023-04448,CAL2022-00489,CAL2021-09737,CAL 2020-05759,CAL 2019-05961,CAL 2018-05773', 0, 3834, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740824500847', '0', 'DUPLICADOR DE PUERTOS', 'HP', '5CG250X02M', 'HSN - IX02',
    'HUAMANI MUÑOZ JAVIER WILFREDO', NULL, 4, 240, 'b',
    'CAL2023-03208', 0, 3738, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742223585039', '0', 'EQUIPO MULTIFUNCIONAL COPIADORA IMPRESORA SCANNER Y/O FAX', 'KYOCERA', 'H6J4901803', 'TASKALFA 6004i',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'NUEVO 2025', 0, 3222, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746460850599', '1760', 'MODULO DE MADERA PARA MICROCOMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'SERTZEN BELLIDO WAGNER', NULL, 4, 192, 'r',
    'CAL2023-07570,CAL2022-10036,CAL2021-04627,CAL2020-03168,CAL 2019-002473', 0, 3485, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375408', '433872', 'MONITOR LED', 'DELL', 'CN0Y01GT742616822N4U', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-06192,CAL2022-01944,CAL2021-09668,CAL2020-10680', 0, 2713, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500CG24', '0', 'TECLADO - KEYBOARD CON PUERTO USB', 'HP.', '9CP2273DXR', 'TPA-P001K',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 10, 252, 'b',
    '', 0, 3649, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554347', '301046', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 5, 252, 'r',
    'CAL2023-10786,CAL2022-08841,CAL2021-01449,CAL2020-01787', 0, 4448, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050E012', '0', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', '@ FASE INTERNET PROTECTION', 'EL6324802089', 'AUR-1000',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 10, 252, 'b',
    '', 0, 3403, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O367', '434787', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'm',
    'CAl2023-03153,CAL2022-05114, CAL2021-02818,CAL2020-04049, CAL 2019-000251,', 0, 3777, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U623', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '7CL24801HX', 'HSA - C001K',
    'PEREZ SALAZAR MARITA', NULL, 4, 241, 'b',
    'CAL2023-03163', 0, 3780, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500A364', '357827', 'TECLADO - KEYBOARD', 'LENOVO', '1S41A53123219047E', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-06462,CAL2022-01200,CAL2021-08762,CAL2020-10944', 0, 2640, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003075', '451053', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-13498,CAL2022-02269,CAL2021-07406,CAL2020-06490', 0, 2627, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746403210352', '99376', 'ARCHIVADOR DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'PAZ MORENO PABLO MIGUEL', NULL, 5, 293, 'r',
    'CAL2023-11531,CAL2022-06000,CAL2021-01520,_x000D_
CAL2020-03096', 0, 4137, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950X463', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE436BPQF', 'HP PRO SFF 400 G9',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3210, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377785', '469346', 'MONITOR LED', 'HEWLETT PACKARD', '6CM85220GF', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13786,CAL2022-04830,CAL2021-06217,CAL2020-06691', 0, 3082, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481194926', '434999', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'm',
    'CAL2023-03203,CAL2022-06231, CAL2021-03559,CAL2020-04092, CAL 2019-001255,', 0, 3633, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K533', '467714', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0ALAAE2BO', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04167,CAL2022-03968,_x000D_
CAL2021-07887,CAL2020-05353', 0, 2941, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437453476', '437063', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'PANDURO OSORIO JORGE LUIS', NULL, 4, 239, 'm',
    'CAL2023-03068,CAL2022-06252,CAL2021-03579,CAL2020-04134', 0, 3382, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500B076', '366917', 'TECLADO - KEYBOARD', 'LENOVO', '1S41A53123496142E', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-07334,CAL2022-03451,CAL2021-05260,CAL 2020-00907,CAL2019-00051', 0, 2343, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500BQ09', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP252RXS3', 'H5A-P010K',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    '', 0, 3511, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037G590', '0', 'MONITOR LED 27 in', 'HP', 'CNC4370WBC', 'HP P27 G5',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3180, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746441520433', '431216', 'ESTANTE DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'b',
    'CAL2023-03157,CAL2022-05126, CAL2021-02855,CAL2020-06313', 0, 3792, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970073', '97595', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10974,CAL2022-08436,CAL2021-02549,CAL2020-01996', 0, 4283, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740800500665', '509452', 'CAPTURADOR DE IMAGEN - SCANNER', 'FUJITSU', '', 'FI-7700',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'CAL2023-07502,CAL2022-05463,CAL2022,06414,CAL2020-02463', 0, 3540, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K509', '467689', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0ALAAB0V7', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-07566,CAL2022-10026,CAL2021-04630,CAL2020-004186,CAL2019-3643', 0, 2935, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481876544', '443597', 'SILLA FIJA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'm',
    'CAL2023-04456,LIM2022-14153,LIM2021-25891,LIM2020-23801', 0, 3823, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746460850650', '1144', 'MODULO DE MADERA PARA MICROCOMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'OCHOA ESTRADA JULIA', NULL, 9, 195, 'm',
    'CAL2023-04562,CAL2022-00324,CAL2021-08430,CAL2020-04973', 0, 3571, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377006', '452285', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03087,CAL2022-05177,CAL2021-03587,CAL2020-04115', 0, 2698, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746483902144', '221035', 'SILLA GIRATORIA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'b',
    'CAL2023-00452, CAL2022-07396, CAL2021-05444, CAL 2020-006139, CAL 2019-003747', 0, 3664, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746441520743', '519861', 'ESTANTE DE MELAMINA', 'SIN MARCA', '', 'S/M',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'b',
    'S-CAL2025-00218, CAL2023-05193,CAL2022-01193,CAL2021-00041', 0, 3477, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877004093', '0', 'MONITOR A COLOR DE 24 in', 'HP', 'CN4242084K', 'E24 G4 FHD',
    'CORREA MARREROS LAURA RAQUEL', NULL, 4, 241, 'b',
    'CAL2023-03221', 0, 3598, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950X621', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE436BPGY', 'HP PRO SFF 400 G9',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 2791, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950G639', '433371', 'UNIDAD CENTRAL DE PROCESO - CPU', 'DELL', 'SIN SERIE', 'OPTIPLEX 7040 SFF',
    'MEZA FERNANDEZ RUBEN ERNESTO', NULL, 4, 257, 'r',
    'CAL2023-08399,CAL2022-06368,CAL2021-01253,CAL2020-06941,CAL2019-02284', 0, 3556, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740800500663', '509450', 'CAPTURADOR DE IMAGEN - SCANNER', 'FUJITSU', 'SIN SERIE', 'FI-7700',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'CAL2023-09824,CALL2022-9797', 0, 3493, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746403550423', '431426', 'ARCHIVADOR DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'r',
    'CAL2023-06454,CAL2022-01195,CAL2021-08742,_x000D_
CAL2020-10929', 0, 3439, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375304', '433768', 'MONITOR LED', 'DELL', 'CN0Y01GT74261682303U', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12214,CAL2022-06580,CAL2021-03886,CAL2020-04287', 0, 2985, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376836', '452115', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12265,CAL2022-05523,CAL2021-04014,CAL2020-00245', 0, 2766, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003061', '451039', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03439,CAL2022-09182,CAL2021-02931,CAL2020-02888', 0, 2872, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970108', '97630', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-11028,CAL2022-08472,CAL2021-02553,CAL2020-01989', 0, 4622, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746460852316', '151469', 'MODULO DE MADERA PARA MICROCOMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'YUCRA TRUJILLO JULIO CESAR', NULL, 4, 261, 'r',
    'CAL2023-09804,CAL2022-9761,CAL2021-00760,CAL2020-02996', 0, 3281, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895002138', '443877', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SK-8827',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-06116,CAL2022-00887,CAL2021-09223,CAL2020-10277,CAL2019-07673', 0, 2654, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377038', '452317', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02859,CAL2022-02537,CAL2021-04866,CAL2020-02739', 0, 3165, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120943', '463647', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12370,CAL2022-10386,CAL2021-00949,_x000D_
CAL2020-04512,CAL2019-09508', 0, 4318, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377825', '469449', 'MONITOR LED', 'HEWLETT PACKARD', '6CM85220GP', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-06288,CAL2022-02341,CAL2021-09633,CAL2019-07748', 0, 3178, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376378', '451657', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-01914,CAL2022-02876,CAL2021-03418,CAL2020-00089', 0, 3117, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950Q549', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE250BSV3', 'PRO 400 G9 SFF',
    'GALLARDO OBREGON GRECIA DEL ROSARIO', NULL, 4, 239, 'b',
    'CAL2023-03037', 0, 3339, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500CC44', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', 'BKTAR0CCPJNFTJ', 'TPA-P001K',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3201, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376422', '451701', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12264,CAL2022-07657,CAL2021-00836,CAL2020-01566', 0, 3173, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950X543', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE436BPHC', 'HP PRO SFF 400 G9',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 2793, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377016', '452295', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12143,CAL2022-02201,CAL2021-07505,CAL2020-06480', 0, 2697, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481876842', '455541', 'SILLA FIJA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'CAL2023-07521,CAL2022-10616,CAL2021-00560,CAL2020-01823,CAL2019-11252,CAL2018-09441', 0, 3549, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481190602', '87934', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ANDIA BARRUETO STEFANI MILUSKA', NULL, 4, 240, 'm',
    'CAL2023-03134,CAL2022-06236,CAL2021,10189,CAL2020-04058', 0, 3724, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375317', '433781', 'MONITOR LED', 'DELL', 'CN0Y01GT742616822N9U', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12007,CAL2022-03464,CAL2021-05154,CAL2020-02127,CAL2019-00206', 0, 2991, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895005514', '250184', 'TECLADO - KEYBOARD', 'LENOVO', '0713649', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-01912,CAL2022-01249,CAL2021-00714,CAL2020-02916,CAL2019-5379,CAL2018-02683', 0, 2633, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U679', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '7CL248009W', 'HSA - C001K',
    'PAREDES SALOME OLGA JANNET', NULL, 4, 242, 'b',
    'CAL2023-03279_x000D_', 0, 3636, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377841', '469486', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011HB0', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04170,CAL2022-03966,_x000D_
CAL2021-07885,CAL2020-05350', 0, 3063, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '112279704874', '434123', 'VENTILADOR ELECTRICO PARA MESA O DE PIE', 'WURDEN', 'SIN SERIE', 'GMS-18-3B2',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'CAL2023-09843,CAL2022-09737,CAL2021-00750,CAL2020-03110,', 0, 3319, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880373506', '414445', 'MONITOR LED', 'LENOVO', 'V5916497', '60AB-AAR1-WW',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-05089,CAL2022-00616,CAL2021-07125,CAL2020-07850,CAL2019-08797,CAL2018-05723', 0, 2703, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746473050043', '97214', 'PIZARRA ACRILICA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'CAL2023-9790,CAL2022-05509,CAL2021-10137,CAL2020-09257', 0, 3330, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375343', '433807', 'MONITOR LED', 'DELL', 'CN0Y01GT74261682398U', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02952,CAL2022-05352,CAL2021-01812,CAL2020-05496,CAL2019-01356', 0, 3005, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880373267', '408570', 'MONITOR LED', 'LENOVO', 'SV5759647', 'LT2013S',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12011,CAL2022-01751, CAL2021-7199, CAL 2020-03296, CAL 2019-09344', 0, 2759, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437122423', '141983', 'ESCRITORIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'm',
    'CAL2023-03242,CAL2022-05108,CAL2021-02825,CAL2020-04011,CAL2019-01288,CAL2018-10080', 0, 3662, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003327', '451305', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03401,CAL2022-01652,CAL2021-07929,CAL2020-05216', 0, 2847, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375415', '433879', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168239FU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03047,CAL2022-06214,CAL2021-03543,CAL2020-04165', 0, 2999, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437457901', '518451', 'ESCRITORIO DE MELAMINA 60 cm X 78 cm X 1.20 m CON 4 GAVETAS', 'SIN MARCA', '', '',
    'RIEGA COLACCI JAIME RONALD', NULL, 4, 300, 'b',
    'CAL2023-13255,CAL2022-06159,CAL2021-06369', 0, 3418, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037F722', '0', 'MONITOR LED 27 in', 'HP', 'CNC3310RRP', 'E27 G5',
    'RAMIREZ ROJAS REINA ROZARIA', NULL, 4, 265, 'b',
    '', 0, 3491, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881877970', '366161', 'MONITOR PLANO', 'LENOVO', 'SV8LM275', 'THINKVISIONLT1952PWD',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12167,CAL2022-3682,CAL2021-03405,CAL2020-00323', 0, 2770, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376962', '452241', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12145,CAL2022-04044,CAL2021-05021,CAL2020-02734,', 0, 3151, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119L403', '327488', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RAMIREZ ROJAS REINA ROZARIA', NULL, 4, 265, 'r',
    'CAL2023-005713,CAL2022-01438,CAL2021-07153_x000D_
CAL2020-10640', 0, 3507, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037F706', '0', 'MONITOR LED 27 in', 'HP', 'CNC33225VG', 'E27 G5',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    '', 0, 3515, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375541', '434005', 'MONITOR LED', 'DELL', 'SIN SERIE', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12102,CAL2022-06330,CAL2021-01246,CAL2020-06936,CAL2019-03118,CAL2018-04107', 0, 3022, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481193411', '151976', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUAMANI MUÑOZ JAVIER WILFREDO', NULL, 4, 240, 'm',
    'CAL2023-03110,CAL2022-06280,CAL2021-03522,CAL2020-04006', 0, 3703, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746405923283', '319056', 'ARMARIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'r',
    'CAL2023-03172,CAL2022-05043,CAL2021-02871,CAL2020-04041', 0, 3606, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481876177', '437402', 'SILLA FIJA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'm',
    'CAL2023-04461,CAL2022-00549,CAL2021-07643,CAL2020-05769,CAL 2019-05953', 0, 3824, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437456040', '477772', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', '', '',
    'BALOIS CRISPIN MIGUEL ANGEL', NULL, 4, 240, 'r',
    'CAL2023-03120,CAL2022-06269,CAL2021-00092,CAL2020-01042', 0, 3707, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746405923394', '319178', 'ARMARIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'CAL2023-09769,CAL2022-09792,CAL2021-00788,CAL2020-002943', 0, 3285, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554266', '300965', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'ZAPATA ZULOETA EDINSON SMITH', NULL, 4, 261, 'r',
    'CAL2023-10931,CAL2022-10895,CAL2021-00774,CAL2020-02926', 0, 3296, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376850', '452129', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02618,CAL2022-02038,CAL2021-07511,CAL2020-05954', 0, 2670, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U457', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '7CL24800AV', 'HSA - C001K',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'b',
    'CAL2023-03201', 0, 3774, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437127635', '321517', 'ESCRITORIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'GUTIERREZ CHUMPITAZ LUCIO JUAN', NULL, 4, 261, 'r',
    'CAL2023-09764,CAL2022-09798,CAL2021-00713,CAL2020-002915', 0, 3258, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120941', '463645', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12328,CAL2022-10397,CAL2021-00942,_x000D_
CAL2020-04555,CAL2019-10403', 0, 4327, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K612', '467778', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0BVBC01XG', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-02781,CAL2022-05373,CAL2021-01835,CAL2019-003615', 0, 2925, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873212', '249005', 'MONITOR PLANO', 'LENOVO', 'V3K2866', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03920,CAL2022-04086,_x000D_
CAL2021-06147,CAL 2020-03798', 0, 2780, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746406601061', '135070', 'ARMARIO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'CAL2023-09778,CAL2022-09776,CAL2021-00711,CAL2020-002909', 0, 3294, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375552', '434016', 'MONITOR LED', 'DELL', 'SIN SERIE', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12056,CAL2022-03201,CAL2021-04508,CAL2020-01719', 0, 2980, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376839', '452118', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12161,CAL2022-02274,CAL2021-08360,CAL2020-05915', 0, 3123, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376953', '452232', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-02933,CAL2022-05624,CAL2021-01882,CAL2020-03987,CAL2019-02377', 0, 2778, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376853', '452132', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12268,CAL2022-07298,CAL2021-10168,CAL2020-02709', 0, 2691, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037G608', '0', 'MONITOR LED 27 in', 'HP', 'CNC4370T9M', 'HP P27 G5',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3182, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742208971698', '441531', 'CAMARA FOTOGRAFICA DIGITAL', 'CANON', '202032001454', 'DS126481',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'b',
    'CAL2023-04471,LIM2022-23918,LIM2021-26520,LIM2020-50193 / ALMACEN', 0, 3844, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120935', '463639', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12363,CAL2022-10365,CAL2021-00912,_x000D_
CAL2020-04544,CAL2019-10404', 0, 4316, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120952', '463656', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12343,CAL2022-10383,CAL2021-00925,_x000D_
CAL2020-04556,CAL2019-10382', 0, 4336, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375428', '433892', 'MONITOR LED', 'DELL', 'CN0Y01GT742616822WRU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12093,CAL2022-05607,CAL2021-03643,CAL2020-03994,CAL2019-02360', 0, 3002, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377834', '469478', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011H1Q', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04190,CAL2022-05888,_x000D_
CAL2021-07854,CAL2020-05379', 0, 3046, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746461240499', '436591', 'MODULO DE MELAMINA PARA COMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'm',
    'CAL2023-03247,CAL2022-05112,CAL2021-02885,CAL2020-03192,CAL 2019-01299', 0, 3674, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437122582', '149740', 'ESCRITORIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'm',
    'CAL2023-03231,CAL2022-05164, CAL2021-02878,CAL2020-04046', 0, 3619, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '462247854368', '0', 'EQUIPO DE ILUMINACION DE EMERGENCIA', 'OPALUX.', 'SIN SERIE', '9101-220',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'NUEVO 2024', 0, 4267, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882225252594', '434229', 'EXTINTOR', 'BUCKEYE', 'B78703303', '456 10CD',
    'GONZALES FARFAN JORGE SANTIAGO', NULL, 4, 252, 'r',
    'CAL2023-02002,CAL2022-03524, CAL2021-00027,CAL2020-00665, CAL 2019-002037', 0, 3570, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500O956', '505241', 'TECLADO - KEYBOARD', 'DELL', 'CN01GN56M6D0004I001BA01', 'KB-216D',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-09405,CAL2022-02135,CAL2021-06634', 0, 2818, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O433', '434853', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'm',
    'CAL2023-03038,CAL2022-05176,CAL2021-03504,CAL2020-06321', 0, 3723, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740824500845', '0', 'DUPLICADOR DE PUERTOS', 'HP', '5CG250ZPTG', 'HSN - IX02',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'b',
    'CAL2023-03147', 0, 3786, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003348', '451326', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-00870,CAL2022-06119,CAL2021-03846,CAL2020-04218', 0, 2635, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950W670', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE325BBZD', 'PRO SFF 400 G9',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    '14/08/2024, ACT. PECOSA Y FECHA ALTA - SOL. POR: YCHUMPITAZ', 0, 3547, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746403211228', '176564', 'ARCHIVADOR DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'PAZ MORENO PABLO MIGUEL', NULL, 5, 293, 'r',
    'CAL2023-11530,CAL2022-06666,CAL2021-04134,_x000D_
CAL2020-06114', 0, 4136, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746483905536', '317684', 'SILLA GIRATORIA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'm',
    'S-CAL2025-00204, CAL2023-09702,CAL2022-09470,CAL2021-01511,CAL2020-02049', 0, 3771, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740824500841', '0', 'DUPLICADOR DE PUERTOS', 'HP', '5CG249XLZB', 'HSN - IX02',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'b',
    'CAL2023-03297', 0, 3624, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375329', '433793', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168T1G7U', 'E2016H',
    'CALDERON QUEZADA PEDRO EDMUNDO', NULL, 4, 242, 'b',
    'CAL2023-03276,CAL2022-06226,CAL2021-02897,CAL 2020-003180,CAL 2019-001280,CAL 2018-003737', 0, 3678, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895006841', '254701', 'TECLADO - KEYBOARD', 'ADVANCE', 'G8190000746', '5105U',
    'GONZALES FARFAN JORGE SANTIAGO', NULL, 7, 192, 'r',
    'CAL2023-03236,CAL2022-09398,CAL2021-00324,CAL2020-02374', 0, 3682, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377899', '469729', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011H3H', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12208,CAL2022-01921,CAL2021-06790,CAL2020-05016', 0, 3102, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746405920249', '79884', 'ARMARIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'MALAVER AYALA PAMELA CECILIA', NULL, 4, 242, 'r',
    'CAL2023-03270,CAL2022-06206,CAL2021-02817,CAL2020-03194', 0, 3648, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375389', '433853', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168232GU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12212,CAL2022-06539,CAL2021-04377,CAL2020-04861', 0, 3031, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746466950620', '0', 'PANTALLA ECRAN ELÉCTRICO', 'OLIMPO', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10015', 0, 4251, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481876950', '455649', 'SILLA FIJA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'NAVARRO PAJUELO MONICA MAXIMINA', NULL, 4, 265, 'b',
    'CAL2023-08729,CAL2022-04425,CAL2021-05888,CAL2020-00960,CAL2019-10697,CAL2018-08086', 0, 3530, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881879976', '400762', 'MONITOR PLANO', 'HEWLETT PACKARD', '6CM4291Y6S', 'LV1911',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13640,CAL2022-00316,CAL2021-09557,CAL2020-04982', 0, 3074, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J610', '433644', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13652,CAL2022-06316,CAL2021-01252,CAL2020-06940,', 0, 2965, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970132', '97654', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10934,CAL2022-08422,CAL2021-02616,CAL2020-01981', 0, 4280, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877002434', '0', 'MONITOR A COLOR 27 in', 'HP', 'CNK23203JK', 'E27 G4 FHD',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'b',
    'CAL2023-03199', 0, 3776, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377810', '469381', 'MONITOR LED', 'HEWLETT PACKARD', '6CM852206F', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03624,CAL2022-04876,_x000D_
CAL2021-08033,CAL2020-006629', 0, 2772, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873180', '248973', 'MONITOR PLANO', 'LENOVO', 'V3F2191', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-11092,CAL2022-08836,CAL2021-01112', 0, 2739, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '536410020500', '0', 'BIOMBO DE METAL DE 3 CUERPOS', 'SIN MARCA', '', '',
    'ASTORAYME PINCHI LUIGUI GIANCARLO PIERRE', NULL, 6, 252, 'b',
    'NUEVO 2024', 0, 3586, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003279', '451257', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-07678,CAL2022-04375,CAL2021-05600,CAL2020-000617,CAL2019-004849', 0, 2359, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970164', '97686', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10935,CAL2022-08450,CAL2021-02522,CAL2020-02026', 0, 4615, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895001821', '440583', 'TECLADO - KEYBOARD', 'HALION', 'SIN SERIE', '682',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03400,CAL2022-07606,CAL2021-01142,CAL2020-03092,CAL2019-08164', 0, 2886, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881877256', '357181', 'MONITOR PLANO', 'LENOVO', 'SV8GY727', 'THINKVISIONLT1952PWD',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13761,CAL2022-06089,CAL2021-03836,CAL2020-03582', 0, 3168, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U140', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP2273GYV', 'TPA - P001K',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03095', 0, 3376, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554348', '301047', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'm',
    'UBICADO 2024', 0, 4452, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746405923346', '319124', 'ARMARIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RUBIO VALLE JOSE OCTAVIO', NULL, 4, 240, 'r',
    'CAL2023-03116,CAL2022-05141,CAL2021-02874,CAL2020-04063', 0, 3709, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500O863', '505150', 'TECLADO - KEYBOARD', 'DELL', 'CN01GN56M6D0004I03OOA01', 'KB-216D',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-09426,CAL2022-02138,CAL2021-06629', 0, 2826, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376968', '452247', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12144,CAL2022-3852,CAL2021-03368,CAL2020-00024', 0, 2750, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375404', '433868', 'MONITOR LED', 'DELL', 'CN0Y01GT74261682388U', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12094,CAL2022-06336,CAL2021-01757,CAL2020-06957,CAL2019-03165,CAL2018-04423', 0, 3003, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740805006402', '0', 'COMPUTADORA PERSONAL PORTATIL', 'HP', '5CD248CM95', 'ProBook 450 G9',
    'ANDIA BARRUETO STEFANI MILUSKA', NULL, 4, 240, 'b',
    'CAL2023-03138', 0, 3734, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648390F418', '512030', 'SILLA GIRATORIA DE METAL CON BRAZOS', 'SIN MARCA', '', '',
    'RIEGA COLACCI JAIME RONALD', NULL, 4, 300, 'b',
    'CAL2023-13256,CAL2022-06161,CAL2021-06375', 0, 3419, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376998', '452277', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12004,CAL2022-02548,CAL2021-04822,CAL2020-02780', 0, 2669, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003232', '451210', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03484,CAL2022-5977,CAL2021-03217,CAL2020-04377', 0, 2604, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437122575', '149732', 'ESCRITORIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'm',
    'CAL2023-03031,CAL2022-06220,CAL2021-03523,CAL2020-04151', 0, 3336, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746460852317', '151470', 'MODULO DE MADERA PARA MICROCOMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'CAL2023-09780,CAL2022-09774,CAL2021-00737,CAL2020-02928', 0, 3292, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119A031', '259577', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'm',
    'CAL2023-12447,CAL2022-10318,CAL2021-00443,_x000D_
CAL2020-02367,CAL2019-09195', 0, 3617, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '112263860079', '130509', 'REFRIGERADORA ELECTRICA DOMESTICA', 'LG', '703TRJL00140', 'GC-151SA',
    'GONZALES FARFAN JORGE SANTIAGO', NULL, 4, 252, 'r',
    'CAL2023-09711,CAL2022-03746,CAL2021-00603,CAL2020-01891CAL2018-01605', 0, 3582, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437126811', '278549', 'ESCRITORIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'PUMACHAY RUIZ RAUL FRANCISCO', NULL, 4, 261, 'r',
    'CAL2023-09857,CAL2022-09754,CAL2021-02409,CAL2020-002334', 0, 3312, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950Q738', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE250BSTD', 'PRO 400 G9 SFF',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'b',
    'CAL2023-03240', 0, 3661, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746489333830', '433075', 'SILLON GIRATORIO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'MALAVER AYALA PAMELA CECILIA', NULL, 4, 242, 'b',
    'CAL2023-03249,CAL2022-05078,CAL2021-02846,CAL2020-003177,CAL2019-01274', 0, 3647, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950I124', '450527', 'UNIDAD CENTRAL DE PROCESO - CPU', 'LENOVO', 'SIN SERIE', 'THINKCENTRE M910S',
    'VILLANUEVA BRUNO WILLIAMS', NULL, 4, 261, 'b',
    'CAL2023-08679,CAL2022-01698,CAL2021-09245,CAL2020-09785,CAL2019-08534', 0, 3243, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950W631', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE325BC6S', 'PRO SFF 400 G9',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    '14/08/2024, ACT. PECOSA Y FECHA ALTA - SOL. POR: YCHUMPITAZ', 0, 3510, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '952255290411', '0', 'MICROFONO INALAMBRICO DE MANO', 'EW 100 G4-835-S-B', '5183078109', 'EW G4',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-11512', 0, 4278, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119K493', '326464', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'r',
    'CAL2023-011752,CAL2022-09463,CAL2021-02054,_x000D_
CAL2020-010615', 0, 3442, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376367', '451646', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-05469,CAL2022-00942,CAL2021-08250,CAL2020-007712,CAL2019-003070', 0, 3126, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K597', '467816', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0B5YB80Q2', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-05467,CAL2022-00955,CAL2021-08911,CAL2020-06595,', 0, 2917, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746403551067', '475415', 'ARCHIVADOR DE MELAMINA', 'SIN MARCA', '', '',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'r',
    'CAL2023-013233,CAL2022-05127, CAL2021-02857,CAL2020-06314', 0, 3789, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500P515', '507701', 'TECLADO - KEYBOARD', 'HP', 'S/S', 'KU-1156',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-07506,CAL2022-05444,CAL2021-06397,CAL2020-61409', 0, 2951, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377888', '469578', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011J1S', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03500,CAL2022-04844,CAL2021-06298,CAL2020-06698', 0, 3081, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970196', '97718', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10945,CAL2022-08477,CAL2021-02556,CAL2020-02021', 0, 4601, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950Q638', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE250BSYS', 'PRO 400 G9 SFF',
    'CORREA MARREROS LAURA RAQUEL', NULL, 4, 241, 'b',
    'CAL2023-03230', 0, 3615, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746489333907', '449438', 'SILLON GIRATORIO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RUIZ HURTADO ORLANDO AUGUSTO', NULL, 4, 261, 'r',
    'CAL2023-09854,CAL2022-09730,CAL2021-10544,CAL2020-03807', 0, 3232, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500CC70', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', 'BKTAR0CCPJNFPK', 'TPA-P001K',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 2794, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120913', '463617', 'DETECTOR DE HUMO', 'OPALUX', 'S/S', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12332,CAL2022-10398,CAL2021-00928,_x000D_
CAL2020-04522,CAL2019-10405', 0, 4330, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970099', '97621', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10978,CAL2022-08310,CAL2021-02559,CAL2020-02583', 0, 4614, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003441', '451419', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13496,CAL2022-04579,CAL2021-05950,CAL2020-001326,CAL2019-03316', 0, 2630, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376982', '452261', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-10707,CAL2022-02741,_x000D_
CAL2021-06835,CAL2020-05104', 0, 2696, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950W642', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE325BCR7', 'PRO SFF 400 G9',
    'VELÁSQUEZ ZÚÑIGA BERNABÉ ALFREDO', NULL, 4, 261, 'r',
    'NUEVO 2024', 0, 3268, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O407', '434827', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'SANCHEZ BALLADARES JUAN ALBERTO', NULL, 4, 261, 'b',
    'CAL2023-09840,CAL2022-09796,CAL2021-00771,CAL2020-02995', 0, 3298, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950I001', '450404', 'UNIDAD CENTRAL DE PROCESO - CPU', 'LENOVO', 'SIN SERIE', 'THINKCENTRE M910S',
    'GONZALES FARFAN JORGE SANTIAGO', NULL, 7, 192, 'm',
    'CAL2023-03235,CAL2022-09339,CAL2021-05465,CAL2020-10494', 0, 3681, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950X542', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE436BPJG', 'HP PRO SFF 400 G9',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3204, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950X617', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE436BPP7', 'HP PRO SFF 400 G9',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 2798, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003597', '451575', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-07189,CAL2022-04032,CAL2021-04954,_x000D_
CAL2020-04704,CAL2019-01812,CAL2018-02019', 0, 2338, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740805006549', '0', 'COMPUTADORA PERSONAL PORTATIL', 'HP', '5CD248CNG5', 'ProBook 450 G9',
    'LUNA ANDAVIZA EDUARDO ALFREDO', NULL, 4, 241, 'b',
    'CAL2023-03149', 0, 3788, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '952278340516', '449177', 'SISTEMA DE PROYECCION MULTIMEDIA - PROYECTOR MULTIMEDIA', 'EPSON', 'WK4K7701923', 'HC1040',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10020,CAL2022-07887,CAL2021-02511,', 0, 4256, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648390F425', '512037', 'SILLA GIRATORIA DE METAL CON BRAZOS', 'SIN MARCA', '', '',
    'ROJAS ROJAS SANDY KARIN', NULL, 4, 300, 'b',
    'CAL2023-13269,CAL2022-06166,CAL2021-06368,CAL2020-0', 0, 3432, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003448', '451426', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03448,CAL2022-00657,CAL2021-04052,CAL2020-04270', 0, 2904, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003206', '451184', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13529,CAL2022-04635,CAL2021-09748,CAL2020-001428,CAL2019-03381', 0, 2889, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376896', '452175', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12125,CAL2022-03880,CAL2021-07919,CAL2020-05206', 0, 2755, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J574', '433608', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13656,CAL2022-00439,CAL2021-08194,CAL2020-03046,CAL2019-07796,CAL2018-03531', 0, 2955, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003896', '457623', 'TECLADO - KEYBOARD', 'DELL', '08NY1N-PRCD0-7AP-06ZG-A02', 'KB212-B',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13660,CAL2022-00353,CAL2021-06640,CAL2020-05618', 0, 2959, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120948', '463652', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12339,CAL2022-10408,CAL2021-00927,_x000D_
CAL2020-04554,CAL2019-10373', 0, 4335, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377837', '469482', 'MONITOR LED', 'HEWLETT PACKARD', '6CM8522015', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-05462,CAL2022-00933,CAL2021-08221,CAL2020-06589', 0, 3070, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050A395', '440294', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', 'FORZA', 'SIN SERIE', 'SL-1012LCD-U',
    'COSSIO CABRERA ANA YSABEL', NULL, 9, 185, 'b',
    'CAL2023-04441,CAL2022-00484,CAL2021-07671,CAL 2020-05761,CAL 2019-05964', 0, 3842, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500B924', '378308', 'TECLADO - KEYBOARD', 'LENOVO', '1S54Y94244409939E', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03562,CAL2022-06003,CAL2021-02771,CAL2020-06018', 0, 2606, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746460850645', '1471', 'MODULO DE MADERA PARA MICROCOMPUTADORA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CHAVEZ LEGUIA MARIA SANDRA MILAGROS', NULL, 4, 261, 'r',
    'CAL2023-09771,CAL2022-09806,CAL2021-00793,CAL2020-02954', 0, 3276, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970149', '97671', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10972,CAL2022-07894,CAL2021-02647,CAL2020-02590', 0, 4285, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375550', '434014', 'MONITOR LED', 'DELL', 'SIN SERIE', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12092,CAL2022-3856,CAL2021-05740,CAL2020-01175', 0, 3021, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050A783', '459474', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', 'FORZA', 'SIN SERIE', 'SL-1012UL',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12504,CAL2022-08277,CAL2021-00565,_x000D_
CAL2020-03904', 0, 4439, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037A150', '476031', 'MONITOR LED', 'HEWLETT PACKARD', '', 'PRODISPLAY P203',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-005722,CAL2022-01131,CAL2021-07133CAL2020-10336', 0, 3080, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376857', '452136', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12225,CAL2022-06911,CAL2021-03688,CAL2020-07534', 0, 3127, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003443', '451421', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13538,CAL2022-02097,CAL2021-07471,CAL2020-05991', 0, 2809, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120925', '463629', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12345,CAL2022-10373,CAL2021-00926,_x000D_
CAL2020-04527,CAL2019-10368', 0, 4326, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970158', '97680', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10968,CAL2022-08412,CAL2021-02584,CAL2020-01998', 0, 4284, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437456078', '477810', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', '', '',
    'CRIBILLERO GUILLEN JIMMY POOL', NULL, 4, 265, 'b',
    'CAL2023-07530,CAL2022-05468,CAL2021-06410,CAL2020-00951,CAL2019-43293', 0, 3525, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377807', '469378', 'MONITOR LED', 'HEWLETT PACKARD', '6CM85220DS', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-06171,CAL2022-01933,CAL2021-09711,CAL2020-08091', 0, 3048, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500E841', '396956', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BDMEP0AHH6UA0P', 'PS/2',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13483,CAL2022-03062,CAL2021-05633,CAL2020-00492,CAL2019-00512,CAL2018-00049', 0, 2902, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895006905', '303204', 'TECLADO - KEYBOARD', 'ADVANCE', 'G0160013916', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03902,CAL2022-04168,CAL2021-11354,CAL2020-08937', 0, 2880, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K503', '467682', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0B5YB81QS', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04124,CAL2022-05838,CAL2021-07356,CAL2020-05847', 0, 2863, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970201', '97723', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10987,CAL2022-08415,CAL2021-02564,CAL2020-01953', 0, 4298, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003207', '451185', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03166,CAL2022-05163,CAL2021-02877,CAL2020-04045', 0, 2639, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481194898', '434971', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'm',
    'CAL2023-03269,CAL2022-06253,CAL2021-03553,CAL2020-04048', 0, 3609, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881871129', '199731', 'MONITOR PLANO', 'ADVANCE', 'M6789JA005985', 'TFT17W80PS',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-00873,CAL2022-06083,CAL2021-03843,CAL2020-03589', 0, 3044, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U596', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP249NTDG', 'HSA - P010K',
    'HUAMANI MUÑOZ JAVIER WILFREDO', NULL, 4, 240, 'b',
    'CAL2023-03218', 0, 3721, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970188', '97710', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10980,CAL2022-08417,CAL2021-02524,CAL2020-01947', 0, 4290, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740824500842', '0', 'DUPLICADOR DE PUERTOS', 'HP', '5CG249X73Y', 'HSN - IX02',
    'RODRIGUEZ ZAMORA LIDIA MERCEDES', NULL, 4, 241, 'b',
    'CAL2023-03195', 0, 3592, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376991', '452270', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'UBICADO2025,CAL2022-05542,CAL2021-04009,CAL2020-08252,CAL2019-05588,CAL2018-08984', 0, 3113, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746489333809', '433054', 'SILLON GIRATORIO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'VILLAR AMASIFEN GERALDO JACOMO', NULL, 4, 239, 'b',
    'CAL2023-03078,CAL2022-01771,CAL2021-08608,CAL2020-09818', 0, 3391, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003241', '451219', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-12626,CAL2022-04328,CAL2021-05611,_x000D_
CAL 2020-00638,CAL2019-03539,CAL2018-08836', 0, 2395, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554305', '301004', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'SERTZEN BELLIDO WAGNER', NULL, 5, 254, 'r',
    'CAL2023-13307,CAL2022-10555,CAL2021-00317,CAL2020-07011', 0, 4443, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881872272', '247141', 'MONITOR PLANO', 'LENOVO', 'V3K2743', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-00637,CAL2022-01477,CAL2021-08588,CAL2020-09849', 0, 3130, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881876554', '350902', 'MONITOR PLANO', 'LENOVO', 'SV8Z0397', 'THINKVISION L1900P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-02867,CAL2022-02783,CAL2021-00456,CAL2020-02424', 0, 2732, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003589', '451567', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13506,CAL2022-02551,CAL2021-04825,CAL2020-002783', 0, 2849, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950X484', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE436BPP5', 'HP PRO SFF 400 G9',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 2789, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895006909', '303319', 'TECLADO - KEYBOARD', 'ADVANCE', 'G0160015993', '5137-AU',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-03415,CAL2022-11156,CAL2021-09516', 0, 2876, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481199998', '259529', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RUIZ HURTADO ORLANDO AUGUSTO', NULL, 4, 261, 'r',
    'CAL2023-00709,CAL2022-05096,CAL2021-10386,CAL2020-04019', 0, 3235, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U589', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '7CL2480077', 'HSA - C001K',
    'LA ROSA MACHADO WALTER WILTINHO', NULL, 4, 242, 'b',
    'CAL2023-03246', 0, 3663, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746459830432', '520308', 'MÓDULO DE CÓMPUTO DE MELAMINA 50 cm X 70 cm X 78 cm', 'SIN MARCA', '', 'S/M',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'CAL2023-07501,CAL2022-05448,CAL2021-06401', 0, 3538, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037F598', '0', 'MONITOR LED 27 in', 'HP', 'CNC24712Z2', 'E27 G5',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'b',
    'NUEVO 2024', 0, 3448, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895002134', '443872', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SK-8827',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-06419,CAL2022-01435,CAL2021-07162,CAL2020-10324', 0, 2655, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O358', '434778', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'SULCA MOGOLLON JUANA DEYANIRA', NULL, 4, 239, 'm',
    'CAL2023-03041,CAL2022-05082,CAL2021-02845,CAL2020-04147', 0, 3388, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '742223583757', '506956', 'EQUIPO MULTIFUNCIONAL COPIADORA IMPRESORA SCANNER A3 MONOCROMATICA', 'KYOCERA', 'RMU0100646', 'TASKALFA 6003I',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'b',
    'CAL2023-06457,CAL2022-01201,CAL2021-08756', 0, 3454, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375390', '433854', 'MONITOR LED', 'DELL', 'CN0Y01GT74261682307U', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12008,CAL2022-03696,CAL2021-03387,CAL2020-00041', 0, 2987, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050E046', '0', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', '@ FASE INTERNET PROTECTION', 'EL6324800774', 'AUR-1000',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 10, 252, 'b',
    '', 0, 3404, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375555', '434019', 'MONITOR LED', 'DELL', 'CN-OYO1GT-742G1-6821DFU-AO1', 'E2016H',
    'YUCRA TRUJILLO JULIO CESAR', NULL, 4, 261, 'b',
    'CAL2023-12050,CAL2022-06232,CAL2021-03565,CAL2020-04088', 0, 3277, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '112279704784', '429979', 'VENTILADOR ELECTRICO PARA MESA O DE PIE', 'NIKKO', 'SIN SERIE', 'JAPAN',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'b',
    'CAL2023-09837,CAL2022-09714,CAL2021-00751,CAL2020-003111', 0, 3321, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746452030100', '136565', 'MESA DE REUNIONES', 'MDM', 'SIN SERIE', 'SIN MODELO',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'CAL2023-09809,CAL2022-09715,CAL2021-00763,CAL2020-02932', 0, 3260, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050A916', '459607', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', 'FORZA', 'SIN SERIE', 'SL-1012UL',
    'PAZ MORENO PABLO MIGUEL', NULL, 5, 293, 'b',
    'CAL2023-11521,CAL2022-05566,CAL2021-04944,_x000D_
CAL2020-02757', 0, 4140, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J559', '433593', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03098,CAL2022-06211,CAL2021-03533,CAL2020-04155', 0, 3396, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '672223130051', '431146', 'CARRETILLA HIDRAULICA', 'PALETRANS', '16051559/005', 'SIN MODELO',
    'CARDENAS TRUJILLO BLANCA HILDA', NULL, 4, 257, 'r',
    'CAL2023-09743,CAL2022-00149,CAL2021-08878,CAL2020-06818', 0, 3697, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500CC69', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', 'BKTAR0CCPJN9EI', 'TPA-P001K',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3205, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873339', '249142', 'MONITOR PLANO', 'LENOVO', 'V3K3091', '9227-AE1',
    'CORONADO ARAUJO JULIO JOSE', NULL, 4, 192, 'r',
    'CAL2023-02876,CAL2022-06384, CAL2021-01739, CAL 2020-005593, CAL 2019-002250, CAL 2018-004112', 0, 3129, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037B317', '501844', 'MONITOR LED', 'DELL', 'CN0KK3PRBO30009A14YI', 'E2220H',
    'SERNAQUE CHIROQUE CARLOS ALBERTO', NULL, 4, 300, 'b',
    'CAL2023-13245,CAL2022-06153,CAL2021-06379', 0, 3423, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377794', '469360', 'MONITOR LED', 'HEWLETT PACKARD', '6CM9011HR8', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03877,CAL2022-04162,CAL2021-06280,CAL2020-03709', 0, 3103, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500U141', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP2273GZ3', 'TPA - P001K',
    'RUBIO VALLE JOSE OCTAVIO', NULL, 4, 240, 'b',
    'CAL2023-03141', 0, 3713, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746403551064', '475412', 'ARCHIVADOR DE MELAMINA', 'SIN MARCA', '', '',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'r',
    'CAL2023-03085,CAL2022-06192,CAL2021-03602,CAL2020-04114', 0, 3379, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375383', '433847', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168238UU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12197,CAL2022-06511,CAL2021-03895,CAL2020-003454,CAL2019-01420', 0, 3020, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881879560', '400286', 'MONITOR PLANO', 'HEWLETT PACKARD', '6CM4291VKX', 'LV1911',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13626,CAL2022-00040,CAL2021-06987,CAL2020-05635,CAL2019-06186', 0, 3079, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375942', '443958', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-06017,CAL2022-00863,CAL2021-09167,CAL2020-008560,CAL2019-007629', 0, 2715, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003294', '451272', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-13552,CAL2022-02276,CAL2021-08358,CAL2020-05913', 0, 2616, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '952254160020', '313856', 'MEZCLADOR DE SONIDO', 'BEHRINGER', '51002341A8N', 'PMP-4000',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-09995,CAL2022-08499,CAL2021-02635,CAL2020-08304', 0, 4275, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554378', '301077', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-10780,CAL2022-10650,CAL2021-00692,CAL2020-01774', 0, 3568, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376995', '452274', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13447,CAL2022-07621,CAL2021-01320,CAL2020-01531', 0, 3120, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746483904265', '276289', 'SILLA GIRATORIA DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'YUCRA TRUJILLO JULIO CESAR', NULL, 4, 261, 'r',
    'CAL2023-09805,CAL2022-09762,CAL2021-00761,CAL2020-02997', 0, 3279, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970061', '97583', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-11017,CAL2022-08410,CAL2021-02632,CAL2020-02596', 0, 4631, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500P429', '507616', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'SIN SERIE', 'KU-1156',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03583,CAL2022-06985,CAL2021-01567', 0, 2854, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K548', '467728', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0B5YB93JH', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03368,CAL2022-07699,CAL2021-00807,CAL2020-02679', 0, 2948, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J547', '433581', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03394,CAL2022-02302,CAL2021-10731,CAL2020-03669', 0, 2956, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500P428', '507615', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'SIN SERIE', 'KU-1156',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03362,CAL2022-09119,CAL2021-02473', 0, 2853, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746427620030', '0', 'CARRO DE METAL TRANSPORTADOR PLEGABLE CON PLATAFORMA DE METAL', 'TOLSEN', 'SIN SERIE', 'SIN MODELO',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 10, 252, 'b',
    '', 0, 3765, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740805006465', '0', 'COMPUTADORA PERSONAL PORTATIL', 'HP', '5CD248CLPK', 'ProBook 450 G9',
    'CORREA MARREROS LAURA RAQUEL', NULL, 4, 241, 'b',
    'CAL2023-03226', 0, 3601, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119L571', '327660', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'PAZ MORENO PABLO MIGUEL', NULL, 5, 293, 'm',
    'CAL2023-11517,CAL2022-05595,CAL2021-04133,_x000D_
CAL2020-06131', 0, 4150, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437120893', '99067', 'ESCRITORIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'm',
    'CAL2023-03145,CAL2022-05153,CAL2021-03505,CAL2020-04069', 0, 3684, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K563', '467743', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0ALAAE2FR', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13479,CAL2022-04135,CAL2021-06198,CAL2020-006738', 0, 2855, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J629', '433663', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-07364,CAL2022-03412,CAL2021-05180,CAL2020-00884,CAL2019-00019', 0, 2969, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375348', '433812', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168230CU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13792,CAL2022-06466,CAL2021-04400,CAL2020-03517', 0, 2989, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375323', '433787', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168216WU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12113,CAL2022-05360,CAL2021-01817,CAL2020-005491,CAL2019-01368', 0, 3026, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J587', '433621', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13654,CAL2022-05659,CAL2021-01871,CAL2019-02420', 0, 2966, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K527', '467708', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0B5YB90O3', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04701,CAL2022-01296,CAL2021-07003,CAL2020-06565,', 0, 2932, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877002617', '0', 'MONITOR A COLOR 27 in', 'HP', 'CNK238179B', 'E27 G4 FHD',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03022', 0, 3343, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003381', '451359', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13509, CAL2022-02035,CAL2021-07509,CAL2020-05956', 0, 2391, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746406601060', '135069', 'ARMARIO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'r',
    'CAL2023-005764,CAL2022-01575,CAL2021-08676_x000D_
CAL2020-11726', 0, 3768, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '112236140323', '500058', 'EQUIPO PARA AIRE ACONDICIONADO TIPO DOMESTICO DE 24000 BTU TIPO SPLIT PARED', 'LG', '009TAYVBS770', 'VM242H8',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'b',
    'CAL2023-02095,CAL2022-O8487,CAL2021-00206', 0, 4268, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877004100', '0', 'MONITOR A COLOR DE 24 in', 'HP', 'CN42420G5H', 'E24 G4 FHD',
    'HUAMANI MUÑOZ JAVIER WILFREDO', NULL, 4, 240, 'b',
    'CAL2023-03207', 0, 3737, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003197', '451175', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13546,CAL2022-02032,CAL2021-07426,CAL2020-05965', 0, 2814, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J514', '433548', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'GUTIERREZ CHUMPITAZ LUCIO JUAN', NULL, 4, 261, 'b',
    'CAL2023-09858,CAL2022-09703,CAL2021-00352,CAL2020-02970', 0, 3257, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375351', '433815', 'MONITOR LED', 'DELL', 'CN0Y01GT7426167T32PU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12201,CAL2022-05000,CAL2021-04332,CAL2020-04845', 0, 2986, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873416', '249220', 'MONITOR PLANO', 'LENOVO', 'V3K3070', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-06330,CAL2022-01708,CAL2021-09239,CAL2020-09801,CAL2019-08522,', 0, 2782, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554293', '300992', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 5, 252, 'r',
    'CAL2022-10553,CAL2021-00672,CAL2020-06103', 0, 4444, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003302', '451280', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13533,CAL2022-02088,CAL2021-08350,CAL2020-05921', 0, 2807, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895005540', '250236', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'KU-0225',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-01655,CAL2022-01365,CAL2021-08986,CAL2020-09582,CAL2019-08938', 0, 2637, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873292', '249093', 'MONITOR PLANO', 'LENOVO', 'V3K2634', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-13601,CAL2022-06315,CAL2021-01289,CAL2020-06930,', 0, 3153, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '112279706227', '0', 'VENTILADOR ELECTRICO DE PIE DE 3 VELOCIDADES', 'IMACO', 'S/S', 'FS1645P',
    'CHAVEZ LEGUIA MARIA SANDRA MILAGROS', NULL, 4, 261, 'r',
    'NUEVO 2024', 0, 3320, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481195795', '455389', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RIEGA COLACCI JAIME RONALD', NULL, 4, 300, 'm',
    'CAL2023-13251,CAL2022-06155,CAL2021-02052,CAL2020-10623', 0, 3420, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950Q702', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE250BT33', 'PRO 400 G9 SFF',
    'DE LA CUBA AIVAR JULIO CESAR', NULL, 4, 264, 'r',
    'CAL2023-06467', 0, 3463, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120928', '463632', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12341,CAL2022-10375,CAL2021-00921,_x000D_
CAL2020-04541,CAL2019-09506', 0, 4322, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746406264829', '0', 'ARMARIO DE MELAMINA', 'EDGAR', '', '',
    'MALAVER AYALA PAMELA CECILIA', NULL, 4, 242, 'r',
    'CAL2023-05213', 0, 3650, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437455575', '464281', 'ESCRITORIO DE MELAMINA', 'SIN MARCA', '', '',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'm',
    'CAL2023-03086,CAL2022-09445,CAL2021-00002,_x000D_', 0, 3346, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376868', '452147', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12119,CAL2022-02283,CAL2021-07484,CAL2020-06404', 0, 2753, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376924', '452203', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'CHAVEZ LEGUIA MARIA SANDRA MILAGROS', NULL, 4, 261, 'b',
    'CAL2023-05552,CAL2022-01799,CAL2021-08207,CAL2020-06756', 0, 3272, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746408640009', '303287', 'ATRIL DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10010,CAL2022-07889,_x000D_
CAL2021-02512,CAL2020-01952', 0, 4254, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950I020', '450423', 'UNIDAD CENTRAL DE PROCESO - CPU', 'LENOVO', 'SIN SERIE', 'THINKCENTRE M910S',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'CAL2023-05918,CAL2022-01553,CAL2021-09367CAL2020-08805', 0, 3293, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '462247854364', '0', 'EQUIPO DE ILUMINACION DE EMERGENCIA', 'OPALUX.', 'SIN SERIE', '9101-220',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'NUEVO 2024', 0, 4261, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J484', '433518', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13651,CAL2022-05761,CAL2021-03299,CAL2020-07029,CAL2019-02320', 0, 2970, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '462247854365', '0', 'EQUIPO DE ILUMINACION DE EMERGENCIA', 'OPALUX.', 'SIN SERIE', '9101-220',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'NUEVO 2024', 0, 4259, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K621', '467787', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0BVBC007G', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03903,CAL2022-04169,CAL2021-11353,CAL 2020-08938', 0, 2856, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003261', '451239', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13540,CAL2022-02560,CAL2021-04911,CAL2020-02775', 0, 2813, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746449320038', '21098', 'MESA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'CAL2023-09839,CAL2022-09732,CAL2021-00345,CAL2020-02937', 0, 3264, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746481191141', '111207', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'HUAMANI MUÑOZ JAVIER WILFREDO', NULL, 4, 240, 'm',
    'CAL2023-03214,CAL2022-06284,CAL2021-10193,CAL2020-04057', 0, 3718, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882225250594', '106550', 'EXTINTOR', 'FIRE MASTER', 'MPI-30', '274',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'b',
    'CAL2023-005762,CAL2022-0293,CAL2021-09582_x000D_
CAL2020-06816', 0, 3763, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500P240', '505523', 'TECLADO - KEYBOARD', 'DELL', 'CN0F2JV2LO3000470CJJ', 'KB-219B',
    'ROJAS ROJAS SANDY KARIN', NULL, 4, 300, 'b',
    'CAL2023-13267,CAL2022-06162,CAL2021-06372,CAL2020-47761', 0, 3430, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437121197', '110736', 'ESCRITORIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CORONADO ARAUJO JULIO JOSE', NULL, 4, 192, 'r',
    'CAL2023-01900,CAL2022-09460,CAL2021-00232_x000D_', 0, 3518, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377775', '469252', 'MONITOR LED', 'HEWLETT PACKARD', '6CM85220BD', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-09361,CAL2022-04955,_x000D_
CAL2021-08081,CAL2020-06510', 0, 3066, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500P241', '505524', 'TECLADO - KEYBOARD', 'DELL', 'CN01GN56M6D0004I06QMA01', 'KB-219B',
    'RECUENCO COICO FLOR DE MARIA', NULL, 4, 300, 'b',
    'CAL2023-13261,CAL2022-06172,CAL2021-06384,CAL2020-047763', 0, 3436, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970126', '97648', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10970,CAL2022-08390,CAL2021-02664,CAL2020-01958', 0, 4282, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '322260610044', '183320', 'HORNO MICROONDAS', 'SAMSUNG', '08627DAQ800052', 'AGE-614W',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'r',
    'CAL2023-09835,CAL2022-09734,CAL2021-00349,CAL2020-02933', 0, 3266, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '952255290215', '322204', 'MICROFONO INALAMBRICO', 'SENNHEISER', '4500015906', 'EW100-G3',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'b',
    'CAL2023-09991,CAL2022-08494,CAL2021-02637', 0, 4273, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740841002286', '382671', 'IMPRESORA LASER', 'KYOCERA', 'SIN SERIE', 'FS-4200DN',
    'COSSIO CABRERA ANA YSABEL', NULL, 4, 299, 'm',
    'CAL2023-00108,CAL2022-07320,CAL2021-04212,CAL 2020-09136,CAL2019-04302', 0, 3814, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746441181782', '243584', 'ESTANTE DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RUIZ HURTADO ORLANDO AUGUSTO', NULL, 4, 261, 'r',
    'CAL2023-09844,CAL2022-8899,CAL2021-00336,CAL2020-02961', 0, 3231, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375339', '433803', 'MONITOR LED', 'DELL', 'CN0Y01GT742616822VJU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12095,CAL2022-02844,CAL2021-03475,CAL2020-00223', 0, 3015, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500J585', '433619', 'TECLADO - KEYBOARD', 'DELL', 'SIN SERIE', 'KB216P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-03560,CAL2022-03036,CAL2021-06606,CAL2020-00600,CAL2019-02145,CAL2018-00453', 0, 2974, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880375313', '433777', 'MONITOR LED', 'DELL', 'CN0Y01GT7426168226VU', 'E2016H',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12052,CAL2022-03403,CAL2021-05177,CAL2020-00877,CAL2019-00026', 0, 3035, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '536410020501', '0', 'BIOMBO DE METAL DE 3 CUERPOS', 'SIN MARCA', '', '',
    'ASTORAYME PINCHI LUIGUI GIANCARLO PIERRE', NULL, 6, 252, 'b',
    'NUEVO 2024', 0, 3587, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377032', '452311', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12138,CAL2022-01498,CAL2021-08561,CAL2020-10572', 0, 3162, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746403551065', '475413', 'ARCHIVADOR DE MELAMINA', 'SIN MARCA', '', '',
    'HUERTAS ANGULO MAGNOLIA DEL ROSARIO', NULL, 4, 242, 'r',
    'CAL2023-03295,CAL 2022-05081,CAL2021-02843,CAL2020-03186', 0, 3627, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970116', '97638', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-10984,CAL2022-08308,CAL2021-02609,CAL2020-02028', 0, 4286, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746441520887', '0', 'ESTANTE DE MELAMINA', 'EDGAR', 'SIN SERIE', 'SIN MODELO',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'CAL2023-09678', 0, 3501, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500N074', '477228', 'TECLADO - KEYBOARD', 'HP DESKJET', 'S/S', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-05854,CAL2022-00504,CAL2021-08476CAL2020-08479', 0, 2934, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003384', '451362', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13482,CAL2022-02199,CAL2021-07503,CAL2020-06478', 0, 2907, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500O869', '505156', 'TECLADO - KEYBOARD', 'DELL', 'CN01GN56M6D0004I06ZMA01', 'KB-216D',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04246,CAL2022-02503,CAL2021-05293', 0, 2825, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746432370075', '28077', 'CREDENZA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'r',
    'CAL2023-06458,CAL2022-01207,CAL2021-08757,_x000D_
CAL2020-10951', 0, 3441, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746487970067', '97589', 'SILLON FIJO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-11280,CAL2022-05476,CAL2021-03976,_x000D_
CAL2020-08280', 0, 4613, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746437120489', '1105', 'ESCRITORIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'r',
    'CAL2023-06459,CAL2022-10924, CAL2021-02226,_x000D_
CAL2020-05768', 0, 3482, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037F704', '0', 'MONITOR LED 27 in', 'HP', 'CNC24712ZB', 'E27 G5',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    '', 0, 3548, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377864', '469509', 'MONITOR LED', 'HEWLETT PACKARD', '6CM852207F', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13622,CAL2021-07835,CAL2020-05276', 0, 3097, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746403890655', '218233', 'ARCHIVADOR DE METAL', 'LIMMSA', 'SIN SERIE', 'SIN MODELO',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'r',
    'CAL2023-06455,CAL2022-01206,CAL2021-08758,_x000D_
CAL2020-10949', 0, 3443, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037G699', '0', 'MONITOR LED 27 in', 'HP', 'CNC4370TJW', 'HP P27 G5',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3192, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050D158', '0', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', 'LEGRAND', 'W09TH00424', '',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    'NUEVO 2025', 0, 3550, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740824500844', '0', 'DUPLICADOR DE PUERTOS', 'HP', '5CG250ZPW9', 'HSN - IX02',
    'MALAVER AYALA PAMELA CECILIA', NULL, 4, 242, 'b',
    'CAL2023-03267', 0, 3643, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '882221120939', '463643', 'DETECTOR DE HUMO', 'OPALUX', '', 'S/M',
    'ZAMUDIO TRINIDAD JORGE AURELIO', NULL, 5, 254, 'b',
    'CAL2023-12337,CAL2022-10415,CAL2021-00902,_x000D_
CAL2020-04551,CAL2019-10401', 0, 4314, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740800501009', '0', 'CAPTURADOR DE IMAGEN - SCANNER', 'AVISION', '107336838120084', 'AD8150',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'b',
    'NUEVO', 0, 3445, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003192', '451170', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-13491,CAL2022-04494,CAL2021-05100,CAL2020-001469,CAL2019-003376', 0, 2620, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K557', '467737', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0ALAAE2LE', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-04108', 0, 2942, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003594', '451572', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13501,CAL2022-04551,CAL2021-05086,CAL2020-00380,CAL2019-03349', 0, 2629, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740877002582', '0', 'MONITOR A COLOR 27 in', 'HP', 'CNK23816G8', 'E27 G4 FHD',
    'LA ROSA MACHADO WALTER WILTINHO', NULL, 4, 242, 'b',
    'CAL2023-03255_x000D_', 0, 3654, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500BQ17', '0', 'TECLADO - KEYBOARD CON PUERTO USB + MOUSE CON PUERTO USB', 'HP', '9CP252RW69', 'H5A-P010K',
    'TAPIA VELARDE SAMUEL ARMANDO', NULL, 4, 265, 'b',
    '', 0, 3546, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037F692', '0', 'MONITOR LED 27 in', 'HP', 'CNC3321YFK', 'E27 G5',
    'CARDENAS TRUJILLO BLANCA HILDA', NULL, 4, 257, 'b',
    '', 0, 3688, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O452', '434872', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'SERTZEN BELLIDO WAGNER', NULL, 7, 198, 'm',
    'CAL2023-1371,CAL2022-06684,CAL2021-04197,CAL2020-06045', 0, 3639, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740881873436', '249241', 'MONITOR PLANO', 'LENOVO', 'V3K2664', '9227-AE1',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-09800,CAL2022-09748,_x000D_
CAL2021-00722,CAL 2020-02991', 0, 3148, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089950X481', '0', 'UNIDAD CENTRAL DE PROCESO - CPU', 'HP', '4CE436BPK5', 'HP PRO SFF 400 G9',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3208, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377823', '469447', 'MONITOR LED', 'HEWLETT PACKARD', '6CM85220GG', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13616,CAL2022-05873,CAL2021-09853,CAL2020-05834', 0, 3092, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119F526', '273475', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'CHOMBO GOMEZ ERIKA MARIA', NULL, 4, 264, 'r',
    'CAL2023-06450,CAL2022-01196,CAL2021-08760,_x000D_
CAL2020-10945', 0, 3459, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895002136', '443875', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SK-8827',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'r',
    'CAL2023-05842,CAL2022-00517,CAL2021-08698,CAL2020-08510', 0, 2661, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746405923273', '319046', 'ARMARIO DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ANDIA BARRUETO STEFANI MILUSKA', NULL, 4, 240, 'r',
    'CAL2023-03123,CAL2022-06205,CAL2021-03527,CAL2020-04099', 0, 3726, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74648119O379', '434799', 'SILLA FIJA DE MADERA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'BALOIS CRISPIN MIGUEL ANGEL', NULL, 4, 240, 'm',
    'CAL2023-03121,CAL2022-05155,CAL2021-03520,CAL2020-03185', 0, 3741, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500O867', '505154', 'TECLADO - KEYBOARD', 'DELL', 'CN01GN56M6D0004I01D5A01', 'KB-216D',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-04273,CAL2022-02531,CAL2021-05283', 0, 2816, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746489333813', '433058', 'SILLON GIRATORIO DE METAL', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'ESPINOZA CRAVERO BRECHMAN', NULL, 4, 239, 'b',
    'CAL2023-03097,CAL2022-05191,CAL2021-03599,CAL2020-04110', 0, 3342, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74088037G606', '0', 'MONITOR LED 27 in', 'HP', 'CNC4370TVN', 'HP P27 G5',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 4, 192, 'b',
    '', 0, 3179, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746450560250', '513750', 'MESA DE MELAMINA', 'SIN MARCA', 'SIN SERIE', 'SIN MODELO',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'b',
    'CAL2023-11729,CAL2022-08491,LIM2021-38040', 0, 4272, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K524', '467705', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0B5YB92VN', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-03377,CAL2022-07667,CAL2021-00829,CAL2020-01582', 0, 2861, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050E010', '0', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', '@ FASE INTERNET PROTECTION', 'EL6324800792', 'AUR-1000',
    'DE LA CRUZ CRUZ HERNAN FRANCISCO', NULL, 10, 252, 'b',
    '', 0, 3199, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003225', '451203', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13539,CAL2022-02281,CAL2021-07482,CAL2020-06402', 0, 2812, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003196', '451174', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13489,CAL2022-03434,CAL2021-05186,CAL2020-00860,CAL2019-00098', 0, 2903, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '746482554268', '300967', 'SILLA FIJA DE OTRO MATERIAL', 'POLINPLAST', 'SIN SERIE', 'SIN MODELO',
    'SERTZEN BELLIDO WAGNER', NULL, 5, 254, 'r',
    'CAL2023-12531,CAL2022-10559,CAL2021-00408,_x000D_
CAL2020-03817', 0, 4453, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880377774', '469248', 'MONITOR LED', 'HEWLETT PACKARD', '6CM8522070', 'V203P',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-13610,CAL2022-04867,CAL2021-08007,CAL2020-06621', 0, 3004, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '46220050A881', '459572', 'ACUMULADOR DE ENERGIA - EQUIPO DE UPS', 'FORZA', 'SIN SERIE', 'SL-1012UL',
    'LEON SANCHEZ NALDA JANET', NULL, 4, 261, 'b',
    'CAL2023-09761,CAL2022-09801,CAL2021-00783,CAL2020-002952', 0, 3289, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '74089500K538', '467719', 'TECLADO - KEYBOARD', 'HEWLETT PACKARD', 'BEXJL0ALAAE2Q7', 'KU-1469',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12574,CAL2022-05822,CAL2021-07370,_x000D_
CAL2020-05396', 0, 2939, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740880376810', '452089', 'MONITOR LED', 'LENOVO', 'SIN SERIE', 'THINKVISION E2054',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'b',
    'CAL2023-12195,CAL2022-04971,CAL2021-04314,CAL2020-003431,CAL2019-01522,', 0, 2682, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '952204090004', '279342', 'ANALIZADOR INTEGRADO DE RED RDSI - ISDN', 'POLYCOM', '8210100040E8CM', 'HDXPUNK',
    'RODRIGUEZ DELGADO LUIS FERNANDO', NULL, 5, 297, 'r',
    'CAL2023-9983,CAL2022-09507,_x000D_
CAL2021-02583,CAL2020-03405', 0, 4277, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

INSERT INTO bienes (
    codigo_patrimonial, cod_barras, denominacion, marca, serie, modelo,
    responsable, usuario_registro, sede_id, unidad_id, estado,
    observaciones, verificado, cal_2025, fecha_registro
) VALUES (
    '740895003224', '451202', 'TECLADO - KEYBOARD', 'LENOVO', 'SIN SERIE', 'SIN MODELO',
    'FERNANDEZ HUAYAS AMALIA FELICITA', NULL, 4, 192, 'm',
    'CAL2023-13553,CAL2022-02296,CAL2021-07557,CAL2020-06407', 0, 2601, NOW()
) ON CONFLICT (codigo_patrimonial) DO UPDATE SET
    cal_2025 = EXCLUDED.cal_2025;

-- ========================================
-- Total: 1405 registros
-- ========================================
