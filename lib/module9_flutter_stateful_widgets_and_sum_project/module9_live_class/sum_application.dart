import 'package:flutter/material.dart';

void main() {
  runApp(
    SumApp(),
  );
}

class SumApp extends StatelessWidget {
  const SumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SumAppHomeScreen(),
      title: "Sum Application",
      debugShowCheckedModeBanner: true,
    );
  }
}

class SumAppHomeScreen extends StatefulWidget {
  const SumAppHomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SumAppState();
  }
}

class _SumAppState extends State<SumAppHomeScreen> {
  final TextEditingController _fieldOneTEController = TextEditingController();
  final TextEditingController _fieldTwoTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sum Calculator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _fieldOneTEController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: "Field 1"),
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
                TextFormField(
                  controller: _fieldTwoTEController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Field 2"),
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
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            double firstNumber = parseToDouble(
                                _fieldOneTEController.text.trim());
                            double secondNumber = parseToDouble(
                                _fieldTwoTEController.text.trim());
                            result = addition(firstNumber, secondNumber);
                            setState(() {});
                            _fieldOneTEController.clear();
                            _fieldTwoTEController.clear();
                          }
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            double firstNumber = parseToDouble(
                                _fieldOneTEController.text.trim());
                            double secondNumber = parseToDouble(
                                _fieldTwoTEController.text.trim());
                            result = subtraction(firstNumber, secondNumber);
                            setState(() {});
                            _fieldOneTEController.clear();
                            _fieldTwoTEController.clear();
                          }
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Sub",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            double firstNumber = parseToDouble(
                                _fieldOneTEController.text.trim());
                            double secondNumber = parseToDouble(
                                _fieldTwoTEController.text.trim());
                            result = multiplication(firstNumber, secondNumber);
                            setState(() {});
                            _fieldOneTEController.clear();
                            _fieldTwoTEController.clear();
                          }
                        },
                        icon: const Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Mul",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            double firstNumber = parseToDouble(
                                _fieldOneTEController.text.trim());
                            double secondNumber = parseToDouble(
                                _fieldTwoTEController.text.trim());
                            result = division(firstNumber, secondNumber);
                            setState(() {});
                            _fieldOneTEController.clear();
                            _fieldTwoTEController.clear();
                          }
                        },
                        icon: const Icon(
                          Icons.safety_divider,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Div",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
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
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Mod",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
                Text(
                  "Result is: $result",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
