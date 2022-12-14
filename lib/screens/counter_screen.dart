

import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {

  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  int counter = 15;

  void increase() {
    counter++;
    setState(() {});
  }
  
  void decrease() {
    counter--;
    setState(() {});
  }
  
  void restart() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    const fontSize30 = TextStyle(fontSize: 30);


    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterScreen'),
        elevation: 0,
      ),       
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget> [
          const Text ('Clicks counter', style: fontSize30 ),
          Text ('$counter', style: fontSize30),  
          ]           
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActions(
        increaseFn: increase,
        decreaseFn: decrease, 
        restartFn: restart,
      ) ,
      );
    }
}



class CustomFloatingActions extends StatelessWidget {

  final Function increaseFn; 
  final Function decreaseFn; 
  final Function restartFn; 

  const CustomFloatingActions({
     Key? key,
    required this.increaseFn, 
    required this.decreaseFn, 
    required this.restartFn,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () => increaseFn(),
          child: const Icon(Icons.exposure_plus_1_outlined),
          ),

        FloatingActionButton(
          onPressed: () => restartFn(), 
          child: const Icon(Icons.restart_alt_outlined),
          ),
        
        FloatingActionButton(
          onPressed: () => decreaseFn(),
          child: const Icon(Icons.exposure_minus_1_outlined),
          ),
      ],
    );
  }
}