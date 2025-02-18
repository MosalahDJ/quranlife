import 'package:flutter/material.dart';
import 'dart:math' as math;

class Tasbih extends StatefulWidget {
  const Tasbih({super.key});

  @override
  State<Tasbih> createState() => _TasbihState();
}

class _TasbihState extends State<Tasbih> with SingleTickerProviderStateMixin {
  int _counter = 0;
  int _targetCount = 33;
  late AnimationController _controller;
  final List<int> _presetCounts = [33, 66, 99, 100];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _controller.forward(from: 0.0);
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('المسبحة الإلكترونية',
            style: TextStyle(fontFamily: 'Amiri')),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$_counter / $_targetCount',
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: _incrementCounter,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi / 8,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Colors.teal[700]!,
                          Colors.teal[500]!,
                          Colors.teal[300]!,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'سبح',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'Amiri',
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 10,
            children: _presetCounts
                .map(
                  (count) => ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _targetCount = count;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _targetCount == count
                          ? Colors.teal
                          : Colors.grey[300],
                    ),
                    child: Text('$count'),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _resetCounter,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[400],
            ),
            child: const Text('إعادة تعيين'),
          ),
        ],
      ),
    );
  }
}
