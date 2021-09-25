import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController kilocontroller = TextEditingController();
  TextEditingController boycontroller = TextEditingController();
  var hesap;
  String durum = "VKİ DURUMUNUZ";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black45,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black45,
          title: Text("VÜCUT KTİLE İNDEKSİ"),
          centerTitle: true,
        ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(16))
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("KİLO"),
                            SizedBox(height: 8,),
                            TextFormField(
                              controller: kilocontroller,
                              keyboardType: TextInputType.number,
                              decoration: new InputDecoration(
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(40.0),
                                  borderSide: new BorderSide(
                                  ),
                                ),
                                //fillColor: Colors.green
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                  SizedBox(width: 30,),
                  Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(16))
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("BOY"),
                            SizedBox(height: 8,),
                            TextFormField(
                              controller: boycontroller,
                              keyboardType: TextInputType.number,
                              decoration: new InputDecoration(
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(40.0),
                                  borderSide: new BorderSide(
                                  ),
                                ),
                                //fillColor: Colors.green
                              ),
                            )],
                        ),
                      )
                  ),
                ],
              ),
              SizedBox(height: 40,),
              ElevatedButton(
                  onPressed: (){
                      setState(() {
                        hesap = int.parse(kilocontroller.text) / pow(int.parse(boycontroller.text), 2);
                        hesap = (hesap!*10000);
                        if(hesap <=18.5) {
                          durum = "ZAYIFSINIZ";
                        }
                        else  if(hesap >18.5 && hesap<24.9){
                          durum = "NORMAL KİLOLUSUNUZ";
                        }
                        else  if(hesap >=25 && hesap<29.9){
                          durum = "FAZLA KİLOLUSUNUZ";
                        }
                        else  if(hesap >=30 && hesap<40){
                          durum = "OBEZ";
                        }
                        else  if(hesap >=40) {
                          durum = "AŞIRI OBEZ";
                        }
                      });

                  }, child: Text("HESAPLA")),
                SizedBox(height: 40,),
                Text(hesap.toString(),style: TextStyle(color: Colors.white),),
                SizedBox(height: 40,),
                Text(durum.toString(),style: TextStyle(color: Colors.white),)
            ],
          ),
        )
      ),
      ),
    );
  }
}
