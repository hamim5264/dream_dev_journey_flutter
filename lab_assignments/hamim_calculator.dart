import 'package:flutter/material.dart';

void main() {
  runApp(
    const HamimCalculatorApp(),
  );
}

class HamimCalculatorApp extends StatelessWidget {
  const HamimCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HamimCalculatorAppHomeScreen(),
      title: "Hamim's Calculator Application",
      debugShowCheckedModeBanner: false,
    );
  }
}

class HamimCalculatorAppHomeScreen extends StatefulWidget {
  const HamimCalculatorAppHomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SumAppState();
  }
}

class _SumAppState extends State<HamimCalculatorAppHomeScreen> {
  final TextEditingController _fieldOneTEController = TextEditingController();
  final TextEditingController _fieldTwoTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hamim's Calculator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Image.asset(
              "images/calculator_bg2.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _fieldOneTEController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        cursorColor: Colors.orangeAccent,
                        decoration: const InputDecoration(
                          label: Text(
                            "Input Number One",
                            style: TextStyle(
                              color: Colors.orangeAccent,
                            ),
                          ),
                          hintText: "Please enter a number",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orangeAccent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orangeAccent,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orangeAccent,
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null) {
                            return "Enter a number";
                          }
                          if (value.trim().isEmpty) {
                            return "Enter a number";
                          }
                          // if(value?.trim().isEmpty ?? true){
                          //   return "Enter valid value";
                          // }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        cursorColor: Colors.orangeAccent,
                        controller: _fieldTwoTEController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text(
                            "Input Number Two",
                            style: TextStyle(
                              color: Colors.orangeAccent,
                            ),
                          ),
                          hintText: "Please enter a number",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orangeAccent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orangeAccent,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orangeAccent,
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return "Enter valid value";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    elevation: 0),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    double firstNumber = parseToDouble(
                                        _fieldOneTEController.text.trim());
                                    double secondNumber = parseToDouble(
                                        _fieldTwoTEController.text.trim());
                                    result =
                                        addition(firstNumber, secondNumber);
                                    setState(() {});
                                    _fieldOneTEController.clear();
                                    _fieldTwoTEController.clear();
                                  }
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.orangeAccent,
                                ),
                                label: const Text(
                                  "Add",
                                  style: TextStyle(
                                    color: Colors.orangeAccent,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    double firstNumber = parseToDouble(
                                        _fieldOneTEController.text.trim());
                                    double secondNumber = parseToDouble(
                                        _fieldTwoTEController.text.trim());
                                    result =
                                        subtraction(firstNumber, secondNumber);
                                    setState(() {});
                                    _fieldOneTEController.clear();
                                    _fieldTwoTEController.clear();
                                  }
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.orangeAccent,
                                ),
                                label: const Text(
                                  "Sub",
                                  style: TextStyle(
                                    color: Colors.orangeAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    double firstNumber = parseToDouble(
                                        _fieldOneTEController.text.trim());
                                    double secondNumber = parseToDouble(
                                        _fieldTwoTEController.text.trim());
                                    result = multiplication(
                                        firstNumber, secondNumber);
                                    setState(() {});
                                    _fieldOneTEController.clear();
                                    _fieldTwoTEController.clear();
                                  }
                                },
                                icon: const Icon(
                                  Icons.star,
                                  color: Colors.orangeAccent,
                                ),
                                label: const Text(
                                  "Mul",
                                  style: TextStyle(
                                    color: Colors.orangeAccent,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    double firstNumber = parseToDouble(
                                        _fieldOneTEController.text.trim());
                                    double secondNumber = parseToDouble(
                                        _fieldTwoTEController.text.trim());
                                    result =
                                        division(firstNumber, secondNumber);
                                    setState(() {});
                                    _fieldOneTEController.clear();
                                    _fieldTwoTEController.clear();
                                  }
                                },
                                icon: const Icon(
                                  Icons.safety_divider,
                                  color: Colors.orangeAccent,
                                ),
                                label: const Text(
                                  "Div",
                                  style: TextStyle(
                                    color: Colors.orangeAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                double firstNumber = parseToDouble(
                                    _fieldOneTEController.text.trim());
                                double secondNumber = parseToDouble(
                                    _fieldTwoTEController.text.trim());
                                result = modulus(firstNumber, secondNumber);
                                setState(() {});
                                _fieldOneTEController.clear();
                                _fieldTwoTEController.clear();
                              }
                            },
                            icon: const Icon(
                              Icons.view_module,
                              color: Colors.orangeAccent,
                            ),
                            label: const Text(
                              "Mod",
                              style: TextStyle(
                                color: Colors.orangeAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Result is: ${result.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 250,
                      ),
                      const Text(
                        "Developed by @Hamim-5264",
                        style: TextStyle(
                          color: Colors.orangeAccent,
                          fontFamily: "fonts/Poppins-Regular.ttf",
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Functions for calculation
  double parseToDouble(String text) {
    return double.tryParse(text) ?? 0;
  }

  double addition(double firstNum, double secondNum) {
    return firstNum + secondNum;
  }

  double subtraction(double firstNum, double secondNum) {
    return firstNum - secondNum;
  }

  double multiplication(double firstNum, double secondNum) {
    return firstNum * secondNum;
  }

  double division(double firstNum, double secondNum) {
    return firstNum / secondNum;
  }

  double modulus(double firstNum, double secondNum) {
    return firstNum % secondNum;
  }
}
