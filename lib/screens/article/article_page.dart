part of 'article.dart';

class _ArticlePage extends StatelessWidget {
  String title;

  _ArticlePage({this.title});

  @override
  Widget build(BuildContext context) {

    Widget body;

    if(title=='How it spreads'){
      body=Spread();
    }
    else if(title=="Symptoms"){
      body=Symptoms();
    }

    else if(title=='What to do'){
      body=Treatment();
    }

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.00,
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
        title: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: body,
      ),
    );
  }
}

class _Paragraph extends StatelessWidget {
  String text;

  _Paragraph(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          style: GoogleFonts.averageSans(
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
class _Heading extends StatelessWidget {
  String text;

  _Heading(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(text,
            style: GoogleFonts.tauri(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class Spread extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _Heading('Person-to-person spread'),
        _Paragraph("The virus is thought to spread mainly from person-to-person."),
        SizedBox(height: 10,),
        _Paragraph("- Between people who are in close contact with one another (within about 6 feet)."),
        _Paragraph("- Through respiratory droplets produced when an infected person coughs, sneezes or talks."),
        _Paragraph("- These droplets can land in the mouths or noses of people who are nearby or possibly be inhaled into the lungs."),
        _Paragraph("- Some recent studies have suggested that COVID-19 may be spread by people who are not showing symptoms."),
        _Paragraph("- Maintaining good social distance (about 6 feet) is very important in preventing the spread of COVID-19."),

        SizedBox(height: 10,),
        _Heading('Spread from contact with contaminated surfaces or objects'),
        _Paragraph('It may be possible that a person can get COVID-19 by touching a surface or object that has the virus on it and then touching their own mouth, nose, or possibly their eyes. This is not thought to be the main way the virus spreads, but we are still learning more about this virus. CDC recommends people practice frequent “hand hygiene,” which is either washing hands with soap or water or using an alcohol-based hand rub. CDC also recommends routine cleaning of frequently touched surfaces.'),

        SizedBox(height: 10,),
        _Heading("How easily the virus spreads"),
        _Paragraph("How easily a virus spreads from person-to-person can vary. Some viruses are highly contagious, like measles, while other viruses do not spread as easily. Another factor is whether the spread is sustained, which means it goes from person-to-person without stopping."),
        _Paragraph("- The virus that causes COVID-19 is spreading very easily and sustainably between people."),
        _Paragraph("- Information from the ongoing COVID-19 pandemic suggest that this virus is spreading more efficiently than influenza, but not as efficiently as measles, which is highly contagious."),
      ],
    );
  }
}

class Symptoms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _Heading('Watch for symptoms'),
        _Paragraph("Reported illnesses have ranged from mild symptoms to severe illness and death for confirmed coronavirus disease 2019 (COVID-19) cases."),
        SizedBox(height: 10,),
        _Paragraph("These symptoms may appear 2-14 days after exposure (based on the incubation period of MERS-CoV viruses)."),
        SizedBox(height: 10,),
        _Paragraph("- Fever"),
        _Paragraph("- Cough"),
        _Paragraph("- Shortness of breath"),

        SizedBox(height: 10,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage('https://www.cdc.gov/coronavirus/2019-ncov/images/symptoms-fever.png'),
              radius: 50,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage('https://www.cdc.gov/coronavirus/2019-ncov/images/symptoms-cough.png'),
              radius: 50,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage('https://www.cdc.gov/coronavirus/2019-ncov/images/symptoms-shortnessOfBreath.png'),
              radius: 50,
            ),
          ],
        ),

        SizedBox(height: 10,),
        _Heading('When to Seek Medical Attention'),
        _Paragraph('If you develop emergency warning signs for COVID-19 get medical attention immediately. Emergency warning signs include*:'),
        SizedBox(height: 10,),
        _Paragraph("- Trouble breathing"),
        _Paragraph("- Persistent pain or pressure in the chest"),
        _Paragraph("- New confusion or inability to arouse"),
        _Paragraph("- Bluish lips or face"),
        SizedBox(height: 10,),
        _Paragraph("This list is not all inclusive. Please consult your medical provider for any other symptoms that are severe or concerning."),
      ],
    );
  }
}

class Treatment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _Heading('What to Do if You Are Sick'),
        _Paragraph("If you have a fever or cough, you might have COVID-19. Most people have mild illness and are able to recover at home. Keep track of your symptoms. If you have an emergency warning sign (including trouble breathing), get medical attention right away."),
        SizedBox(height: 10,),
        _Heading('Steps to help prevent the spread of COVID-19 if you are sick'),
        _Paragraph('Follow the steps below: If you are sick with COVID-19 or think you might have COVID-19, follow the steps below to care for yourself and to help protect other people in your home and community.'),
        SizedBox(height: 10,),
        Image.network("https://www.cdc.gov/coronavirus/2019-ncov/images/COVIDweb_02_bed.png"),
        _Heading("Stay home except to get medical care"),
        _Paragraph("Stay home: Most people with COVID-19 have mild illness and are able to recover at home without medical care. Do not leave your home, except to get medical care. Do not visit public areas."),
        _Paragraph("Stay in touch with your doctor. Call before you get medical care. Be sure to get care if you have trouble breathing, or have any other emergency warning signs, or if you think it is an emergency."),
        _Paragraph("Avoid public transportation: Avoid using public transportation, ride-sharing, or taxis."),
        _Paragraph("Stay away from others: As much as possible, you stay away from others. You should stay in a specific “sick room” if possible, and away from other people in your home. Use a separate bathroom, if available."),
      ],
    );
  }
}



