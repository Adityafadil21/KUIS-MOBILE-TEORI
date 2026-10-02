import 'package:flutter/material.dart';

class CekHariScreen extends StatefulWidget {
  const CekHariScreen({super.key});

  @override
  State<CekHariScreen> createState() => _CekHariScreenState();
}

class _CekHariScreenState extends State<CekHariScreen> {
  final _nomorController = TextEditingController();
  String _hasilHari = 'Masukkan nomor hari (1-7)';

  void _cekHari() {
    int? no = int.tryParse(_nomorController.text);

    setState(() {
      switch (no) {
        case 1:
          _hasilHari = 'Hari: Senin';
          break;
        case 2:
          _hasilHari = 'Hari: Selasa';
          break;
        case 3:
          _hasilHari = 'Hari: Rabu';
          break;
        case 4:
          _hasilHari = 'Hari: Kamis';
          break;
        case 5:
          _hasilHari = 'Hari: Jumat';
          break;
        case 6:
          _hasilHari = 'Hari: Sabtu';
          break;
        case 7:
          _hasilHari = 'Hari: Minggu';
          break;
        default:
          _hasilHari = 'Input tidak valid! Masukkan angka 1 sampai 7.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cek Hari')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomorController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nomor Hari (1 - 7)'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _cekHari, child: const Text('Cek Hari')),
            const SizedBox(height: 24),
            Text(
              _hasilHari,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}