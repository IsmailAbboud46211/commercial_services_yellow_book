// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';
import '../../constant/privacy_policies.dart';

class PrivacyPlicies extends StatelessWidget {
  const PrivacyPlicies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policies",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Text(
                      privacy_policies[index],
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: height * 0.02,
                    ),
                itemCount: privacy_policies.length),
            SizedBox(
              height: height * 0.02,
            ),
            ElevatedButton(
                onPressed: () => Navigator.pop(
                      context,
                    ),
                child:
                    const Text("Hidden", style: TextStyle(color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
