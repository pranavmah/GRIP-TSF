import 'package:bank/home.dart';
import 'package:bank/shared/Cubit/States.dart';
import 'package:bank/shared/Cubit/cubit.dart';
import 'package:bank/shared/constants.dart';
import 'package:bank/shared/sharedComponents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class transferTO extends StatelessWidget {
  int coin;
  int id1;
  transferTO({
    Key? key,
    required this.coin,
    required this.id1,
  }) : super(key: key);
  late int id2;

  var CustomerController = TextEditingController();

  late int id11;

  var ScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext) => AppCubit(AppInitialState()),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Color(0xFFEF9341),
              key: ScaffoldKey,
              appBar: AppBar(
                backgroundColor: Color(0xFFFF5100),
                leading: Icon(
                  Icons.person,
                ),
                title: Text('Customers'),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                        controller: CustomerController,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(155, 255, 144, 100),
                          hintText: 'Search Customer',
                          suffixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                        )),
                    ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            ItemBuilder(context, list, index),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 0.0),
                        itemCount: 10),
                  ],
                ),
              ));
        },
      ),
    );
  }

  Widget ItemBuilder(context, List l, int index) => Padding(
    padding: const EdgeInsets.all(7.5),
    child: Column(
      children: [
        InkWell(
          onTap: () {
            id2 = index;
            //  print(id1);
            print(id2);
            double inc = l[id2]['coin'] + coin;
            double dec = l[id1]['coin'] - coin;
            print(id1);
            AppCubit.get(context).UpdateDB(dec, l[id1]['id']);
            AppCubit.get(context).UpdateDB(inc, l[id2]['id']);
            //   transtable(sender: l[id1]['name'], receiver: l[id2]['name'], RS: RS);
            trans = {
              'Sender': l[id1]['name'],
              'Receiver': l[id2]['name'],
              'coin': coin.toString()
            };
            navigateAndFinish(context, HomeScreen());

            //////////////////////////////
            // print(l[id]['Rs']);
            Fluttertoast.showToast(
                msg: "Money transferred Succefully!",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 4,
                backgroundColor: Color(0xFFFF5100),
                textColor: Colors.white,
                fontSize: 16.0);
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                //val==l[index]['name'] ? 'not found':l[index]['name']).toString(),
                  children: [
                    Text(
                      l[index]['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Spacer(),
                    Text(l[index]['coin'].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        )),
                  ]),
            ),
            height: 40,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 244, 177, 82),
                borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ],
    ),
  );
}
