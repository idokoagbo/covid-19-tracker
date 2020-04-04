part of 'guides.dart';

class _GuidesPage extends StatefulWidget {
  @override
  __GuidesPageState createState() => __GuidesPageState();
}

class __GuidesPageState extends State<_GuidesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            LineIcons.arrow_left,
            color: Colors.black,
            size: 25,
          ),
        ),
        title: Text('Covid-19',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Guides',style: GoogleFonts.tauri(textStyle: TextStyle(color: Colors.black,fontSize: 44,fontWeight: FontWeight.normal))),

            SizedBox(
              height: 10,
            ),
            _InfoCard(
              title: "COVID-19 self checker",
              subtitle: "Take a Covid-19 risk exposure test",
              icon: LineIcons.medkit,
              color: Colors.green[300],
              action: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ExposureTest()));
              },
            ),
            SizedBox(
              height: 10,
            ),
            _InfoCard(
              title: "How it spreads",
              subtitle: "Learn how Covid-19 spreads",
              icon: LineIcons.share_alt,
              color: Colors.blue,
              action: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Article("How it spreads")));
              },
            ),
//            SizedBox(
//              height: 10,
//            ),
//            _InfoCard(
//              title: "Prevention & treatment",
//              subtitle: "Learn how to prevent Covid-19",
//              icon: LineIcons.heartbeat,
//              color: Colors.green[800],
//              action: () {
//                Navigator.push(
//                    context, MaterialPageRoute(builder: (_) => Article("Prevention & treatment")));
//              },
//            ),
            SizedBox(
              height: 10,
            ),
            _InfoCard(
              title: "Symptoms",
              subtitle: "Learn how Covid-19 symptoms",
              icon: LineIcons.warning,
              color: Colors.yellow,
              action: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Article("Symptoms")));
              },
            ),
            SizedBox(
              height: 10,
            ),
            _InfoCard(
              title: "What to do",
              subtitle: "What to do if you get infected",
              icon: Icons.help_outline,
              color: Colors.red,
              action: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Article("What to do")));
              },
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  IconData icon;
  Color color;
  String title;
  String subtitle;
  Function action;

  _InfoCard({this.title, this.subtitle, this.color, this.icon, this.action});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[100],
                blurRadius: 4.0,
                spreadRadius: 3.5,
                offset: Offset(0.0, 2)),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              child: Center(
                child: Icon(
                  icon,
                  size: 50,
                  color: color,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(subtitle,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
