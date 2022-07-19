import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app_01/constants.dart';
import 'package:grocery_app_01/models/products.dart';

class DetailPage extends StatefulWidget {
  final Product product;
  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class ClipPathDetail extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 2, size.height + 30, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: widget.product.color!.withOpacity(0.4),
          elevation: 0,
          leadingWidth: 80,
          leading: Container(
            margin: const EdgeInsets.only(left: 20),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: widget.product.color,
              ),
            ),
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
                    color: widget.product.color!,
                  )),
            ),
            const SizedBox(width: 20),
          ],
        ),
        bottomNavigationBar: Container(
          height: 90,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price',
                      style:
                          GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      '\$${widget.product.price!.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                const Spacer(),
                FlatButton(
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 40),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: kPrimaryGradientColor),
                      child: Text(
                        'Add to Cart',
                        style: GoogleFonts.poppins(
                            fontSize: 16, color: Colors.white),
                      ),
                    ))
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  const SizedBox(
                    height: 350,
                  ),
                  Positioned(
                    bottom: 30,
                    left: 20,
                    right: 20,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                            offset: const Offset(5, 5),
                            blurRadius: 15,
                            spreadRadius: 15,
                            color: widget.product.color!.withOpacity(0.5))
                      ]),
                    ),
                  ),
                  ClipPath(
                    clipper: ClipPathDetail(),
                    child: Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      color: widget.product.color!.withOpacity(0.4),
                    ),
                  ),
                  Positioned(
                    bottom: -30,
                    left: 20,
                    right: 20,
                    child: Image.asset(
                      'assets/' + widget.product.image!,
                      width: MediaQuery.of(context).size.width - 40,
                      height: 400,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product.name!,
                        style: GoogleFonts.poppins(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        RatingBar.builder(
                            initialRating: widget.product.rate!,
                            itemSize: 24,
                            allowHalfRating: true,
                            itemBuilder: (context, index) => Icon(
                                  Icons.star_rounded,
                                  color: widget.product.color,
                                ),
                            onRatingUpdate: (rating) {}),
                        Text(
                          ' (' + widget.product.rate!.toString() + ')',
                          style: GoogleFonts.poppins(
                              fontSize: 14, color: Colors.grey),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (quantity > 1) {
                                quantity--;
                              }
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: grey),
                            child: Center(
                              child: Text(
                                '-',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: Colors.green,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          quantity.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                            child: Center(
                              child: Text(
                                '+',
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Description',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.product.description!,
                      maxLines: 3,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                          height: 1.5, fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 75,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade300),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
