// ignore_for_file: file_names, prefer_const_constructors

import 'package:delta/components/button.dart';
import 'package:delta/model/products.dart';
import 'package:delta/screens/findingRider.dart';
import 'package:flutter/material.dart';

class ProductSummary extends StatefulWidget {
  final ProductModel products;
  const ProductSummary({Key? key, required this.products}) : super(key: key);

  @override
  State<ProductSummary> createState() => _ProductSummaryState();
}

class _ProductSummaryState extends State<ProductSummary> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: height * 0.15,
              child: Text('Summary',
                  style: theme.textTheme.headline2!
                      .copyWith(fontWeight: FontWeight.bold))),
          Center(
            child: Container(
                padding: EdgeInsets.all(20),
                width: width * 0.8,
                height: height * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.2),
                ),
                child: Column(
                  children: [
                    Container(
                        //width: width * 0.5,
                        height: height * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: widget.products.prodColor,
                        ),
                        child: Image.asset(widget.products.prodImage,
                            fit: BoxFit.fitHeight)),
                    Text(widget.products.prodName,
                        style: theme.textTheme.headline4),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: Text('Item Price:',
                                style: theme.textTheme.bodyText2!
                                    .copyWith(fontWeight: FontWeight.bold))),
                        Expanded(
                            child: Text('GHS ${widget.products.unitPrice}',
                                textAlign: TextAlign.right,
                                style: theme.textTheme.bodyText2)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: Text('Number of Items:',
                                style: theme.textTheme.bodyText2!
                                    .copyWith(fontWeight: FontWeight.bold))),
                        Expanded(
                            child: Text(widget.products.prodCount,
                                textAlign: TextAlign.right,
                                style: theme.textTheme.bodyText2)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                        alignment: Alignment.bottomRight,
                        child: Text('TOTAL: GHS ${widget.products.prodPrice}',
                            style: theme.textTheme.headline4!
                                .copyWith(fontWeight: FontWeight.bold)))
                  ],
                )),
          ),
          SizedBox(height: 20),
          Button(
              width: width * 0.5,
              onTap: () {
                _settingModalBottomSheet(context);
              },
              buttonText: 'Proceed',
              color: widget.products.prodColor)
        ],
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    final theme = Theme.of(context);
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20.0),
              topRight: const Radius.circular(20.0)),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            spacing: 20,
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.greenAccent,
                          ),
                          child: Icon(Icons.money,
                              color: Colors.white, size: 25),
                        ),
                        SizedBox(height: 5),
                        Text('Cash on delivery',
                            style: theme.textTheme.bodyText1!
                                .copyWith(fontSize: 14)),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FindingRider(
                                        
                                      ),
                                    ));
                     // Navigator.of(context).pop();
                    },
                  ),
                  GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.yellowAccent,
                          ),
                          child: Icon(Icons.phone_android,
                              color: Colors.white, size: 25),
                        ),
                        SizedBox(height: 5),
                        Text('Momo on delivery',
                            style: theme.textTheme.bodyText1!
                                .copyWith(fontSize: 14)),
                      ],
                    ),
                    onTap: () {
                      // _imgFromGallery();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blueAccent,
                          ),
                          child: Icon(Icons.file_copy,
                              color: Colors.white, size: 25),
                        ),
                        SizedBox(height: 5),
                        Text('Documents',
                            style: theme.textTheme.bodyText1!
                                .copyWith(fontSize: 14)),
                      ],
                    ),
                    onTap: () {
                      //_openFile();
                      Navigator.of(context).pop();
                    },
                  ),
                  GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.redAccent,
                          ),
                          child:
                              Icon(Icons.close, color: Colors.white, size: 25),
                        ),
                        SizedBox(height: 5),
                        Text('Cancel',
                            style: theme.textTheme.bodyText1!
                                .copyWith(fontSize: 14)),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              SizedBox(height: 20)

              // new ListTile(
              //   leading: new Icon(Icons.camera_alt,
              //       color: Colors.blueAccent, size: 25),
              //   title: new Text('Take a photo'),
              //   trailing: new Icon(Icons.arrow_forward_ios),
              //   onTap: () {
              //     _imgFromCamera();
              //     Navigator.of(context).pop();
              //   },
              // ),
              // new ListTile(
              //     leading: new Icon(Icons.cloud_upload_sharp,
              //         color: Colors.blueAccent, size: 25),
              //     title: new Text('Upload from gallery'),
              //     trailing: new Icon(Icons.arrow_forward_ios),
              //     onTap: () {
              //       _imgFromGallery();
              //       Navigator.of(context).pop();
              //     }),
              // new ListTile(
              //     leading: new Icon(Icons.file_copy,
              //         color: Colors.blueAccent, size: 25),
              //     title: new Text('Add Document File'),
              //     trailing: new Icon(Icons.arrow_forward_ios),
              //     onTap: () {
              //       _openFile();
              //       Navigator.of(context).pop();
              //     }),
              // new ListTile(
              //   leading:
              //       new Icon(Icons.close, color: Colors.blueAccent, size: 25),
              //   title: new Text('Cancel'),
              //   trailing: new Icon(Icons.arrow_forward_ios),
              //   onTap: () => {Navigator.pop(context)},
              // ),
            ],
          );
        });
  }
}
