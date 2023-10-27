import 'package:flutter/material.dart';

String Calculate(String myvalue1,String myvalue2 , String Value){
  if(myvalue1 == "EGP" && myvalue2 == "USD"){
    return (int.parse(Value) * 40).toString();
  }
  else if(myvalue1 == "USD" && myvalue2 == "EGP"){
    return (int.parse(Value) / 40).toString();
  }
  else if (myvalue1 == "EUR" && myvalue2 == "EGP"){
    return (int.parse(Value) * 30).toString();
  }
  else if (myvalue1 == "EGP" && myvalue2 == "EUR"){
    return (int.parse(Value) / 30).toString();
  }
  else if (myvalue1 == "USD" && myvalue2 == "EUR"){
    return (int.parse(Value) * 1.06).toString();
  }
  else if (myvalue1 == "EUR" && myvalue2 == "USD"){
    return (int.parse(Value) / 1.06).toString();
  }
  else return "0";
}


void main() {
  runApp(MaterialApp(
    title: "CurrencyAPP",
    home:Exechangeapp(),

  ));
}

class Exechangeapp extends StatefulWidget {
  const Exechangeapp({super.key});

  @override
  State<Exechangeapp> createState() => _ExechangeappState();
}

class _ExechangeappState extends State<Exechangeapp> {
  List<String> CurrencyA = ["EGP","USD","EUR"];
  List<String> CurrencyB = ["EGP","USD","EUR"];
  String myvalue1 = "EGP";
  String myvalue2 = "EGP";
  String Value ='';
  String myvalue ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text(
          "change your Curency Today !",
          style: TextStyle(

            fontWeight:FontWeight.bold,
            fontSize: 20,
          ),

        ),
        centerTitle: true,
          backgroundColor: Colors.orange,

      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
            items: CurrencyA.map((String value){
              return DropdownMenuItem(
                value : value,
                child: Text(value),
              );
            }).toList(),
            value:myvalue1,
            onChanged: (String? Value){
              setState(() {
                myvalue1 = Value!;
              });

            },),

            SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "enter the value",
                  border: OutlineInputBorder(),
                ),
                onChanged: (val){
                setState(() {
                  Value = val;
                });
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  items: CurrencyB.map((String Value){
                    return DropdownMenuItem(
                      value: Value,
                      child: Text(Value),
                    );
                  }).toList(),
                  value: myvalue2,
                  onChanged: (String? Value){
                    setState(() {
                      myvalue2 = Value!;
                    });
                  },),
              IconButton(
                  onPressed: (){
                    setState(() {

                    myvalue= Calculate(myvalue1,myvalue2,Value);
                    });
                  },
                  icon: Icon(Icons.calculate_rounded)
              ),
              ],

            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.blueGrey,
                  width: 2,
                )
              ),
              width: 200,
              height: 60,
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.all(10.0),

              child: Text("${myvalue}"),
            ),

          ],


        ),



      ),

    );
  }
}


