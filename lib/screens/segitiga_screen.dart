import 'dart:math';
import 'package:flutter/material.dart';

class SegitigaScreen extends StatefulWidget {
  const SegitigaScreen({super.key});

  @override
  State<SegitigaScreen> createState() => _SegitigaScreenState();
}

class _SegitigaScreenState extends State<SegitigaScreen> {
  String _jenisSegitiga = 'Sama Sisi';
  final _inputAController = TextEditingController();
  final _inputBController = TextEditingController();
  final _inputCController = TextEditingController();

  double _luas = 0;
  double _keliling = 0;

  void _hitung() {
    double a = double.tryParse(_inputAController.text) ?? 0;
    double b = double.tryParse(_inputBController.text) ?? 0;
    double c = double.tryParse(_inputCController.text) ?? 0;

    setState(() {
      if (_jenisSegitiga == 'Sama Sisi') {
        _luas = (sqrt(3) / 4) * pow(a, 2);
        _keliling = 3 * a;
      } else if (_jenisSegitiga == 'Sama Kaki') {
        // a = alas, b = tinggi, c = sisi miring
        _luas = 0.5 * a * b;
        _keliling = a + (2 * c);
      } else if (_jenisSegitiga == 'Siku-siku') {
        // a = alas, b = tinggi, c = sisi miring
        _luas = 0.5 * a * b;
        _keliling = a + b + c;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator Segitiga')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropdownButton<String>(
                value: _jenisSegitiga,
                isExpanded: true,
                items: ['Sama Sisi', 'Sama Kaki', 'Siku-siku'].map((String value) {
                  return DropdownMenuItem<String>(value: value, child: Text(value));
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    _jenisSegitiga = val!;
                    _inputAController.clear();
                    _inputBController.clear();
                    _inputCController.clear();
                  });
                },
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _inputAController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: _jenisSegitiga == 'Sama Sisi' ? 'Panjang Sisi' : 'Alas (a)'),
              ),
              if (_jenisSegitiga != 'Sama Sisi')
                TextField(
                  controller: _inputBController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Tinggi (b)'),
                ),
              if (_jenisSegitiga != 'Sama Sisi')
                TextField(
                  controller: _inputCController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: _jenisSegitiga == 'Sama Kaki' ? 'Sisi Miring / Sama' : 'Sisi Miring (c)'),
                ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: _hitung, child: const Text('Hitung')),
              const SizedBox(height: 20),
              Text('Luas: ${_luas.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Keliling: ${_keliling.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}