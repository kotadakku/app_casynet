
class DataAddress{
  String? keysNameRegion;
  String? id;
  String? nameRegion;
  late Map<String, List<City>> cities;

  DataAddress(this.keysNameRegion, this.id, this.nameRegion, this.cities);

  DataAddress.fromJson(Map<String, dynamic> json) {
    this.id =  json["id"];
    this.nameRegion = json["name"];
    this.cities = Map.from(json["cities"]).map((k, v) => MapEntry<String, List<City>>(k, List<City>.from(v.map((x) => City.fromJson(x)))));
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameRegion,
    "cities": Map.from(cities).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
  };
  
}
class City{
  String? entityId;
  String? regionId;
  String? city;

  City(this.entityId, this.regionId, this.city);

  City.fromJson(Map<String, dynamic> json) {

    this.entityId = json["entity_id"];
    this.regionId = json["region_id"];
    this.city = json["city"];
  }

  Map<String, dynamic> toJson() => {
    "entity_id": entityId,
    "region_id": regionId,
    "city": city,
  };
}

const Map<String, dynamic> dataAddress = {
  "An Giang":{
    "id":"709",
    "name":"An Giang",
    "cities":{
      "Long Xuy\u00ean":[
        {
          "entity_id":"644",
          "region_id":"709",
          "city":"Long Xuy\u00ean"
        }
      ],
      "Th\u00e0nh ph\u1ed1 Ch\u00e2u \u0110\u1ed1c":[
        {
          "entity_id":"645",
          "region_id":"709",
          "city":"Th\u00e0nh ph\u1ed1 Ch\u00e2u \u0110\u1ed1c"
        }
      ],
      "An Ph\u00fa":[
        {
          "entity_id":"646",
          "region_id":"709",
          "city":"An Ph\u00fa"
        }
      ],
      "T\u00e2n Ch\u00e2u":[
        {
          "entity_id":"647",
          "region_id":"709",
          "city":"T\u00e2n Ch\u00e2u"
        }
      ],
      "Ph\u00fa T\u00e2n":[
        {
          "entity_id":"648",
          "region_id":"709",
          "city":"Ph\u00fa T\u00e2n"
        }
      ],
      "Ch\u00e2u Ph\u00fa":[
        {
          "entity_id":"649",
          "region_id":"709",
          "city":"Ch\u00e2u Ph\u00fa"
        }
      ],
      "T\u1ecbnh Bi\u00ean":[
        {
          "entity_id":"650",
          "region_id":"709",
          "city":"T\u1ecbnh Bi\u00ean"
        }
      ],
      "Tri T\u00f4n":[
        {
          "entity_id":"651",
          "region_id":"709",
          "city":"Tri T\u00f4n"
        }
      ],
      "Ch\u00e2u Th\u00e0nh":[
        {
          "entity_id":"652",
          "region_id":"709",
          "city":"Ch\u00e2u Th\u00e0nh"
        }
      ],
      "Ch\u1ee3 M\u1edbi":[
        {
          "entity_id":"653",
          "region_id":"709",
          "city":"Ch\u1ee3 M\u1edbi"
        }
      ],
      "Tho\u1ea1i S\u01a1n":[
        {
          "entity_id":"654",
          "region_id":"709",
          "city":"Tho\u1ea1i S\u01a1n"
        }
      ]
    }
  },
  "B\u00e0 R\u1ecba - V\u0169ng T\u00e0u":{
    "id":"697",
    "name":"B\u00e0 R\u1ecba - V\u0169ng T\u00e0u",
    "cities":{
      "V\u0169ng T\u00e0u":[
        {
          "entity_id":"548",
          "region_id":"697",
          "city":"V\u0169ng T\u00e0u"
        }
      ],
      "B\u00e0 R\u1ecba":[
        {
          "entity_id":"549",
          "region_id":"697",
          "city":"B\u00e0 R\u1ecba"
        }
      ],
      "Ch\u00e2u \u0110\u1ee9c":[
        {
          "entity_id":"550",
          "region_id":"697",
          "city":"Ch\u00e2u \u0110\u1ee9c"
        }
      ],
      "Xuy\u00ean M\u1ed9c":[
        {
          "entity_id":"551",
          "region_id":"697",
          "city":"Xuy\u00ean M\u1ed9c"
        }
      ],
      "Long \u0110i\u1ec1n":[
        {
          "entity_id":"552",
          "region_id":"697",
          "city":"Long \u0110i\u1ec1n"
        }
      ],
      "\u0110\u1ea5t \u0110\u1ecf":[
        {
          "entity_id":"553",
          "region_id":"697",
          "city":"\u0110\u1ea5t \u0110\u1ecf"
        }
      ],
      "Ph\u00fa M\u1ef9":[
        {
          "entity_id":"554",
          "region_id":"697",
          "city":"Ph\u00fa M\u1ef9"
        }
      ],
      "C\u00f4n \u0110\u1ea3o":[
        {
          "entity_id":"555",
          "region_id":"697",
          "city":"C\u00f4n \u0110\u1ea3o"
        }
      ]
    }
  },
  "B\u1eafc Giang":{
    "id":"644",
    "name":"B\u1eafc Giang",
    "cities":{
      "Th\u00e0nh ph\u1ed1 B\u1eafc Giang":[
        {
          "entity_id":"163",
          "region_id":"644",
          "city":"Th\u00e0nh ph\u1ed1 B\u1eafc Giang"
        }
      ],
      "Y\u00ean Th\u1ebf":[
        {
          "entity_id":"164",
          "region_id":"644",
          "city":"Y\u00ean Th\u1ebf"
        }
      ],
      "T\u00e2n Y\u00ean":[
        {
          "entity_id":"165",
          "region_id":"644",
          "city":"T\u00e2n Y\u00ean"
        }
      ],
      "L\u1ea1ng Giang":[
        {
          "entity_id":"166",
          "region_id":"644",
          "city":"L\u1ea1ng Giang"
        }
      ],
      "L\u1ee5c Nam":[
        {
          "entity_id":"167",
          "region_id":"644",
          "city":"L\u1ee5c Nam"
        }
      ],
      "L\u1ee5c Ng\u1ea1n":[
        {
          "entity_id":"168",
          "region_id":"644",
          "city":"L\u1ee5c Ng\u1ea1n"
        }
      ],
      "S\u01a1n \u0110\u1ed9ng":[
        {
          "entity_id":"169",
          "region_id":"644",
          "city":"S\u01a1n \u0110\u1ed9ng"
        }
      ],
      "Y\u00ean D\u0169ng":[
        {
          "entity_id":"170",
          "region_id":"644",
          "city":"Y\u00ean D\u0169ng"
        }
      ],
      "Vi\u1ec7t Y\u00ean":[
        {
          "entity_id":"171",
          "region_id":"644",
          "city":"Vi\u1ec7t Y\u00ean"
        }
      ],
      "Hi\u1ec7p H\u00f2a":[
        {
          "entity_id":"172",
          "region_id":"644",
          "city":"Hi\u1ec7p H\u00f2a"
        }
      ]
    }
  },
  "B\u1eafc K\u1ea1n":{
    "id":"626",
    "name":"B\u1eafc K\u1ea1n",
    "cities":{
      "Th\u00e0nh ph\u1ed1 B\u1eafc K\u1ea1n":[
        {
          "entity_id":"55",
          "region_id":"626",
          "city":"Th\u00e0nh ph\u1ed1 B\u1eafc K\u1ea1n"
        }
      ],
      "P\u00e1c N\u1eb7m":[
        {
          "entity_id":"56",
          "region_id":"626",
          "city":"P\u00e1c N\u1eb7m"
        }
      ],
      "Ba B\u1ec3":[
        {
          "entity_id":"57",
          "region_id":"626",
          "city":"Ba B\u1ec3"
        }
      ],
      "Ng\u00e2n S\u01a1n":[
        {
          "entity_id":"58",
          "region_id":"626",
          "city":"Ng\u00e2n S\u01a1n"
        }
      ],
      "B\u1ea1ch Th\u00f4ng":[
        {
          "entity_id":"59",
          "region_id":"626",
          "city":"B\u1ea1ch Th\u00f4ng"
        }
      ],
      "Ch\u1ee3 \u0110\u1ed3n":[
        {
          "entity_id":"60",
          "region_id":"626",
          "city":"Ch\u1ee3 \u0110\u1ed3n"
        }
      ],
      "Ch\u1ee3 M\u1edbi":[
        {
          "entity_id":"61",
          "region_id":"626",
          "city":"Ch\u1ee3 M\u1edbi"
        }
      ],
      "Na R\u00ec":[
        {
          "entity_id":"62",
          "region_id":"626",
          "city":"Na R\u00ec"
        }
      ]
    }
  },
  "B\u1ea1c Li\u00eau":{
    "id":"715",
    "name":"B\u1ea1c Li\u00eau",
    "cities":{
      "Th\u00e0nh ph\u1ed1 B\u1ea1c Li\u00eau":[
        {
          "entity_id":"698",
          "region_id":"715",
          "city":"Th\u00e0nh ph\u1ed1 B\u1ea1c Li\u00eau"
        }
      ],
      "H\u1ed3ng D\u00e2n":[
        {
          "entity_id":"699",
          "region_id":"715",
          "city":"H\u1ed3ng D\u00e2n"
        }
      ],
      "Ph\u01b0\u1edbc Long":[
        {
          "entity_id":"700",
          "region_id":"715",
          "city":"Ph\u01b0\u1edbc Long"
        }
      ],
      "V\u0129nh L\u1ee3i":[
        {
          "entity_id":"701",
          "region_id":"715",
          "city":"V\u0129nh L\u1ee3i"
        }
      ],
      "Gi\u00e1 Rai":[
        {
          "entity_id":"702",
          "region_id":"715",
          "city":"Gi\u00e1 Rai"
        }
      ],
      "\u0110\u00f4ng H\u1ea3i":[
        {
          "entity_id":"703",
          "region_id":"715",
          "city":"\u0110\u00f4ng H\u1ea3i"
        }
      ],
      "Ho\u00e0 B\u00ecnh":[
        {
          "entity_id":"704",
          "region_id":"715",
          "city":"Ho\u00e0 B\u00ecnh"
        }
      ]
    }
  },
  "B\u1eafc Ninh":{
    "id":"647",
    "name":"B\u1eafc Ninh",
    "cities":{
      "Th\u00e0nh ph\u1ed1 B\u1eafc Ninh":[
        {
          "entity_id":"195",
          "region_id":"647",
          "city":"Th\u00e0nh ph\u1ed1 B\u1eafc Ninh"
        }
      ],
      "Y\u00ean Phong":[
        {
          "entity_id":"196",
          "region_id":"647",
          "city":"Y\u00ean Phong"
        }
      ],
      "Qu\u1ebf V\u00f5":[
        {
          "entity_id":"197",
          "region_id":"647",
          "city":"Qu\u1ebf V\u00f5"
        }
      ],
      "Ti\u00ean Du":[
        {
          "entity_id":"198",
          "region_id":"647",
          "city":"Ti\u00ean Du"
        }
      ],
      "T\u1eeb S\u01a1n":[
        {
          "entity_id":"199",
          "region_id":"647",
          "city":"T\u1eeb S\u01a1n"
        }
      ],
      "Thu\u1eadn Th\u00e0nh":[
        {
          "entity_id":"200",
          "region_id":"647",
          "city":"Thu\u1eadn Th\u00e0nh"
        }
      ],
      "Gia B\u00ecnh":[
        {
          "entity_id":"201",
          "region_id":"647",
          "city":"Gia B\u00ecnh"
        }
      ],
      "L\u01b0\u01a1ng T\u00e0i":[
        {
          "entity_id":"202",
          "region_id":"647",
          "city":"L\u01b0\u01a1ng T\u00e0i"
        }
      ]
    }
  },
  "B\u1ebfn Tre":{
    "id":"703",
    "name":"B\u1ebfn Tre",
    "cities":{
      "B\u1ebfn Tre":[
        {
          "entity_id":"606",
          "region_id":"703",
          "city":"B\u1ebfn Tre"
        }
      ],
      "Ch\u00e2u Th\u00e0nh":[
        {
          "entity_id":"607",
          "region_id":"703",
          "city":"Ch\u00e2u Th\u00e0nh"
        }
      ],
      "Ch\u1ee3 L\u00e1ch":[
        {
          "entity_id":"608",
          "region_id":"703",
          "city":"Ch\u1ee3 L\u00e1ch"
        }
      ],
      "M\u1ecf C\u00e0y Nam":[
        {
          "entity_id":"609",
          "region_id":"703",
          "city":"M\u1ecf C\u00e0y Nam"
        }
      ],
      "Gi\u1ed3ng Tr\u00f4m":[
        {
          "entity_id":"610",
          "region_id":"703",
          "city":"Gi\u1ed3ng Tr\u00f4m"
        }
      ],
      "B\u00ecnh \u0110\u1ea1i":[
        {
          "entity_id":"611",
          "region_id":"703",
          "city":"B\u00ecnh \u0110\u1ea1i"
        }
      ],
      "Ba Tri":[
        {
          "entity_id":"612",
          "region_id":"703",
          "city":"Ba Tri"
        }
      ],
      "Th\u1ea1nh Ph\u00fa":[
        {
          "entity_id":"613",
          "region_id":"703",
          "city":"Th\u1ea1nh Ph\u00fa"
        }
      ],
      "M\u1ecf C\u00e0y B\u1eafc":[
        {
          "entity_id":"614",
          "region_id":"703",
          "city":"M\u1ecf C\u00e0y B\u1eafc"
        }
      ]
    }
  },
  "B\u00ecnh D\u01b0\u01a1ng":{
    "id":"694",
    "name":"B\u00ecnh D\u01b0\u01a1ng",
    "cities":{
      "Th\u1ee7 D\u1ea7u M\u1ed9t":[
        {
          "entity_id":"528",
          "region_id":"694",
          "city":"Th\u1ee7 D\u1ea7u M\u1ed9t"
        }
      ],
      "B\u00e0u B\u00e0ng":[
        {
          "entity_id":"529",
          "region_id":"694",
          "city":"B\u00e0u B\u00e0ng"
        }
      ],
      "D\u1ea7u Ti\u1ebfng":[
        {
          "entity_id":"530",
          "region_id":"694",
          "city":"D\u1ea7u Ti\u1ebfng"
        }
      ],
      "B\u1ebfn C\u00e1t":[
        {
          "entity_id":"531",
          "region_id":"694",
          "city":"B\u1ebfn C\u00e1t"
        }
      ],
      "Ph\u00fa Gi\u00e1o":[
        {
          "entity_id":"532",
          "region_id":"694",
          "city":"Ph\u00fa Gi\u00e1o"
        }
      ],
      "T\u00e2n Uy\u00ean":[
        {
          "entity_id":"533",
          "region_id":"694",
          "city":"T\u00e2n Uy\u00ean"
        }
      ],
      "D\u0129 An":[
        {
          "entity_id":"534",
          "region_id":"694",
          "city":"D\u0129 An"
        }
      ],
      "Thu\u1eadn An":[
        {
          "entity_id":"535",
          "region_id":"694",
          "city":"Thu\u1eadn An"
        }
      ],
      "B\u1eafc T\u00e2n Uy\u00ean":[
        {
          "entity_id":"536",
          "region_id":"694",
          "city":"B\u1eafc T\u00e2n Uy\u00ean"
        }
      ]
    }
  },
  "B\u00ecnh Ph\u01b0\u1edbc":{
    "id":"690",
    "name":"B\u00ecnh Ph\u01b0\u1edbc",
    "cities":{
      "Ph\u01b0\u1edbc Long":[
        {
          "entity_id":"508",
          "region_id":"690",
          "city":"Ph\u01b0\u1edbc Long"
        }
      ],
      "\u0110\u1ed3ng Xo\u00e0i":[
        {
          "entity_id":"509",
          "region_id":"690",
          "city":"\u0110\u1ed3ng Xo\u00e0i"
        }
      ],
      "B\u00ecnh Long":[
        {
          "entity_id":"510",
          "region_id":"690",
          "city":"B\u00ecnh Long"
        }
      ],
      "B\u00f9 Gia M\u1eadp":[
        {
          "entity_id":"511",
          "region_id":"690",
          "city":"B\u00f9 Gia M\u1eadp"
        }
      ],
      "L\u1ed9c Ninh":[
        {
          "entity_id":"512",
          "region_id":"690",
          "city":"L\u1ed9c Ninh"
        }
      ],
      "B\u00f9 \u0110\u1ed1p":[
        {
          "entity_id":"513",
          "region_id":"690",
          "city":"B\u00f9 \u0110\u1ed1p"
        }
      ],
      "H\u1edbn Qu\u1ea3n":[
        {
          "entity_id":"514",
          "region_id":"690",
          "city":"H\u1edbn Qu\u1ea3n"
        }
      ],
      "\u0110\u1ed3ng Ph\u00fa":[
        {
          "entity_id":"515",
          "region_id":"690",
          "city":"\u0110\u1ed3ng Ph\u00fa"
        }
      ],
      "B\u00f9 \u0110\u0103ng":[
        {
          "entity_id":"516",
          "region_id":"690",
          "city":"B\u00f9 \u0110\u0103ng"
        }
      ],
      "Ch\u01a1n Th\u00e0nh":[
        {
          "entity_id":"517",
          "region_id":"690",
          "city":"Ch\u01a1n Th\u00e0nh"
        }
      ],
      "Ph\u00fa Ri\u1ec1ng":[
        {
          "entity_id":"518",
          "region_id":"690",
          "city":"Ph\u00fa Ri\u1ec1ng"
        }
      ]
    }
  },
  "B\u00ecnh Thu\u1eadn":{
    "id":"680",
    "name":"B\u00ecnh Thu\u1eadn",
    "cities":{
      "Phan Thi\u1ebft":[
        {
          "entity_id":"436",
          "region_id":"680",
          "city":"Phan Thi\u1ebft"
        }
      ],
      "La Gi":[
        {
          "entity_id":"437",
          "region_id":"680",
          "city":"La Gi"
        }
      ],
      "Tuy Phong":[
        {
          "entity_id":"438",
          "region_id":"680",
          "city":"Tuy Phong"
        }
      ],
      "B\u1eafc B\u00ecnh":[
        {
          "entity_id":"439",
          "region_id":"680",
          "city":"B\u1eafc B\u00ecnh"
        }
      ],
      "H\u00e0m Thu\u1eadn B\u1eafc":[
        {
          "entity_id":"440",
          "region_id":"680",
          "city":"H\u00e0m Thu\u1eadn B\u1eafc"
        }
      ],
      "H\u00e0m Thu\u1eadn Nam":[
        {
          "entity_id":"441",
          "region_id":"680",
          "city":"H\u00e0m Thu\u1eadn Nam"
        }
      ],
      "T\u00e1nh Linh":[
        {
          "entity_id":"442",
          "region_id":"680",
          "city":"T\u00e1nh Linh"
        }
      ],
      "\u0110\u1ee9c Linh":[
        {
          "entity_id":"443",
          "region_id":"680",
          "city":"\u0110\u1ee9c Linh"
        }
      ],
      "H\u00e0m T\u00e2n":[
        {
          "entity_id":"444",
          "region_id":"680",
          "city":"H\u00e0m T\u00e2n"
        }
      ],
      "Ph\u00fa Qu\u00ed":[
        {
          "entity_id":"445",
          "region_id":"680",
          "city":"Ph\u00fa Qu\u00ed"
        }
      ]
    }
  },
  "B\u00ecnh \u0110\u1ecbnh":{
    "id":"672",
    "name":"B\u00ecnh \u0110\u1ecbnh",
    "cities":{
      "Qui Nh\u01a1n":[
        {
          "entity_id":"400",
          "region_id":"672",
          "city":"Qui Nh\u01a1n"
        }
      ],
      "An L\u00e3o":[
        {
          "entity_id":"401",
          "region_id":"672",
          "city":"An L\u00e3o"
        }
      ],
      "Ho\u00e0i Nh\u01a1n":[
        {
          "entity_id":"402",
          "region_id":"672",
          "city":"Ho\u00e0i Nh\u01a1n"
        }
      ],
      "Ho\u00e0i \u00c2n":[
        {
          "entity_id":"403",
          "region_id":"672",
          "city":"Ho\u00e0i \u00c2n"
        }
      ],
      "Ph\u00f9 M\u1ef9":[
        {
          "entity_id":"404",
          "region_id":"672",
          "city":"Ph\u00f9 M\u1ef9"
        }
      ],
      "V\u0129nh Th\u1ea1nh":[
        {
          "entity_id":"405",
          "region_id":"672",
          "city":"V\u0129nh Th\u1ea1nh"
        }
      ],
      "T\u00e2y S\u01a1n":[
        {
          "entity_id":"406",
          "region_id":"672",
          "city":"T\u00e2y S\u01a1n"
        }
      ],
      "Ph\u00f9 C\u00e1t":[
        {
          "entity_id":"407",
          "region_id":"672",
          "city":"Ph\u00f9 C\u00e1t"
        }
      ],
      "An Nh\u01a1n":[
        {
          "entity_id":"408",
          "region_id":"672",
          "city":"An Nh\u01a1n"
        }
      ],
      "Tuy Ph\u01b0\u1edbc":[
        {
          "entity_id":"409",
          "region_id":"672",
          "city":"Tuy Ph\u01b0\u1edbc"
        }
      ],
      "V\u00e2n Canh":[
        {
          "entity_id":"410",
          "region_id":"672",
          "city":"V\u00e2n Canh"
        }
      ]
    }
  },
  "C\u00e0 Mau":{
    "id":"716",
    "name":"C\u00e0 Mau",
    "cities":{
      "Th\u00e0nh ph\u1ed1 C\u00e0 Mau":[
        {
          "entity_id":"705",
          "region_id":"716",
          "city":"Th\u00e0nh ph\u1ed1 C\u00e0 Mau"
        }
      ],
      "U Minh":[
        {
          "entity_id":"706",
          "region_id":"716",
          "city":"U Minh"
        }
      ],
      "Th\u1edbi B\u00ecnh":[
        {
          "entity_id":"707",
          "region_id":"716",
          "city":"Th\u1edbi B\u00ecnh"
        }
      ],
      "Tr\u1ea7n V\u0103n Th\u1eddi":[
        {
          "entity_id":"708",
          "region_id":"716",
          "city":"Tr\u1ea7n V\u0103n Th\u1eddi"
        }
      ],
      "C\u00e1i N\u01b0\u1edbc":[
        {
          "entity_id":"709",
          "region_id":"716",
          "city":"C\u00e1i N\u01b0\u1edbc"
        }
      ],
      "\u0110\u1ea7m D\u01a1i":[
        {
          "entity_id":"710",
          "region_id":"716",
          "city":"\u0110\u1ea7m D\u01a1i"
        }
      ],
      "N\u0103m C\u0103n":[
        {
          "entity_id":"711",
          "region_id":"716",
          "city":"N\u0103m C\u0103n"
        }
      ],
      "Ph\u00fa T\u00e2n":[
        {
          "entity_id":"712",
          "region_id":"716",
          "city":"Ph\u00fa T\u00e2n"
        }
      ],
      "Ng\u1ecdc Hi\u1ec3n":[
        {
          "entity_id":"713",
          "region_id":"716",
          "city":"Ng\u1ecdc Hi\u1ec3n"
        }
      ]
    }
  },
  "C\u1ea7n Th\u01a1":{
    "id":"712",
    "name":"C\u1ea7n Th\u01a1",
    "cities":{
      "Ninh Ki\u1ec1u":[
        {
          "entity_id":"670",
          "region_id":"712",
          "city":"Ninh Ki\u1ec1u"
        }
      ],
      "\u00d4 M\u00f4n":[
        {
          "entity_id":"671",
          "region_id":"712",
          "city":"\u00d4 M\u00f4n"
        }
      ],
      "B\u00ecnh Thu\u1ef7":[
        {
          "entity_id":"672",
          "region_id":"712",
          "city":"B\u00ecnh Thu\u1ef7"
        }
      ],
      "C\u00e1i R\u0103ng":[
        {
          "entity_id":"673",
          "region_id":"712",
          "city":"C\u00e1i R\u0103ng"
        }
      ],
      "Th\u1ed1t N\u1ed1t":[
        {
          "entity_id":"674",
          "region_id":"712",
          "city":"Th\u1ed1t N\u1ed1t"
        }
      ],
      "V\u0129nh Th\u1ea1nh":[
        {
          "entity_id":"675",
          "region_id":"712",
          "city":"V\u0129nh Th\u1ea1nh"
        }
      ],
      "C\u1edd \u0110\u1ecf":[
        {
          "entity_id":"676",
          "region_id":"712",
          "city":"C\u1edd \u0110\u1ecf"
        }
      ],
      "Phong \u0110i\u1ec1n":[
        {
          "entity_id":"677",
          "region_id":"712",
          "city":"Phong \u0110i\u1ec1n"
        }
      ],
      "Th\u1edbi Lai":[
        {
          "entity_id":"678",
          "region_id":"712",
          "city":"Th\u1edbi Lai"
        }
      ]
    }
  },
  "Cao B\u1eb1ng":{
    "id":"624",
    "name":"Cao B\u1eb1ng",
    "cities":{
      "Th\u00e0nh ph\u1ed1 Cao B\u1eb1ng":[
        {
          "entity_id":"42",
          "region_id":"624",
          "city":"Th\u00e0nh ph\u1ed1 Cao B\u1eb1ng"
        }
      ],
      "B\u1ea3o L\u00e2m":[
        {
          "entity_id":"43",
          "region_id":"624",
          "city":"B\u1ea3o L\u00e2m"
        }
      ],
      "B\u1ea3o L\u1ea1c":[
        {
          "entity_id":"44",
          "region_id":"624",
          "city":"B\u1ea3o L\u1ea1c"
        }
      ],
      "Th\u00f4ng N\u00f4ng":[
        {
          "entity_id":"45",
          "region_id":"624",
          "city":"Th\u00f4ng N\u00f4ng"
        }
      ],
      "H\u00e0 Qu\u1ea3ng":[
        {
          "entity_id":"46",
          "region_id":"624",
          "city":"H\u00e0 Qu\u1ea3ng"
        }
      ],
      "Tr\u00e0 L\u0129nh":[
        {
          "entity_id":"47",
          "region_id":"624",
          "city":"Tr\u00e0 L\u0129nh"
        }
      ],
      "Tr\u00f9ng Kh\u00e1nh":[
        {
          "entity_id":"48",
          "region_id":"624",
          "city":"Tr\u00f9ng Kh\u00e1nh"
        }
      ],
      "H\u1ea1 Lang":[
        {
          "entity_id":"49",
          "region_id":"624",
          "city":"H\u1ea1 Lang"
        }
      ],
      "Qu\u1ea3ng Uy\u00ean":[
        {
          "entity_id":"50",
          "region_id":"624",
          "city":"Qu\u1ea3ng Uy\u00ean"
        }
      ],
      "Ph\u1ee5c Ho\u00e0":[
        {
          "entity_id":"51",
          "region_id":"624",
          "city":"Ph\u1ee5c Ho\u00e0"
        }
      ],
      "Ho\u00e0 An":[
        {
          "entity_id":"52",
          "region_id":"624",
          "city":"Ho\u00e0 An"
        }
      ],
      "Nguy\u00ean B\u00ecnh":[
        {
          "entity_id":"53",
          "region_id":"624",
          "city":"Nguy\u00ean B\u00ecnh"
        }
      ],
      "Th\u1ea1ch An":[
        {
          "entity_id":"54",
          "region_id":"624",
          "city":"Th\u1ea1ch An"
        }
      ]
    }
  },
  "Gia Lai":{
    "id":"684",
    "name":"Gia Lai",
    "cities":{
      "Pleiku":[
        {
          "entity_id":"456",
          "region_id":"684",
          "city":"Pleiku"
        }
      ],
      "An Kh\u00ea":[
        {
          "entity_id":"457",
          "region_id":"684",
          "city":"An Kh\u00ea"
        }
      ],
      "Ayun Pa":[
        {
          "entity_id":"458",
          "region_id":"684",
          "city":"Ayun Pa"
        }
      ],
      "KBang":[
        {
          "entity_id":"459",
          "region_id":"684",
          "city":"KBang"
        }
      ],
      "\u0110\u0103k \u0110oa":[
        {
          "entity_id":"460",
          "region_id":"684",
          "city":"\u0110\u0103k \u0110oa"
        }
      ],
      "Ch\u01b0 P\u0103h":[
        {
          "entity_id":"461",
          "region_id":"684",
          "city":"Ch\u01b0 P\u0103h"
        }
      ],
      "Ia Grai":[
        {
          "entity_id":"462",
          "region_id":"684",
          "city":"Ia Grai"
        }
      ],
      "Mang Yang":[
        {
          "entity_id":"463",
          "region_id":"684",
          "city":"Mang Yang"
        }
      ],
      "K\u00f4ng Chro":[
        {
          "entity_id":"464",
          "region_id":"684",
          "city":"K\u00f4ng Chro"
        }
      ],
      "\u0110\u1ee9c C\u01a1":[
        {
          "entity_id":"465",
          "region_id":"684",
          "city":"\u0110\u1ee9c C\u01a1"
        }
      ],
      "Ch\u01b0 Pr\u00f4ng":[
        {
          "entity_id":"466",
          "region_id":"684",
          "city":"Ch\u01b0 Pr\u00f4ng"
        }
      ],
      "Ch\u01b0 S\u00ea":[
        {
          "entity_id":"467",
          "region_id":"684",
          "city":"Ch\u01b0 S\u00ea"
        }
      ],
      "\u0110\u0103k P\u01a1":[
        {
          "entity_id":"468",
          "region_id":"684",
          "city":"\u0110\u0103k P\u01a1"
        }
      ],
      "Ia Pa":[
        {
          "entity_id":"469",
          "region_id":"684",
          "city":"Ia Pa"
        }
      ],
      "Kr\u00f4ng Pa":[
        {
          "entity_id":"470",
          "region_id":"684",
          "city":"Kr\u00f4ng Pa"
        }
      ],
      "Ph\u00fa Thi\u1ec7n":[
        {
          "entity_id":"471",
          "region_id":"684",
          "city":"Ph\u00fa Thi\u1ec7n"
        }
      ],
      "Ch\u01b0 P\u01b0h":[
        {
          "entity_id":"472",
          "region_id":"684",
          "city":"Ch\u01b0 P\u01b0h"
        }
      ]
    }
  },
  "H\u00e0 Giang":{
    "id":"622",
    "name":"H\u00e0 Giang",
    "cities":{
      "Th\u00e0nh ph\u1ed1 H\u00e0 Giang":[
        {
          "entity_id":"31",
          "region_id":"622",
          "city":"Th\u00e0nh ph\u1ed1 H\u00e0 Giang"
        }
      ],
      "\u0110\u1ed3ng V\u0103n":[
        {
          "entity_id":"32",
          "region_id":"622",
          "city":"\u0110\u1ed3ng V\u0103n"
        }
      ],
      "M\u00e8o V\u1ea1c":[
        {
          "entity_id":"33",
          "region_id":"622",
          "city":"M\u00e8o V\u1ea1c"
        }
      ],
      "Y\u00ean Minh":[
        {
          "entity_id":"34",
          "region_id":"622",
          "city":"Y\u00ean Minh"
        }
      ],
      "Qu\u1ea3n B\u1ea1":[
        {
          "entity_id":"35",
          "region_id":"622",
          "city":"Qu\u1ea3n B\u1ea1"
        }
      ],
      "V\u1ecb Xuy\u00ean":[
        {
          "entity_id":"36",
          "region_id":"622",
          "city":"V\u1ecb Xuy\u00ean"
        }
      ],
      "B\u1eafc M\u00ea":[
        {
          "entity_id":"37",
          "region_id":"622",
          "city":"B\u1eafc M\u00ea"
        }
      ],
      "Ho\u00e0ng Su Ph\u00ec":[
        {
          "entity_id":"38",
          "region_id":"622",
          "city":"Ho\u00e0ng Su Ph\u00ec"
        }
      ],
      "X\u00edn M\u1ea7n":[
        {
          "entity_id":"39",
          "region_id":"622",
          "city":"X\u00edn M\u1ea7n"
        }
      ],
      "B\u1eafc Quang":[
        {
          "entity_id":"40",
          "region_id":"622",
          "city":"B\u1eafc Quang"
        }
      ],
      "Quang B\u00ecnh":[
        {
          "entity_id":"41",
          "region_id":"622",
          "city":"Quang B\u00ecnh"
        }
      ]
    }
  },
  "H\u00e0 Nam":{
    "id":"655",
    "name":"H\u00e0 Nam",
    "cities":{
      "Th\u00e0nh ph\u1ed1 Ph\u1ee7 L\u00fd":[
        {
          "entity_id":"248",
          "region_id":"655",
          "city":"Th\u00e0nh ph\u1ed1 Ph\u1ee7 L\u00fd"
        }
      ],
      "Duy Ti\u00ean":[
        {
          "entity_id":"249",
          "region_id":"655",
          "city":"Duy Ti\u00ean"
        }
      ],
      "Kim B\u1ea3ng":[
        {
          "entity_id":"250",
          "region_id":"655",
          "city":"Kim B\u1ea3ng"
        }
      ],
      "Thanh Li\u00eam":[
        {
          "entity_id":"251",
          "region_id":"655",
          "city":"Thanh Li\u00eam"
        }
      ],
      "B\u00ecnh L\u1ee5c":[
        {
          "entity_id":"252",
          "region_id":"655",
          "city":"B\u00ecnh L\u1ee5c"
        }
      ],
      "L\u00fd Nh\u00e2n":[
        {
          "entity_id":"253",
          "region_id":"655",
          "city":"L\u00fd Nh\u00e2n"
        }
      ]
    }
  },
  "H\u00e0 N\u1ed9i":{
    "id":"609",
    "name":"H\u00e0 N\u1ed9i",
    "cities":{
      "C\u1ea7u Gi\u1ea5y":[
        {
          "entity_id":"1",
          "region_id":"609",
          "city":"C\u1ea7u Gi\u1ea5y"
        }
      ],
      "Ba \u0110\u00ecnh":[
        {
          "entity_id":"2",
          "region_id":"609",
          "city":"Ba \u0110\u00ecnh"
        }
      ],
      "Ba V\u00ec":[
        {
          "entity_id":"3",
          "region_id":"609",
          "city":"Ba V\u00ec"
        }
      ],
      "Ch\u01b0\u01a1ng M\u1ef9":[
        {
          "entity_id":"4",
          "region_id":"609",
          "city":"Ch\u01b0\u01a1ng M\u1ef9"
        }
      ],
      "\u0110an Ph\u01b0\u1ee3ng":[
        {
          "entity_id":"5",
          "region_id":"609",
          "city":"\u0110an Ph\u01b0\u1ee3ng"
        }
      ],
      "\u0110\u00f4ng Anh":[
        {
          "entity_id":"6",
          "region_id":"609",
          "city":"\u0110\u00f4ng Anh"
        }
      ],
      "Gia L\u00e2m":[
        {
          "entity_id":"7",
          "region_id":"609",
          "city":"Gia L\u00e2m"
        }
      ],
      "Ho\u00e0i \u0110\u1ee9c":[
        {
          "entity_id":"8",
          "region_id":"609",
          "city":"Ho\u00e0i \u0110\u1ee9c"
        }
      ],
      "M\u00ea Linh":[
        {
          "entity_id":"9",
          "region_id":"609",
          "city":"M\u00ea Linh"
        }
      ],
      "M\u1ef9 \u0110\u1ee9c":[
        {
          "entity_id":"10",
          "region_id":"609",
          "city":"M\u1ef9 \u0110\u1ee9c"
        }
      ],
      "Ph\u00fa Xuy\u00ean":[
        {
          "entity_id":"11",
          "region_id":"609",
          "city":"Ph\u00fa Xuy\u00ean"
        }
      ],
      "Ph\u00fac Th\u1ecd":[
        {
          "entity_id":"12",
          "region_id":"609",
          "city":"Ph\u00fac Th\u1ecd"
        }
      ],
      "Qu\u1ed1c Oai":[
        {
          "entity_id":"13",
          "region_id":"609",
          "city":"Qu\u1ed1c Oai"
        }
      ],
      "S\u00f3c S\u01a1n":[
        {
          "entity_id":"14",
          "region_id":"609",
          "city":"S\u00f3c S\u01a1n"
        }
      ],
      "Th\u1ea1ch Th\u1ea5t":[
        {
          "entity_id":"15",
          "region_id":"609",
          "city":"Th\u1ea1ch Th\u1ea5t"
        }
      ],
      "Thanh Oai":[
        {
          "entity_id":"16",
          "region_id":"609",
          "city":"Thanh Oai"
        }
      ],
      "Thanh Tr\u00ec":[
        {
          "entity_id":"17",
          "region_id":"609",
          "city":"Thanh Tr\u00ec"
        }
      ],
      "Th\u01b0\u1eddng T\u00edn":[
        {
          "entity_id":"18",
          "region_id":"609",
          "city":"Th\u01b0\u1eddng T\u00edn"
        }
      ],
      "\u1ee8ng H\u00f2a":[
        {
          "entity_id":"19",
          "region_id":"609",
          "city":"\u1ee8ng H\u00f2a"
        }
      ],
      "B\u1eafc T\u1eeb Li\u00eam":[
        {
          "entity_id":"20",
          "region_id":"609",
          "city":"B\u1eafc T\u1eeb Li\u00eam"
        }
      ],
      "\u0110\u1ed1ng \u0110a":[
        {
          "entity_id":"21",
          "region_id":"609",
          "city":"\u0110\u1ed1ng \u0110a"
        }
      ],
      "H\u00e0 \u0110\u00f4ng":[
        {
          "entity_id":"22",
          "region_id":"609",
          "city":"H\u00e0 \u0110\u00f4ng"
        }
      ],
      "Hai B\u00e0 Tr\u01b0ng":[
        {
          "entity_id":"23",
          "region_id":"609",
          "city":"Hai B\u00e0 Tr\u01b0ng"
        }
      ],
      "Ho\u00e0n Ki\u1ebfm":[
        {
          "entity_id":"24",
          "region_id":"609",
          "city":"Ho\u00e0n Ki\u1ebfm"
        }
      ],
      "Ho\u00e0ng Mai":[
        {
          "entity_id":"25",
          "region_id":"609",
          "city":"Ho\u00e0ng Mai"
        }
      ],
      "Long Bi\u00ean":[
        {
          "entity_id":"26",
          "region_id":"609",
          "city":"Long Bi\u00ean"
        }
      ],
      "Nam T\u1eeb Li\u00eam":[
        {
          "entity_id":"27",
          "region_id":"609",
          "city":"Nam T\u1eeb Li\u00eam"
        }
      ],
      "T\u00e2y H\u1ed3":[
        {
          "entity_id":"28",
          "region_id":"609",
          "city":"T\u00e2y H\u1ed3"
        }
      ],
      "Thanh Xu\u00e2n":[
        {
          "entity_id":"29",
          "region_id":"609",
          "city":"Thanh Xu\u00e2n"
        }
      ],
      "S\u01a1n T\u00e2y":[
        {
          "entity_id":"30",
          "region_id":"609",
          "city":"S\u01a1n T\u00e2y"
        }
      ]
    }
  },
  "H\u00e0 T\u0129nh":{
    "id":"662",
    "name":"H\u00e0 T\u0129nh",
    "cities":{
      "Th\u00e0nh ph\u1ed1 H\u00e0 T\u0129nh":[
        {
          "entity_id":"320",
          "region_id":"662",
          "city":"Th\u00e0nh ph\u1ed1 H\u00e0 T\u0129nh"
        }
      ],
      "Th\u1ecb x\u00e3 H\u1ed3ng L\u0129nh":[
        {
          "entity_id":"321",
          "region_id":"662",
          "city":"Th\u1ecb x\u00e3 H\u1ed3ng L\u0129nh"
        }
      ],
      "H\u01b0\u01a1ng S\u01a1n":[
        {
          "entity_id":"322",
          "region_id":"662",
          "city":"H\u01b0\u01a1ng S\u01a1n"
        }
      ],
      "\u0110\u1ee9c Th\u1ecd":[
        {
          "entity_id":"323",
          "region_id":"662",
          "city":"\u0110\u1ee9c Th\u1ecd"
        }
      ],
      "V\u0169 Quang":[
        {
          "entity_id":"324",
          "region_id":"662",
          "city":"V\u0169 Quang"
        }
      ],
      "Nghi Xu\u00e2n":[
        {
          "entity_id":"325",
          "region_id":"662",
          "city":"Nghi Xu\u00e2n"
        }
      ],
      "Can L\u1ed9c":[
        {
          "entity_id":"326",
          "region_id":"662",
          "city":"Can L\u1ed9c"
        }
      ],
      "H\u01b0\u01a1ng Kh\u00ea":[
        {
          "entity_id":"327",
          "region_id":"662",
          "city":"H\u01b0\u01a1ng Kh\u00ea"
        }
      ],
      "Th\u1ea1ch H\u00e0":[
        {
          "entity_id":"328",
          "region_id":"662",
          "city":"Th\u1ea1ch H\u00e0"
        }
      ],
      "C\u1ea9m Xuy\u00ean":[
        {
          "entity_id":"329",
          "region_id":"662",
          "city":"C\u1ea9m Xuy\u00ean"
        }
      ],
      "K\u1ef3 Anh":[
        {
          "entity_id":"332",
          "region_id":"662",
          "city":"K\u1ef3 Anh"
        }
      ],
      "L\u1ed9c H\u00e0":[
        {
          "entity_id":"331",
          "region_id":"662",
          "city":"L\u1ed9c H\u00e0"
        }
      ]
    }
  },
  "H\u1ea3i D\u01b0\u01a1ng":{
    "id":"610",
    "name":"H\u1ea3i D\u01b0\u01a1ng",
    "cities":{
      "Th\u00e0nh ph\u1ed1 H\u1ea3i D\u01b0\u01a1ng":[
        {
          "entity_id":"203",
          "region_id":"610",
          "city":"Th\u00e0nh ph\u1ed1 H\u1ea3i D\u01b0\u01a1ng"
        }
      ],
      "Ch\u00ed Linh":[
        {
          "entity_id":"204",
          "region_id":"610",
          "city":"Ch\u00ed Linh"
        }
      ],
      "Nam S\u00e1ch":[
        {
          "entity_id":"205",
          "region_id":"610",
          "city":"Nam S\u00e1ch"
        }
      ],
      "Kinh M\u00f4n":[
        {
          "entity_id":"206",
          "region_id":"610",
          "city":"Kinh M\u00f4n"
        }
      ],
      "Kim Th\u00e0nh":[
        {
          "entity_id":"207",
          "region_id":"610",
          "city":"Kim Th\u00e0nh"
        }
      ],
      "Thanh H\u00e0":[
        {
          "entity_id":"208",
          "region_id":"610",
          "city":"Thanh H\u00e0"
        }
      ],
      "C\u1ea9m Gi\u00e0ng":[
        {
          "entity_id":"209",
          "region_id":"610",
          "city":"C\u1ea9m Gi\u00e0ng"
        }
      ],
      "B\u00ecnh Giang":[
        {
          "entity_id":"210",
          "region_id":"610",
          "city":"B\u00ecnh Giang"
        }
      ],
      "Gia L\u1ed9c":[
        {
          "entity_id":"211",
          "region_id":"610",
          "city":"Gia L\u1ed9c"
        }
      ],
      "T\u1ee9 K\u1ef3":[
        {
          "entity_id":"212",
          "region_id":"610",
          "city":"T\u1ee9 K\u1ef3"
        }
      ],
      "Ninh Giang":[
        {
          "entity_id":"213",
          "region_id":"610",
          "city":"Ninh Giang"
        }
      ],
      "Thanh Mi\u1ec7n":[
        {
          "entity_id":"214",
          "region_id":"610",
          "city":"Thanh Mi\u1ec7n"
        }
      ]
    }
  },
  "H\u1ea3i Ph\u00f2ng":{
    "id":"651",
    "name":"H\u1ea3i Ph\u00f2ng",
    "cities":{
      "H\u1ed3ng B\u00e0ng":[
        {
          "entity_id":"215",
          "region_id":"651",
          "city":"H\u1ed3ng B\u00e0ng"
        }
      ],
      "Ng\u00f4 Quy\u1ec1n":[
        {
          "entity_id":"216",
          "region_id":"651",
          "city":"Ng\u00f4 Quy\u1ec1n"
        }
      ],
      "L\u00ea Ch\u00e2n":[
        {
          "entity_id":"217",
          "region_id":"651",
          "city":"L\u00ea Ch\u00e2n"
        }
      ],
      "H\u1ea3i An":[
        {
          "entity_id":"218",
          "region_id":"651",
          "city":"H\u1ea3i An"
        }
      ],
      "Ki\u1ebfn An":[
        {
          "entity_id":"219",
          "region_id":"651",
          "city":"Ki\u1ebfn An"
        }
      ],
      "\u0110\u1ed3 S\u01a1n":[
        {
          "entity_id":"220",
          "region_id":"651",
          "city":"\u0110\u1ed3 S\u01a1n"
        }
      ],
      "D\u01b0\u01a1ng Kinh":[
        {
          "entity_id":"221",
          "region_id":"651",
          "city":"D\u01b0\u01a1ng Kinh"
        }
      ],
      "Thu\u1ef7 Nguy\u00ean":[
        {
          "entity_id":"222",
          "region_id":"651",
          "city":"Thu\u1ef7 Nguy\u00ean"
        }
      ],
      "An D\u01b0\u01a1ng":[
        {
          "entity_id":"223",
          "region_id":"651",
          "city":"An D\u01b0\u01a1ng"
        }
      ],
      "An L\u00e3o":[
        {
          "entity_id":"224",
          "region_id":"651",
          "city":"An L\u00e3o"
        }
      ],
      "Ki\u1ebfn Thu\u1ef5":[
        {
          "entity_id":"225",
          "region_id":"651",
          "city":"Ki\u1ebfn Thu\u1ef5"
        }
      ],
      "Ti\u00ean L\u00e3ng":[
        {
          "entity_id":"226",
          "region_id":"651",
          "city":"Ti\u00ean L\u00e3ng"
        }
      ],
      "V\u0129nh B\u1ea3o":[
        {
          "entity_id":"227",
          "region_id":"651",
          "city":"V\u0129nh B\u1ea3o"
        }
      ],
      "C\u00e1t H\u1ea3i":[
        {
          "entity_id":"228",
          "region_id":"651",
          "city":"C\u00e1t H\u1ea3i"
        }
      ],
      "B\u1ea1ch Long V\u0129":[
        {
          "entity_id":"229",
          "region_id":"651",
          "city":"B\u1ea1ch Long V\u0129"
        }
      ]
    }
  },
  "H\u1eadu Giang":{
    "id":"713",
    "name":"H\u1eadu Giang",
    "cities":{
      "Th\u00e0nh ph\u1ed1 V\u1ecb Thanh":[
        {
          "entity_id":"679",
          "region_id":"713",
          "city":"Th\u00e0nh ph\u1ed1 V\u1ecb Thanh"
        }
      ],
      "Ng\u00e3 B\u1ea3y":[
        {
          "entity_id":"680",
          "region_id":"713",
          "city":"Ng\u00e3 B\u1ea3y"
        }
      ],
      "Ch\u00e2u Th\u00e0nh A":[
        {
          "entity_id":"681",
          "region_id":"713",
          "city":"Ch\u00e2u Th\u00e0nh A"
        }
      ],
      "Ch\u00e2u Th\u00e0nh":[
        {
          "entity_id":"682",
          "region_id":"713",
          "city":"Ch\u00e2u Th\u00e0nh"
        }
      ],
      "Ph\u1ee5ng Hi\u1ec7p":[
        {
          "entity_id":"683",
          "region_id":"713",
          "city":"Ph\u1ee5ng Hi\u1ec7p"
        }
      ],
      "V\u1ecb Thu\u1ef7":[
        {
          "entity_id":"684",
          "region_id":"713",
          "city":"V\u1ecb Thu\u1ef7"
        }
      ],
      "Long M\u1ef9":[
        {
          "entity_id":"686",
          "region_id":"713",
          "city":"Long M\u1ef9"
        }
      ]
    }
  },
  "H\u1ed3 Ch\u00ed Minh":{
    "id":"613",
    "name":"H\u1ed3 Ch\u00ed Minh",
    "cities":{
      "Qu\u1eadn 1":[
        {
          "entity_id":"556",
          "region_id":"613",
          "city":"Qu\u1eadn 1"
        }
      ],
      "Qu\u1eadn 12":[
        {
          "entity_id":"557",
          "region_id":"613",
          "city":"Qu\u1eadn 12"
        }
      ],
      "Th\u1ee7 \u0110\u1ee9c":[
        {
          "entity_id":"558",
          "region_id":"613",
          "city":"Th\u1ee7 \u0110\u1ee9c"
        }
      ],
      "Qu\u1eadn 9":[
        {
          "entity_id":"559",
          "region_id":"613",
          "city":"Qu\u1eadn 9"
        }
      ],
      "G\u00f2 V\u1ea5p":[
        {
          "entity_id":"560",
          "region_id":"613",
          "city":"G\u00f2 V\u1ea5p"
        }
      ],
      "B\u00ecnh Th\u1ea1nh":[
        {
          "entity_id":"561",
          "region_id":"613",
          "city":"B\u00ecnh Th\u1ea1nh"
        }
      ],
      "T\u00e2n B\u00ecnh":[
        {
          "entity_id":"562",
          "region_id":"613",
          "city":"T\u00e2n B\u00ecnh"
        }
      ],
      "T\u00e2n Ph\u00fa":[
        {
          "entity_id":"563",
          "region_id":"613",
          "city":"T\u00e2n Ph\u00fa"
        }
      ],
      "Ph\u00fa Nhu\u1eadn":[
        {
          "entity_id":"564",
          "region_id":"613",
          "city":"Ph\u00fa Nhu\u1eadn"
        }
      ],
      "Qu\u1eadn 2":[
        {
          "entity_id":"565",
          "region_id":"613",
          "city":"Qu\u1eadn 2"
        }
      ],
      "Qu\u1eadn 3":[
        {
          "entity_id":"566",
          "region_id":"613",
          "city":"Qu\u1eadn 3"
        }
      ],
      "Qu\u1eadn 10":[
        {
          "entity_id":"567",
          "region_id":"613",
          "city":"Qu\u1eadn 10"
        }
      ],
      "Qu\u1eadn 11":[
        {
          "entity_id":"568",
          "region_id":"613",
          "city":"Qu\u1eadn 11"
        }
      ],
      "Qu\u1eadn 4":[
        {
          "entity_id":"569",
          "region_id":"613",
          "city":"Qu\u1eadn 4"
        }
      ],
      "Qu\u1eadn 5":[
        {
          "entity_id":"570",
          "region_id":"613",
          "city":"Qu\u1eadn 5"
        }
      ],
      "Qu\u1eadn 6":[
        {
          "entity_id":"571",
          "region_id":"613",
          "city":"Qu\u1eadn 6"
        }
      ],
      "Qu\u1eadn 8":[
        {
          "entity_id":"572",
          "region_id":"613",
          "city":"Qu\u1eadn 8"
        }
      ],
      "B\u00ecnh T\u00e2n":[
        {
          "entity_id":"573",
          "region_id":"613",
          "city":"B\u00ecnh T\u00e2n"
        }
      ],
      "Qu\u1eadn 7":[
        {
          "entity_id":"574",
          "region_id":"613",
          "city":"Qu\u1eadn 7"
        }
      ],
      "C\u1ee7 Chi":[
        {
          "entity_id":"575",
          "region_id":"613",
          "city":"C\u1ee7 Chi"
        }
      ],
      "H\u00f3c M\u00f4n":[
        {
          "entity_id":"576",
          "region_id":"613",
          "city":"H\u00f3c M\u00f4n"
        }
      ],
      "B\u00ecnh Ch\u00e1nh":[
        {
          "entity_id":"577",
          "region_id":"613",
          "city":"B\u00ecnh Ch\u00e1nh"
        }
      ],
      "Nh\u00e0 B\u00e8":[
        {
          "entity_id":"578",
          "region_id":"613",
          "city":"Nh\u00e0 B\u00e8"
        }
      ],
      "C\u1ea7n Gi\u1edd":[
        {
          "entity_id":"579",
          "region_id":"613",
          "city":"C\u1ea7n Gi\u1edd"
        }
      ]
    }
  },
  "H\u00f2a B\u00ecnh":{
    "id":"637",
    "name":"H\u00f2a B\u00ecnh",
    "cities":{
      "Th\u00e0nh ph\u1ed1 H\u00f2a B\u00ecnh":[
        {
          "entity_id":"118",
          "region_id":"637",
          "city":"Th\u00e0nh ph\u1ed1 H\u00f2a B\u00ecnh"
        }
      ],
      "\u0110\u00e0 B\u1eafc":[
        {
          "entity_id":"119",
          "region_id":"637",
          "city":"\u0110\u00e0 B\u1eafc"
        }
      ],
      "K\u1ef3 S\u01a1n":[
        {
          "entity_id":"120",
          "region_id":"637",
          "city":"K\u1ef3 S\u01a1n"
        }
      ],
      "L\u01b0\u01a1ng S\u01a1n":[
        {
          "entity_id":"121",
          "region_id":"637",
          "city":"L\u01b0\u01a1ng S\u01a1n"
        }
      ],
      "Kim B\u00f4i":[
        {
          "entity_id":"122",
          "region_id":"637",
          "city":"Kim B\u00f4i"
        }
      ],
      "Cao Phong":[
        {
          "entity_id":"123",
          "region_id":"637",
          "city":"Cao Phong"
        }
      ],
      "T\u00e2n L\u1ea1c":[
        {
          "entity_id":"124",
          "region_id":"637",
          "city":"T\u00e2n L\u1ea1c"
        }
      ],
      "Mai Ch\u00e2u":[
        {
          "entity_id":"125",
          "region_id":"637",
          "city":"Mai Ch\u00e2u"
        }
      ],
      "L\u1ea1c S\u01a1n":[
        {
          "entity_id":"126",
          "region_id":"637",
          "city":"L\u1ea1c S\u01a1n"
        }
      ],
      "Y\u00ean Th\u1ee7y":[
        {
          "entity_id":"127",
          "region_id":"637",
          "city":"Y\u00ean Th\u1ee7y"
        }
      ],
      "L\u1ea1c Th\u1ee7y":[
        {
          "entity_id":"128",
          "region_id":"637",
          "city":"L\u1ea1c Th\u1ee7y"
        }
      ]
    }
  },
  "H\u01b0ng Y\u00ean":{
    "id":"653",
    "name":"H\u01b0ng Y\u00ean",
    "cities":{
      "Th\u00e0nh ph\u1ed1 H\u01b0ng Y\u00ean":[
        {
          "entity_id":"230",
          "region_id":"653",
          "city":"Th\u00e0nh ph\u1ed1 H\u01b0ng Y\u00ean"
        }
      ],
      "V\u0103n L\u00e2m":[
        {
          "entity_id":"231",
          "region_id":"653",
          "city":"V\u0103n L\u00e2m"
        }
      ],
      "V\u0103n Giang":[
        {
          "entity_id":"232",
          "region_id":"653",
          "city":"V\u0103n Giang"
        }
      ],
      "Y\u00ean M\u1ef9":[
        {
          "entity_id":"233",
          "region_id":"653",
          "city":"Y\u00ean M\u1ef9"
        }
      ],
      "M\u1ef9 H\u00e0o":[
        {
          "entity_id":"234",
          "region_id":"653",
          "city":"M\u1ef9 H\u00e0o"
        }
      ],
      "\u00c2n Thi":[
        {
          "entity_id":"235",
          "region_id":"653",
          "city":"\u00c2n Thi"
        }
      ],
      "Kho\u00e1i Ch\u00e2u":[
        {
          "entity_id":"236",
          "region_id":"653",
          "city":"Kho\u00e1i Ch\u00e2u"
        }
      ],
      "Kim \u0110\u1ed9ng":[
        {
          "entity_id":"237",
          "region_id":"653",
          "city":"Kim \u0110\u1ed9ng"
        }
      ],
      "Ti\u00ean L\u1eef":[
        {
          "entity_id":"238",
          "region_id":"653",
          "city":"Ti\u00ean L\u1eef"
        }
      ],
      "Ph\u00f9 C\u1eeb":[
        {
          "entity_id":"239",
          "region_id":"653",
          "city":"Ph\u00f9 C\u1eeb"
        }
      ]
    }
  },
  "Kh\u00e1nh H\u00f2a":{
    "id":"676",
    "name":"Kh\u00e1nh H\u00f2a",
    "cities":{
      "Nha Trang":[
        {
          "entity_id":"420",
          "region_id":"676",
          "city":"Nha Trang"
        }
      ],
      "Cam Ranh":[
        {
          "entity_id":"421",
          "region_id":"676",
          "city":"Cam Ranh"
        }
      ],
      "Cam L\u00e2m":[
        {
          "entity_id":"422",
          "region_id":"676",
          "city":"Cam L\u00e2m"
        }
      ],
      "V\u1ea1n Ninh":[
        {
          "entity_id":"423",
          "region_id":"676",
          "city":"V\u1ea1n Ninh"
        }
      ],
      "Ninh H\u00f2a":[
        {
          "entity_id":"424",
          "region_id":"676",
          "city":"Ninh H\u00f2a"
        }
      ],
      "Kh\u00e1nh V\u0129nh":[
        {
          "entity_id":"425",
          "region_id":"676",
          "city":"Kh\u00e1nh V\u0129nh"
        }
      ],
      "Di\u00ean Kh\u00e1nh":[
        {
          "entity_id":"426",
          "region_id":"676",
          "city":"Di\u00ean Kh\u00e1nh"
        }
      ],
      "Kh\u00e1nh S\u01a1n":[
        {
          "entity_id":"427",
          "region_id":"676",
          "city":"Kh\u00e1nh S\u01a1n"
        }
      ],
      "Tr\u01b0\u1eddng Sa":[
        {
          "entity_id":"428",
          "region_id":"676",
          "city":"Tr\u01b0\u1eddng Sa"
        }
      ]
    }
  },
  "Ki\u00ean giang":{
    "id":"711",
    "name":"Ki\u00ean giang",
    "cities":{
      "Th\u00e0nh ph\u1ed1 R\u1ea1ch Gi\u00e1":[
        {
          "entity_id":"655",
          "region_id":"711",
          "city":"Th\u00e0nh ph\u1ed1 R\u1ea1ch Gi\u00e1"
        }
      ],
      "H\u00e0 Ti\u00ean":[
        {
          "entity_id":"656",
          "region_id":"711",
          "city":"H\u00e0 Ti\u00ean"
        }
      ],
      "Ki\u00ean L\u01b0\u01a1ng":[
        {
          "entity_id":"657",
          "region_id":"711",
          "city":"Ki\u00ean L\u01b0\u01a1ng"
        }
      ],
      "H\u00f2n \u0110\u1ea5t":[
        {
          "entity_id":"658",
          "region_id":"711",
          "city":"H\u00f2n \u0110\u1ea5t"
        }
      ],
      "T\u00e2n Hi\u1ec7p":[
        {
          "entity_id":"659",
          "region_id":"711",
          "city":"T\u00e2n Hi\u1ec7p"
        }
      ],
      "Ch\u00e2u Th\u00e0nh":[
        {
          "entity_id":"660",
          "region_id":"711",
          "city":"Ch\u00e2u Th\u00e0nh"
        }
      ],
      "Gi\u1ed3ng Ri\u1ec1ng":[
        {
          "entity_id":"661",
          "region_id":"711",
          "city":"Gi\u1ed3ng Ri\u1ec1ng"
        }
      ],
      "G\u00f2 Quao":[
        {
          "entity_id":"662",
          "region_id":"711",
          "city":"G\u00f2 Quao"
        }
      ],
      "An Bi\u00ean":[
        {
          "entity_id":"663",
          "region_id":"711",
          "city":"An Bi\u00ean"
        }
      ],
      "An Minh":[
        {
          "entity_id":"664",
          "region_id":"711",
          "city":"An Minh"
        }
      ],
      "V\u0129nh Thu\u1eadn":[
        {
          "entity_id":"665",
          "region_id":"711",
          "city":"V\u0129nh Thu\u1eadn"
        }
      ],
      "Ph\u00fa Qu\u1ed1c":[
        {
          "entity_id":"666",
          "region_id":"711",
          "city":"Ph\u00fa Qu\u1ed1c"
        }
      ],
      "Ki\u00ean H\u1ea3i":[
        {
          "entity_id":"667",
          "region_id":"711",
          "city":"Ki\u00ean H\u1ea3i"
        }
      ],
      "U Minh Th\u01b0\u1ee3ng":[
        {
          "entity_id":"668",
          "region_id":"711",
          "city":"U Minh Th\u01b0\u1ee3ng"
        }
      ],
      "Giang Th\u00e0nh":[
        {
          "entity_id":"669",
          "region_id":"711",
          "city":"Giang Th\u00e0nh"
        }
      ]
    }
  },
  "Kon Tum":{
    "id":"682",
    "name":"Kon Tum",
    "cities":{
      "Kon Tum":[
        {
          "entity_id":"446",
          "region_id":"682",
          "city":"Kon Tum"
        }
      ],
      "\u0110\u1eafk Glei":[
        {
          "entity_id":"447",
          "region_id":"682",
          "city":"\u0110\u1eafk Glei"
        }
      ],
      "Ng\u1ecdc H\u1ed3i":[
        {
          "entity_id":"448",
          "region_id":"682",
          "city":"Ng\u1ecdc H\u1ed3i"
        }
      ],
      "\u0110\u1eafk T\u00f4":[
        {
          "entity_id":"449",
          "region_id":"682",
          "city":"\u0110\u1eafk T\u00f4"
        }
      ],
      "Kon Pl\u00f4ng":[
        {
          "entity_id":"450",
          "region_id":"682",
          "city":"Kon Pl\u00f4ng"
        }
      ],
      "Kon R\u1eaby":[
        {
          "entity_id":"451",
          "region_id":"682",
          "city":"Kon R\u1eaby"
        }
      ],
      "\u0110\u1eafk H\u00e0":[
        {
          "entity_id":"452",
          "region_id":"682",
          "city":"\u0110\u1eafk H\u00e0"
        }
      ],
      "Sa Th\u1ea7y":[
        {
          "entity_id":"453",
          "region_id":"682",
          "city":"Sa Th\u1ea7y"
        }
      ],
      "Tu M\u01a1 R\u00f4ng":[
        {
          "entity_id":"454",
          "region_id":"682",
          "city":"Tu M\u01a1 R\u00f4ng"
        }
      ],
      "Ia H' Drai":[
        {
          "entity_id":"455",
          "region_id":"682",
          "city":"Ia H' Drai"
        }
      ]
    }
  },
  "Lai Ch\u00e2u":{
    "id":"632",
    "name":"Lai Ch\u00e2u",
    "cities":{
      "Th\u00e0nh ph\u1ed1 Lai Ch\u00e2u":[
        {
          "entity_id":"89",
          "region_id":"632",
          "city":"Th\u00e0nh ph\u1ed1 Lai Ch\u00e2u"
        }
      ],
      "Tam \u0110\u01b0\u1eddng":[
        {
          "entity_id":"90",
          "region_id":"632",
          "city":"Tam \u0110\u01b0\u1eddng"
        }
      ],
      "M\u01b0\u1eddng T\u00e8":[
        {
          "entity_id":"91",
          "region_id":"632",
          "city":"M\u01b0\u1eddng T\u00e8"
        }
      ],
      "S\u00ecn H\u1ed3":[
        {
          "entity_id":"92",
          "region_id":"632",
          "city":"S\u00ecn H\u1ed3"
        }
      ],
      "Phong Th\u1ed5":[
        {
          "entity_id":"93",
          "region_id":"632",
          "city":"Phong Th\u1ed5"
        }
      ],
      "Than Uy\u00ean":[
        {
          "entity_id":"94",
          "region_id":"632",
          "city":"Than Uy\u00ean"
        }
      ],
      "T\u00e2n Uy\u00ean":[
        {
          "entity_id":"95",
          "region_id":"632",
          "city":"T\u00e2n Uy\u00ean"
        }
      ],
      "N\u1eadm Nh\u00f9n":[
        {
          "entity_id":"96",
          "region_id":"632",
          "city":"N\u1eadm Nh\u00f9n"
        }
      ]
    }
  },
  "L\u00e2m \u0110\u1ed3ng":{
    "id":"688",
    "name":"L\u00e2m \u0110\u1ed3ng",
    "cities":{
      "\u0110\u00e0 L\u1ea1t":[
        {
          "entity_id":"496",
          "region_id":"688",
          "city":"\u0110\u00e0 L\u1ea1t"
        }
      ],
      "B\u1ea3o L\u1ed9c":[
        {
          "entity_id":"497",
          "region_id":"688",
          "city":"B\u1ea3o L\u1ed9c"
        }
      ],
      "\u0110am R\u00f4ng":[
        {
          "entity_id":"498",
          "region_id":"688",
          "city":"\u0110am R\u00f4ng"
        }
      ],
      "L\u1ea1c D\u01b0\u01a1ng":[
        {
          "entity_id":"499",
          "region_id":"688",
          "city":"L\u1ea1c D\u01b0\u01a1ng"
        }
      ],
      "L\u00e2m H\u00e0":[
        {
          "entity_id":"500",
          "region_id":"688",
          "city":"L\u00e2m H\u00e0"
        }
      ],
      "\u0110\u01a1n D\u01b0\u01a1ng":[
        {
          "entity_id":"501",
          "region_id":"688",
          "city":"\u0110\u01a1n D\u01b0\u01a1ng"
        }
      ],
      "\u0110\u1ee9c Tr\u1ecdng":[
        {
          "entity_id":"502",
          "region_id":"688",
          "city":"\u0110\u1ee9c Tr\u1ecdng"
        }
      ],
      "Di Linh":[
        {
          "entity_id":"503",
          "region_id":"688",
          "city":"Di Linh"
        }
      ],
      "B\u1ea3o L\u00e2m":[
        {
          "entity_id":"504",
          "region_id":"688",
          "city":"B\u1ea3o L\u00e2m"
        }
      ],
      "\u0110\u1ea1 Huoai":[
        {
          "entity_id":"505",
          "region_id":"688",
          "city":"\u0110\u1ea1 Huoai"
        }
      ],
      "\u0110\u1ea1 T\u1ebbh":[
        {
          "entity_id":"506",
          "region_id":"688",
          "city":"\u0110\u1ea1 T\u1ebbh"
        }
      ],
      "C\u00e1t Ti\u00ean":[
        {
          "entity_id":"507",
          "region_id":"688",
          "city":"C\u00e1t Ti\u00ean"
        }
      ]
    }
  },
  "L\u1ea1ng S\u01a1n":{
    "id":"640",
    "name":"L\u1ea1ng S\u01a1n",
    "cities":{
      "Th\u00e0nh ph\u1ed1 L\u1ea1ng S\u01a1n":[
        {
          "entity_id":"138",
          "region_id":"640",
          "city":"Th\u00e0nh ph\u1ed1 L\u1ea1ng S\u01a1n"
        }
      ],
      "Tr\u00e0ng \u0110\u1ecbnh":[
        {
          "entity_id":"139",
          "region_id":"640",
          "city":"Tr\u00e0ng \u0110\u1ecbnh"
        }
      ],
      "B\u00ecnh Gia":[
        {
          "entity_id":"140",
          "region_id":"640",
          "city":"B\u00ecnh Gia"
        }
      ],
      "V\u0103n L\u00e3ng":[
        {
          "entity_id":"141",
          "region_id":"640",
          "city":"V\u0103n L\u00e3ng"
        }
      ],
      "Cao L\u1ed9c":[
        {
          "entity_id":"142",
          "region_id":"640",
          "city":"Cao L\u1ed9c"
        }
      ],
      "V\u0103n Quan":[
        {
          "entity_id":"143",
          "region_id":"640",
          "city":"V\u0103n Quan"
        }
      ],
      "B\u1eafc S\u01a1n":[
        {
          "entity_id":"144",
          "region_id":"640",
          "city":"B\u1eafc S\u01a1n"
        }
      ],
      "H\u1eefu L\u0169ng":[
        {
          "entity_id":"145",
          "region_id":"640",
          "city":"H\u1eefu L\u0169ng"
        }
      ],
      "Chi L\u0103ng":[
        {
          "entity_id":"146",
          "region_id":"640",
          "city":"Chi L\u0103ng"
        }
      ],
      "L\u1ed9c B\u00ecnh":[
        {
          "entity_id":"147",
          "region_id":"640",
          "city":"L\u1ed9c B\u00ecnh"
        }
      ],
      "\u0110\u00ecnh L\u1eadp":[
        {
          "entity_id":"148",
          "region_id":"640",
          "city":"\u0110\u00ecnh L\u1eadp"
        }
      ]
    }
  },
  "L\u00e0o Cai":{
    "id":"630",
    "name":"L\u00e0o Cai",
    "cities":{
      "Th\u00e0nh ph\u1ed1 L\u00e0o Cai":[
        {
          "entity_id":"70",
          "region_id":"630",
          "city":"Th\u00e0nh ph\u1ed1 L\u00e0o Cai"
        }
      ],
      "B\u00e1t X\u00e1t":[
        {
          "entity_id":"71",
          "region_id":"630",
          "city":"B\u00e1t X\u00e1t"
        }
      ],
      "M\u01b0\u1eddng Kh\u01b0\u01a1ng":[
        {
          "entity_id":"72",
          "region_id":"630",
          "city":"M\u01b0\u1eddng Kh\u01b0\u01a1ng"
        }
      ],
      "Si Ma Cai":[
        {
          "entity_id":"73",
          "region_id":"630",
          "city":"Si Ma Cai"
        }
      ],
      "B\u1eafc H\u00e0":[
        {
          "entity_id":"74",
          "region_id":"630",
          "city":"B\u1eafc H\u00e0"
        }
      ],
      "B\u1ea3o Th\u1eafng":[
        {
          "entity_id":"75",
          "region_id":"630",
          "city":"B\u1ea3o Th\u1eafng"
        }
      ],
      "B\u1ea3o Y\u00ean":[
        {
          "entity_id":"76",
          "region_id":"630",
          "city":"B\u1ea3o Y\u00ean"
        }
      ],
      "Sa Pa":[
        {
          "entity_id":"77",
          "region_id":"630",
          "city":"Sa Pa"
        }
      ],
      "V\u0103n B\u00e0n":[
        {
          "entity_id":"78",
          "region_id":"630",
          "city":"V\u0103n B\u00e0n"
        }
      ]
    }
  },
  "Long An":{
    "id":"700",
    "name":"Long An",
    "cities":{
      "T\u00e2n An":[
        {
          "entity_id":"580",
          "region_id":"700",
          "city":"T\u00e2n An"
        }
      ],
      "Ki\u1ebfn T\u01b0\u1eddng":[
        {
          "entity_id":"581",
          "region_id":"700",
          "city":"Ki\u1ebfn T\u01b0\u1eddng"
        }
      ],
      "T\u00e2n H\u01b0ng":[
        {
          "entity_id":"582",
          "region_id":"700",
          "city":"T\u00e2n H\u01b0ng"
        }
      ],
      "V\u0129nh H\u01b0ng":[
        {
          "entity_id":"583",
          "region_id":"700",
          "city":"V\u0129nh H\u01b0ng"
        }
      ],
      "M\u1ed9c H\u00f3a":[
        {
          "entity_id":"584",
          "region_id":"700",
          "city":"M\u1ed9c H\u00f3a"
        }
      ],
      "T\u00e2n Th\u1ea1nh":[
        {
          "entity_id":"585",
          "region_id":"700",
          "city":"T\u00e2n Th\u1ea1nh"
        }
      ],
      "Th\u1ea1nh H\u00f3a":[
        {
          "entity_id":"586",
          "region_id":"700",
          "city":"Th\u1ea1nh H\u00f3a"
        }
      ],
      "\u0110\u1ee9c Hu\u1ec7":[
        {
          "entity_id":"587",
          "region_id":"700",
          "city":"\u0110\u1ee9c Hu\u1ec7"
        }
      ],
      "\u0110\u1ee9c H\u00f2a":[
        {
          "entity_id":"588",
          "region_id":"700",
          "city":"\u0110\u1ee9c H\u00f2a"
        }
      ],
      "B\u1ebfn L\u1ee9c":[
        {
          "entity_id":"589",
          "region_id":"700",
          "city":"B\u1ebfn L\u1ee9c"
        }
      ],
      "Th\u1ee7 Th\u1eeba":[
        {
          "entity_id":"590",
          "region_id":"700",
          "city":"Th\u1ee7 Th\u1eeba"
        }
      ],
      "T\u00e2n Tr\u1ee5":[
        {
          "entity_id":"591",
          "region_id":"700",
          "city":"T\u00e2n Tr\u1ee5"
        }
      ],
      "C\u1ea7n \u0110\u01b0\u1edbc":[
        {
          "entity_id":"592",
          "region_id":"700",
          "city":"C\u1ea7n \u0110\u01b0\u1edbc"
        }
      ],
      "C\u1ea7n Giu\u1ed9c":[
        {
          "entity_id":"593",
          "region_id":"700",
          "city":"C\u1ea7n Giu\u1ed9c"
        }
      ],
      "Ch\u00e2u Th\u00e0nh":[
        {
          "entity_id":"594",
          "region_id":"700",
          "city":"Ch\u00e2u Th\u00e0nh"
        }
      ]
    }
  },
  "Nam \u0110\u1ecbnh":{
    "id":"656",
    "name":"Nam \u0110\u1ecbnh",
    "cities":{
      "Th\u00e0nh ph\u1ed1 Nam \u0110\u1ecbnh":[
        {
          "entity_id":"254",
          "region_id":"656",
          "city":"Th\u00e0nh ph\u1ed1 Nam \u0110\u1ecbnh"
        }
      ],
      "M\u1ef9 L\u1ed9c":[
        {
          "entity_id":"255",
          "region_id":"656",
          "city":"M\u1ef9 L\u1ed9c"
        }
      ],
      "V\u1ee5 B\u1ea3n":[
        {
          "entity_id":"256",
          "region_id":"656",
          "city":"V\u1ee5 B\u1ea3n"
        }
      ],
      "\u00dd Y\u00ean":[
        {
          "entity_id":"257",
          "region_id":"656",
          "city":"\u00dd Y\u00ean"
        }
      ],
      "Ngh\u0129a H\u01b0ng":[
        {
          "entity_id":"258",
          "region_id":"656",
          "city":"Ngh\u0129a H\u01b0ng"
        }
      ],
      "Nam Tr\u1ef1c":[
        {
          "entity_id":"259",
          "region_id":"656",
          "city":"Nam Tr\u1ef1c"
        }
      ],
      "Tr\u1ef1c Ninh":[
        {
          "entity_id":"260",
          "region_id":"656",
          "city":"Tr\u1ef1c Ninh"
        }
      ],
      "Xu\u00e2n Tr\u01b0\u1eddng":[
        {
          "entity_id":"261",
          "region_id":"656",
          "city":"Xu\u00e2n Tr\u01b0\u1eddng"
        }
      ],
      "Giao Th\u1ee7y":[
        {
          "entity_id":"262",
          "region_id":"656",
          "city":"Giao Th\u1ee7y"
        }
      ],
      "H\u1ea3i H\u1eadu":[
        {
          "entity_id":"263",
          "region_id":"656",
          "city":"H\u1ea3i H\u1eadu"
        }
      ]
    }
  },
  "Ngh\u1ec7 An":{
    "id":"660",
    "name":"Ngh\u1ec7 An",
    "cities":{
      "Th\u00e0nh ph\u1ed1 Vinh":[
        {
          "entity_id":"299",
          "region_id":"660",
          "city":"Th\u00e0nh ph\u1ed1 Vinh"
        }
      ],
      "Th\u1ecb x\u00e3 C\u1eeda L\u00f2":[
        {
          "entity_id":"300",
          "region_id":"660",
          "city":"Th\u1ecb x\u00e3 C\u1eeda L\u00f2"
        }
      ],
      "Th\u1ecb x\u00e3 Th\u00e1i H\u00f2a":[
        {
          "entity_id":"301",
          "region_id":"660",
          "city":"Th\u1ecb x\u00e3 Th\u00e1i H\u00f2a"
        }
      ],
      "Qu\u1ebf Phong":[
        {
          "entity_id":"302",
          "region_id":"660",
          "city":"Qu\u1ebf Phong"
        }
      ],
      "Qu\u1ef3 Ch\u00e2u":[
        {
          "entity_id":"303",
          "region_id":"660",
          "city":"Qu\u1ef3 Ch\u00e2u"
        }
      ],
      "K\u1ef3 S\u01a1n":[
        {
          "entity_id":"304",
          "region_id":"660",
          "city":"K\u1ef3 S\u01a1n"
        }
      ],
      "T\u01b0\u01a1ng D\u01b0\u01a1ng":[
        {
          "entity_id":"305",
          "region_id":"660",
          "city":"T\u01b0\u01a1ng D\u01b0\u01a1ng"
        }
      ],
      "Ngh\u0129a \u0110\u00e0n":[
        {
          "entity_id":"306",
          "region_id":"660",
          "city":"Ngh\u0129a \u0110\u00e0n"
        }
      ],
      "Qu\u1ef3 H\u1ee3p":[
        {
          "entity_id":"307",
          "region_id":"660",
          "city":"Qu\u1ef3 H\u1ee3p"
        }
      ],
      "Qu\u1ef3nh L\u01b0u":[
        {
          "entity_id":"308",
          "region_id":"660",
          "city":"Qu\u1ef3nh L\u01b0u"
        }
      ],
      "Con Cu\u00f4ng":[
        {
          "entity_id":"309",
          "region_id":"660",
          "city":"Con Cu\u00f4ng"
        }
      ],
      "T\u00e2n K\u1ef3":[
        {
          "entity_id":"310",
          "region_id":"660",
          "city":"T\u00e2n K\u1ef3"
        }
      ],
      "Anh S\u01a1n":[
        {
          "entity_id":"311",
          "region_id":"660",
          "city":"Anh S\u01a1n"
        }
      ],
      "Di\u1ec5n Ch\u00e2u":[
        {
          "entity_id":"312",
          "region_id":"660",
          "city":"Di\u1ec5n Ch\u00e2u"
        }
      ],
      "Y\u00ean Th\u00e0nh":[
        {
          "entity_id":"313",
          "region_id":"660",
          "city":"Y\u00ean Th\u00e0nh"
        }
      ],
      "\u0110\u00f4 L\u01b0\u01a1ng":[
        {
          "entity_id":"314",
          "region_id":"660",
          "city":"\u0110\u00f4 L\u01b0\u01a1ng"
        }
      ],
      "Thanh Ch\u01b0\u01a1ng":[
        {
          "entity_id":"315",
          "region_id":"660",
          "city":"Thanh Ch\u01b0\u01a1ng"
        }
      ],
      "Nghi L\u1ed9c":[
        {
          "entity_id":"316",
          "region_id":"660",
          "city":"Nghi L\u1ed9c"
        }
      ],
      "Nam \u0110\u00e0n":[
        {
          "entity_id":"317",
          "region_id":"660",
          "city":"Nam \u0110\u00e0n"
        }
      ],
      "H\u01b0ng Nguy\u00ean":[
        {
          "entity_id":"318",
          "region_id":"660",
          "city":"H\u01b0ng Nguy\u00ean"
        }
      ],
      "Ho\u00e0ng Mai":[
        {
          "entity_id":"319",
          "region_id":"660",
          "city":"Ho\u00e0ng Mai"
        }
      ]
    }
  },
  "Ninh B\u00ecnh":{
    "id":"657",
    "name":"Ninh B\u00ecnh",
    "cities":{
      "Th\u00e0nh ph\u1ed1 Ninh B\u00ecnh":[
        {
          "entity_id":"264",
          "region_id":"657",
          "city":"Th\u00e0nh ph\u1ed1 Ninh B\u00ecnh"
        }
      ],
      "Tam \u0110i\u1ec7p":[
        {
          "entity_id":"265",
          "region_id":"657",
          "city":"Tam \u0110i\u1ec7p"
        }
      ],
      "Nho Quan":[
        {
          "entity_id":"266",
          "region_id":"657",
          "city":"Nho Quan"
        }
      ],
      "Gia Vi\u1ec5n":[
        {
          "entity_id":"267",
          "region_id":"657",
          "city":"Gia Vi\u1ec5n"
        }
      ],
      "Hoa L\u01b0":[
        {
          "entity_id":"268",
          "region_id":"657",
          "city":"Hoa L\u01b0"
        }
      ],
      "Y\u00ean Kh\u00e1nh":[
        {
          "entity_id":"269",
          "region_id":"657",
          "city":"Y\u00ean Kh\u00e1nh"
        }
      ],
      "Kim S\u01a1n":[
        {
          "entity_id":"270",
          "region_id":"657",
          "city":"Kim S\u01a1n"
        }
      ],
      "Y\u00ean M\u00f4":[
        {
          "entity_id":"271",
          "region_id":"657",
          "city":"Y\u00ean M\u00f4"
        }
      ]
    }
  },
  "Ninh Thu\u1eadn":{
    "id":"678",
    "name":"Ninh Thu\u1eadn",
    "cities":{
      "Phan Rang-Th\u00e1p Ch\u00e0m":[
        {
          "entity_id":"429",
          "region_id":"678",
          "city":"Phan Rang-Th\u00e1p Ch\u00e0m"
        }
      ],
      "B\u00e1c \u00c1i":[
        {
          "entity_id":"430",
          "region_id":"678",
          "city":"B\u00e1c \u00c1i"
        }
      ],
      "Ninh S\u01a1n":[
        {
          "entity_id":"431",
          "region_id":"678",
          "city":"Ninh S\u01a1n"
        }
      ],
      "Ninh H\u1ea3i":[
        {
          "entity_id":"432",
          "region_id":"678",
          "city":"Ninh H\u1ea3i"
        }
      ],
      "Ninh Ph\u01b0\u1edbc":[
        {
          "entity_id":"433",
          "region_id":"678",
          "city":"Ninh Ph\u01b0\u1edbc"
        }
      ],
      "Thu\u1eadn B\u1eafc":[
        {
          "entity_id":"434",
          "region_id":"678",
          "city":"Thu\u1eadn B\u1eafc"
        }
      ],
      "Thu\u1eadn Nam":[
        {
          "entity_id":"435",
          "region_id":"678",
          "city":"Thu\u1eadn Nam"
        }
      ]
    }
  },
  "Ph\u00fa Th\u1ecd":{
    "id":"645",
    "name":"Ph\u00fa Th\u1ecd",
    "cities":{
      "Th\u00e0nh ph\u1ed1 Vi\u1ec7t Tr\u00ec":[
        {
          "entity_id":"173",
          "region_id":"645",
          "city":"Th\u00e0nh ph\u1ed1 Vi\u1ec7t Tr\u00ec"
        }
      ],
      "Th\u1ecb x\u00e3 Ph\u00fa Th\u1ecd":[
        {
          "entity_id":"174",
          "region_id":"645",
          "city":"Th\u1ecb x\u00e3 Ph\u00fa Th\u1ecd"
        }
      ],
      "\u0110oan H\u00f9ng":[
        {
          "entity_id":"175",
          "region_id":"645",
          "city":"\u0110oan H\u00f9ng"
        }
      ],
      "H\u1ea1 Ho\u00e0":[
        {
          "entity_id":"176",
          "region_id":"645",
          "city":"H\u1ea1 Ho\u00e0"
        }
      ],
      "Thanh Ba":[
        {
          "entity_id":"177",
          "region_id":"645",
          "city":"Thanh Ba"
        }
      ],
      "Ph\u00f9 Ninh":[
        {
          "entity_id":"178",
          "region_id":"645",
          "city":"Ph\u00f9 Ninh"
        }
      ],
      "Y\u00ean L\u1eadp":[
        {
          "entity_id":"179",
          "region_id":"645",
          "city":"Y\u00ean L\u1eadp"
        }
      ],
      "C\u1ea9m Kh\u00ea":[
        {
          "entity_id":"180",
          "region_id":"645",
          "city":"C\u1ea9m Kh\u00ea"
        }
      ],
      "Tam N\u00f4ng":[
        {
          "entity_id":"181",
          "region_id":"645",
          "city":"Tam N\u00f4ng"
        }
      ],
      "L\u00e2m Thao":[
        {
          "entity_id":"182",
          "region_id":"645",
          "city":"L\u00e2m Thao"
        }
      ],
      "Thanh S\u01a1n":[
        {
          "entity_id":"183",
          "region_id":"645",
          "city":"Thanh S\u01a1n"
        }
      ],
      "Thanh Thu\u1ef7":[
        {
          "entity_id":"184",
          "region_id":"645",
          "city":"Thanh Thu\u1ef7"
        }
      ],
      "T\u00e2n S\u01a1n":[
        {
          "entity_id":"185",
          "region_id":"645",
          "city":"T\u00e2n S\u01a1n"
        }
      ]
    }
  },
  "Ph\u00fa Y\u00ean":{
    "id":"674",
    "name":"Ph\u00fa Y\u00ean",
    "cities":{
      "Tuy Ho\u00e0":[
        {
          "entity_id":"411",
          "region_id":"674",
          "city":"Tuy Ho\u00e0"
        }
      ],
      "S\u00f4ng C\u1ea7u":[
        {
          "entity_id":"412",
          "region_id":"674",
          "city":"S\u00f4ng C\u1ea7u"
        }
      ],
      "\u0110\u1ed3ng Xu\u00e2n":[
        {
          "entity_id":"413",
          "region_id":"674",
          "city":"\u0110\u1ed3ng Xu\u00e2n"
        }
      ],
      "Tuy An":[
        {
          "entity_id":"414",
          "region_id":"674",
          "city":"Tuy An"
        }
      ],
      "S\u01a1n H\u00f2a":[
        {
          "entity_id":"415",
          "region_id":"674",
          "city":"S\u01a1n H\u00f2a"
        }
      ],
      "S\u00f4ng Hinh":[
        {
          "entity_id":"416",
          "region_id":"674",
          "city":"S\u00f4ng Hinh"
        }
      ],
      "T\u00e2y Ho\u00e0":[
        {
          "entity_id":"417",
          "region_id":"674",
          "city":"T\u00e2y Ho\u00e0"
        }
      ],
      "Ph\u00fa Ho\u00e0":[
        {
          "entity_id":"418",
          "region_id":"674",
          "city":"Ph\u00fa Ho\u00e0"
        }
      ],
      "\u0110\u00f4ng H\u00f2a":[
        {
          "entity_id":"419",
          "region_id":"674",
          "city":"\u0110\u00f4ng H\u00f2a"
        }
      ]
    }
  },
  "Qu\u1ea3ng B\u00ecnh":{
    "id":"664",
    "name":"Qu\u1ea3ng B\u00ecnh",
    "cities":{
      "Th\u00e0nh ph\u1ed1 \u0110\u1ed3ng H\u1edbi":[
        {
          "entity_id":"333",
          "region_id":"664",
          "city":"Th\u00e0nh ph\u1ed1 \u0110\u1ed3ng H\u1edbi"
        }
      ],
      "Minh H\u00f3a":[
        {
          "entity_id":"334",
          "region_id":"664",
          "city":"Minh H\u00f3a"
        }
      ],
      "Tuy\u00ean H\u00f3a":[
        {
          "entity_id":"335",
          "region_id":"664",
          "city":"Tuy\u00ean H\u00f3a"
        }
      ],
      "Qu\u1ea3ng Tr\u1ea1ch":[
        {
          "entity_id":"336",
          "region_id":"664",
          "city":"Qu\u1ea3ng Tr\u1ea1ch"
        }
      ],
      "B\u1ed1 Tr\u1ea1ch":[
        {
          "entity_id":"337",
          "region_id":"664",
          "city":"B\u1ed1 Tr\u1ea1ch"
        }
      ],
      "Qu\u1ea3ng Ninh":[
        {
          "entity_id":"338",
          "region_id":"664",
          "city":"Qu\u1ea3ng Ninh"
        }
      ],
      "L\u1ec7 Th\u1ee7y":[
        {
          "entity_id":"339",
          "region_id":"664",
          "city":"L\u1ec7 Th\u1ee7y"
        }
      ],
      "Ba \u0110\u1ed3n":[
        {
          "entity_id":"340",
          "region_id":"664",
          "city":"Ba \u0110\u1ed3n"
        }
      ]
    }
  },
  "Qu\u1ea3ng Nam":{
    "id":"669",
    "name":"Qu\u1ea3ng Nam",
    "cities":{
      "Tam K\u1ef3":[
        {
          "entity_id":"368",
          "region_id":"669",
          "city":"Tam K\u1ef3"
        }
      ],
      "H\u1ed9i An":[
        {
          "entity_id":"369",
          "region_id":"669",
          "city":"H\u1ed9i An"
        }
      ],
      "T\u00e2y Giang":[
        {
          "entity_id":"370",
          "region_id":"669",
          "city":"T\u00e2y Giang"
        }
      ],
      "\u0110\u00f4ng Giang":[
        {
          "entity_id":"371",
          "region_id":"669",
          "city":"\u0110\u00f4ng Giang"
        }
      ],
      "\u0110\u1ea1i L\u1ed9c":[
        {
          "entity_id":"372",
          "region_id":"669",
          "city":"\u0110\u1ea1i L\u1ed9c"
        }
      ],
      "\u0110i\u1ec7n B\u00e0n":[
        {
          "entity_id":"373",
          "region_id":"669",
          "city":"\u0110i\u1ec7n B\u00e0n"
        }
      ],
      "Duy Xuy\u00ean":[
        {
          "entity_id":"374",
          "region_id":"669",
          "city":"Duy Xuy\u00ean"
        }
      ],
      "Qu\u1ebf S\u01a1n":[
        {
          "entity_id":"375",
          "region_id":"669",
          "city":"Qu\u1ebf S\u01a1n"
        }
      ],
      "Nam Giang":[
        {
          "entity_id":"376",
          "region_id":"669",
          "city":"Nam Giang"
        }
      ],
      "Ph\u01b0\u1edbc S\u01a1n":[
        {
          "entity_id":"377",
          "region_id":"669",
          "city":"Ph\u01b0\u1edbc S\u01a1n"
        }
      ],
      "Hi\u1ec7p \u0110\u1ee9c":[
        {
          "entity_id":"378",
          "region_id":"669",
          "city":"Hi\u1ec7p \u0110\u1ee9c"
        }
      ],
      "Th\u0103ng B\u00ecnh":[
        {
          "entity_id":"379",
          "region_id":"669",
          "city":"Th\u0103ng B\u00ecnh"
        }
      ],
      "Ti\u00ean Ph\u01b0\u1edbc":[
        {
          "entity_id":"380",
          "region_id":"669",
          "city":"Ti\u00ean Ph\u01b0\u1edbc"
        }
      ],
      "B\u1eafc Tr\u00e0 My":[
        {
          "entity_id":"381",
          "region_id":"669",
          "city":"B\u1eafc Tr\u00e0 My"
        }
      ],
      "Nam Tr\u00e0 My":[
        {
          "entity_id":"382",
          "region_id":"669",
          "city":"Nam Tr\u00e0 My"
        }
      ],
      "N\u00fai Th\u00e0nh":[
        {
          "entity_id":"383",
          "region_id":"669",
          "city":"N\u00fai Th\u00e0nh"
        }
      ],
      "Ph\u00fa Ninh":[
        {
          "entity_id":"384",
          "region_id":"669",
          "city":"Ph\u00fa Ninh"
        }
      ],
      "N\u00f4ng S\u01a1n":[
        {
          "entity_id":"385",
          "region_id":"669",
          "city":"N\u00f4ng S\u01a1n"
        }
      ]
    }
  },
  "Qu\u1ea3ng Ng\u00e3i":{
    "id":"671",
    "name":"Qu\u1ea3ng Ng\u00e3i",
    "cities":{
      "Qu\u1ea3ng Ng\u00e3i":[
        {
          "entity_id":"386",
          "region_id":"671",
          "city":"Qu\u1ea3ng Ng\u00e3i"
        }
      ],
      "B\u00ecnh S\u01a1n":[
        {
          "entity_id":"387",
          "region_id":"671",
          "city":"B\u00ecnh S\u01a1n"
        }
      ],
      "Tr\u00e0 B\u1ed3ng":[
        {
          "entity_id":"388",
          "region_id":"671",
          "city":"Tr\u00e0 B\u1ed3ng"
        }
      ],
      "T\u00e2y Tr\u00e0":[
        {
          "entity_id":"389",
          "region_id":"671",
          "city":"T\u00e2y Tr\u00e0"
        }
      ],
      "S\u01a1n T\u1ecbnh":[
        {
          "entity_id":"390",
          "region_id":"671",
          "city":"S\u01a1n T\u1ecbnh"
        }
      ],
      "T\u01b0 Ngh\u0129a":[
        {
          "entity_id":"391",
          "region_id":"671",
          "city":"T\u01b0 Ngh\u0129a"
        }
      ],
      "S\u01a1n H\u00e0":[
        {
          "entity_id":"392",
          "region_id":"671",
          "city":"S\u01a1n H\u00e0"
        }
      ],
      "S\u01a1n T\u00e2y":[
        {
          "entity_id":"393",
          "region_id":"671",
          "city":"S\u01a1n T\u00e2y"
        }
      ],
      "Minh Long":[
        {
          "entity_id":"394",
          "region_id":"671",
          "city":"Minh Long"
        }
      ],
      "Ngh\u0129a H\u00e0nh":[
        {
          "entity_id":"395",
          "region_id":"671",
          "city":"Ngh\u0129a H\u00e0nh"
        }
      ],
      "M\u1ed9 \u0110\u1ee9c":[
        {
          "entity_id":"396",
          "region_id":"671",
          "city":"M\u1ed9 \u0110\u1ee9c"
        }
      ],
      "\u0110\u1ee9c Ph\u1ed5":[
        {
          "entity_id":"397",
          "region_id":"671",
          "city":"\u0110\u1ee9c Ph\u1ed5"
        }
      ],
      "Ba T\u01a1":[
        {
          "entity_id":"398",
          "region_id":"671",
          "city":"Ba T\u01a1"
        }
      ],
      "L\u00fd S\u01a1n":[
        {
          "entity_id":"399",
          "region_id":"671",
          "city":"L\u00fd S\u01a1n"
        }
      ]
    }
  },
  "Qu\u1ea3ng Ninh":{
    "id":"612",
    "name":"Qu\u1ea3ng Ninh",
    "cities":{
      "Th\u00e0nh ph\u1ed1 H\u1ea1 Long":[
        {
          "entity_id":"149",
          "region_id":"612",
          "city":"Th\u00e0nh ph\u1ed1 H\u1ea1 Long"
        }
      ],
      "M\u00f3ng C\u00e1i":[
        {
          "entity_id":"150",
          "region_id":"612",
          "city":"M\u00f3ng C\u00e1i"
        }
      ],
      "C\u1ea9m Ph\u1ea3":[
        {
          "entity_id":"151",
          "region_id":"612",
          "city":"C\u1ea9m Ph\u1ea3"
        }
      ],
      "U\u00f4ng B\u00ed":[
        {
          "entity_id":"152",
          "region_id":"612",
          "city":"U\u00f4ng B\u00ed"
        }
      ],
      "B\u00ecnh Li\u00eau":[
        {
          "entity_id":"153",
          "region_id":"612",
          "city":"B\u00ecnh Li\u00eau"
        }
      ],
      "Ti\u00ean Y\u00ean":[
        {
          "entity_id":"154",
          "region_id":"612",
          "city":"Ti\u00ean Y\u00ean"
        }
      ],
      "\u0110\u1ea7m H\u00e0":[
        {
          "entity_id":"155",
          "region_id":"612",
          "city":"\u0110\u1ea7m H\u00e0"
        }
      ],
      "H\u1ea3i H\u00e0":[
        {
          "entity_id":"156",
          "region_id":"612",
          "city":"H\u1ea3i H\u00e0"
        }
      ],
      "Ba Ch\u1ebd":[
        {
          "entity_id":"157",
          "region_id":"612",
          "city":"Ba Ch\u1ebd"
        }
      ],
      "V\u00e2n \u0110\u1ed3n":[
        {
          "entity_id":"158",
          "region_id":"612",
          "city":"V\u00e2n \u0110\u1ed3n"
        }
      ],
      "Ho\u00e0nh B\u1ed3":[
        {
          "entity_id":"159",
          "region_id":"612",
          "city":"Ho\u00e0nh B\u1ed3"
        }
      ],
      "\u0110\u00f4ng Tri\u1ec1u":[
        {
          "entity_id":"160",
          "region_id":"612",
          "city":"\u0110\u00f4ng Tri\u1ec1u"
        }
      ],
      "Qu\u1ea3ng Y\u00ean":[
        {
          "entity_id":"161",
          "region_id":"612",
          "city":"Qu\u1ea3ng Y\u00ean"
        }
      ],
      "C\u00f4 T\u00f4":[
        {
          "entity_id":"162",
          "region_id":"612",
          "city":"C\u00f4 T\u00f4"
        }
      ]
    }
  },
  "Qu\u1ea3ng Tr\u1ecb":{
    "id":"665",
    "name":"Qu\u1ea3ng Tr\u1ecb",
    "cities":{
      "Th\u00e0nh ph\u1ed1 \u0110\u00f4ng H\u00e0":[
        {
          "entity_id":"341",
          "region_id":"665",
          "city":"Th\u00e0nh ph\u1ed1 \u0110\u00f4ng H\u00e0"
        }
      ],
      "Th\u1ecb x\u00e3 Qu\u1ea3ng Tr\u1ecb":[
        {
          "entity_id":"342",
          "region_id":"665",
          "city":"Th\u1ecb x\u00e3 Qu\u1ea3ng Tr\u1ecb"
        }
      ],
      "V\u0129nh Linh":[
        {
          "entity_id":"343",
          "region_id":"665",
          "city":"V\u0129nh Linh"
        }
      ],
      "H\u01b0\u1edbng H\u00f3a":[
        {
          "entity_id":"344",
          "region_id":"665",
          "city":"H\u01b0\u1edbng H\u00f3a"
        }
      ],
      "Gio Linh":[
        {
          "entity_id":"345",
          "region_id":"665",
          "city":"Gio Linh"
        }
      ],
      "\u0110a Kr\u00f4ng":[
        {
          "entity_id":"346",
          "region_id":"665",
          "city":"\u0110a Kr\u00f4ng"
        }
      ],
      "Cam L\u1ed9":[
        {
          "entity_id":"347",
          "region_id":"665",
          "city":"Cam L\u1ed9"
        }
      ],
      "Tri\u1ec7u Phong":[
        {
          "entity_id":"348",
          "region_id":"665",
          "city":"Tri\u1ec7u Phong"
        }
      ],
      "H\u1ea3i L\u0103ng":[
        {
          "entity_id":"349",
          "region_id":"665",
          "city":"H\u1ea3i L\u0103ng"
        }
      ],
      "C\u1ed3n C\u1ecf":[
        {
          "entity_id":"350",
          "region_id":"665",
          "city":"C\u1ed3n C\u1ecf"
        }
      ]
    }
  },
  "S\u00f3c Tr\u0103ng":{
    "id":"714",
    "name":"S\u00f3c Tr\u0103ng",
    "cities":{
      "Th\u00e0nh ph\u1ed1 S\u00f3c Tr\u0103ng":[
        {
          "entity_id":"687",
          "region_id":"714",
          "city":"Th\u00e0nh ph\u1ed1 S\u00f3c Tr\u0103ng"
        }
      ],
      "Ch\u00e2u Th\u00e0nh":[
        {
          "entity_id":"688",
          "region_id":"714",
          "city":"Ch\u00e2u Th\u00e0nh"
        }
      ],
      "K\u1ebf S\u00e1ch":[
        {
          "entity_id":"689",
          "region_id":"714",
          "city":"K\u1ebf S\u00e1ch"
        }
      ],
      "M\u1ef9 T\u00fa":[
        {
          "entity_id":"690",
          "region_id":"714",
          "city":"M\u1ef9 T\u00fa"
        }
      ],
      "C\u00f9 Lao Dung":[
        {
          "entity_id":"691",
          "region_id":"714",
          "city":"C\u00f9 Lao Dung"
        }
      ],
      "Long Ph\u00fa":[
        {
          "entity_id":"692",
          "region_id":"714",
          "city":"Long Ph\u00fa"
        }
      ],
      "M\u1ef9 Xuy\u00ean":[
        {
          "entity_id":"693",
          "region_id":"714",
          "city":"M\u1ef9 Xuy\u00ean"
        }
      ],
      "Ng\u00e3 N\u0103m":[
        {
          "entity_id":"694",
          "region_id":"714",
          "city":"Ng\u00e3 N\u0103m"
        }
      ],
      "Th\u1ea1nh Tr\u1ecb":[
        {
          "entity_id":"695",
          "region_id":"714",
          "city":"Th\u1ea1nh Tr\u1ecb"
        }
      ],
      "V\u0129nh Ch\u00e2u":[
        {
          "entity_id":"696",
          "region_id":"714",
          "city":"V\u0129nh Ch\u00e2u"
        }
      ],
      "Tr\u1ea7n \u0110\u1ec1":[
        {
          "entity_id":"697",
          "region_id":"714",
          "city":"Tr\u1ea7n \u0110\u1ec1"
        }
      ]
    }
  },
  "S\u01a1n La":{
    "id":"634",
    "name":"S\u01a1n La",
    "cities":{
      "Th\u00e0nh ph\u1ed1 S\u01a1n La":[
        {
          "entity_id":"97",
          "region_id":"634",
          "city":"Th\u00e0nh ph\u1ed1 S\u01a1n La"
        }
      ],
      "Qu\u1ef3nh Nhai":[
        {
          "entity_id":"98",
          "region_id":"634",
          "city":"Qu\u1ef3nh Nhai"
        }
      ],
      "Thu\u1eadn Ch\u00e2u":[
        {
          "entity_id":"99",
          "region_id":"634",
          "city":"Thu\u1eadn Ch\u00e2u"
        }
      ],
      "M\u01b0\u1eddng La":[
        {
          "entity_id":"100",
          "region_id":"634",
          "city":"M\u01b0\u1eddng La"
        }
      ],
      "B\u1eafc Y\u00ean":[
        {
          "entity_id":"101",
          "region_id":"634",
          "city":"B\u1eafc Y\u00ean"
        }
      ],
      "Ph\u00f9 Y\u00ean":[
        {
          "entity_id":"102",
          "region_id":"634",
          "city":"Ph\u00f9 Y\u00ean"
        }
      ],
      "M\u1ed9c Ch\u00e2u":[
        {
          "entity_id":"103",
          "region_id":"634",
          "city":"M\u1ed9c Ch\u00e2u"
        }
      ],
      "Y\u00ean Ch\u00e2u":[
        {
          "entity_id":"104",
          "region_id":"634",
          "city":"Y\u00ean Ch\u00e2u"
        }
      ],
      "Mai S\u01a1n":[
        {
          "entity_id":"105",
          "region_id":"634",
          "city":"Mai S\u01a1n"
        }
      ],
      "S\u00f4ng M\u00e3":[
        {
          "entity_id":"106",
          "region_id":"634",
          "city":"S\u00f4ng M\u00e3"
        }
      ],
      "S\u1ed1p C\u1ed9p":[
        {
          "entity_id":"107",
          "region_id":"634",
          "city":"S\u1ed1p C\u1ed9p"
        }
      ],
      "V\u00e2n H\u1ed3":[
        {
          "entity_id":"108",
          "region_id":"634",
          "city":"V\u00e2n H\u1ed3"
        }
      ]
    }
  },
  "T\u00e2y Ninh":{
    "id":"692",
    "name":"T\u00e2y Ninh",
    "cities":{
      "T\u00e2y Ninh":[
        {
          "entity_id":"519",
          "region_id":"692",
          "city":"T\u00e2y Ninh"
        }
      ],
      "T\u00e2n Bi\u00ean":[
        {
          "entity_id":"520",
          "region_id":"692",
          "city":"T\u00e2n Bi\u00ean"
        }
      ],
      "T\u00e2n Ch\u00e2u":[
        {
          "entity_id":"521",
          "region_id":"692",
          "city":"T\u00e2n Ch\u00e2u"
        }
      ],
      "D\u01b0\u01a1ng Minh Ch\u00e2u":[
        {
          "entity_id":"522",
          "region_id":"692",
          "city":"D\u01b0\u01a1ng Minh Ch\u00e2u"
        }
      ],
      "Ch\u00e2u Th\u00e0nh":[
        {
          "entity_id":"523",
          "region_id":"692",
          "city":"Ch\u00e2u Th\u00e0nh"
        }
      ],
      "H\u00f2a Th\u00e0nh":[
        {
          "entity_id":"524",
          "region_id":"692",
          "city":"H\u00f2a Th\u00e0nh"
        }
      ],
      "G\u00f2 D\u1ea7u":[
        {
          "entity_id":"525",
          "region_id":"692",
          "city":"G\u00f2 D\u1ea7u"
        }
      ],
      "B\u1ebfn C\u1ea7u":[
        {
          "entity_id":"526",
          "region_id":"692",
          "city":"B\u1ebfn C\u1ea7u"
        }
      ],
      "Tr\u1ea3ng B\u00e0ng":[
        {
          "entity_id":"527",
          "region_id":"692",
          "city":"Tr\u1ea3ng B\u00e0ng"
        }
      ]
    }
  },
  "Th\u00e1i B\u00ecnh":{
    "id":"654",
    "name":"Th\u00e1i B\u00ecnh",
    "cities":{
      "Th\u00e0nh ph\u1ed1 Th\u00e1i B\u00ecnh":[
        {
          "entity_id":"240",
          "region_id":"654",
          "city":"Th\u00e0nh ph\u1ed1 Th\u00e1i B\u00ecnh"
        }
      ],
      "Qu\u1ef3nh Ph\u1ee5":[
        {
          "entity_id":"241",
          "region_id":"654",
          "city":"Qu\u1ef3nh Ph\u1ee5"
        }
      ],
      "H\u01b0ng H\u00e0":[
        {
          "entity_id":"242",
          "region_id":"654",
          "city":"H\u01b0ng H\u00e0"
        }
      ],
      "\u0110\u00f4ng H\u01b0ng":[
        {
          "entity_id":"243",
          "region_id":"654",
          "city":"\u0110\u00f4ng H\u01b0ng"
        }
      ],
      "Th\u00e1i Th\u1ee5y":[
        {
          "entity_id":"244",
          "region_id":"654",
          "city":"Th\u00e1i Th\u1ee5y"
        }
      ],
      "Ti\u1ec1n H\u1ea3i":[
        {
          "entity_id":"245",
          "region_id":"654",
          "city":"Ti\u1ec1n H\u1ea3i"
        }
      ],
      "Ki\u1ebfn X\u01b0\u01a1ng":[
        {
          "entity_id":"246",
          "region_id":"654",
          "city":"Ki\u1ebfn X\u01b0\u01a1ng"
        }
      ],
      "V\u0169 Th\u01b0":[
        {
          "entity_id":"247",
          "region_id":"654",
          "city":"V\u0169 Th\u01b0"
        }
      ]
    }
  },
  "Th\u00e1i Nguy\u00ean":{
    "id":"639",
    "name":"Th\u00e1i Nguy\u00ean",
    "cities":{
      "Th\u00e0nh ph\u1ed1 Th\u00e1i Nguy\u00ean":[
        {
          "entity_id":"129",
          "region_id":"639",
          "city":"Th\u00e0nh ph\u1ed1 Th\u00e1i Nguy\u00ean"
        }
      ],
      "Th\u00e0nh ph\u1ed1 S\u00f4ng C\u00f4ng":[
        {
          "entity_id":"130",
          "region_id":"639",
          "city":"Th\u00e0nh ph\u1ed1 S\u00f4ng C\u00f4ng"
        }
      ],
      "\u0110\u1ecbnh H\u00f3a":[
        {
          "entity_id":"131",
          "region_id":"639",
          "city":"\u0110\u1ecbnh H\u00f3a"
        }
      ],
      "Ph\u00fa L\u01b0\u01a1ng":[
        {
          "entity_id":"132",
          "region_id":"639",
          "city":"Ph\u00fa L\u01b0\u01a1ng"
        }
      ],
      "\u0110\u1ed3ng H\u1ef7":[
        {
          "entity_id":"133",
          "region_id":"639",
          "city":"\u0110\u1ed3ng H\u1ef7"
        }
      ],
      "V\u00f5 Nhai":[
        {
          "entity_id":"134",
          "region_id":"639",
          "city":"V\u00f5 Nhai"
        }
      ],
      "\u0110\u1ea1i T\u1eeb":[
        {
          "entity_id":"135",
          "region_id":"639",
          "city":"\u0110\u1ea1i T\u1eeb"
        }
      ],
      "Ph\u1ed5 Y\u00ean":[
        {
          "entity_id":"136",
          "region_id":"639",
          "city":"Ph\u1ed5 Y\u00ean"
        }
      ],
      "Ph\u00fa B\u00ecnh":[
        {
          "entity_id":"137",
          "region_id":"639",
          "city":"Ph\u00fa B\u00ecnh"
        }
      ]
    }
  },
  "Thanh H\u00f3a":{
    "id":"611",
    "name":"Thanh H\u00f3a",
    "cities":{
      "Th\u00e0nh ph\u1ed1 Thanh Ho\u00e1":[
        {
          "entity_id":"272",
          "region_id":"611",
          "city":"Th\u00e0nh ph\u1ed1 Thanh Ho\u00e1"
        }
      ],
      "B\u1ec9m S\u01a1n":[
        {
          "entity_id":"273",
          "region_id":"611",
          "city":"B\u1ec9m S\u01a1n"
        }
      ],
      "S\u1ea7m S\u01a1n":[
        {
          "entity_id":"274",
          "region_id":"611",
          "city":"S\u1ea7m S\u01a1n"
        }
      ],
      "M\u01b0\u1eddng L\u00e1t":[
        {
          "entity_id":"275",
          "region_id":"611",
          "city":"M\u01b0\u1eddng L\u00e1t"
        }
      ],
      "Quan H\u00f3a":[
        {
          "entity_id":"276",
          "region_id":"611",
          "city":"Quan H\u00f3a"
        }
      ],
      "B\u00e1 Th\u01b0\u1edbc":[
        {
          "entity_id":"277",
          "region_id":"611",
          "city":"B\u00e1 Th\u01b0\u1edbc"
        }
      ],
      "Quan S\u01a1n":[
        {
          "entity_id":"278",
          "region_id":"611",
          "city":"Quan S\u01a1n"
        }
      ],
      "Lang Ch\u00e1nh":[
        {
          "entity_id":"279",
          "region_id":"611",
          "city":"Lang Ch\u00e1nh"
        }
      ],
      "Ng\u1ecdc L\u1eb7c":[
        {
          "entity_id":"280",
          "region_id":"611",
          "city":"Ng\u1ecdc L\u1eb7c"
        }
      ],
      "C\u1ea9m Th\u1ee7y":[
        {
          "entity_id":"281",
          "region_id":"611",
          "city":"C\u1ea9m Th\u1ee7y"
        }
      ],
      "Th\u1ea1ch Th\u00e0nh":[
        {
          "entity_id":"282",
          "region_id":"611",
          "city":"Th\u1ea1ch Th\u00e0nh"
        }
      ],
      "H\u00e0 Trung":[
        {
          "entity_id":"283",
          "region_id":"611",
          "city":"H\u00e0 Trung"
        }
      ],
      "V\u0129nh L\u1ed9c":[
        {
          "entity_id":"284",
          "region_id":"611",
          "city":"V\u0129nh L\u1ed9c"
        }
      ],
      "Y\u00ean \u0110\u1ecbnh":[
        {
          "entity_id":"285",
          "region_id":"611",
          "city":"Y\u00ean \u0110\u1ecbnh"
        }
      ],
      "Th\u1ecd Xu\u00e2n":[
        {
          "entity_id":"286",
          "region_id":"611",
          "city":"Th\u1ecd Xu\u00e2n"
        }
      ],
      "Th\u01b0\u1eddng Xu\u00e2n":[
        {
          "entity_id":"287",
          "region_id":"611",
          "city":"Th\u01b0\u1eddng Xu\u00e2n"
        }
      ],
      "Tri\u1ec7u S\u01a1n":[
        {
          "entity_id":"288",
          "region_id":"611",
          "city":"Tri\u1ec7u S\u01a1n"
        }
      ],
      "Thi\u1ec7u H\u00f3a":[
        {
          "entity_id":"289",
          "region_id":"611",
          "city":"Thi\u1ec7u H\u00f3a"
        }
      ],
      "Ho\u1eb1ng H\u00f3a":[
        {
          "entity_id":"290",
          "region_id":"611",
          "city":"Ho\u1eb1ng H\u00f3a"
        }
      ],
      "H\u1eadu L\u1ed9c":[
        {
          "entity_id":"291",
          "region_id":"611",
          "city":"H\u1eadu L\u1ed9c"
        }
      ],
      "Nga S\u01a1n":[
        {
          "entity_id":"292",
          "region_id":"611",
          "city":"Nga S\u01a1n"
        }
      ],
      "Nh\u01b0 Xu\u00e2n":[
        {
          "entity_id":"293",
          "region_id":"611",
          "city":"Nh\u01b0 Xu\u00e2n"
        }
      ],
      "Nh\u01b0 Thanh":[
        {
          "entity_id":"294",
          "region_id":"611",
          "city":"Nh\u01b0 Thanh"
        }
      ],
      "N\u00f4ng C\u1ed1ng":[
        {
          "entity_id":"295",
          "region_id":"611",
          "city":"N\u00f4ng C\u1ed1ng"
        }
      ],
      "\u0110\u00f4ng S\u01a1n":[
        {
          "entity_id":"296",
          "region_id":"611",
          "city":"\u0110\u00f4ng S\u01a1n"
        }
      ],
      "Qu\u1ea3ng X\u01b0\u01a1ng":[
        {
          "entity_id":"297",
          "region_id":"611",
          "city":"Qu\u1ea3ng X\u01b0\u01a1ng"
        }
      ],
      "T\u0129nh Gia":[
        {
          "entity_id":"298",
          "region_id":"611",
          "city":"T\u0129nh Gia"
        }
      ]
    }
  },
  "Th\u1eeba Thi\u00ean Hu\u1ebf":{
    "id":"666",
    "name":"Th\u1eeba Thi\u00ean Hu\u1ebf",
    "cities":{
      "Th\u00e0nh ph\u1ed1 Hu\u1ebf":[
        {
          "entity_id":"351",
          "region_id":"666",
          "city":"Th\u00e0nh ph\u1ed1 Hu\u1ebf"
        }
      ],
      "Phong \u0110i\u1ec1n":[
        {
          "entity_id":"352",
          "region_id":"666",
          "city":"Phong \u0110i\u1ec1n"
        }
      ],
      "Qu\u1ea3ng \u0110i\u1ec1n":[
        {
          "entity_id":"353",
          "region_id":"666",
          "city":"Qu\u1ea3ng \u0110i\u1ec1n"
        }
      ],
      "Ph\u00fa Vang":[
        {
          "entity_id":"354",
          "region_id":"666",
          "city":"Ph\u00fa Vang"
        }
      ],
      "H\u01b0\u01a1ng Th\u1ee7y":[
        {
          "entity_id":"355",
          "region_id":"666",
          "city":"H\u01b0\u01a1ng Th\u1ee7y"
        }
      ],
      "Th\u1ecb x\u00e3 H\u01b0\u01a1ng Tr\u00e0":[
        {
          "entity_id":"356",
          "region_id":"666",
          "city":"Th\u1ecb x\u00e3 H\u01b0\u01a1ng Tr\u00e0"
        }
      ],
      "A L\u01b0\u1edbi":[
        {
          "entity_id":"357",
          "region_id":"666",
          "city":"A L\u01b0\u1edbi"
        }
      ],
      "Ph\u00fa L\u1ed9c":[
        {
          "entity_id":"358",
          "region_id":"666",
          "city":"Ph\u00fa L\u1ed9c"
        }
      ],
      "Nam \u0110\u00f4ng":[
        {
          "entity_id":"359",
          "region_id":"666",
          "city":"Nam \u0110\u00f4ng"
        }
      ]
    }
  },
  "Ti\u1ec1n Giang":{
    "id":"702",
    "name":"Ti\u1ec1n Giang",
    "cities":{
      "M\u1ef9 Tho":[
        {
          "entity_id":"595",
          "region_id":"702",
          "city":"M\u1ef9 Tho"
        }
      ],
      "G\u00f2 C\u00f4ng":[
        {
          "entity_id":"596",
          "region_id":"702",
          "city":"G\u00f2 C\u00f4ng"
        }
      ],
      "Cai L\u1eady":[
        {
          "entity_id":"600",
          "region_id":"702",
          "city":"Cai L\u1eady"
        }
      ],
      "T\u00e2n Ph\u01b0\u1edbc":[
        {
          "entity_id":"598",
          "region_id":"702",
          "city":"T\u00e2n Ph\u01b0\u1edbc"
        }
      ],
      "C\u00e1i B\u00e8":[
        {
          "entity_id":"599",
          "region_id":"702",
          "city":"C\u00e1i B\u00e8"
        }
      ],
      "Ch\u00e2u Th\u00e0nh":[
        {
          "entity_id":"601",
          "region_id":"702",
          "city":"Ch\u00e2u Th\u00e0nh"
        }
      ],
      "Ch\u1ee3 G\u1ea1o":[
        {
          "entity_id":"602",
          "region_id":"702",
          "city":"Ch\u1ee3 G\u1ea1o"
        }
      ],
      "G\u00f2 C\u00f4ng T\u00e2y":[
        {
          "entity_id":"603",
          "region_id":"702",
          "city":"G\u00f2 C\u00f4ng T\u00e2y"
        }
      ],
      "G\u00f2 C\u00f4ng \u0110\u00f4ng":[
        {
          "entity_id":"604",
          "region_id":"702",
          "city":"G\u00f2 C\u00f4ng \u0110\u00f4ng"
        }
      ],
      "T\u00e2n Ph\u00fa \u0110\u00f4ng":[
        {
          "entity_id":"605",
          "region_id":"702",
          "city":"T\u00e2n Ph\u00fa \u0110\u00f4ng"
        }
      ]
    }
  },
  "Tr\u00e0 Vinh":{
    "id":"704",
    "name":"Tr\u00e0 Vinh",
    "cities":{
      "Tr\u00e0 Vinh":[
        {
          "entity_id":"615",
          "region_id":"704",
          "city":"Tr\u00e0 Vinh"
        }
      ],
      "C\u00e0ng Long":[
        {
          "entity_id":"616",
          "region_id":"704",
          "city":"C\u00e0ng Long"
        }
      ],
      "C\u1ea7u K\u00e8":[
        {
          "entity_id":"617",
          "region_id":"704",
          "city":"C\u1ea7u K\u00e8"
        }
      ],
      "Ti\u1ec3u C\u1ea7n":[
        {
          "entity_id":"618",
          "region_id":"704",
          "city":"Ti\u1ec3u C\u1ea7n"
        }
      ],
      "Ch\u00e2u Th\u00e0nh":[
        {
          "entity_id":"619",
          "region_id":"704",
          "city":"Ch\u00e2u Th\u00e0nh"
        }
      ],
      "C\u1ea7u Ngang":[
        {
          "entity_id":"620",
          "region_id":"704",
          "city":"C\u1ea7u Ngang"
        }
      ],
      "Tr\u00e0 C\u00fa":[
        {
          "entity_id":"621",
          "region_id":"704",
          "city":"Tr\u00e0 C\u00fa"
        }
      ],
      "Duy\u00ean H\u1ea3i":[
        {
          "entity_id":"623",
          "region_id":"704",
          "city":"Duy\u00ean H\u1ea3i"
        }
      ]
    }
  },
  "Tuy\u00ean Quang":{
    "id":"628",
    "name":"Tuy\u00ean Quang",
    "cities":{
      "Th\u00e0nh ph\u1ed1 Tuy\u00ean Quang":[
        {
          "entity_id":"63",
          "region_id":"628",
          "city":"Th\u00e0nh ph\u1ed1 Tuy\u00ean Quang"
        }
      ],
      "L\u00e2m B\u00ecnh":[
        {
          "entity_id":"64",
          "region_id":"628",
          "city":"L\u00e2m B\u00ecnh"
        }
      ],
      "Na Hang":[
        {
          "entity_id":"65",
          "region_id":"628",
          "city":"Na Hang"
        }
      ],
      "Chi\u00eam H\u00f3a":[
        {
          "entity_id":"66",
          "region_id":"628",
          "city":"Chi\u00eam H\u00f3a"
        }
      ],
      "H\u00e0m Y\u00ean":[
        {
          "entity_id":"67",
          "region_id":"628",
          "city":"H\u00e0m Y\u00ean"
        }
      ],
      "Y\u00ean S\u01a1n":[
        {
          "entity_id":"68",
          "region_id":"628",
          "city":"Y\u00ean S\u01a1n"
        }
      ],
      "S\u01a1n D\u01b0\u01a1ng":[
        {
          "entity_id":"69",
          "region_id":"628",
          "city":"S\u01a1n D\u01b0\u01a1ng"
        }
      ]
    }
  },
  "V\u0129nh Long":{
    "id":"706",
    "name":"V\u0129nh Long",
    "cities":{
      "V\u0129nh Long":[
        {
          "entity_id":"624",
          "region_id":"706",
          "city":"V\u0129nh Long"
        }
      ],
      "Long H\u1ed3":[
        {
          "entity_id":"625",
          "region_id":"706",
          "city":"Long H\u1ed3"
        }
      ],
      "Mang Th\u00edt":[
        {
          "entity_id":"626",
          "region_id":"706",
          "city":"Mang Th\u00edt"
        }
      ],
      "V\u0169ng Li\u00eam":[
        {
          "entity_id":"627",
          "region_id":"706",
          "city":"V\u0169ng Li\u00eam"
        }
      ],
      "Tam B\u00ecnh":[
        {
          "entity_id":"628",
          "region_id":"706",
          "city":"Tam B\u00ecnh"
        }
      ],
      "B\u00ecnh Minh":[
        {
          "entity_id":"629",
          "region_id":"706",
          "city":"B\u00ecnh Minh"
        }
      ],
      "Tr\u00e0 \u00d4n":[
        {
          "entity_id":"630",
          "region_id":"706",
          "city":"Tr\u00e0 \u00d4n"
        }
      ],
      "B\u00ecnh T\u00e2n":[
        {
          "entity_id":"631",
          "region_id":"706",
          "city":"B\u00ecnh T\u00e2n"
        }
      ]
    }
  },
  "V\u0129nh Ph\u00fac":{
    "id":"646",
    "name":"V\u0129nh Ph\u00fac",
    "cities":{
      "Th\u00e0nh ph\u1ed1 V\u0129nh Y\u00ean":[
        {
          "entity_id":"186",
          "region_id":"646",
          "city":"Th\u00e0nh ph\u1ed1 V\u0129nh Y\u00ean"
        }
      ],
      "Th\u1ecb x\u00e3 Ph\u00fac Y\u00ean":[
        {
          "entity_id":"187",
          "region_id":"646",
          "city":"Th\u1ecb x\u00e3 Ph\u00fac Y\u00ean"
        }
      ],
      "L\u1eadp Th\u1ea1ch":[
        {
          "entity_id":"188",
          "region_id":"646",
          "city":"L\u1eadp Th\u1ea1ch"
        }
      ],
      "Tam D\u01b0\u01a1ng":[
        {
          "entity_id":"189",
          "region_id":"646",
          "city":"Tam D\u01b0\u01a1ng"
        }
      ],
      "Tam \u0110\u1ea3o":[
        {
          "entity_id":"190",
          "region_id":"646",
          "city":"Tam \u0110\u1ea3o"
        }
      ],
      "B\u00ecnh Xuy\u00ean":[
        {
          "entity_id":"191",
          "region_id":"646",
          "city":"B\u00ecnh Xuy\u00ean"
        }
      ],
      "Y\u00ean L\u1ea1c":[
        {
          "entity_id":"192",
          "region_id":"646",
          "city":"Y\u00ean L\u1ea1c"
        }
      ],
      "V\u0129nh T\u01b0\u1eddng":[
        {
          "entity_id":"193",
          "region_id":"646",
          "city":"V\u0129nh T\u01b0\u1eddng"
        }
      ],
      "S\u00f4ng L\u00f4":[
        {
          "entity_id":"194",
          "region_id":"646",
          "city":"S\u00f4ng L\u00f4"
        }
      ]
    }
  },
  "Y\u00ean B\u00e1i":{
    "id":"635",
    "name":"Y\u00ean B\u00e1i",
    "cities":{
      "Th\u00e0nh ph\u1ed1 Y\u00ean B\u00e1i":[
        {
          "entity_id":"109",
          "region_id":"635",
          "city":"Th\u00e0nh ph\u1ed1 Y\u00ean B\u00e1i"
        }
      ],
      "Ngh\u0129a L\u1ed9":[
        {
          "entity_id":"110",
          "region_id":"635",
          "city":"Ngh\u0129a L\u1ed9"
        }
      ],
      "L\u1ee5c Y\u00ean":[
        {
          "entity_id":"111",
          "region_id":"635",
          "city":"L\u1ee5c Y\u00ean"
        }
      ],
      "V\u0103n Y\u00ean":[
        {
          "entity_id":"112",
          "region_id":"635",
          "city":"V\u0103n Y\u00ean"
        }
      ],
      "M\u00f9 C\u0103ng Ch\u1ea3i":[
        {
          "entity_id":"113",
          "region_id":"635",
          "city":"M\u00f9 C\u0103ng Ch\u1ea3i"
        }
      ],
      "Tr\u1ea5n Y\u00ean":[
        {
          "entity_id":"114",
          "region_id":"635",
          "city":"Tr\u1ea5n Y\u00ean"
        }
      ],
      "Tr\u1ea1m T\u1ea5u":[
        {
          "entity_id":"115",
          "region_id":"635",
          "city":"Tr\u1ea1m T\u1ea5u"
        }
      ],
      "V\u0103n Ch\u1ea5n":[
        {
          "entity_id":"116",
          "region_id":"635",
          "city":"V\u0103n Ch\u1ea5n"
        }
      ],
      "Y\u00ean B\u00ecnh":[
        {
          "entity_id":"117",
          "region_id":"635",
          "city":"Y\u00ean B\u00ecnh"
        }
      ]
    }
  },
  "\u0110\u00e0 N\u1eb5ng":{
    "id":"668",
    "name":"\u0110\u00e0 N\u1eb5ng",
    "cities":{
      "Li\u00ean Chi\u1ec3u":[
        {
          "entity_id":"360",
          "region_id":"668",
          "city":"Li\u00ean Chi\u1ec3u"
        }
      ],
      "Thanh Kh\u00ea":[
        {
          "entity_id":"361",
          "region_id":"668",
          "city":"Thanh Kh\u00ea"
        }
      ],
      "H\u1ea3i Ch\u00e2u":[
        {
          "entity_id":"362",
          "region_id":"668",
          "city":"H\u1ea3i Ch\u00e2u"
        }
      ],
      "S\u01a1n Tr\u00e0":[
        {
          "entity_id":"363",
          "region_id":"668",
          "city":"S\u01a1n Tr\u00e0"
        }
      ],
      "Ng\u0169 H\u00e0nh S\u01a1n":[
        {
          "entity_id":"364",
          "region_id":"668",
          "city":"Ng\u0169 H\u00e0nh S\u01a1n"
        }
      ],
      "C\u1ea9m L\u1ec7":[
        {
          "entity_id":"365",
          "region_id":"668",
          "city":"C\u1ea9m L\u1ec7"
        }
      ],
      "H\u00f2a Vang":[
        {
          "entity_id":"366",
          "region_id":"668",
          "city":"H\u00f2a Vang"
        }
      ],
      "Ho\u00e0ng Sa":[
        {
          "entity_id":"367",
          "region_id":"668",
          "city":"Ho\u00e0ng Sa"
        }
      ]
    }
  },
  "\u0110\u1eafk L\u1eafk":{
    "id":"686",
    "name":"\u0110\u1eafk L\u1eafk",
    "cities":{
      "Bu\u00f4n Ma Thu\u1ed9t":[
        {
          "entity_id":"473",
          "region_id":"686",
          "city":"Bu\u00f4n Ma Thu\u1ed9t"
        }
      ],
      "Bu\u00f4n H\u1ed3":[
        {
          "entity_id":"474",
          "region_id":"686",
          "city":"Bu\u00f4n H\u1ed3"
        }
      ],
      "Ea H'leo":[
        {
          "entity_id":"475",
          "region_id":"686",
          "city":"Ea H'leo"
        }
      ],
      "Ea S\u00fap":[
        {
          "entity_id":"476",
          "region_id":"686",
          "city":"Ea S\u00fap"
        }
      ],
      "Bu\u00f4n \u0110\u00f4n":[
        {
          "entity_id":"477",
          "region_id":"686",
          "city":"Bu\u00f4n \u0110\u00f4n"
        }
      ],
      "C\u01b0 M'gar":[
        {
          "entity_id":"478",
          "region_id":"686",
          "city":"C\u01b0 M'gar"
        }
      ],
      "Kr\u00f4ng B\u00fak":[
        {
          "entity_id":"479",
          "region_id":"686",
          "city":"Kr\u00f4ng B\u00fak"
        }
      ],
      "Kr\u00f4ng N\u0103ng":[
        {
          "entity_id":"480",
          "region_id":"686",
          "city":"Kr\u00f4ng N\u0103ng"
        }
      ],
      "Ea Kar":[
        {
          "entity_id":"481",
          "region_id":"686",
          "city":"Ea Kar"
        }
      ],
      "M'\u0110r\u1eafk":[
        {
          "entity_id":"482",
          "region_id":"686",
          "city":"M'\u0110r\u1eafk"
        }
      ],
      "Kr\u00f4ng B\u00f4ng":[
        {
          "entity_id":"483",
          "region_id":"686",
          "city":"Kr\u00f4ng B\u00f4ng"
        }
      ],
      "Kr\u00f4ng P\u1eafc":[
        {
          "entity_id":"484",
          "region_id":"686",
          "city":"Kr\u00f4ng P\u1eafc"
        }
      ],
      "Kr\u00f4ng A Na":[
        {
          "entity_id":"485",
          "region_id":"686",
          "city":"Kr\u00f4ng A Na"
        }
      ],
      "L\u1eafk":[
        {
          "entity_id":"486",
          "region_id":"686",
          "city":"L\u1eafk"
        }
      ],
      "C\u01b0 Kuin":[
        {
          "entity_id":"487",
          "region_id":"686",
          "city":"C\u01b0 Kuin"
        }
      ]
    }
  },
  "\u0110\u1eafk N\u00f4ng":{
    "id":"687",
    "name":"\u0110\u1eafk N\u00f4ng",
    "cities":{
      "Gia Ngh\u0129a":[
        {
          "entity_id":"488",
          "region_id":"687",
          "city":"Gia Ngh\u0129a"
        }
      ],
      "\u0110\u0103k Glong":[
        {
          "entity_id":"489",
          "region_id":"687",
          "city":"\u0110\u0103k Glong"
        }
      ],
      "C\u01b0 J\u00fat":[
        {
          "entity_id":"490",
          "region_id":"687",
          "city":"C\u01b0 J\u00fat"
        }
      ],
      "\u0110\u1eafk Mil":[
        {
          "entity_id":"491",
          "region_id":"687",
          "city":"\u0110\u1eafk Mil"
        }
      ],
      "Kr\u00f4ng N\u00f4":[
        {
          "entity_id":"492",
          "region_id":"687",
          "city":"Kr\u00f4ng N\u00f4"
        }
      ],
      "\u0110\u1eafk Song":[
        {
          "entity_id":"493",
          "region_id":"687",
          "city":"\u0110\u1eafk Song"
        }
      ],
      "\u0110\u1eafk R'L\u1ea5p":[
        {
          "entity_id":"494",
          "region_id":"687",
          "city":"\u0110\u1eafk R'L\u1ea5p"
        }
      ],
      "Tuy \u0110\u1ee9c":[
        {
          "entity_id":"495",
          "region_id":"687",
          "city":"Tuy \u0110\u1ee9c"
        }
      ]
    }
  },
  "\u0110i\u1ec7n Bi\u00ean":{
    "id":"631",
    "name":"\u0110i\u1ec7n Bi\u00ean",
    "cities":{
      "Th\u00e0nh ph\u1ed1 \u0110i\u1ec7n Bi\u00ean Ph\u1ee7":[
        {
          "entity_id":"79",
          "region_id":"631",
          "city":"Th\u00e0nh ph\u1ed1 \u0110i\u1ec7n Bi\u00ean Ph\u1ee7"
        }
      ],
      "M\u01b0\u1eddng Lay":[
        {
          "entity_id":"80",
          "region_id":"631",
          "city":"M\u01b0\u1eddng Lay"
        }
      ],
      "M\u01b0\u1eddng Nh\u00e9":[
        {
          "entity_id":"81",
          "region_id":"631",
          "city":"M\u01b0\u1eddng Nh\u00e9"
        }
      ],
      "M\u01b0\u1eddng Ch\u00e0":[
        {
          "entity_id":"82",
          "region_id":"631",
          "city":"M\u01b0\u1eddng Ch\u00e0"
        }
      ],
      "T\u1ee7a Ch\u00f9a":[
        {
          "entity_id":"83",
          "region_id":"631",
          "city":"T\u1ee7a Ch\u00f9a"
        }
      ],
      "Tu\u1ea7n Gi\u00e1o":[
        {
          "entity_id":"84",
          "region_id":"631",
          "city":"Tu\u1ea7n Gi\u00e1o"
        }
      ],
      "\u0110i\u1ec7n Bi\u00ean":[
        {
          "entity_id":"85",
          "region_id":"631",
          "city":"\u0110i\u1ec7n Bi\u00ean"
        }
      ],
      "\u0110i\u1ec7n Bi\u00ean \u0110\u00f4ng":[
        {
          "entity_id":"86",
          "region_id":"631",
          "city":"\u0110i\u1ec7n Bi\u00ean \u0110\u00f4ng"
        }
      ],
      "M\u01b0\u1eddng \u1ea2ng":[
        {
          "entity_id":"87",
          "region_id":"631",
          "city":"M\u01b0\u1eddng \u1ea2ng"
        }
      ],
      "N\u1eadm P\u1ed3":[
        {
          "entity_id":"88",
          "region_id":"631",
          "city":"N\u1eadm P\u1ed3"
        }
      ]
    }
  },
  "\u0110\u1ed3ng Nai":{
    "id":"695",
    "name":"\u0110\u1ed3ng Nai",
    "cities":{
      "Bi\u00ean H\u00f2a":[
        {
          "entity_id":"537",
          "region_id":"695",
          "city":"Bi\u00ean H\u00f2a"
        }
      ],
      "Long Kh\u00e1nh":[
        {
          "entity_id":"538",
          "region_id":"695",
          "city":"Long Kh\u00e1nh"
        }
      ],
      "T\u00e2n Ph\u00fa":[
        {
          "entity_id":"539",
          "region_id":"695",
          "city":"T\u00e2n Ph\u00fa"
        }
      ],
      "V\u0129nh C\u1eedu":[
        {
          "entity_id":"540",
          "region_id":"695",
          "city":"V\u0129nh C\u1eedu"
        }
      ],
      "\u0110\u1ecbnh Qu\u00e1n":[
        {
          "entity_id":"541",
          "region_id":"695",
          "city":"\u0110\u1ecbnh Qu\u00e1n"
        }
      ],
      "Tr\u1ea3ng Bom":[
        {
          "entity_id":"542",
          "region_id":"695",
          "city":"Tr\u1ea3ng Bom"
        }
      ],
      "Th\u1ed1ng Nh\u1ea5t":[
        {
          "entity_id":"543",
          "region_id":"695",
          "city":"Th\u1ed1ng Nh\u1ea5t"
        }
      ],
      "C\u1ea9m M\u1ef9":[
        {
          "entity_id":"544",
          "region_id":"695",
          "city":"C\u1ea9m M\u1ef9"
        }
      ],
      "Long Th\u00e0nh":[
        {
          "entity_id":"545",
          "region_id":"695",
          "city":"Long Th\u00e0nh"
        }
      ],
      "Xu\u00e2n L\u1ed9c":[
        {
          "entity_id":"546",
          "region_id":"695",
          "city":"Xu\u00e2n L\u1ed9c"
        }
      ],
      "Nh\u01a1n Tr\u1ea1ch":[
        {
          "entity_id":"547",
          "region_id":"695",
          "city":"Nh\u01a1n Tr\u1ea1ch"
        }
      ]
    }
  },
  "\u0110\u1ed3ng Th\u00e1p":{
    "id":"707",
    "name":"\u0110\u1ed3ng Th\u00e1p",
    "cities":{
      "Cao L\u00e3nh":[
        {
          "entity_id":"632",
          "region_id":"707",
          "city":"Cao L\u00e3nh"
        }
      ],
      "Th\u00e0nh ph\u1ed1 Sa \u0110\u00e9c":[
        {
          "entity_id":"633",
          "region_id":"707",
          "city":"Th\u00e0nh ph\u1ed1 Sa \u0110\u00e9c"
        }
      ],
      "H\u1ed3ng Ng\u1ef1":[
        {
          "entity_id":"636",
          "region_id":"707",
          "city":"H\u1ed3ng Ng\u1ef1"
        }
      ],
      "T\u00e2n H\u1ed3ng":[
        {
          "entity_id":"635",
          "region_id":"707",
          "city":"T\u00e2n H\u1ed3ng"
        }
      ],
      "Tam N\u00f4ng":[
        {
          "entity_id":"637",
          "region_id":"707",
          "city":"Tam N\u00f4ng"
        }
      ],
      "Th\u00e1p M\u01b0\u1eddi":[
        {
          "entity_id":"638",
          "region_id":"707",
          "city":"Th\u00e1p M\u01b0\u1eddi"
        }
      ],
      "Th\u00e0nh ph\u1ed1 Cao L\u00e3nh":[
        {
          "entity_id":"639",
          "region_id":"707",
          "city":"Th\u00e0nh ph\u1ed1 Cao L\u00e3nh"
        }
      ],
      "Thanh B\u00ecnh":[
        {
          "entity_id":"640",
          "region_id":"707",
          "city":"Thanh B\u00ecnh"
        }
      ],
      "L\u1ea5p V\u00f2":[
        {
          "entity_id":"641",
          "region_id":"707",
          "city":"L\u1ea5p V\u00f2"
        }
      ],
      "Lai Vung":[
        {
          "entity_id":"642",
          "region_id":"707",
          "city":"Lai Vung"
        }
      ],
      "Ch\u00e2u Th\u00e0nh":[
        {
          "entity_id":"643",
          "region_id":"707",
          "city":"Ch\u00e2u Th\u00e0nh"
        }
      ]
    }
  }
};