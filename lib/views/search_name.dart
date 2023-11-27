import 'package:flutter/material.dart';
import 'package:teste_vaga_dunnas/core/app_text.dart';
import 'package:teste_vaga_dunnas/views/home.dart';

class SearchName extends StatelessWidget {
  const SearchName({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Row(
            children: [
              CircleAvatar(
                child: Image.network(
                  'https://seeklogo.com/images/G/github-logo-2E3852456C-seeklogo.com.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                ' Github',
                style: AppText.boldWhite(22),
              ),
              Text(
                ' profiles',
                style: AppText.regularWhite(22),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Search by username"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (controller.text != '' && controller.text.isNotEmpty) {
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              Home(username: controller.text),
                        ));
                  }
                },
                child: Text('Search'))
          ]),
        ),
      ),
    );
  }
}
