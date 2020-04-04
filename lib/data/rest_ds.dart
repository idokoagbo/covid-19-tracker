import 'package:sliclone/util/util.dart';
import 'package:sliclone/model/model.dart';

class RestDataSource{
  NetworkUtil _netUtil=new NetworkUtil();

  static const BASE_URL="https://covid-19-data.p.rapidapi.com";
  static const GET_TOTALS=BASE_URL+"/totals";
  static const GET_COUNTRY_BY_CODE=BASE_URL+"/country/code";

  static const API_HOST="covid-19-data.p.rapidapi.com";
  static const API_KEY="01a2625bcfmshbf6e8ab2655fb39p16bcbfjsn3b9f16914e48";

  Future<Totals> getTotal(){

    var map=new Map<String, String>();

    map['x-rapidapi-host']=API_HOST;
    map['x-rapidapi-key']=API_KEY;

    return _netUtil.get(GET_TOTALS,headers: map).then((dynamic res){

      print(res.toString());

      return Totals.map(res[0]);
    });
  }

  Future<Country> getCountryDataByCode(String code){
    var map=new Map<String, String>();

    map['x-rapidapi-host']=API_HOST;
    map['x-rapidapi-key']=API_KEY;

    return _netUtil.get(GET_COUNTRY_BY_CODE+"?code=$code",headers: map).then((dynamic res){

      print(res.toString());

      return Country.map(res[0]);
    });
  }
}