import 'package:bank/user.dart';
import 'package:bank/transfer_table.dart';
import 'package:bank/shared/sharedComponents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createDB();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          backgroundColor: Colors.black38,
          body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 25,
              ),
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        'BIT BANK',
                        style: GoogleFonts.righteous(
                            fontSize: 38,
                            color: Colors.orange),
                      ),
                      Image(
                        image: new ExactAssetImage('assets/images/bnk.jpg'),
                        height: 220,
                      ),
                      Text(
                        'Banking System App',
                        style: GoogleFonts.righteous(
                            fontSize: 28,
                            fontStyle: FontStyle.italic,
                            color: Colors.orange),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 270,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              navigateTo(context, Customers());
                              insertonDB();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 246, 77, 7),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: Center(
                            child: Text(
                              'Users',
                              style: GoogleFonts.sacramento(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: 38,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 270,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            navigateTo(context, transtable());
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 246, 77, 7),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: Center(
                            child: Text(
                              'History',
                              style: GoogleFonts.sacramento(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: 38,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              )),
        ),
      ),
    );
  }

}