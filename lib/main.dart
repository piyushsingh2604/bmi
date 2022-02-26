import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget ca1cbutton(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          calculation(btntxt);
        },
        child: Text(
          btntxt,
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        shape: CircleBorder(),
        color: btncolor,
        padding: EdgeInsets.all(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Calculator display
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '$text',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 100),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // here button function will be called where we will pass some arguments
                ca1cbutton('AC', Colors.grey, Colors.black),
                ca1cbutton('+/-', Colors.grey, Colors.black),
                ca1cbutton('%', Colors.grey, Colors.black),
                ca1cbutton('/', Colors.yellow, Colors.black),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // here button function will be called where we will pass some arguments
                ca1cbutton('7', Colors.grey, Colors.white),
                ca1cbutton('8', Colors.grey, Colors.black),
                ca1cbutton('9', Colors.grey, Colors.black),
                ca1cbutton('x', Colors.yellow, Colors.black),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // here button function will be called where we will pass some arguments
                ca1cbutton('4', Colors.grey, Colors.black),
                ca1cbutton('5', Colors.grey, Colors.black),
                ca1cbutton('6', Colors.grey, Colors.black),
                ca1cbutton('-', Colors.yellow, Colors.black),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // here button function will be called where we will pass some arguments
                ca1cbutton('1', Colors.grey, Colors.black),
                ca1cbutton('2', Colors.grey, Colors.black),
                ca1cbutton('3', Colors.grey, Colors.black),
                ca1cbutton('+', Colors.yellow, Colors.black),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //this is button 0
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                  onPressed: () {
                    calculation('0');
                  },
                  shape: StadiumBorder(),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.grey,
                ),
                ca1cbutton('.', Colors.grey, Colors.black),
                ca1cbutton('=', Colors.yellow, Colors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }
//variable = value
//double(data type) = 0.0
//dynamic(data type) = "piyush" //string
//int(data type) = 0 to 9
//array(data type) = [1,2,3]
//dynamic = mutable(it can change)
//static = immutable(it cannot be change)

  //define or create default value
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = ''; //"" = emty string
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0'; //if the AC button click than the int is '0'
      opr = ''; //"" = emty string
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      // name = "piyusd" // for assigning or setting the vslue
      // name == "piyush" // for checking the value
      //
      if (preOpr == '+') {
        //
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}
