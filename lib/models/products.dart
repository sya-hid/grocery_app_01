import 'package:flutter/material.dart';
import 'package:grocery_app_01/models/categories.dart';

class Product {
  final String? description, name, image;
  final double? rate, price;
  final Color? color;
  final String? category;

  Product(
      {required this.category,
      required this.image,
      required this.description,
      required this.name,
      required this.rate,
      required this.color,
      required this.price});
}

List<Product> products = [
  Product(
      category: categories[1],
      image: 'fruit/orange.png',
      name: 'Orange',
      price: 14.99,
      rate: 4.4,
      color: Colors.orangeAccent,
      description:
          'An orange is a fruit of various citrus species in the family Rutaceae (see list of plants known as orange); it primarily refers to Citrus × sinensis, which is also called sweet orange, to distinguish it from the related Citrus × aurantium, referred to as bitter orange. The sweet orange reproduces asexually (apomixis through nucellar embryony); varieties of sweet orange arise through mutations.'),
  Product(
      image: 'vegetable/broccoli.png',
      category: categories[2],
      name: 'Broccoli',
      description:
          'Broccoli (Brassica oleracea var. italica) is an edible green plant in the cabbage family (family Brassicaceae, genus Brassica) whose large flowering head, stalk and small associated leaves are eaten as a vegetable. Broccoli is classified in the Italica cultivar group of the species Brassica oleracea. Broccoli has large flower heads, usually dark green, arranged in a tree-like structure branching out from a thick stalk which is usually light green. The mass of flower heads is surrounded by leaves. Broccoli resembles cauliflower, which is a different but closely related cultivar group of the same Brassica species.',
      price: 10.9,
      rate: 4.0,
      color: Colors.lightGreen),
  Product(
      category: categories[1],
      name: 'Apple',
      image: 'fruit/apple.png',
      price: 15.33,
      rate: 4.5,
      color: Colors.redAccent,
      description:
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today. Apples have been grown for thousands of years in Asia and Europe and were brought to North America by European colonists. Apples have religious and mythological significance in many cultures, including Norse, Greek, and European Christian tradition.'),
  Product(
      category: categories[2],
      image: 'vegetable/potato.png',
      description:
          'The potato is a starchy tuber of the plant Solanum tuberosum and is a root vegetable native to the Americas. The plant is a perennial in the nightshade family Solanaceae. Wild potato species can be found from the southern United States to southern Chile. The potato was originally believed to have been domesticated by Native Americans independently in multiple locations, but later genetic studies traced a single origin, in the area of present-day southern Peru and extreme northwestern Bolivia.',
      name: 'Potato',
      rate: 3.5,
      color: Colors.brown.shade400,
      price: 9.0),
  Product(
      category: categories[2],
      image: 'vegetable/carrot.png',
      name: 'Carrot',
      description:
          'The carrot (Daucus carota subsp. sativus) is a root vegetable, typically orange in color, though purple, black, red, white, and yellow cultivars exist, all of which are domesticated forms of the wild carrot, Daucus carota, native to Europe and Southwestern Asia. The plant probably originated in Persia and was originally cultivated for its leaves and seeds. The most commonly eaten part of the plant is the taproot, although the stems and leaves are also eaten. The domestic carrot has been selectively bred for its enlarged, more palatable, less woody-textured taproot.',
      price: 13.4,
      color: Colors.orange,
      rate: 3.8),
  Product(
      image: 'fruit/grape.png',
      name: 'Grape',
      category: categories[1],
      color: Colors.redAccent,
      price: 16.7,
      rate: 4.3,
      description:
          'A grape is a fruit, botanically a berry, of the deciduous woody vines of the flowering plant genus Vitis. Grapes can be eaten fresh as table grapes, used for making wine, jam, grape juice, jelly, grape seed extract, vinegar, and grape seed oil, or dried as raisins, currants and sultanas. Grapes are a non-climacteric type of fruit, generally occurring in clusters.'),
  Product(
      image: 'fruit/mango.png',
      name: 'Mango',
      category: categories[1],
      color: Colors.redAccent,
      price: 16.0,
      rate: 4.0,
      description:
          'A mango is an edible stone fruit produced by the tropical tree Mangifera indica which is believed to have originated from the region between northwestern Myanmar, Bangladesh, and northeastern India. M. indica has been cultivated in South and Southeast Asia since ancient times resulting in two types of modern mango cultivars: the "Indian type" and the "Southeast Asian type". Other species in the genus Mangifera also produce edible fruits that are also called "mangoes", the majority of which are found in the Malesian ecoregion.'),
  Product(
      category: categories[1],
      image: 'fruit/melon.png',
      description:
          'A melon is any of various plants of the family Cucurbitaceae with sweet, edible, and fleshy fruit. The word "melon" can refer to either the plant or specifically to the fruit. Botanically, a melon is a kind of berry, specifically a "pepo". The word melon derives from Latin melopepo, which is the latinization of the Greek μηλοπέπων (mēlopepōn), meaning "melon", itself a compound of μῆλον (mēlon), "apple, treefruit (of any kind)" and πέπων (pepōn), amongst others "a kind of gourd or melon". Many different cultivars have been produced, particularly of cantaloupes.',
      name: 'Melon',
      color: Colors.orangeAccent,
      rate: 3.9,
      price: 12.6),
  Product(
      category: categories[2],
      image: 'vegetable/celery.png',
      name: 'Celery',
      description:
          'Celery (Apium graveolens) is a marshland plant in the family Apiaceae that has been cultivated as a vegetable since antiquity. Celery has a long fibrous stalk tapering into leaves. Depending on location and cultivar, either its stalks, leaves or hypocotyl are eaten and used in cooking. Celery seed powder is used as a spice.',
      price: 13.4,
      color: Colors.lightGreen,
      rate: 4.0),
  Product(
      category: categories[2],
      image: 'vegetable/lettuce.png',
      color: Colors.lightGreenAccent,
      name: 'Lettuce',
      description:
          'Lettuce (Lactuca sativa) is an annual plant of the family Asteraceae. It is most often grown as a leaf vegetable, but sometimes for its stem and seeds. Lettuce is most often used for salads, although it is also seen in other kinds of food, such as soups, sandwiches and wraps; it can also be grilled. One variety, the celtuce (asparagus lettuce), is grown for its stems, which are eaten either raw or cooked. In addition to its main use as a leafy green, it has also gathered religious and medicinal significance over centuries of human consumption. Europe and North America originally dominated the market for lettuce, but by the late 20th century the consumption of lettuce had spread throughout the world. As of 2017, world production of lettuce and chicory was 27 million tonnes, 56% of which came from China.',
      rate: 3.4,
      price: 10.0)
];

class Recent {
  final Product? product;

  Recent({this.product});
}

List<Recent> recents = [
  Recent(product: products[9]),
  Recent(product: products[7]),
];
