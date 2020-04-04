import 'package:sliclone/data/data.dart';
import 'package:sliclone/model/model.dart';

abstract class SummaryScreenContract{
  void showLoader();
  void hideLoader();
  void onSuccess(Totals total);
  void onError(String errorTxt);
}

class SummaryScreenPresenter{
  SummaryScreenContract _view;
  RestDataSource api=new RestDataSource();
  SummaryScreenPresenter(this._view);

  getTotal(){
    _view.showLoader();
    api.getTotal().then((Totals total){
      _view.hideLoader();
      _view.onSuccess(total);
    }).catchError((Object error){
      _view.hideLoader();
      _view.onError(error.toString().replaceAll('Exception: ', ''));
    });
  }

  getCountryDataByCode(String code){
    _view.showLoader();
    api.getCountryDataByCode(code).then((Country countryData){
      _view.hideLoader();
      _view.onSuccess(Totals.map(countryData.toMap()));
    }).catchError((Object error){
      _view.hideLoader();
      _view.onError(error.toString().replaceAll('Exception: ', ''));
    });
  }
}