import 'dart:convert';
import 'package:flutter_qrcode_scanner/flutter_qrcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  var qrText = '';
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  String image = "";

  void getImage() async {
    var response = await http.get(Uri.parse("https://fakeface.rest/face/json"));
    if (response.statusCode == 200) {
      var value = json.decode(response.body);
      // print(value['image_url']);
      image = value['image_url'];
    } else {
      print("No Data Fetched");
    }
  }

  @override
  Widget build(BuildContext context) {
    getImage();
    print(image);
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Colors.blue,
                  ),
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Pay through UPI",
                          style: GoogleFonts.balooTammudu(
                            textStyle: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                          child: TextFormField(
                            showCursor: true,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: "Enter UPI number",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                              hintText: "123456789@oksbi",
                              hintStyle: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 12.0,
                              ),
                              focusColor: Colors.black,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                        borderColor: Colors.red,
                        borderRadius: 10,
                        borderLength: 30,
                        borderWidth: 10,
                        cutOutSize: 300,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.blue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Search Contact",
                            style: GoogleFonts.balooTammudu(
                              textStyle: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                            child: TextFormField(
                              showCursor: true,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.contact_phone_rounded),
                                labelText: "Select Number",
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                                hintText: "123456789",
                                hintStyle: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 12.0,
                                ),
                                focusColor: Colors.black,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 20, 0),
                                  child: Container(
                                    height: 70,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          maxRadius: 30,
                                          child: image.length > 0
                                              ? ClipOval(
                                                  child: Image.network(
                                                    image,
                                                    alignment: Alignment.center,
                                                    fit: BoxFit.contain,
                                                  ),
                                                )
                                              : CircularProgressIndicator(
                                                  color: Colors.lightBlue[100],
                                                ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 8, 8, 8),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                "Yugandhar Surya",
                                                style: GoogleFonts.ropaSans(
                                                  textStyle: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "7667941731",
                                                style: GoogleFonts.ropaSans(
                                                  textStyle: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey[800],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }
}
