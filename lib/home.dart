import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(

        title: const Text('AI Model Prediction',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomSection(
              title: 'Acetic Acid',
              imagePath: "assets/images/acetic.jpg",
              normalCIN1Color: Colors.green,
              cin2CIN3Color: Colors.orange,
              cin3PlusColor: Colors.red,
              normalCIN1Flex: 26,
              cin2CIN3Flex: 30,
              cin3PlusFlex: 44,
            ),
            SizedBox(height: 20),
            CustomSection(
              title: "Lugol's Iodine",
              imagePath: "assets/images/lugols.jpg",
              normalCIN1Color: Colors.green,
              cin2CIN3Color: Colors.orange,
              cin3PlusColor: Colors.red,
              normalCIN1Flex: 30,
              cin2CIN3Flex: 44,
              cin3PlusFlex: 26,
            ),
            SizedBox(height: 20),
            CombineOutput(
              title: "Combine OutPut",
              normalCIN1Color: Colors.green,
              cin2CIN3Color: Colors.orange,
              cin3PlusColor: Colors.red,
              normalCIN1Flex: 26,
              cin2CIN3Flex: 34,
              cin3PlusFlex: 39,
            )
          ],
        ),
      ),
    );
  }
}


class CustomSection extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color normalCIN1Color;
  final Color cin2CIN3Color;
  final Color cin3PlusColor;
  final int normalCIN1Flex;
  final int cin2CIN3Flex;
  final int cin3PlusFlex;

  const CustomSection({
    super.key,
    required this.title,
    required this.imagePath,
    required this.normalCIN1Color,
    required this.cin2CIN3Color,
    required this.cin3PlusColor,
    required this.normalCIN1Flex,
    required this.cin2CIN3Flex,
    required this.cin3PlusFlex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FullScreenImage(imagePath: imagePath)),
                );
              },
              child: SizedBox(
                width: 300,
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              children: [
                Card(
                  color: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Normal/CIN 1',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: normalCIN1Color,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'CIN 2/CIN 3',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: cin2CIN3Color,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'CIN 3+',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: cin3PlusColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              flex: normalCIN1Flex,
                              child: Container(
                                height: 25,
                                color: normalCIN1Color,
                              ),
                            ),
                            Expanded(
                              flex: cin2CIN3Flex,
                              child: Container(
                                height: 25,
                                color: cin2CIN3Color,
                              ),
                            ),
                            Expanded(
                              flex: cin3PlusFlex,
                              child: Container(
                                height: 25,
                                color: cin3PlusColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: InkWell(
                    child: const Icon(
                      Icons.info,
                      color: Colors.grey,
                    ),
                    onTap: () => showDetailDialog(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CombineOutput extends StatelessWidget {
  final String title;
  final Color normalCIN1Color;
  final Color cin2CIN3Color;
  final Color cin3PlusColor;
  final int normalCIN1Flex;
  final int cin2CIN3Flex;
  final int cin3PlusFlex;

  const CombineOutput({
    super.key,
    required this.title,
    required this.normalCIN1Color,
    required this.cin2CIN3Color,
    required this.cin3PlusColor,
    required this.normalCIN1Flex,
    required this.cin2CIN3Flex,
    required this.cin3PlusFlex,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the proportional values
    final totalFlex = normalCIN1Flex + cin2CIN3Flex + cin3PlusFlex;
    final normalCIN1Proportion = normalCIN1Flex / totalFlex;
    final cin2CIN3Proportion = cin2CIN3Flex / totalFlex;
    final cin3PlusProportion = cin3PlusFlex / totalFlex;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 7),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "CIN3+, or cervical interapithelial neoplasia grade 3+ indicates abnormal cells have affected the entire thickness of the cervix's surface layer. It's also known as carcinoma-in-situ, which is a very early stage of cancer where tumor cells have not yet invaded surrounding tissues. CIN3+ is not cancer, but it can become cancer and spread to nearby normal tissue if left untreated.",
                style: TextStyle(
                  wordSpacing: 2.0,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Stack(
              children: [
                Card(
                  color: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Normal/CIN 1',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: normalCIN1Color,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'CIN 2/CIN 3',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: cin2CIN3Color,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'CIN 3+',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: cin3PlusColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              flex: (normalCIN1Proportion * 100).toInt(),
                              child: Container(
                                height: 25,
                                color: normalCIN1Color,
                                child: Center(
                                  child: Text(
                                    normalCIN1Proportion.toStringAsFixed(2),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: (cin2CIN3Proportion * 100).toInt(),
                              child: Container(
                                height: 25,
                                color: cin2CIN3Color,
                                child: Center(
                                  child: Text(
                                    cin2CIN3Proportion.toStringAsFixed(2),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: (cin3PlusProportion * 100).toInt(),
                              child: Container(
                                height: 25,
                                color: cin3PlusColor,
                                child: Center(
                                  child: Text(
                                    cin3PlusProportion.toStringAsFixed(2),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                 Positioned(
                  top: 10,
                  right: 10,
                  child: InkWell(
                    child: const Icon(
                      Icons.info,
                      color: Colors.grey,
                    ),
                    onTap: () => showDetailDialog(context),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showDetailDialog(context){
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Details'),
        content: const Text(
          "CIN3+, or cervical interapithelial neoplasia grade 3+ indicates abnormal cells have affected the entire thickness of the cervix's surface layer. It's also known as carcinoma-in-situ, which is a very early stage of cancer where tumor cells have not yet invaded surrounding tissues. CIN3+ is not cancer, but it can become cancer and spread to nearby normal tissue if left untreated.",
        ),
        actions: [
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  const FullScreenImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Screen Image'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: PhotoView(
          imageProvider: AssetImage(imagePath),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 2.0,
          initialScale: PhotoViewComputedScale.contained,
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
