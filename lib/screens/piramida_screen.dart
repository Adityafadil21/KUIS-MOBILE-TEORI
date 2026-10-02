import 'package:flutter/material.dart';

class PiramidaScreen extends StatefulWidget {
  const PiramidaScreen({super.key});

  @override
  State<PiramidaScreen> createState() => _PiramidaScreenState();
}

class _PiramidaScreenState extends State<PiramidaScreen> {
  final _panjangController = TextEditingController();
  final _lebarController = TextEditingController();
  final _tinggiController = TextEditingController();

  double _volume = 0;
  double _kelilingAlas = 0;

  void _hitung() {
    double p = double.tryParse(_panjangController.text) ?? 0;
    double l = double.tryParse(_lebarController.text) ?? 0;
    double t = double.tryParse(_tinggiController.text) ?? 0;

    setState(() {
      _volume = (1 / 3) * (p * l) * t;
      _kelilingAlas = 2 * (p + l);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator Piramida')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _panjangController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Panjang Alas')),
            TextField(controller: _lebarController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Lebar Alas')),
            TextField(controller: _tinggiController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Tinggi Piramida')),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _hitung, child: const Text('Hitung')),
            const SizedBox(height: 20),
            Text('Volume: ${_volume.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Keliling Alas: ${_kelilingAlas.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}