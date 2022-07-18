import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app_01/models/products.dart';

class DetailPage extends StatefulWidget {
  final Product product;

  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        elevation: 0,
        backgroundColor: (widget.product.color)!.withOpacity(0.4),
        leading: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: widget.product.color!,
              )),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: widget.product.color,
                )),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/' + widget.product.image!,
            height: 400,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          Text(
            widget.product.name!,
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              RatingBar.builder(
                  initialRating: widget.product.rate!,
                  allowHalfRating: true,
                  itemSize: 24,
                  ignoreGestures: true,
                  itemBuilder: (context, index) => Icon(
                      Icons.star_border_rounded,
                      color: widget.product.color),
                  onRatingUpdate: (rating) {}),
              Text(
                ' (' + widget.product.rate.toString() + ') ',
                style: GoogleFonts.poppins(color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
