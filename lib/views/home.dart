import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:findmind/services/payment.dart';
import 'package:findmind/views/details.dart';

class Home extends StatefulWidget {
  // const Home({ Key? key }) : super(key: key);
  // final String title;
  @override
  _HomeState createState() => _HomeState();
}

class MySuperHero {
  final String img;
  final String title;
  final String body;

  MySuperHero(this.img, this.title, this.body);
}

class _HomeState extends State<Home> {
  // ignore: deprecated_member_use
  List<MySuperHero> items = new List<MySuperHero>();

  _HomeState() {
    items.add(
      MySuperHero(
        "https://d33wubrfki0l68.cloudfront.net/30568f290d29d4a4933ee2d9ae9423e469b3bf69/fc97f/assets/images/logo.png",
        "LegalMind",
        "An AI-powered research, analytics and strategy building platform for legal professionals. LegalMind is currently incubated in Prarambh - India's first legaltech incubator by a law firm - Cyril Amarchand Mangaldas. We offer features such as LegalMind Search, Judgment Summarizer and Legal Analytics.",
      ),
    );
    items.add(
      MySuperHero(
        "https://www.findmind.in/assets/images/findmind_icon_without_text.png",
        "FinLit",
        "A complete personal finance manager which brings all your expenses, investments, debts at your fingertips to track. Features like Finfit Score gives you an idea of your financial fitness, Finsim to simulate a financial decision to avoid a gut based potential bad decision just make the app more complete.",
      ),
    );
    items.add(
      MySuperHero(
        "https://www.findmind.in/assets/images/findmind_icon_without_text.png",
        "CreditMind",
        "Our aim is to create an alternative dataset for better credit scoring that involves spent patterns from various ecommerce platforms through Emails, analyzing the social and professional data from Facebook and Linkedin and taking out transactional information from the mobile SMSes.",
      ),
    );
    items.add(
      MySuperHero(
        "https://www.findmind.in/assets/images/findmind_icon_without_text.png",
        "Aavriti",
        "Gone are the days of receiving those annoying text messages containing OTPs and manually entering them just to think that an extra layer of security protects you from frauds. NSDT or Near Sound Data Transfer makes the whole process hassle free plus more secure than you can 'hear'.",
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget SuperHeroCell(BuildContext ctx, int index) {
    return GestureDetector(
      onTap: () {
        // ignore: unused_local_variable
        final snackBar = SnackBar(content: Text("Tap"));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyDetailPage(
              items[index],
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 2.0,
        color: Colors.blue[100],
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Hero(
                    tag: items[index],
                    child: Image.network(
                      items[index].img,
                      fit: BoxFit.contain,
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    items[index].title,
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Icon(Icons.navigate_next, color: Colors.black38),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SelectableText(
          "FindMind Analytics",
          showCursor: true,
          enableInteractiveSelection: true,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            // Add one stop for each color
            // Values should increase from 0.0 to 1.0
            stops: [0.1, 0.5, 0.8, 0.9],
            colors: [
              Colors.lightBlue[50],
              Colors.blue[200],
              Colors.blue[400],
              Colors.lightBlue
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10.0),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: "Where",
                        style: GoogleFonts.rajdhani(
                          textStyle: TextStyle(fontSize: 30.0),
                        )),
                    TextSpan(
                      text: " Technology",
                      style: GoogleFonts.rajdhani(
                        textStyle: TextStyle(
                          fontSize: 34.0,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: "\npartners with",
                      style: GoogleFonts.rajdhani(
                        textStyle: TextStyle(fontSize: 30.0),
                      ),
                    ),
                    TextSpan(
                      text: " Creativity.\n",
                      style: GoogleFonts.rajdhani(
                        textStyle: TextStyle(
                          fontSize: 34.0,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextSpan(
                      text:
                          "\nWe create projects for companies and startups with a passion for quality.",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Colors.blue[800],
                          fontSize: 14.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Our Products",
              style: GoogleFonts.lobster(
                textStyle: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 30.0,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => SuperHeroCell(context, index),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.payment_rounded),
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 600),
              reverseDuration: Duration(milliseconds: 600),
              child: Payment(),
            ),
          );
        },
      ),
    );
  }
}
