import 'package:flutter/material.dart';
import 'piramida_screen.dart';
import 'segitiga_screen.dart';
import 'konversi_waktu_screen.dart';
import 'cek_hari_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Math Assistant')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildMenuCard(
            context,
            title: 'Menu Piramida',
            subtitle: 'Hitung volume & keliling piramida',
            icon: Icons.change_history,
            target: const PiramidaScreen(),
          ),
          _buildMenuCard(
            context,
            title: 'Menu Segitiga',
            subtitle: 'Hitung luas & keliling berbagai jenis segitiga',
            icon: Icons.details,
            target: const SegitigaScreen(),
          ),
          _buildMenuCard(
            context,
            title: 'Konversi Waktu',
            subtitle: 'Konversi ke WIB, Malaysia, dan Kanada',
            icon: Icons.access_time,
            target: const KonversiWaktuScreen(),
          ),
          _buildMenuCard(
            context,
            title: 'Cek Hari',
            subtitle: 'Cek nama hari berdasarkan nomor (1-7)',
            icon: Icons.calendar_today,
            target: const CekHariScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, {required String title, required String subtitle, required IconData icon, required Widget target}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        leading: Icon(icon, size: 36, color: Colors.indigo),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => target));
        },
      ),
    );
  }
}