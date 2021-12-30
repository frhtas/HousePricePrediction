final counties = [
  "Esenyurt",
  "Beşiktaş",
  "Pendik",
  "Küçükçekmece",
  "Bahçelievler",
  "Üsküdar",
  "Kadıköy",
  "Sarıyer",
  "Bakırköy",
  "Şişli",
];

final roomCounts = {
  "Esenyurt": [
    "3+1",
    "1+1",
    "2+1",
    "3.5+1",
    "Stüdyo",
    "3+2",
    "1 Oda",
    "4+1",
    "5+2",
    "4+2"
  ],
  "Beşiktaş": [
    "4+1",
    "3+1",
    "2+1",
    "1+1",
    "3+2",
    "5+1",
    "Stüdyo",
    "4+2",
    "2+2",
    "5+2"
  ],
  "Pendik": [
    "2+1",
    "Stüdyo",
    "3+1",
    "3.5+1",
    "1+1",
    "1.5+1",
    "4+1",
    "1 Oda",
    "3+2",
    "6+2"
  ],
  "Küçükçekmece": [
    "1+1",
    "3+1",
    "2+1",
    "2.5+1",
    "3+2",
    "1.5+1",
    "4+1",
    "Stüdyo",
    "2+2",
    "1 Oda",
    "5+1",
    "5+2",
    "4+2"
  ],
  "Bahçelievler": [
    "3+1",
    "2+1",
    "4+1",
    "1.5+1",
    "1+1",
    "4+2",
    "Stüdyo",
    "1 Oda",
    "5+1",
    "2+2",
    "7+2",
    "5+2"
  ],
  "Üsküdar": [
    "2+1",
    "4+2",
    "3+1",
    "5+1",
    "4.5+1",
    "4+1",
    "1+1",
    "2.5+1",
    "Stüdyo",
    "1 Oda"
  ],
  "Kadıköy": [
    "4+2",
    "4+1",
    "3+1",
    "2+1",
    "5+1",
    "6+2",
    "6+1",
    "Stüdyo",
    "1+1",
    "5+2"
  ],
  "Sarıyer": [
    "3+1",
    "2+1",
    "4+1",
    "1+1",
    "Stüdyo",
    "3.5+1",
    "2.5+1",
    "5+1",
    "6+1",
    "3+2",
    "4+2",
    "1 Oda"
  ],
  "Bakırköy": [
    "1+1",
    "3+1",
    "2+1",
    "5+2",
    "4+1",
    "Stüdyo",
    "6+1",
    "4+2",
    "4.5+1",
    "5+1",
    "1.5+1",
    "3+2",
    "6+2"
  ],
  "Şişli": [
    "1+1",
    "2+1",
    "3+1",
    "3+2",
    "2+0",
    "Stüdyo",
    "4+1",
    "5+2",
    "8+ Oda",
    "4+2"
  ],
  "null": ["1"]
};

final buildingAges = {
  "Esenyurt": [
    "16-20",
    "0 (Yeni)",
    "5-10",
    "4",
    "11-15",
    "3",
    "2",
    "1",
    "21 Ve Üzeri"
  ],
  "Beşiktaş": [
    "4",
    "21 Ve Üzeri",
    "2",
    "16-20",
    "11-15",
    "1",
    "5-10",
    "0 (Yeni)"
  ],
  "Pendik": [
    "2",
    "5-10",
    "3",
    "21 Ve Üzeri",
    "16-20",
    "11-15",
    "4",
    "0 (Yeni)",
    "1"
  ],
  "Küçükçekmece": [
    "11-15",
    "5-10",
    "0 (Yeni)",
    "16-20",
    "4",
    "21 Ve Üzeri",
    "2",
    "3",
    "1"
  ],
  "Bahçelievler": [
    "5-10",
    "4",
    "16-20",
    "3",
    "0 (Yeni)",
    "21 Ve Üzeri",
    "2",
    "11-15",
    "1"
  ],
  "Üsküdar": [
    "21 Ve Üzeri",
    "5-10",
    "0 (Yeni)",
    "11-15",
    "4",
    "16-20",
    "2",
    "1",
    "3",
  ],
  "Kadıköy": [
    "3",
    "21 Ve Üzeri",
    "0 (Yeni)",
    "2",
    "11-15",
    "4",
    "1",
    "5-10",
  ],
  "Sarıyer": [
    "11-15",
    "2",
    "21 Ve Üzeri",
    "4",
    "16-20",
    "0 (Yeni)",
    "5-10",
    "1",
    "3"
  ],
  "Bakırköy": [
    "0 (Yeni)",
    "21 Ve Üzeri",
    "5-10",
    "11-15",
    "2",
    "3",
    "16-20",
    "1",
    "4"
  ],
  "Şişli": [
    "5-10",
    "11-15",
    "16-20",
    "21 Ve Üzeri",
    "4",
    "2",
    "0 (Yeni)",
    "3",
    "1"
  ],
  "null": ["1"]
};

final heatingTypes = {
  "Esenyurt": [
    "Merkezi Doğalgaz",
    "Kombi Doğalgaz",
    "Doğalgaz Sobalı",
    "Merkezi (Pay Ölçer)",
    "Kat Kaloriferi",
    "Klimalı",
    "Sobalı"
  ],
  "Beşiktaş": [
    "Merkezi (Pay Ölçer)",
    "Merkezi Doğalgaz",
    "Kombi Doğalgaz",
    "Yerden Isıtma"
  ],
  "Pendik": [
    "Merkezi (Pay Ölçer)",
    "Merkezi Doğalgaz",
    "Kombi Doğalgaz",
    "Doğalgaz Sobalı",
    "Sobalı",
    "Isıtma Yok",
    "Yerden Isıtma"
  ],
  "Küçükçekmece": [
    "Merkezi Doğalgaz",
    "Kombi Doğalgaz",
    "Merkezi (Pay Ölçer)",
    "Sobalı",
    "Doğalgaz Sobalı",
    "Klimalı",
    "Yerden Isıtma",
    "Isıtma Yok"
  ],
  "Bahçelievler": [
    "Kombi Doğalgaz",
    "Merkezi (Pay Ölçer)",
    "Merkezi Doğalgaz",
    "Klimalı",
    "Yerden Isıtma",
    "Isıtma Yok",
    "Kat Kaloriferi"
  ],
  "Üsküdar": [
    "Kombi Doğalgaz",
    "Merkezi Doğalgaz",
    "Merkezi (Pay Ölçer)",
    "Isıtma Yok",
    "Yerden Isıtma"
  ],
  "Kadıköy": [
    "Merkezi (Pay Ölçer)",
    "Kombi Doğalgaz",
    "Merkezi Doğalgaz",
    "Yerden Isıtma",
    "Isıtma Yok",
    "Klimalı"
  ],
  "Sarıyer": [
    "Kombi Doğalgaz",
    "Merkezi (Pay Ölçer)",
    "Isıtma Yok",
    "Kombi Fueloil",
    "Yerden Isıtma",
    "Doğalgaz Sobalı",
    "Merkezi Doğalgaz",
    "Klimalı"
  ],
  "Bakırköy": [
    "Merkezi Doğalgaz",
    "Kombi Doğalgaz",
    "Merkezi (Pay Ölçer)",
    "Klimalı",
    "Yerden Isıtma",
    "Isıtma Yok"
  ],
  "Şişli": [
    "Kombi Doğalgaz",
    "Merkezi Doğalgaz",
    "Yerden Isıtma",
    "Klimalı",
    "Merkezi (Pay Ölçer)",
    "Sobalı",
    "Kat Kaloriferi"
  ],
  "null": ["1"]
};
