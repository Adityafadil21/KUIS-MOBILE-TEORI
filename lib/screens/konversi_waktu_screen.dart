import 'package:flutter/material.dart';

class KonversiWaktuScreen extends StatefulWidget {
  const KonversiWaktuScreen({super.key});

  @override
  State<KonversiWaktuScreen> createState() => _KonversiWaktuScreenState();
}

class _KonversiWaktuScreenState extends State<KonversiWaktuScreen> {
  final _jamController = TextEditingController();
  String _wib = '-';
  String _malaysia = '-';
  String _kanada = '-';

  void _konversi() {
    int jamWib = int.tryParse(_jamController.text) ?? -1;

    if (jamWib < 0 || jamWib > 23) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan jam angka valid (0 - 23)')),
      );
      return;
    }

    setState(() {
      _wib = '${jamWib.toString().padLeft(2, '0')}:00 WIB';
      
      // Malaysia (WIB + 1 jam)
      int jamMY = (jamWib + 1) % 24;
      _malaysia = '${jamMY.toString().padLeft(2, '0')}:00 MYT (+1 Jam)';

      // Kanada Ottawa / EST (WIB - 11 jam / UTC-5 vs UTC+7)
      int jamCA = (jamWib - 11) % 24;
      if (jamCA < 0) jamCA += 24;
      _kanada = '${jamCA.toString().padLeft(2, '0')}:00 EDT (-11 Jam)';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Konversi Waktu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _jamController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Jam Acuan WIB (0 - 23)',
                hintText: 'Misal: 14',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _konversi, child: const Text('Konversi')),
            const SizedBox(height: 20),
            ListTile(title: const Text('Indonesia (WIB)'), subtitle: Text(_wib)),
            ListTile(title: const Text('Malaysia (MYT)'), subtitle: Text(_malaysia)),
            ListTile(title: const Text('Kanada (Ottawa - EDT)'), subtitle: Text(_kanada)),
          ],
        ),
      ),
    );
  }
}