import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myapp1/layout_pages/phone_no.dart';

class Phonecarousel extends StatefulWidget {
  @override
  _PhonecarouselState createState() => _PhonecarouselState();
}

class _PhonecarouselState extends State<Phonecarousel> {
  List phonenumbers = [
    {"longphone": "123", "shortphone": "8535", "region": 'Addis Ababa'},
    {"longphone": "123", "shortphone": "6407", "region": "Diredawa"},
    {"longphone": "123", "shortphone": "6244", "region": "Tigray"},
    {"longphone": "123", "shortphone": "6981", "region": "Amahara"},
    {"longphone": "123", "shortphone": "6955", "region": "Oromiya"},
    {"longphone": "123", "shortphone": "6599", "region": "Somali"},
    {"longphone": "123", "shortphone": "6016", "region": "Benishangul Gumz"},
    {"longphone": "123", "shortphone": "6929", "region": "SNNP"},
    {"longphone": "123", "shortphone": "6864", "region": "Harari"},
    {"longphone": "123", "shortphone": "6184", "region": "Gambela"},
    {"longphone": "123", "shortphone": "6220", "region": "Afar"},
    {"longphone": "952", "shortphone": "8535", "region": "For More Info"},
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemBuilder: (context, index) {
          return Phonelayout(
            longcallcenter: (phonenumbers[index]["longphone"]),
            shortcallcenter: (phonenumbers[index]["shortphone"]),
            regionname: (phonenumbers[index]['region']),
            shordial: (phonenumbers[index]["shortphone"]),
            longdial: (phonenumbers[index]["longphone"]),
          );
        },
        options: CarouselOptions(
            height: 178,
            initialPage: 0,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayInterval: Duration(seconds: 8),
            enlargeCenterPage: true,
            autoPlay: true),
        itemCount: phonenumbers.length);
  }
}
