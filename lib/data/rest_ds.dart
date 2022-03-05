import 'package:sliclone/util/util.dart';
import 'package:sliclone/model/model.dart';

class RestDataSource {
  NetworkUtil _netUtil = new NetworkUtil();

  static const DISEASE_URL = "https://disease.sh/v3/covid-19/all";
  static const DISEASE_COUNTRY_URL = "https://disease.sh/v3/covid-19/countries";

  Future<Totals> getTotal() {
    return _netUtil.get(DISEASE_URL).then((dynamic res) {
      print(res.toString());

      return Totals.map(res);
    });
  }

  Future<Country> getCountryDataByCode(String code) {
    return _netUtil.get("$DISEASE_COUNTRY_URL/$code").then((dynamic res) {
      print(res.toString());

      return Country.map(res);
    });
  }
}
