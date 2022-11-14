import 'package:flutter/material.dart';
import 'package:hires/core/utils/color_constant.dart';
import 'package:hires/core/utils/math_utils.dart';
import 'package:hires/models/candidates_model.dart';
import 'package:hires/models/find_jobs.dart';

class Contact {
  late User? user;
  late String? message;
  late DateTime? timeSent;

  Contact({
    this.user,
    this.message,
    this.timeSent
  });
}

class MyContactScreen extends StatefulWidget {
  static String id = "myContact";
  const MyContactScreen({Key? key}) : super(key: key);


  @override
  State<MyContactScreen> createState() => _MyContactScreenState();
}

class _MyContactScreenState extends State<MyContactScreen> {
  late TextEditingController txtSearchContact;
  String orderByDWValue = "Order By";

  List<Contact> contacts = [
    Contact(
      user: User(
        name: "Rajeev kumar majhi",
        email: "Rajeevkumarmajhi@gmail.com"
      ),
      message: "Hello",
      timeSent: DateTime.now()
    ),
    Contact(
        user: User(
            name: "Biman lakhey",
            email: "biman@gmail.com"
        ),
        message: "Hello biman",
        timeSent: DateTime.now()
    ),
  ];

  String dateToString = "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
  List<Contact> searchedContacts = [];

  getSearchedContacts() {
    searchedContacts.clear();
    contacts.forEach((contact) {
      if(contact.user!.name!.toLowerCase().contains(txtSearchContact.text.toLowerCase())) {
        searchedContacts.add(contact);
      }
    });
  }


  //Todo: Implement orderByNewest function
  orderByNewest() {
  }

  //Todo: Implement orderByOldest function
  orderByOldest() {
  }


  @override
  void initState() {
    txtSearchContact = TextEditingController(text: "");
    super.initState();
  }

  @override
  void dispose() {
    txtSearchContact.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            "My Contact",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5.0,
                              color: Colors.grey,
                              offset: Offset(
                                  3,3
                              )
                          ),
                        ],
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "My Contact",
                                      style: TextStyle(
                                          fontSize: 18
                                      ),
                                    )
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height / 30,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 200,
                                      child: TextFormField(
                                        controller: txtSearchContact,
                                        decoration: InputDecoration(
                                          hintText: "Search by name...",
                                          fillColor: Color(0xFFD9D9D9),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 140,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              getSearchedContacts();
                                            });
                                          },
                                          child: const Text("Search"),
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(15.0),
                                                      side: BorderSide(color: Colors.blue)
                                                  )
                                              )
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height / 35,),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    height: 50,
                                    width: 140,
                                    child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color:Color(0xFFAAAFB4),
                                          borderRadius: BorderRadius.circular(12.0)
                                        ),
                                        child:Padding(
                                            padding: EdgeInsets.only(left:30, right:30),
                                            child:DropdownButton(
                                              value: orderByDWValue,
                                              items: [ //add items in the dropdown
                                                DropdownMenuItem(
                                                  child: Text("Order By", style: TextStyle(color: Colors.black, fontSize: 14),),
                                                  value: "Order By",
                                                ),
                                                DropdownMenuItem(
                                                    child: Text("Newest", style: TextStyle(color: Colors.black, fontSize: 14),),
                                                    value: "Newest"
                                                ),
                                                DropdownMenuItem(
                                                  child: Text("Oldest", style: TextStyle(color: Colors.black, fontSize: 14),),
                                                  value: "Oldest",
                                                ),

                                              ],
                                              onChanged: (value){ //get value when changed
                                                setState(() {
                                                  orderByDWValue = value.toString();
                                                  if(orderByDWValue == "Newest") {
                                                    orderByNewest();
                                                  }
                                                  else if (orderByDWValue == "Oldest") {
                                                    orderByOldest();
                                                  }
                                                });
                                              },
                                              icon: Icon(Icons.arrow_drop_down),
                                              style: TextStyle(
                                                  fontSize: 12
                                              ),
                                              dropdownColor: Color(0xFFD9D9D9), //dropdown background color
                                            )
                                        )
                                    ),
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height / 30,),
                                SizedBox(
                                    height: 520,
                                    width: 400,
                                    child: ListView.builder(
                                        itemCount: searchedContacts.length == 0
                                            ? contacts.length : searchedContacts.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.fromLTRB(0,0,0,40),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              color: Color(0xFFD9D9D9),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 30.0,
                                                    horizontal: 20.0
                                                ),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 120,
                                                          child: RichText(
                                                            text: TextSpan(
                                                                text: 'Name: ',
                                                                style: TextStyle(
                                                                    color: Colors.blueAccent, fontSize: 17
                                                                ),
                                                                children: <TextSpan>[
                                                                  TextSpan(
                                                                    text: searchedContacts.length == 0
                                                                        ? contacts[index].user!.name
                                                                        : searchedContacts[index].user!.name,
                                                                    style: TextStyle(
                                                                        fontSize: 14,
                                                                        color: Colors.black
                                                                    ),
                                                                  )
                                                                ]
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 140,
                                                          child: RichText(
                                                            text: TextSpan(
                                                                text: 'Email: ',
                                                                style: TextStyle(
                                                                    color: Colors.blueAccent, fontSize: 17
                                                                ),
                                                                children: <TextSpan>[
                                                                  TextSpan(
                                                                    text: searchedContacts.length == 0
                                                                        ? contacts[index].user!.email
                                                                        : searchedContacts[index].user!.email,
                                                                    style: TextStyle(
                                                                        fontSize: 14,
                                                                        color: Colors.black
                                                                    ),
                                                                  )
                                                                ]
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 50,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 120,
                                                          child: RichText(
                                                            text: TextSpan(
                                                                text: 'Message: ',
                                                                style: TextStyle(
                                                                    color: Colors.blueAccent, fontSize: 17
                                                                ),
                                                                children: <TextSpan>[
                                                                  TextSpan(
                                                                    text: searchedContacts.length == 0
                                                                        ? contacts[index].message
                                                                        : searchedContacts[index].message,
                                                                    style: TextStyle(
                                                                        fontSize: 14,
                                                                        color: Colors.black
                                                                    ),
                                                                  )
                                                                ]
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 140,
                                                          child: RichText(
                                                            text: TextSpan(
                                                                text: 'Time sent: ',
                                                                style: TextStyle(
                                                                    color: Colors.blueAccent, fontSize: 17
                                                                ),
                                                                children: <TextSpan>[
                                                                  TextSpan(
                                                                    text: dateToString,
                                                                    style: TextStyle(
                                                                        fontSize: 14,
                                                                        color: Colors.black
                                                                    ),
                                                                  )
                                                                ]
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                    )
                                ),
                              ]
                          )
                      )
                  )
                ]
            )
        )
    );
  }
}
