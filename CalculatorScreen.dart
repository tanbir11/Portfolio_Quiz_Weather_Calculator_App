import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';

String input = '', value = '', final_result = '';
double value1 = 0, v = 0, result = 0;

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _homeState();
}

class _homeState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Center(
              child: Text("CALCULATOR",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
          backgroundColor: Colors.black),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text("$input\n$final_result",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            v = 10;
                            setState(() {
                              input = input + 'log';
                            });
                          },
                          child: Text("log", style: TextStyle(fontSize: 30))),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            v = 11;
                            setState(() {
                              input = input + 'ln';
                            });
                          },
                          child: Text("ln", style: TextStyle(fontSize: 30))),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            v = 12;
                            setState(() {
                              input = input + '^';
                              value1 = double.parse(value);
                              value = '';
                            });
                          },
                          child: Text("^", style: TextStyle(fontSize: 30))),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            v = 6;
                            setState(() {
                              input = input + 'sin';
                            });
                          },
                          child: Text("sin", style: TextStyle(fontSize: 30))),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            v = 7;
                            setState(() {
                              input = input + 'cos';
                            });
                          },
                          child: Text("cos", style: TextStyle(fontSize: 30))),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            v = 8;
                            setState(() {
                              input = input + 'tan';
                            });
                          },
                          child: Text("tan", style: TextStyle(fontSize: 30))),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            v = 9;
                            setState(() {
                              input = input + '√';
                            });
                          },
                          child: Text("√", style: TextStyle(fontSize: 30))),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            setState(() {
                              input = '';
                              value = '';
                              final_result = '';
                              v = 0;
                            });
                          },
                          child: Text("AC", style: TextStyle(fontSize: 30))),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            setState(() {
                              input = input.substring(0, input.length - 1);
                              value = value.substring(0, value.length - 1);
                            });
                          },
                          child: Text("DEL", style: TextStyle(fontSize: 30))),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            setState(() {
                              input = input + '%';
                              value1 = double.parse(value);
                              value = '';
                              result = value1 / 100;
                              final_result = '= ' + result.toString();
                            });
                          },
                          child: Text("%", style: TextStyle(fontSize: 30))),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            v = 2;
                            setState(() {
                              input = input + ' ÷ ';
                              value1 = double.parse(value);
                              value = '';
                            });
                          },
                          child: Text("÷", style: TextStyle(fontSize: 30))),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            setState(() {
                              input = input + '7';
                              value = value + '7';
                            });
                          },
                          child: Text("7",
                              style: TextStyle(
                                  fontSize: 30, color: Colors.white))),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            setState(() {
                              input = input + '8';
                              value = value + '8';
                            });
                          },
                          child: Text("8",
                              style: TextStyle(
                                  fontSize: 30, color: Colors.white))),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            setState(() {
                              input = input + '9';
                              value = value + '9';
                            });
                          },
                          child: Text("9",
                              style: TextStyle(
                                  fontSize: 30, color: Colors.white))),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            v = 3;
                            setState(() {
                              input = input + ' × ';
                              value1 = double.parse(value);
                              value = '';
                            });
                          },
                          child: Text("×", style: TextStyle(fontSize: 30))),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            setState(() {
                              input = input + '4';
                              value = value + '4';
                            });
                          },
                          child: Text("4",
                              style: TextStyle(
                                  fontSize: 30, color: Colors.white))),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            setState(() {
                              input = input + '5';
                              value = value + '5';
                            });
                          },
                          child: Text("5",
                              style: TextStyle(
                                  fontSize: 30, color: Colors.white))),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            setState(() {
                              input = input + '6';
                              value = value + '6';
                            });
                          },
                          child: Text("6",
                              style: TextStyle(
                                  fontSize: 30, color: Colors.white))),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            v = 4;
                            setState(() {
                              input = input + ' - ';
                              value1 = double.parse(value);
                              value = '';
                            });
                          },
                          child: Text("－", style: TextStyle(fontSize: 30))),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            setState(() {
                              input = input + '1';
                              value = value + '1';
                            });
                          },
                          child: Text("1",
                              style: TextStyle(
                                  fontSize: 30, color: Colors.white))),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            setState(() {
                              input = input + '2';
                              value = value + '2';
                            });
                          },
                          child: Text("2",
                              style: TextStyle(
                                  fontSize: 30, color: Colors.white))),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            setState(() {
                              input = input + '3';
                              value = value + '3';
                            });
                          },
                          child: Text("3",
                              style: TextStyle(
                                  fontSize: 30, color: Colors.white))),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            v = 5;
                            setState(() {
                              input = input + ' ＋ ';
                              value1 = double.parse(value);
                              value = '';
                            });
                          },
                          child: Text("＋", style: TextStyle(fontSize: 30))),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            setState(() {
                              input = input + '0';
                              value = value + '0';
                            });
                          },
                          child: Text("0",
                              style: TextStyle(
                                  fontSize: 30, color: Colors.white))),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            setState(() {
                              input = input + '.';
                              value = value + '.';
                            });
                          },
                          child: Text("⋅",
                              style: TextStyle(
                                  fontSize: 30, color: Colors.white))),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            setState(() {
                              input = result.toString();
                              value = result.toString();
                              final_result = '';
                            });
                          },
                          child: Text("ANS",
                              style: TextStyle(
                                  fontSize: 30, color: Colors.white))),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      width: 20,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          onPressed: () {
                            setState(() {
                              if (v == 2) {
                                result = value1 / double.parse(value);
                                final_result = '= ' + result.toString();
                              } else if (v == 3) {
                                result = value1 * double.parse(value);
                                final_result = '= ' + result.toString();
                              } else if (v == 4) {
                                result = value1 - double.parse(value);
                                final_result = '= ' + result.toString();
                              } else if (v == 5) {
                                result = value1 + double.parse(value);
                                final_result = '= ' + result.toString();
                              } else if (v == 6) {
                                result = sin(double.parse(value));
                                final_result = '= ' + result.toString();
                              } else if (v == 7) {
                                result = cos(double.parse(value) * pi / 180);
                                final_result = '= ' + result.toString();
                              } else if (v == 8) {
                                result = tan(double.parse(value) * pi / 180);
                                final_result = '= ' + result.toString();
                              } else if (v == 9) {
                                result = sqrt(double.parse(value));
                                final_result = '= ' + result.toString();
                              } else if (v == 10) {
                                result = log(double.parse(value)) / ln10;
                                final_result = '= ' + result.toString();
                              } else if (v == 11) {
                                result = log(double.parse(value));
                                final_result = '= ' + result.toString();
                              } else if (v == 12) {
                                result =
                                    pow(value1, double.parse(value)) as double;
                                final_result = '= ' + result.toString();
                              }
                            });
                          },
                          child: Text("＝", style: TextStyle(fontSize: 30))),
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
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    ),
  );
}
