import 'package:flutter/material.dart';

customImageUploadDiv({
  required final title,
  required final imageFile,
  required final getFromGallery,

}) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: Colors.grey.shade300)
        // boxShadow: [
        //   BoxShadow(
        //       blurRadius: 5.0,
        //       color: Colors.grey,
        //       offset: Offset(
        //           3,3
        //       )
        //   ),
        // ],
      ),
      child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 18
                      ),
                    )
                ),
                SizedBox(height: 30,),
                Container(
                    width: 400,
                    height: 150,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD9D9D9)),
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    child: imageFile == null ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 150,
                            width: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/gallery_image.png"),
                                  fit: BoxFit.contain
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {
                                getFromGallery();
                              },
                              child: const Text("Upload image"),
                            ),
                          )
                        ]
                    )
                        : GestureDetector(
                        onTap: () => getFromGallery(),
                        child: Image.file(imageFile!)
                    )
                ),

              ]
          )
      )
  );
}