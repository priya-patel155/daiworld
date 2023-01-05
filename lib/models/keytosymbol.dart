class keytosybol {
  String? sSymbol;
  int? slt=0;

  keytosybol({required this.sSymbol});

  keytosybol.fromJson(Map<String, dynamic> json) {
    sSymbol = json['sSymbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sSymbol'] = this.sSymbol;
    return data;
  }
}