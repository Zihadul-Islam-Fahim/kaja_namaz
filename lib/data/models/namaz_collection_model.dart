/// namazes : {"Regular":{"Isha":"1","Fajr":"1","Maghrib":"1","Zuhar":"1","Vitr":"1","Asar":"1"},"Kosor":{"Isha":"1","Fajr":"1","Maghrib":"1","Zuhar":"1","Asar":"1"}}

class NamazCollection {
  NamazCollection({
      Namazes? namazes,}){
    _namazes = namazes;
}

  NamazCollection.fromJson(dynamic json) {
    _namazes = json['namazes'] != null ? Namazes.fromJson(json['namazes']) : null;
  }
  Namazes? _namazes;
NamazCollection copyWith({  Namazes? namazes,
}) => NamazCollection(  namazes: namazes ?? _namazes,
);
  Namazes? get namazes => _namazes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_namazes != null) {
      map['namazes'] = _namazes?.toJson();
    }
    return map;
  }

}

/// Regular : {"Isha":"1","Fajr":"1","Maghrib":"1","Zuhar":"1","Vitr":"1","Asar":"1"}
/// Kosor : {"Isha":"1","Fajr":"1","Maghrib":"1","Zuhar":"1","Asar":"1"}

class Namazes {
  Namazes({
      Regular? regular, 
      Kosor? kosor,}){
    _regular = regular;
    _kosor = kosor;
}

  Namazes.fromJson(dynamic json) {
    _regular = json['Regular'] != null ? Regular.fromJson(json['Regular']) : null;
    _kosor = json['Kosor'] != null ? Kosor.fromJson(json['Kosor']) : null;
  }
  Regular? _regular;
  Kosor? _kosor;
Namazes copyWith({  Regular? regular,
  Kosor? kosor,
}) => Namazes(  regular: regular ?? _regular,
  kosor: kosor ?? _kosor,
);
  Regular? get regular => _regular;
  Kosor? get kosor => _kosor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_regular != null) {
      map['Regular'] = _regular?.toJson();
    }
    if (_kosor != null) {
      map['Kosor'] = _kosor?.toJson();
    }
    return map;
  }

}

/// Isha : "1"
/// Fajr : "1"
/// Maghrib : "1"
/// Zuhar : "1"
/// Asar : "1"

class Kosor {
  Kosor({
    String? isha,
    String? fajr,
    String? maghrib,
    String? zuhar,
    String? asar,}){
    _isha = isha;
    _fajr = fajr;
    _maghrib = maghrib;
    _zuhar = zuhar;
    _asar = asar;
  }

  Kosor.fromJson(dynamic json) {
    _isha = json['Isha'];
    _fajr = json['Fajr'];
    _maghrib = json['Maghrib'];
    _zuhar = json['Zuhar'];
    _asar = json['Asar'];
  }

  String? _isha;
  String? _fajr;
  String? _maghrib;
  String? _zuhar;
  String? _asar;

  String? get isha => _isha;
  set isha(String? value) => _isha = value;

  String? get fajr => _fajr;
  set fajr(String? value) => _fajr = value;

  String? get maghrib => _maghrib;
  set maghrib(String? value) => _maghrib = value;

  String? get zuhar => _zuhar;
  set zuhar(String? value) => _zuhar = value;

  String? get asar => _asar;
  set asar(String? value) => _asar = value;

  Kosor copyWith({
    String? isha,
    String? fajr,
    String? maghrib,
    String? zuhar,
    String? asar,
  }) => Kosor(
    isha: isha ?? _isha,
    fajr: fajr ?? _fajr,
    maghrib: maghrib ?? _maghrib,
    zuhar: zuhar ?? _zuhar,
    asar: asar ?? _asar,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Isha'] = _isha;
    map['Fajr'] = _fajr;
    map['Maghrib'] = _maghrib;
    map['Zuhar'] = _zuhar;
    map['Asar'] = _asar;
    return map;
  }
}


/// Isha : "1"
/// Fajr : "1"
/// Maghrib : "1"
/// Zuhar : "1"
/// Vitr : "1"
/// Asar : "1"

class Regular {
  Regular({
    String? isha,
    String? fajr,
    String? maghrib,
    String? zuhar,
    String? vitr,
    String? asar,}){
    _isha = isha;
    _fajr = fajr;
    _maghrib = maghrib;
    _zuhar = zuhar;
    _vitr = vitr;
    _asar = asar;
  }

  Regular.fromJson(dynamic json) {
    _isha = json['Isha'];
    _fajr = json['Fajr'];
    _maghrib = json['Maghrib'];
    _zuhar = json['Zuhar'];
    _vitr = json['Vitr'];
    _asar = json['Asar'];
  }

  String? _isha;
  String? _fajr;
  String? _maghrib;
  String? _zuhar;
  String? _vitr;
  String? _asar;

  String? get isha => _isha;
  set isha(String? value) => _isha = value;

  String? get fajr => _fajr;
  set fajr(String? value) => _fajr = value;

  String? get maghrib => _maghrib;
  set maghrib(String? value) => _maghrib = value;

  String? get zuhar => _zuhar;
  set zuhar(String? value) => _zuhar = value;

  String? get vitr => _vitr;
  set vitr(String? value) => _vitr = value;

  String? get asar => _asar;
  set asar(String? value) => _asar = value;

  Regular copyWith({
    String? isha,
    String? fajr,
    String? maghrib,
    String? zuhar,
    String? vitr,
    String? asar,
  }) => Regular(
    isha: isha ?? _isha,
    fajr: fajr ?? _fajr,
    maghrib: maghrib ?? _maghrib,
    zuhar: zuhar ?? _zuhar,
    vitr: vitr ?? _vitr,
    asar: asar ?? _asar,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Isha'] = _isha;
    map['Fajr'] = _fajr;
    map['Maghrib'] = _maghrib;
    map['Zuhar'] = _zuhar;
    map['Vitr'] = _vitr;
    map['Asar'] = _asar;
    return map;
  }
}

