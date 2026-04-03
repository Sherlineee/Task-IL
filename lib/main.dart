import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart Function Demo',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final namaController = TextEditingController();
  final sisiController = TextEditingController();
  final hargaController = TextEditingController();
  final diskonController = TextEditingController();

  // ✅ HASIL DIPISAH
  String hasilSapa = "";
  String hasilLuas = "";
  String hasilDiskon = "";

  // ================= FUNCTION =================
  String sapa4(String nama) => "Halo, $nama!";
  int luas4(int sisi) => sisi * sisi;
  double diskon4(double harga, double diskon) =>
      harga - (harga * diskon / 100);

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: null,
body: SingleChildScrollView(
  padding: const EdgeInsets.all(20),
  child: Column(
    children: [

      // ===== TITLE CUSTOM =====
      Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            "Dart Function Types",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      const SizedBox(height: 20),

            // ================= MENYAPA =================
            buildCard(
              "🙌 Menyapa",
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Masukkan Nama"),
                            const SizedBox(height: 8),
                            TextField(
                              controller: namaController,
                              decoration: inputStyle("Nama disini....."),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            hasilSapa = sapa4(namaController.text);
                          });
                        },
                        child: const Text("Kirim"),
                      )
                    ],
                  ),

                  // ✅ HASIL DI SINI
                  if (hasilSapa.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        hasilSapa,
                        style: const TextStyle(color: Colors.green),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ================= LUAS =================
            buildCard(
              "🟩 Hitung Persegi",
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Masukkan Ukuran Sisi"),
                            const SizedBox(height: 8),
                            TextField(
                              controller: sisiController,
                              keyboardType: TextInputType.number,
                              decoration: inputStyle("Isi ukuran sisi"),
                            ),
                            const Text("Misal sisi (12)",
                                style: TextStyle(color: Colors.grey))
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            int sisi =
                                int.tryParse(sisiController.text) ?? 0;
                            hasilLuas = "Luas: ${luas4(sisi)}";
                          });
                        },
                        child: const Text("Kirim"),
                      )
                    ],
                  ),

                  // ✅ HASIL DI SINI
                  if (hasilLuas.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        hasilLuas,
                        style: const TextStyle(color: Colors.green),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ================= DISKON =================
            buildCard(
              "🏷️ Hitung Diskon",
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: hargaController,
                          keyboardType: TextInputType.number,
                          decoration: inputStyle("Isi harga barang"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: diskonController,
                          keyboardType: TextInputType.number,
                          decoration: inputStyle("Isi angka diskon"),
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            double harga =
                                double.tryParse(hargaController.text) ?? 0;
                            double diskon =
                                double.tryParse(diskonController.text) ?? 0;
                            hasilDiskon =
                                "Harga akhir: ${diskon4(harga, diskon)}";
                          });
                        },
                        child: const Text("Kirim"),
                      )
                    ],
                  ),

                  const SizedBox(height: 5),
                  const Text("Misal: 50",
                      style: TextStyle(color: Colors.grey)),

                  // ✅ HASIL DI SINI
                  if (hasilDiskon.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        hasilDiskon,
                        style: const TextStyle(color: Colors.green),
                      ),
                    ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  // ================= COMPONENT =================

  Widget buildCard(String title, Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  InputDecoration inputStyle(String hint) {
    return InputDecoration(
      hintText: hint,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.green),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.green, width: 2),
      ),
    );
  }
}