// ignore_for_file: unnecessary_string_interpolations

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_flutter/models/api_shoes_model.dart';
import 'package:mini_project_flutter/theme.dart';

class AddShoes extends StatefulWidget {
  const AddShoes({Key? key}) : super(key: key);

  @override
  State<AddShoes> createState() => _AddShoesState();
}

class _AddShoesState extends State<AddShoes> {
  List<Shoes> shoes = [];

  Future<void> fetchShoes() async {
    try {
      final response = await Dio()
          .get('https://crud-75ac9-default-rtdb.firebaseio.com/converse.json');
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        List<Shoes> shoesList = data.entries.map((entry) {
          final json = entry.value as Map<String, dynamic>;
          return Shoes.fromJson(json);
        }).toList();
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
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primary3Color,
        title: Text(
          'Shoes Collection',
          style: addTitle,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (Shoes shoe in shoes)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 400,
                      height: 300,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Image.network(
                              shoe.imageUrl,
                              width: 188,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${shoe.title}',
                            style: subtitle,
                          ),
                          const SizedBox(height: 5),
                          Text('${shoe.tipe}', style: subtitle2),
                          const SizedBox(height: 5),
                          Text(
                            '${shoe.size}',
                            style: keterangan,
                          ),
                          const SizedBox(height: 5),
                          Text('${shoe.kategori}', style: subtitle),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: fetchShoes,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(primary3Color),
                  ),
                  child: const Text('Add Shoes Collection'),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 170,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primary3Color),
                    ),
                    child: const Text('Back'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
