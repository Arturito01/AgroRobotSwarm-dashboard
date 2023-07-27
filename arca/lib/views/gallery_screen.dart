import 'dart:math';

import 'package:arca/services/image_loader.dart';
import 'package:arca/services/lg_service.dart';
import 'package:arca/utils/constants.dart';
import 'package:flutter/material.dart';

import '../entities/kml/kml_entity.dart';

class GalleryScreen extends StatefulWidget {
  GalleryScreen({Key? key}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final List<String> allImages = ImageLoader.images;
  final List<String> _images = [];

  void _generateRandomStrings() {
    _images.clear();
    final random = Random();
    final totalStrings = allImages.length;

    while (_images.length < 50 && _images.length < totalStrings) {
      int randomIndex = random.nextInt(totalStrings);
      String randomString = allImages[randomIndex];

      if (!_images.contains(randomString)) {
        _images.add(randomString);
      }
    }
  }

  final kml = KMLEntity(
    name: "image",
    content: '',
  );

  @override
  void initState() {
    super.initState();
    _generateRandomStrings();
  }

  bool isAscending = true;
  bool isShowingFullImage = false;
  String selectedImage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text(
          'Gallery',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
          splashRadius: 24,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.photo,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: isShowingFullImage ? buildFullImage() : buildImageGrid(),
    );
  }

  Widget buildImageGrid() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              isAscending = !isAscending;
              if (isAscending) {
                _images.sort();
              } else {
                _images.sort((a, b) => b.compareTo(a));
              }
            });
          },
          child: Text(isAscending ? 'Order A-Z' : 'Order Z-A'),
        ),
      ),
      Expanded(
        child: GridView.builder(
          padding: const EdgeInsets.only(
              left: defaultPadding * 3, right: defaultPadding * 3),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
          ),
          itemCount: _images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedImage = _images[index];
                  isShowingFullImage = true;
                });
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  _images[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      )
    ]);
  }

  Widget buildFullImage() {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            selectedImage,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: 40,
          right: 16,
          child: IconButton(
            icon: const Icon(
              Icons.close,
              size: 50,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                isShowingFullImage = false;
              });
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            onPressed: () {
              //LGService.shared?.sendKMLToLastScreen(kml, selectedImage);
            },
            child: const Text('Send KML'),
          ),
        ),
      ],
    );
  }
}
