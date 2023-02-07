import 'package:bank/shared/sharedComponents.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/constants.dart';
import 'userinfo.dart';

class Customers extends StatefulWidget {
  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  late int id2;
  late double z;
  var CustomerController = TextEditingController();
  var ScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF343232),
        key: ScaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.black38,
          leading: Icon(
            Icons.account_box,
              size: 50
          ),
          title: Text('USERS'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 26.0,bottom: 26.0),
          child: Column(
            children: [
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      ItemBuilder(context, list, index),
                  separatorBuilder: (context, index) => SizedBox(height: 4.0),
                  itemCount: 10),
            ],
          ),
        ));
  }

  Widget ItemBuilder(context, List l, int index) => Padding(
    padding: const EdgeInsets.all(7.5),
    child: Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              id2 = index;
              navigateTo(context, information(id2, index, list));
              print(l[id2]['coin']);
              print(id2);
              z = l[index]['coin'];
            });
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Text(
                  list[index]['name'].toString(),
                  style: GoogleFonts.righteous(
                      fontSize: 17,
                      color: Color.fromARGB(255, 254, 255, 255)),
                ),
                Spacer(),
                Text(list[index]['coin'].toString(),
                    style: GoogleFonts.righteous(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color.fromARGB(255, 254, 255, 255))),
              ]),
            ),
            height: 50,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 226, 85, 13),
                borderRadius: BorderRadius.circular(58)),
          ),
        ),
      ],
    ),
  );
}