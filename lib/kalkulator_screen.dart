import 'package:flutter/material.dart';
import 'button_values.dart';

class KalkulatorScreen extends StatefulWidget {
  const KalkulatorScreen({super.key});

  @override
  State<KalkulatorScreen> createState() => _KalkulatorScreenState();
}

class _KalkulatorScreenState extends State<KalkulatorScreen> {
  @override
  Widget build(BuildContext context) {
    final screenZize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            //output
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "0",
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
            //buttons
            Wrap(
              children: Btn.buttonsValues
                  .map(
                    (value) => SizedBox(
                      width: screenZize.width / 4,
                      height: screenZize.width / 5,
                      child: buildButton(value),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: [Btn.del, Btn.clr].contains(value)
            ? Colors.blueGrey
            : [
                Btn.per,
                Btn.multiply,
                Btn.add,
                Btn.subtract,
                Btn.divide,
                Btn.calculate,
              ].contains(value)
            ? Colors.orange
            : Colors.black87,
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white24),
          borderRadius: BorderRadius.circular(100),
        ),
        child: InkWell(
          onTap: () {},
          child: Center(child: Text(value)),
        ),
      ),
    );
  }
}
