class Country{
  String name;
  int confirmed;
  int recovered;
  int critical;
  int deaths;
  double latitude;
  double longitude;

  Country(this.name,this.confirmed,this.recovered,this.critical,this.deaths,this.latitude,this.longitude);

  Country.map(dynamic obj){
    this.name=obj['country'];
    this.confirmed=obj['confirmed'];
    this.recovered=obj['recovered'];
    this.critical=obj['critical'];
    this.deaths=obj['deaths'];
    this.latitude=obj['latitude'];
    this.longitude=obj['longitude'];
  }


  Map<String, dynamic> toMap(){
    var map=new Map<String, dynamic>();

    map['name']=name;
    map['confirmed']="$confirmed";
    map['recovered']="$recovered";
    map['critical']="$critical";
    map['deaths']="$deaths";
    map['latitude']="$latitude";
    map['longitude']="$longitude";

    return map;
  }
}