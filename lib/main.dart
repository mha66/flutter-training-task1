import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Product> products = [
    Product(
      title: 'Nikon 600D Mirrorless',
      price: 344.99,
      recommendations: 201,
      thumbnail: 'https://m.media-amazon.com/images/I/91ohbKev4BL.jpg',
    ),
    Product(
      title: 'WJPILIS Smart Wrist Watch',
      price: 199.99,
      recommendations: 184,
      thumbnail: 'https://images-na.ssl-images-amazon.com/images/I/41wdBrccfuL.jpg',
    ),
    Product(
      title: 'Echo Dot Kids Edition',
      price: 299.99,
      recommendations: 410,
      thumbnail: 'https://crdms.images.consumerreports.org/prod/products/cr/models/396194-smart-speakers-amazon-echo-dot-kids-edition-62433.png',
    ),
    Product(
      title: 'Amazon Echo Look',
      price: 349.49,
      recommendations: 474,
      thumbnail: 'https://cdn.geekwire.com/wp-content/uploads/2017/04/Echo-Look-Standing-Left-1260x1260.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0x93DEDDDD),
              ),
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount:products.length,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Page2(
                                price: products[index].price,
                              )
                          )
                        );
                      },
                      child: TextAndImage(product:products[index])
                  );
                }
          ),
        ),
      )),
    );
  }
}

class TextAndImage extends StatelessWidget {
  final Product product;
  const TextAndImage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
              color: Colors.black38,
              blurRadius: 5,
              blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  product.thumbnail,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                ),
                const SizedBox(height: 5),
                Text(
                    '\$${product.price.toString()}',
                    style: const TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(Icons.people),
                    Text(
                      ' +${product.recommendations.toString()} recommendations',
                      style: const TextStyle(
                        fontSize: 9,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class Page2 extends StatefulWidget {
  double price;
  Page2({super.key, required this.price});
  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  double price = 0.0;

  void add5(){
    setState(() {
      price=price+5;
    });
  }

  void subtract5(){
    setState(() {
      price=price-5;
    });
  }

  @override
  void initState(){
    price = widget.price;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Price is \$$price',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: Colors.lightBlueAccent,
                      shape: const OvalBorder(eccentricity: 0.7),
                      minimumSize: const Size(100,50),
                    ),
                    onPressed: () {
                      add5();
                    },
                    child: const Text(
                      '+5',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    )
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: Colors.lightBlueAccent,
                      shape: const OvalBorder(eccentricity: 0.7),
                      minimumSize: const Size(100,50),
                    ),
                    onPressed: () {
                      subtract5();
                    },
                    child: const Text(
                      '-5',
                      style: TextStyle(
                        fontSize: 20
                      ),
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class Product {
  final String title;
  final double price;
  final int recommendations;
  final String thumbnail;

  Product({
      required this.title,
      required this.price,
      required this.recommendations,
      required this.thumbnail,
  });
}
