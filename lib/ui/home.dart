import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
   return HomeState();
  }

}

class HomeState extends State<Home>{

  final TextEditingController _weightController = TextEditingController();

  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = "";

  void handleRadioValueChanged(value) {
    setState(() {
      radioValue = value;
      // print(radioValue);

      switch(radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formattedText = "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText = "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";

          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedText = "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";

      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(2.5),
          children: [
            Image.asset('images/planet.png', height: 133.0,
            width: 200.0,),

            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: [
                   TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Your Weight on Earth',
                      icon: Icon(Icons.person_outline)
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(5.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Radio<int>(
                        activeColor: Colors.brown,
                          value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged),
                       const Text(
                        "Pluto",
                        style: TextStyle(color: Colors.black),
                      ),
                      Radio<int>(
                        activeColor: Colors.redAccent,
                          value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      const Text(
                        "Mars",
                        style: TextStyle(color: Colors.black),
                      ),
                      Radio<int>(
                        activeColor: Colors.orangeAccent,
                          value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      const Text(
                        "Venus",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],

                  ),

                  const Padding(padding: EdgeInsets.all(35.6)),
                   Text(
                     _weightController.text.isEmpty ? "Please enter weight" : "${_formattedText}lbs",
                    // _formattedText,
                    style: const TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if(int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {
      print("Wrong!");
    }
    return int.parse("180") * 0.38;
  }

}