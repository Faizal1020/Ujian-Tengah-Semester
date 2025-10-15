import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/viewmodel/tasbih_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller (di-push ke dependency management GetX)
    final TasbihController controller = Get.put(TasbihController());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 210, 145),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Counter (nilai ditampilkan reaktif via Obx)
              Obx(
                () => Text(
                  '${controller.counter.value.round()}',
                  style: const TextStyle(fontSize: 250),
                ),
              ),

              const SizedBox(height: 8),

              // Progress bar reaktif
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: LinearProgressIndicator(
                    value: controller.progress.value / 100,
                    backgroundColor: Colors.white54,
                    color: Colors.amberAccent.shade400,
                    minHeight: 15,
                    // borderRadius is available on some versions; to avoid errors, wrap if needed
                    // but for simplicity we keep default
                  ),
                ),
              ),

              const SizedBox(height: 48),

              // Tombol fingerprint (tap untuk increment)
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: InkWell(
                  onTap: controller.incrementCounter,
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    padding: const EdgeInsets.all(30),
                    child: const Icon(
                      Icons.fingerprint,
                      size: 100,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.resetCounter,
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.refresh_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}
