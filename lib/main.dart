import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double amount = 0.0;
  int tipPercent = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tip Calculator"),
          shadowColor: Colors.grey.shade800,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.black, boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      offset: const Offset(0, 0),
                      blurRadius: 4.0)
                ]),
                child: TextField(
                  onChanged: (val) => {
                    setState(() {
                      try {
                        amount = double.parse(val);
                      } catch (e) {
                        amount = 0.00;
                      }
                    }),
                  },
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefix: Text('\$'),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                    filled: true,
                    fillColor: Color(0xFFBBDEFB),
                    hintText: 'Enter Amount',
                    counterText: '',
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$tipPercent%',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  Expanded(
                    child: Slider(
                      activeColor: Colors.amber.shade600,
                      inactiveColor: Colors.grey.shade400,
                      value: tipPercent.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          tipPercent = value.round();
                        });
                      },
                      min: 0,
                      max: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  const Text(
                    "Tip",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500,
                          offset: const Offset(0, 2),
                          blurRadius: 4.0,
                        )
                      ],
                      color: const Color(0xFFFFE0B2),
                    ),
                    child: Center(
                      child: Text(
                        '\$${((tipPercent / 100) * amount).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500,
                          offset: const Offset(0, 2),
                          blurRadius: 4.0,
                        )
                      ],
                      color: const Color(0xFFFFE0B2),
                    ),
                    child: Center(
                      child: Text(
                        '\$${(amount + ((tipPercent / 100) * amount)).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
