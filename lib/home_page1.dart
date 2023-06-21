import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_api_new/models/model1.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  List<Userdetails> userdetails = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: userdetails.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      // margin: const EdgeInsets.only(bottom: 10),
                      height: 300,
                      decoration: const BoxDecoration(
                        color: Colors.greenAccent,
                        //borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getText(
                              index, 'ID:', userdetails[index].id.toString()),
                          getText(index, 'Name:',
                              userdetails[index].name.toString()),
                          getText(index, 'UserName:',
                              userdetails[index].username.toString()),
                          getText(index, 'Email:',
                              userdetails[index].email.toString()),
                          getText(index, 'Phone:',
                              userdetails[index].phone.toString()),
                          getText(index, 'website:',
                              userdetails[index].website.toString()),
                          getText(
                            index,
                            'Address:',
                            '${userdetails[index].address.suite.toString()},${userdetails[index].address.street.toString()},${userdetails[index].address.city.toString()},${userdetails[index].address.zipcode.toString()},${userdetails[index].address.geo.toString()}:,${userdetails[index].address.geo.lat.toString()},${userdetails[index].address.geo.lng.toString()}',
                          ),
                          getText(
                            index,
                            'Company:',
                            '${userdetails[index].company.name.toString()},${userdetails[index].company.catchPhrase.toString()},${userdetails[index].company.bs.toString()}',
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }

  Text getText(int index, String fieldName, String content) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: fieldName,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: content,
        style: const TextStyle(
          fontSize: 16,
        ),
      )
    ]));
  }

  Future<List<Userdetails>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        userdetails.add(Userdetails.fromJson(index));
      }
      return userdetails;
    } else {
      return userdetails;
    }
  }
}
