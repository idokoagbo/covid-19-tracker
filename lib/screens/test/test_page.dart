part of 'test.dart';

class _ExposureTestPage extends StatefulWidget {
  @override
  __ExposureTestPageState createState() => __ExposureTestPageState();
}

class __ExposureTestPageState extends State<_ExposureTestPage> {

  var _questionIndex=3;
  int _points=0;

  bool quiz=true;

  final TextEditingController responseController=TextEditingController();
  final ScrollController _scrollController=ScrollController();

  void sendMessage(String message){

    if(message!=null && message!=''){

      setState(() {
        chat[_questionIndex]['answer']=message;

        //check for trick question
        if(_questionIndex==3 && message[0]=='n'){
          _questionIndex=_covidQuestions.length-1;
          chat.add({
            'question':_covidQuestions[_covidQuestions.length-1],
            'answer':null,
          });
          quiz=false;
          return;
        }else{
          _questionIndex++;
        }

        //answering points
        if(_questionIndex>3 && _questionIndex<11 && message[0]=='y'){
          _points+=1;
        }
        if(_questionIndex>10 && _questionIndex<13 && message[0]=='y'){
          _points+=2;
        }
        if(_questionIndex>13 && _questionIndex<16 && message[0]=='y'){
          _points+=3;
        }
        if(_questionIndex>15){
          quiz=false;
        }

        //send response based on next index in array
        if(quiz){
          chat.add({
            'question':_covidQuestions[_questionIndex],
            'answer':null,
          });
        }
        //send response based on points
        else{
          if (_points <=2) {
            chat.add({
              'question':'May be stress related, rest and observe',
              'answer':null,
            });
          }

          else if (_points >=3 && _points <=5){
            chat.add({
              'question':'Hydrate properly and practice proper personal hygiene. Observe and re-evaluate after 2 days.',
              'answer':null,
            });
          }

          else if(_points >=6 && _points <=12 ){
            chat.add({
              'question':'Seek a consultation with a doctor, immediately',
              'answer':null,
            });
          }

          else {
            chat.add({
              'question':'It appears you are showing symptoms of Covid-19. Please contact your doctor immediately OR CDC to take an actual test. This report will be forwarded to the local CDC.',
              'answer':null,
            });
          }
        }
      });

      print("this is text: $message");
      responseController.clear();
    }
//    _scrollController.animateTo(
//      0.0,
//      curve: Curves.easeOut,
//      duration: const Duration(milliseconds: 300),
//    );
  }

  @override
  void initState(){
    super.initState();
  }

   static const _covidQuestions= const[
    "The purpose of the Coronavirus Self-Checker is to help you make decisions about seeking appropriate medical care. This system is not intended for the diagnosis or treatment of disease or other conditions, including COVID-19. Are you ready to begin?",
    "If you are experiencing a life-threatening emergency, please call 911 immediately. This system does not replace the judgment of healthcare professionals or the performance of any clinical assessment.",
    "To provide information on the right level of care, we are going to ask you a series of questions. Ready? Let’s get started",
    "Are you ill, or caring for someone who is ill?",
     "Do you have cough?",
     "Do you have cold?",
     "Are you having diarrhea?",
     "Do you have sore throat?",
     "Are you experiencing body Aches?",
     "Do you have a headache?",
     "Do you have fever (Temperature 37.8 C & above)?",
     "Are you having difficulty breathing?",
     "Are you experiencing fatique?",
     "Have you travelled within the last 14 days?",
     "Do you stay or have recently travelled to a COVID-19 infected area?",
     "Have you had direct contact with a positive COVID-19 patient?",
    "This Coronavirus Self-Checker system is for those who may be sick. Learn more about COVID-19 and what you can do to help by reading our guides in the help section.",
  ];

  var chat=[
    {
      'question':_covidQuestions[0],
      'answer':null,
    },
    {
      'question':_covidQuestions[1],
      'answer':null,
    },
    {
      'question':_covidQuestions[2],
      'answer':null,
    },
    {
      'question':_covidQuestions[3],
      'answer':null,
    },
  ];

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    responseController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
//        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            LineIcons.arrow_left,
            color: Colors.white,
            size: 25,
          ),
        ),
        title: Row(
//          mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              child: Text("SA"),
            ),
            SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sliclone AI",
                  style: TextStyle(color: Colors.white),
                  overflow: TextOverflow.clip,
                ),
              ],
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: ListView.builder(itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        chat[index]['question']!=null? _ReceiveBubble(chat[index]['question'], "08:03 AM") : SizedBox.shrink(),

                        chat[index]['answer']!=null? _SendBubble(chat[index]['answer'], "08:03 AM") : SizedBox.shrink(),



                      ],
                    ),
                  );
                },itemCount: chat.length,),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
//              height: 61,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35.0),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 5,
                              color: Colors.grey)
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 20,),
                          Expanded(
                            child: TextField(
                              controller: responseController,
                              onSubmitted: sendMessage,
                              decoration: InputDecoration(
                                  hintText: "Type Something...",
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                    child: InkWell(
                      onTap: (){
                        sendMessage(responseController.text);
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReceiveBubble extends StatelessWidget {

  String _message;
  String _time;

  _ReceiveBubble(this._message,this._time);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          child: Text("SA"),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * .8),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Text(
                _message,
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SendBubble extends StatelessWidget {
  String _message;
  String _time;

  _SendBubble(this._message,this._time);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * .8),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.blue[500],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
              ),
              child: Text(
                _message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
