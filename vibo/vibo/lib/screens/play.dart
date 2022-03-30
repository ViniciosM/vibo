import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key, required this.docId}) : super(key: key);

  final String docId;

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      color: Colors.black,
      child: CarouselSlider(
        items: [
          Image.asset('assets/images/01.jpeg'),
          Image.asset('assets/images/02.jpeg'),
          Image.asset('assets/images/03.jpeg'),
          Image.asset('assets/images/04.jpeg'),
          Image.asset('assets/images/05.jpeg'),
          Image.asset('assets/images/06.jpeg'),
          Image.asset('assets/images/07.jpeg'),
        ],
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
            //aspectRatio: 1,
            initialPage: 1,
            //autoPlayAnimationDuration: Duration(seconds: 10),
            autoPlayInterval: Duration(seconds: 12)),
      ),
      /*
        TextButton(
          onPressed: () => _controller.nextPage(
              duration: const Duration(milliseconds: 300), curve: Curves.linear),
          child: const Text('→'),
        ),
       */
    );
  }
}
