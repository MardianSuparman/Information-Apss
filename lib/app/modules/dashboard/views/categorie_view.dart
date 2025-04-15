import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/app/data/categorie_response.dart';
import 'package:myapp/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CategorieView extends GetView {
  const CategorieView({super.key});
  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.put(DashboardController());
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        // Membuat AppBar dengan judul "Event List"
        title: const Text('Kategori'),
        centerTitle: true, // Menjadikan judul di tengah AppBar
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), // Memberi padding di sekitar konten
        child: FutureBuilder<CategorieResponse>(
          // Mengambil data event melalui fungsi getEvent dari controller
          future: controller.getCategorie(),
          builder: (context, snapshot) {
            // Jika data sedang dimuat, tampilkan animasi loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Lottie.network(
                  // Menggunakan animasi Lottie untuk tampilan loading
                  'https://gist.githubusercontent.com/olipiskandar/4f08ac098c81c32ebc02c55f5b11127b/raw/6e21dc500323da795e8b61b5558748b5c7885157/loading.json',
                  repeat: true, // Animasi akan berulang terus-menerus
                  width: MediaQuery.of(context).size.width /
                      1, // Menyesuaikan lebar animasi
                ),
              );
            }

            if (!snapshot.hasData ||
                snapshot.data == null ||
                snapshot.data!.data == null) {
              return const Center(child: Text("Tidak ada data"));
            }

            // Jika tidak ada data yang diterima, tampilkan pesan "Tidak ada data"
            if (snapshot.data!.data!.isEmpty) {
              return const Center(child: Text("Tidak ada data"));
            }

            return ListView.builder(
              // Menentukan jumlah item berdasarkan panjang data data
              itemCount: snapshot.data!.data!.length,
              controller:
                  scrollController, // Menggunakan ScrollController untuk ListView
              shrinkWrap:
                  true, // Membatasi ukuran ListView agar sesuai dengan konten
              itemBuilder: (context, index) {
                // final item = snapshot.data!.data![index];
                return ZoomTapAnimation(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Menyusun elemen secara horizontal di kiri
                    children: [
                      Text(
                        snapshot.data!.data![index].name.toString(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight:
                              FontWeight.bold, // Membuat teks menjadi tebal
                        ),
                      ),
                      const Divider(height: 10),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
