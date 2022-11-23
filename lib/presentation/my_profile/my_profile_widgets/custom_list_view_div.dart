import 'package:flutter/material.dart';
import 'package:hires/core/app_export.dart';
customListViewDiv({
  final index,
  final screenHeight,
  final screenWidth,
  final String? mainTitle,
  final itemCount,
  final itemList,
  final subTitle,
  final listType,
  Function? openImages,
}) {
  return Column(
    children: [
      Align(
          alignment: Alignment.topLeft,
          child: Text(
            mainTitle.toString(),
            style: TextStyle(
                fontSize: 16
            ),
          )
      ),
      SizedBox(height: 20,),
      Expanded(
        child: ListView.builder(
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(0,0,0,screenHeight /30),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstant.gray100,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 7,
                        offset: Offset(3,3)
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 180,
                              child: RichText(
                                text: TextSpan(
                                    text: 'Start Date: ',
                                    style: TextStyle(
                                        color: Colors.blueAccent, fontSize: 17
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
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
                              width: 120,
                              child: RichText(
                                text: TextSpan(
                                    text: 'End date: ',
                                    style: TextStyle(
                                        color: Colors.blueAccent, fontSize: 17
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
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
                              width: 180,
                              child: RichText(
                                text: TextSpan(
                                    text: 'Location: ',
                                    style: TextStyle(
                                        color: Colors.blueAccent, fontSize: 17
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: itemList[index].from.toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black
                                        ),
                                      )
                                    ]
                                ),
                              ),
                            ),
                            Builder(
                                builder: (context) {
                                  if (listType == "education") {
                                    return Container(
                                      width: 120,
                                      child: RichText(
                                        text: TextSpan(
                                            text: subTitle,
                                            style: TextStyle(
                                                color: Colors.blueAccent, fontSize: 17
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: itemList[index].reward,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black
                                                ),
                                              )
                                            ]
                                        ),
                                      ),
                                    );
                                  }
                                  else {
                                    return Container(
                                      width: 120,
                                      child: RichText(
                                        text: TextSpan(
                                            text: subTitle,
                                            style: TextStyle(
                                                color: Colors.blueAccent, fontSize: 17
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: itemList[index].position,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black
                                                ),
                                              )
                                            ]
                                        ),
                                      ),
                                    );
                                  }
                                }
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
                                    text: 'More Information: ',
                                    style: TextStyle(
                                        color: Colors.blueAccent, fontSize: 17
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: itemList[index].information,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black
                                        ),
                                      )
                                    ]
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete_outline, color: Colors.blueAccent,),
                              onPressed: () {
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      ),
      SizedBox(height: screenHeight / 30,),
      ElevatedButton.icon(
        icon: Icon(Icons.add_circle_outline),
        onPressed: (){
          openImages!();
        },
        label: Text("Add item"),
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16, vertical: 13)),
            backgroundColor: MaterialStateProperty.all(Colors.teal)
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Divider(color: Colors.black, thickness: 1,),
      ),
    ],
  );
}