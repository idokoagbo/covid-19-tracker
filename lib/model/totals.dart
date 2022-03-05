class Totals {
  int confirmed;
  int recovered;
  int critical;
  int deaths;

  Totals(this.confirmed, this.recovered, this.critical, this.deaths);

  Totals.map(dynamic obj) {
    this.confirmed = obj['cases'];
    this.recovered = obj['recovered'];
    this.critical = obj['critical'];
    this.deaths = obj['deaths'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map['cases'] = confirmed;
    map['recovered'] = recovered;
    map['critical'] = critical;
    map['deaths'] = deaths;

    return map;
  }
}
