import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FA), // background pink muda
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                // Judul kota
                const Center(
                  child: Text(
                    'Malang',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),

                // Spacer lebih besar di atas angka supaya angka turun
                const Spacer(flex: 2),

                // Suhu besar
                const Center(
                  child: Text(
                    '25\u00B0',
                    style: TextStyle(
                      fontSize: 130,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      height: 0.9,
                    ),
                  ),
                ),

                // Spacer kecil di bawah angka
                const Spacer(flex: 1),

                // Baris Minggu–Senin–Selasa
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      DayForecast(
                        day: 'Minggu',
                        icon: Icons.wb_sunny,
                        temp: '20°C',
                      ),
                      DayForecast(
                        day: 'Senin',
                        icon: Icons.cloudy_snowing,
                        temp: '23°C',
                      ),
                      DayForecast(
                        day: 'Selasa',
                        icon: Icons.cloud,
                        temp: '22°C',
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // === Ribbon DEBUG di pojok kanan atas ===
            Positioned(
              top: 0,
              right: -40,
              child: Transform.rotate(
                angle: math.pi / 4,
                child: Container(
                  width: 120,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'DEBUG',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DayForecast extends StatelessWidget {
  final String day;
  final IconData icon;
  final String temp;

  const DayForecast({
    super.key,
    required this.day,
    required this.icon,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          day,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 6),
        Icon(
          icon,
          size: 32,
          color: Colors.black,
        ),
        const SizedBox(height: 6),
        Text(
          temp,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
