part of 'summary.dart';

class _SummaryPage extends StatefulWidget {
  @override
  __SummaryPageState createState() => __SummaryPageState();
}

class __SummaryPageState extends State<_SummaryPage> implements SummaryScreenContract {

  int confirmed=0;
  int recovered=0;
  int deaths=0;
  int newConfirmed=0;
  int newRecovered=0;
  int newDeaths=0;
  Totals prevData;
  String _platformVersion = 'Unknown';

  @override
  void initState() {

    Preferences.getMap("data").then((Map res){

      if(res!=null){
        setState(() {
          prevData=Totals.map(res);
          confirmed=prevData.confirmed;
          recovered=prevData.recovered;
          deaths=prevData.deaths;
        });
      }else{
        _refreshController.requestRefresh();
      }


    }).catchError((error){
      print("error text: ${error.toString()}");
      _refreshController.requestRefresh();
    });

//    _presenter.getTotal();
    initPlatformState();
    super.initState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterSimCountryCode.simCountryCode;
    } catch (error){
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  SummaryScreenPresenter _presenter;

  __SummaryPageState(){
    _presenter=new SummaryScreenPresenter(this);
  }

  RefreshController _refreshController =
  RefreshController(initialRefresh: true);

  void _onRefresh() async{
    // monitor network fetch
    // if failed,use refreshFailed()
    if(_platformVersion.length<4){
      await _presenter.getCountryDataByCode(_platformVersion);
    }else{
      await _presenter.getTotal();
    }

//    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
//    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if(_platformVersion.length<4){
      await _presenter.getCountryDataByCode(_platformVersion);
    }else{
      await _presenter.getTotal();
    }
//    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Covid-19',style: TextStyle(color: Colors.grey,fontSize: 24,fontWeight: FontWeight.bold)),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>Guides()));
            },
            icon: Icon(LineIcons.bars,color: Colors.black,size: 25,),
          )
        ],
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: ClassicHeader(),
        footer: ClassicFooter(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Reports - ${_platformVersion.length<4? _platformVersion.toUpperCase() : "Global"}',style: GoogleFonts.tauri(textStyle: TextStyle(color: Colors.black,fontSize: 34,fontWeight: FontWeight.normal))),

              SizedBox(height: 10,),
              GlobalSituationCard(
                cardTitle: 'Confirmed CASES',
                caseTitle: 'Confirmed',
                currentData: confirmed,
                newData: newConfirmed,
                percentChange: 0,
                cardColor: Colors.red,
                icon: Icon(LineIcons.arrow_up),
                color: Colors.red,
              ),

              SizedBox(height: 30,),

              GlobalSituationCard(
                cardTitle: 'Recovered CASES',
                caseTitle: 'Recovered',
                currentData: recovered,
                newData: newRecovered,
                percentChange: 0,
                icon: Icon(LineIcons.arrow_up),
                color: Colors.red,
              ),

              SizedBox(height: 30,),

              GlobalSituationCard(
                cardTitle: 'Death CASES',
                caseTitle: 'Death',
                currentData: deaths,
                newData: newDeaths,
                percentChange: 0,
                cardColor: Colors.black87,
                icon: Icon(LineIcons.arrow_up),
                color: Colors.red,
              ),
              SizedBox(height: 50,),

            ],
          ),
        ),
      ),

    );
  }

  void showLoader(){
    _refreshController.isLoading;
  }

  void hideLoader(){
    _refreshController.refreshCompleted();

  }

  void onSuccess(Totals total){    
    if(Preferences.setMap('data', total.toMap())!=null){
      setState(() {
        newConfirmed=confirmed==0 ? 0 : total.confirmed-confirmed;
        newRecovered=recovered==0 ? 0 : total.recovered-recovered;
        newDeaths=deaths==0 ? 0 : total.deaths-deaths;
        confirmed=total.confirmed;
        recovered=total.recovered;
        deaths=total.deaths;
      });
    }
  }

  void onError(String error){
    _refreshController.refreshFailed();
    print("error from summary: $error");
  }
}

class _InfoBox extends StatelessWidget {
  
  Color color;
  Color accentColor;
  String title;

  String totalCases;
  String newCases;

  _InfoBox({this.color,this.accentColor,this.title,this.totalCases,this.newCases});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),color: accentColor),
            child: Text("$title Cases", style: TextStyle(color: Colors.white,fontSize: 16,),),
          ),
          SizedBox(height:10),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(totalCases, style: TextStyle(color: Colors.white,fontSize: 24,),),
                    SizedBox(height:10),
                    Text("Total", style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(newCases, style: TextStyle(color: Colors.white,fontSize: 24,),),
                    SizedBox(height:10),
                    Text("New", style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class GlobalSituationCard extends StatelessWidget {
  final String cardTitle;
  final String caseTitle;
  final int currentData;
  final int newData;
  final double percentChange;
  final Icon icon;
  final Color color;
  final Color cardColor;

  const GlobalSituationCard(
      {Key key,
        @required this.cardTitle,
        @required this.caseTitle,
        @required this.currentData,
        @required this.newData,
        @required this.percentChange,
        this.icon,
        this.cardColor = Colors.green,
        @required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formatter = new NumberFormat("#,###");

    return Stack(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 170,
//                margin: EdgeInsets.symmetric(horizontal:25),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.18),
                        blurRadius: 20,
                        spreadRadius: 3.5,
                        offset: Offset(0, 13)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 40,
                          margin: EdgeInsets.all(15),
                          padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 17),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(5)),
                          child: RichText(
                              text:
                              TextSpan(
                                text: "$cardTitle"
                                    .toUpperCase(),
                                style: GoogleFonts.cabin(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )

                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                currentData != null
                                    ? formatter.format(currentData)
                                    : '-',
                                style: GoogleFonts.cabin(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 29),
                                ),
                              ),
//                              const YMargin(5),
                              Text(
                                caseTitle ?? "",
                                style: GoogleFonts.cabin(
                                  textStyle: TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                newData != null
                                    ? formatter.format(newData)
                                    : '-',
                                style: GoogleFonts.cabin(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 29),
                                ),
                              ),
//                              const YMargin(5),
                              Text(
                                "New",
                                style: GoogleFonts.cabin(
                                  textStyle: TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
//        Align(
//          alignment: Alignment.bottomRight,
//          child: Column(
//            children: <Widget>[
//              Container(
//                width: 58,
//                height: 58,
//                margin: EdgeInsets.all(25),
//                decoration: BoxDecoration(
//                  color: Colors.white,
//                  borderRadius: BorderRadius.only(
//                      topLeft: Radius.circular(10),
//                      bottomLeft: Radius.circular(10),
//                      bottomRight: Radius.circular(10)),
//                  boxShadow: [
//                    BoxShadow(
//                        color: Colors.black.withOpacity(0.15),
//                        blurRadius: 30,
//                        spreadRadius: 3.5,
//                        offset: Offset(0, 13)),
//                  ],
//                ),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Icon(icon.icon, color: icon.color, size: 15),
//                    Text(
//                      "${percentChange.round()}%",
//                      style: GoogleFonts.cabin(
//                        textStyle: TextStyle(
//                            color: color,
//                            fontWeight: FontWeight.w300,
//                            fontSize: 13),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ],
//          ),
//        )
      ],
    );
  }
}

