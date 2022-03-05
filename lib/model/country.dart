class Country {
  String name;
  int confirmed;
  int recovered;
  int critical;
  int deaths;
  int latitude;
  int longitude;

  Country(this.name, this.confirmed, this.recovered, this.critical, this.deaths,
      this.latitude, this.longitude);

  Country.map(dynamic obj) {
    this.name = obj['country'];
    this.confirmed = obj['cases'];
    this.recovered = obj['recovered'];
    this.critical = obj['critical'];
    this.deaths = obj['deaths'];
    this.latitude = obj['countryInfo']['lat'];
    this.longitude = obj['countryInfo']['long'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map['name'] = name;
    map['cases'] = confirmed;
    map['recovered'] = recovered;
    map['critical'] = critical;
    map['deaths'] = deaths;
    map['latitude'] = latitude;
    map['longitude'] = longitude;

    return map;
  }
}
