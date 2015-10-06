clear all
close all
clc

region(1).name='Fpz';
region(1).location='midline';
region(1).sensors={'MEG0811','MEG0821'};

region(2).name='Fp1';
region(2).location='left';
region(2).sensors={'MEG0511','MEG0521','MEG0531'};

region(3).name='Fp2';
region(3).location='right';
region(3).sensors={'MEG0911','MEG0921','MEG0941'};

region(4).name='AFz';
region(4).location='midline';
region(4).sensors={'MEG1011'};

region(5).name='AF3';
region(5).location='left';
region(5).sensors={'MEG0611'};

region(6).name='AF4';
region(6).location='right';
region(6).sensors={'MEG1021'};

region(7).name='AF5';
region(7).location='left';
region(7).sensors={'MEG0541'};

region(8).name='AF6';
region(8).location='right';
region(8).sensors={'MEG0931'};

region(9).name='AF7';
region(9).location='left';
region(9).sensors={'MEG0311'};

region(10).name='AF8';
region(10).location='right';
region(10).sensors={'MEG1211'};

region(11).name='Fz';
region(11).location='midline';
region(11).sensors={'MEG0621'};

region(12).name='F1';
region(12).location='left';
region(12).sensors={'MEG0641'};

region(13).name='F2';
region(13).location='right';
region(13).sensors={'MEG1031'};

region(14).name='F3';
region(14).location='left';
region(14).sensors={'MEG0331'};

region(15).name='F4';
region(15).location='right';
region(15).sensors={'MEG1241'};

region(16).name='F5';
region(16).location='left';
region(16).sensors={'MEG0321'};

region(17).name='F6';
region(17).location='right';
region(17).sensors={'MEG1231'};

region(18).name='F7';
region(18).location='left';
region(18).sensors={'MEG0341'};

region(19).name='F8';
region(19).location='right';
region(19).sensors={'MEG1221'};

region(20).name='F9';
region(20).location='left';
region(20).sensors={'MEG0121','MEG0111'};

region(21).name='F10';
region(21).location='right';
region(21).sensors={'MEG1411','MEG1421'};

region(22).name='FCz';
region(22).location='midline';
region(22).sensors={'MEG0631','MEG1041'};

region(23).name='FC1';
region(23).location='left';
region(23).sensors={'MEG0421'};

region(24).name='FC2';
region(24).location='right';
region(24).sensors={'MEG1111'};

region(25).name='FC3';
region(25).location='left';
region(25).sensors={'MEG0411'};

region(26).name='FC4';
region(26).location='right';
region(26).sensors={'MEG1121'};

region(27).name='FC5';
region(27).location='left';
region(27).sensors={'MEG0221'};

region(28).name='FC6';
region(28).location='right';
region(28).sensors={'MEG1311'};

region(29).name='FT7';
region(29).location='left';
region(29).sensors={'MEG0211'};

region(30).name='FT8';
region(30).location='right';
region(30).sensors={'MEG1321'};

region(31).name='FT9';
region(31).location='left';
region(31).sensors={'MEG0131'};

region(32).name='FT10';
region(32).location='right';
region(32).sensors={'MEG1441'};

region(33).name='Cz';
region(33).location='midline';
region(33).sensors={'MEG0711','MEG0721'};

region(34).name='C1';
region(34).location='left';
region(34).sensors={'MEG0431'};

region(35).name='C2';
region(35).location='right';
region(35).sensors={'MEG1141'};

region(36).name='C3';
region(36).location='left';
region(36).sensors={'MEG0441'};

region(37).name='C4';
region(37).location='right';
region(37).sensors={'MEG1131'};

region(38).name='C5';
region(38).location='left';
region(38).sensors={'MEG0231'};

region(39).name='C6';
region(39).location='right';
region(39).sensors={'MEG1341'};

region(40).name='C5';
region(40).location='left';
region(40).sensors={'MEG0231'};

region(41).name='C6';
region(41).location='right';
region(41).sensors={'MEG1341'};

region(42).name='T7';
region(42).location='left';
region(42).sensors={'MEG0241'};

region(43).name='T8';
region(43).location='right';
region(43).sensors={'MEG1331'};

region(44).name='T9';
region(44).location='left';
region(44).sensors={'MEG1511', 'MEG1541'};

region(45).name='T10';
region(45).location='right';
region(45).sensors={'MEG2621', 'MEG2611'};

region(46).name='TP7';
region(46).location='left';
region(46).sensors={'MEG1611'};

region(47).name='TP8';
region(47).location='right';
region(47).sensors={'MEG2421'};

region(48).name='TP9';
region(48).location='left';
region(48).sensors={'MEG1521'};

region(49).name='TP10';
region(49).location='right';
region(49).sensors={'MEG2641'};

region(50).name='CPz';
region(50).location='midline';
region(50).sensors={'MEG0741','MEG0731'};

region(51).name='CP1';
region(51).location='left';
region(51).sensors={'MEG1821'};

region(52).name='CP2';
region(52).location='right';
region(52).sensors={'MEG2211'};

region(53).name='CP3';
region(53).location='left';
region(53).sensors={'MEG1811'};

region(54).name='CP4';
region(54).location='right';
region(54).sensors={'MEG2221'};

region(55).name='CP5';
region(55).location='left';
region(55).sensors={'MEG1621'};

region(56).name='CP6';
region(56).location='right';
region(56).sensors={'MEG2411'};

region(57).name='Pz';
region(57).location='midline';
region(57).sensors={'MEG1831','MEG2011','MEG2021','MEG2241'};

region(58).name='P1';
region(58).location='left';
region(58).sensors={'MEG1841'};

region(59).name='P2';
region(59).location='right';
region(59).sensors={'MEG2231'};

region(60).name='P3';
region(60).location='left';
region(60).sensors={'MEG1631'};

region(61).name='P4';
region(61).location='right';
region(61).sensors={'MEG2441'};

region(62).name='P5';
region(62).location='left';
region(62).sensors={'MEG1641'};

region(63).name='P6';
region(63).location='right';
region(63).sensors={'MEG2431'};

region(64).name='P7';
region(64).location='left';
region(64).sensors={'MEG1721'};

region(65).name='P8';
region(65).location='right';
region(65).sensors={'MEG2521'};

region(66).name='P9';
region(66).location='left';
region(66).sensors={'MEG1531'};

region(67).name='P10';
region(67).location='right';
region(67).sensors={'MEG2631'};

region(68).name='POz';
region(68).location='midline';
region(68).sensors={'MEG2031','MEG2041'};

region(69).name='PO3';
region(69).location='left';
region(69).sensors={'MEG1911'};

region(70).name='PO4';
region(70).location='right';
region(70).sensors={'MEG2311'};

region(71).name='PO7';
region(71).location='left';
region(71).sensors={'MEG1941'};

region(72).name='PO8';
region(72).location='right';
region(72).sensors={'MEG2321'};

region(73).name='PO9';
region(73).location='left';
region(73).sensors={'MEG1711','MEG1731'};

region(74).name='PO10';
region(74).location='right';
region(74).sensors={'MEG2511','MEG253'};

region(75).name='Oz';
region(75).location='midline';
region(75).sensors={'MEG2111','MEG2121','MEG2131','MEG2141'};

region(76).name='O1';
region(76).location='left';
region(76).sensors={'MEG1921','MEG1931','MEG1741'};

region(77).name='O2';
region(77).location='right';
region(77).sensors={'MEG2341','MEG2331','MEG2541'};

save('MEG1010regiondef.mat')