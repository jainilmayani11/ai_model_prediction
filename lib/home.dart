import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Model Prediction', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange.shade500,
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
              normalCIN1Flex: 26, // Example different flex values
              cin2CIN3Flex: 44,   // Example different flex values
              cin3PlusFlex: 30,    // Example different flex values
            ),
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
    required this.normalCIN1Flex, // Default flex values
    required this.cin2CIN3Flex,   // Default flex values
    required this.cin3PlusFlex,    // Default flex values
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FullScreenImage(imagePath: imagePath)),
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
        Card(
          color: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    const Icon(
                      Icons.info,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
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
      ],
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  const FullScreenImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Screen Image'),
      ),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: ClipRRect(
            child: Image(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
