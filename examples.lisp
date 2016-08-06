;;; (ql:quickload "quickproject")
;;; (quickproject:make-project "/home/orm/work/programmieren/lisp/blahblah/" :depends-on '("svg-export"))
;;; danach den code in docbooktotex.lisp schreiben, emacs neu starten und:
;;; (ql:quickload "blahblah")

(in-package #:svg-export)


(points->svg
 '((0.0 93.0) (12.0 94.0) (17.0 90.0) (24.0 95.0) (28.0 91.0) (34.0 85.0)
   (36.0 96.0) (39.0 92.0) (46.0 86.0) (48.0 97.0) (50.0 93.0) (51.0 82.0)
   (58.0 87.0) (59.0 98.0) (61.0 94.0) (62.0 83.0) (68.0 77.0) (70.0 88.0)
   (72.0 99.0) (73.0 84.0) (76.0 95.0) (80.0 78.0) (82.0 89.0) (84.0 85.0)
   (85.0 74.0) (86.0 102.0) (86.0 100.0) (91.0 96.0) (92.0 79.0) (93.0 90.0)
   (94.0 103.0) (94.0 101.0) (95.0 86.0) (96.0 75.0) (102.0 69.0) (103.0 97.0)
   (104.0 80.0) (106.0 91.0) (107.0 76.0) (108.0 104.0) (108.0 102.0)
   (110.0 87.0) (114.0 70.0) (115.0 98.0) (116.0 81.0) (117.0 105.0)
   (117.0 103.0) (118.0 77.0) (119.0 66.0) (120.0 94.0) (120.0 92.0) (124.0 99.0)
   (125.0 88.0) (126.0 71.0) (127.0 82.0) (128.0 95.0) (128.0 93.0) (129.0 78.0)
   (130.0 67.0) (131.0 106.0) (131.0 104.0) (133.5 100.0) (136.0 105.0)
   (136.5 61.0) (137.0 89.0) (138.0 72.0) (139.0 101.0) (140.0 83.0) (141.0 68.0)
   (142.0 96.0) (142.0 94.0) (144.0 79.0) (148.0 106.0) (148.5 62.0) (149.0 90.0)
   (150.0 73.0) (151.0 97.0) (151.0 95.0) (152.0 69.0) (153.0 102.0) (153.5 58.0)
   (154.0 86.0) (154.0 84.0) (158.0 91.0) (159.0 80.0) (160.0 107.0) (160.5 63.0)
   (161.0 74.0) (162.0 87.0) (162.0 85.0) (163.0 70.0) (164.0 103.0) (164.5 59.0)
   (165.0 98.0) (165.0 96.0) (167.5 92.0) (170.0 97.0) (170.5 53.0) (171.0 81.0)
   (172.0 108.0) (172.5 64.0) (173.0 93.0) (174.0 75.0) (175.0 104.0)
   (175.5 60.0) (176.0 88.0) (176.0 86.0) (178.0 71.0) (182.0 98.0) (182.5 54.0)
   (183.0 82.0) (184.0 109.0) (184.5 65.0) (185.0 89.0) (185.0 87.0)
   (186.0 105.0) (186.5 61.0) (187.0 94.0) (187.5 50.0) (188.0 78.0) (188.0 76.0)
   (192.0 83.0) (193.0 72.0) (194.0 99.0) (194.5 55.0) (195.0 110.0) (195.5 66.0)
   (196.0 79.0) (196.0 77.0) (197.0 106.0) (197.5 62.0) (198.0 95.0) (198.5 51.0)
   (199.0 90.0) (199.0 88.0) (201.5 84.0) (204.0 89.0) (204.5 45.0) (205.0 73.0)
   (206.0 100.0) (206.5 56.0) (207.0 85.0) (208.0 111.0) (208.5 67.0)
   (209.0 96.0) (209.5 52.0) (210.0 80.0) (210.0 78.0) (212.0 107.0) (212.5 63.0)
   (216.0 90.0) (216.5 46.0) (217.0 74.0) (218.0 101.0) (218.5 57.0) (219.0 81.0)
   (219.0 79.0) (220.0 97.0) (220.5 53.0) (221.0 86.0) (221.5 42.0) (222.0 114.0)
   (222.0 112.0) (222.5 70.0) (222.5 68.0) (226.0 75.0) (227.0 108.0)
   (227.5 64.0) (228.0 91.0) (228.5 47.0) (229.0 102.0) (229.5 58.0)
   (230.0 115.0) (230.0 113.0) (230.5 71.0) (230.5 69.0) (231.0 98.0)
   (231.5 54.0) (232.0 87.0) (232.5 43.0) (233.0 82.0) (233.0 80.0) (238.0 81.0)
   (238.5 37.0) (239.0 109.0) (239.5 65.0) (240.0 92.0) (240.5 48.0)
   (242.0 103.0) (242.5 59.0) (243.0 88.0) (243.5 44.0) (244.0 116.0)
   (244.0 114.0) (244.5 72.0) (244.5 70.0) (246.0 99.0) (246.5 55.0) (250.0 82.0)
   (250.5 38.0) (251.0 110.0) (251.5 66.0) (252.0 93.0) (252.5 49.0)
   (253.0 117.0) (253.0 115.0) (253.5 73.0) (253.5 71.0) (254.0 89.0)
   (254.5 45.0) (255.0 78.0) (255.5 34.0) (256.0 106.0) (256.0 104.0)
   (256.5 62.0) (256.5 60.0) (260.0 111.0) (260.5 67.0) (261.0 100.0)
   (261.5 56.0) (262.0 83.0) (262.5 39.0) (263.0 94.0) (263.5 50.0) (264.0 107.0)
   (264.0 105.0) (264.5 63.0) (264.5 61.0) (265.0 90.0) (265.5 46.0) (266.0 79.0)
   (266.5 35.0) (267.0 118.0) (267.0 116.0) (267.5 74.0) (267.5 72.0)
   (270.0 68.0) (272.5 73.0) (273.0 101.0) (273.5 57.0) (274.0 84.0) (274.5 40.0)
   (275.5 69.0) (276.0 95.0) (276.5 51.0) (277.0 80.0) (277.5 36.0) (278.0 108.0)
   (278.0 106.0) (278.5 64.0) (278.5 62.0) (280.0 91.0) (280.5 47.0) (284.5 74.0)
   (285.0 102.0) (285.5 58.0) (286.0 85.0) (286.5 41.0) (287.0 109.0)
   (287.0 107.0) (287.5 65.0) (287.5 63.0) (288.0 81.0) (288.5 37.0) (289.5 70.0)
   (290.0 98.0) (290.0 96.0) (290.5 54.0) (290.5 52.0) (294.0 103.0) (294.5 59.0)
   (295.0 92.0) (295.5 48.0) (296.5 75.0) (297.0 86.0) (297.5 42.0) (298.0 99.0)
   (298.0 97.0) (298.5 55.0) (298.5 53.0) (299.0 82.0) (299.5 38.0) (300.5 71.0)
   (301.0 110.0) (301.0 108.0) (301.5 66.0) (301.5 64.0) (304.0 60.0)
   (306.5 65.0) (307.0 93.0) (307.5 49.0) (308.5 76.0) (309.5 61.0) (310.0 87.0)
   (310.5 43.0) (311.5 72.0) (312.0 100.0) (312.0 98.0) (312.5 56.0) (312.5 54.0)
   (314.0 83.0) (314.5 39.0) (318.5 66.0) (319.0 94.0) (319.5 50.0) (320.5 77.0)
   (321.0 101.0) (321.0 99.0) (321.5 57.0) (321.5 55.0) (322.5 73.0) (323.5 62.0)
   (324.0 90.0) (324.0 88.0) (324.5 46.0) (324.5 44.0) (328.0 95.0) (328.5 51.0)
   (329.0 84.0) (329.5 40.0) (330.5 67.0) (331.5 78.0) (332.0 91.0) (332.0 89.0)
   (332.5 47.0) (332.5 45.0) (333.5 74.0) (334.5 63.0) (335.0 102.0)
   (335.0 100.0) (335.5 58.0) (335.5 56.0) (338.0 52.0) (340.5 57.0) (341.0 85.0)
   (341.5 41.0) (342.5 68.0) (343.5 53.0) (344.5 79.0) (345.5 64.0) (346.0 92.0)
   (346.0 90.0) (346.5 48.0) (346.5 46.0) (348.5 75.0) (352.5 58.0) (353.0 86.0)
   (353.5 42.0) (354.5 69.0) (355.0 93.0) (355.0 91.0) (355.5 49.0) (355.5 47.0)
   (356.5 65.0) (357.5 54.0) (358.5 82.0) (358.5 80.0) (362.0 87.0) (362.5 43.0)
   (363.5 76.0) (364.5 59.0) (365.5 70.0) (366.5 83.0) (366.5 81.0) (367.5 66.0)
   (368.5 55.0) (369.0 94.0) (369.0 92.0) (369.5 50.0) (369.5 48.0) (374.5 49.0)
   (375.5 77.0) (376.5 60.0) (378.5 71.0) (379.5 56.0) (380.5 84.0) (380.5 82.0)
   (382.5 67.0) (386.5 50.0) (387.5 78.0) (388.5 61.0) (389.5 85.0) (389.5 83.0)
   (390.5 57.0) (391.5 46.0) (392.5 74.0) (392.5 72.0) (396.5 79.0) (397.5 68.0)
   (398.5 51.0) (399.5 62.0) (400.5 75.0) (400.5 73.0) (401.5 58.0) (402.5 47.0)
   (403.5 86.0) (403.5 84.0) (409.5 69.0) (410.5 52.0) (412.5 63.0) (413.5 48.0)
   (414.5 76.0) (414.5 74.0) (416.5 59.0) (421.5 70.0) (422.5 53.0) (423.5 77.0)
   (423.5 75.0) (424.5 49.0) (426.5 66.0) (426.5 64.0) (430.5 71.0) (431.5 60.0)
   (433.5 54.0) (434.5 67.0) (434.5 65.0) (435.5 50.0) (437.5 78.0) (437.5 76.0)
   (443.5 61.0) (446.5 55.0) (448.5 68.0) (448.5 66.0) (450.5 51.0) (455.5 62.0)
   (457.5 69.0) (457.5 67.0) (460.5 58.0) (460.5 56.0) (464.5 63.0) (465.5 52.0)
   (468.5 59.0) (468.5 57.0) (471.5 70.0) (471.5 68.0) (477.5 53.0) (482.5 60.0)
   (482.5 58.0) (489.5 54.0) (491.5 61.0) (491.5 59.0) (498.5 55.0) (505.5 62.0)
   (505.5 60.0)))

(svg->points :infile #P "/tmp/test.svg")
