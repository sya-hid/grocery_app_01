import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app_01/constants.dart';
import 'package:grocery_app_01/models/categories.dart';
import 'package:grocery_app_01/models/products.dart';
import 'package:grocery_app_01/pages/detailPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String kategori = 'ALL';
  List<Product> dataProduct = products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: GoogleFonts.poppins(
                            fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        'Jennifer',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.black,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage('assets/profile.png'))),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: TextField(
                        onChanged: (value) {
                          setState(() {
                            dataProduct = products
                                .where((element) => element.name!
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search_rounded,
                              color: Colors.grey,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Search Grocery',
                            hintStyle:
                                GoogleFonts.poppins(color: Colors.grey))),
                  )),
                  const SizedBox(width: 10),
                  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15), color: grey),
                      child: const Icon(
                        Icons.tune_rounded,
                        color: Colors.green,
                      ))
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    categories.length,
                    (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              kategori = categories[index];
                              kategori == 'ALL'
                                  ? dataProduct = products
                                  : dataProduct = products
                                      .where((element) =>
                                          element.category!.toLowerCase() ==
                                          kategori.toLowerCase())
                                      .toList();
                            });
                          },
                          child: SizedBox(
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  categories[index],
                                  style: GoogleFonts.poppins(
                                    fontSize:
                                        kategori == categories[index] ? 16 : 14,
                                    color: kategori == categories[index]
                                        ? Colors.green
                                        : Colors.grey,
                                    fontWeight: kategori == categories[index]
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                                kategori == categories[index]
                                    ? Container(
                                        height: 10,
                                        width: 10,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                        )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    dataProduct.length,
                    (index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                          product: dataProduct[index],
                                        )));
                          },
                          child: Padding(
                            padding: index == 0
                                ? const EdgeInsets.only(left: 20, right: 20)
                                : const EdgeInsets.only(right: 20),
                            child: ItemProduct(
                              product: dataProduct[index],
                            ),
                          ),
                        )),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Recent Shop',
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    recents.length,
                    (index) => Padding(
                          padding: index == 0
                              ? const EdgeInsets.symmetric(horizontal: 20)
                              : const EdgeInsets.only(right: 20),
                          child: ItemRecent(
                            recent: recents[index].product!,
                          ),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemRecent extends StatelessWidget {
  final Product recent;
  const ItemRecent({
    Key? key,
    required this.recent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 20, top: 10, bottom: 10),
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: [
          Container(
            height: 75,
            width: 75,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage('assets/' + recent.image!))),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(recent.name!,
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                  recent.category!,
                  style: GoogleFonts.poppins(color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            '\$${(recent.price!).toStringAsFixed(2)}',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}

class ItemProduct extends StatelessWidget {
  final Product product;
  const ItemProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 20,
                    right: 20,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                          offset: const Offset(5, 5),
                          blurRadius: 30,
                          spreadRadius: 15,
                          color: product.color!,
                        )
                      ]),
                    ),
                  ),
                  Image.asset(
                    'assets/' + product.image!,
                    height: 125,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name!,
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.category!,
                            style: GoogleFonts.poppins(
                                fontSize: 16, color: Colors.grey),
                          ),
                          Text(
                            '\$${(product.price)!.toStringAsFixed(2)}',
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15)),
                              color: Colors.deepOrange),
                          child: const Icon(
                            Icons.shopping_bag_rounded,
                            color: Colors.white,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
