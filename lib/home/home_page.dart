import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_flutter/models/api_shoes_model.dart';
import 'package:mini_project_flutter/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _ApiFilteringState();
}

class _ApiFilteringState extends State<HomePage> {
  final List<String> categories = [
    'Collection',
    'Mix and Match',
    'Campus',
    'Minimalist',
    'Gather',
  ];
  List<String> shoeListMap = [];

  List<Shoes> shoes = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    try {
      final response = await Dio()
          .get("https://crud-75ac9-default-rtdb.firebaseio.com/converse.json");

      if (response.statusCode == 200) {
        final data = response.data;
        final List<Shoes> shoesList = [];
        data.forEach((key, value) {
          shoesList.add(Shoes.fromJson(value));
        });

        setState(() {
          shoes = shoesList;
        });
      }
    } catch (error) {
      print("Error fetching data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    final filterProducts = shoes.where((product) {
      return shoeListMap.isEmpty || shoeListMap.contains(product.kategori);
    }).toList();

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(top: 24),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((kategori) {
                  return Row(
                    children: [
                      FilterChip(
                        backgroundColor: primary2Color,
                        selected: shoeListMap.contains(kategori),
                        label: Text(kategori),
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              shoeListMap.add(kategori);
                            } else {
                              shoeListMap.remove(kategori);
                            }
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side:
                              const BorderSide(color: Colors.black, width: 1.0),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
            ),
            child: Text('Converse All Star', style: loginTitle),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filterProducts.length,
              itemBuilder: (context, index) {
                final shoes = filterProducts[index];
                return Container(
                  width: 188,
                  height: 300,
                  margin: const EdgeInsets.only(
                    top: 16,
                    right: 16,
                    left: 16,
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Image.network(
                        shoes.imageUrl,
                        width: 188,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        shoes.title,
                        style: subtitle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(shoes.tipe, style: subtitle2),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('Size: ${shoes.size}', style: keterangan),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/detail');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              backgroundColor, // Menggunakan primary untuk mengubah warna latar belakang
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          'Detail',
                          style: detailButton,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
