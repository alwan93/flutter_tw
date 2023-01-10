import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tw/screens/screen_2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    // ff8c00
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        bottom: PreferredSize(
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
          preferredSize: Size.fromHeight(4.0),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.search,
            color: Color(0xffff8c00),
          ),
          onPressed: () {
            // TODO: Do something here.
            print('Search button tapped');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Color(0xffff8c00),
            ),
            onPressed: () {
              // TODO: Do something here.
              print('Plus button tapped');
            },
          ),
        ],
        backgroundColor: Colors.white,
        title: const Text('Contacts',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black)),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        height: _height,
        width: _width,
        child: FutureBuilder(
            future: rootBundle.loadString('assets/data.json'),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                List data = jsonDecode(snapshot.data!) ?? [];
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) => Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Screen2(
                                              data: data[index],
                                            ))).then((value) {
                                  print(value);
                                  setState(() {
                                    data = data.map((product) {
                                      if (product["id"] == value['id']) {
                                        return {value};
                                      }
                                      return product;
                                    }).toList();
                                  });
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Color(0xffff8c00),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        data[index]['firstName'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const Divider()
                          ],
                        ));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
