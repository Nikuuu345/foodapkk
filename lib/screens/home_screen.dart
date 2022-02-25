import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _numberCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _numberCtrl.text = "9076494252";
  }

  bool _Calculating = false;
  Widget listTile({required IconData icon,required String title}){
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(title,style: TextStyle(color: Colors.black45,),),
    );
  }
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Color(0xFFcbcbcb),
        resizeToAvoidBottomInset: false,
        drawer: Drawer(
          child: Container(
            color: Color(0xFFd1ad17),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white54,
                        radius: 43,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 40,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Welcome guest'),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            height: 30,
                            child: OutlineButton(
                              onPressed: () {},
                              child: Text('LOGIN'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                  width: 2,
                                )
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                listTile(icon: Icons.home_outlined, title: "Home"),
                listTile(icon: Icons.account_box_outlined, title: "My Account"),
                listTile(icon: Icons.question_answer,title: "Support"),
                listTile(icon: Icons.location_searching_outlined,title: "Track Order"),
                listTile(icon: Icons.people_alt_outlined, title: "Group Order"),
                listTile(icon: Icons.people_outline , title: "Resturant Sign Up"),
                listTile(icon: Icons.amp_stories_outlined , title: "Travel Stories"),
                listTile(icon: Icons.mark_chat_read_outlined , title: "Terms & Conditions"),
                listTile(icon: Icons.smart_button_outlined ,title: "Sign Out"),

                Padding(
                  padding: const EdgeInsets.only(top: 20 ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 350,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Contact Support'),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text('Call us:'),
                            SizedBox(width: 10,),
                            Text('+919076494252'),

                          ],
                        ),
                        SizedBox(height: 5,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text('Mail us:'),
                              SizedBox(width: 10,),
                              Text('Ajjushaikh78@gmail.com'),
                              
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFFd6b738),
          title: Text("Home"),
          actions: [
            IconButton(
              onPressed: ()async {
                FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);
              },
              icon: Icon(Icons.call),
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/food-coupons.jpg'),
                  ),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  Container(
                    height: 250,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              child: Text('Order Via PNR No'),
                              onPressed: () {
                                setState(() {
                                  _Calculating = true;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFd6b738),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                elevation: 10,
                              ),
                            ),
                            ElevatedButton(
                              child: Text('Order Via Train No'),
                              onPressed: () {
                                setState(() {
                                  _Calculating = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFd6b738),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                elevation: 10,
                              ),
                            ),
                          ],
                        ),
                        if (_Calculating == true)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Column(
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter PNR No.',
                                    //labelText: 'PNR No.',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Order',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(0xFFd6b738),
                                            padding: EdgeInsets.only(
                                                left: 42, right: 42),
                                            elevation: 10),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        if (_Calculating == false)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Column(
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter 10 digit Phone No.',
                                    //labelText: 'PNR No.',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Order',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0xFFd6b738),
                                          padding: EdgeInsets.only(
                                              left: 42, right: 42),
                                          elevation: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          'Coupons For You',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 150,
                        width: 265,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Image.asset(
                                "assets/images/download.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 150,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Image.asset(
                                      "assets/images/images.jfif",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 1,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    height: 150,
                                    width: 320,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Image.asset(
                                            "assets/images/download.jfif",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 1,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 150,
                                          width: 320,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Image.asset(
                                                  "assets/images/veg.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 1,
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 1),
                                                height: 150,
                                                width: 320,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Image.asset(
                                                        "assets/images/beve.png",
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 1,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      height: 150,
                                                      width: 320,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.white,
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Expanded(
                                                            flex: 2,
                                                            child: Image.asset(
                                                              "assets/images/cake.png",
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        vertical: 1,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10),
                                                            height: 150,
                                                            width: 320,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/Coupons Offers.png",
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ]),
        )));
  }
}
