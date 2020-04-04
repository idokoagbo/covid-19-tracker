class Totals{
  int confirmed;
  int recovered;
  int critical;
  int deaths;

  Totals(this.confirmed,this.recovered,this.critical,this.deaths);

  Totals.map(dynamic obj){
    this.confirmed=int.parse(obj['confirmed']);
    this.recovered=int.parse(obj['recovered']);
    this.critical=int.parse(obj['critical']);
    this.deaths=int.parse(obj['deaths']);
  }


  Map<String, dynamic> toMap(){
    var map=new Map<String, dynamic>();

    map['confirmed']="$confirmed";
    map['recovered']="$recovered";
    map['critical']="$critical";
    map['deaths']="$deaths";

    return map;
  }
}