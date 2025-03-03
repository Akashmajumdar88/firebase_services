import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Counter Bloc"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment : CrossAxisAlignment.center,
          children: [
            const Text("0",style: TextStyle(color: Colors.black,fontSize: 50,fontWeight: FontWeight.bold)),
            const SizedBox(),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: const Icon(Icons.minimize,color: Colors.black,size: 30)
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                    onPressed: () {},
                    child: const Icon(Icons.add,size: 30,color: Colors.black)
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
