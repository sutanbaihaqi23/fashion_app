import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedFilter = 0;
  var filters = ["All Items", "Dress", "T-Shirt", "Pants"];
  var products = [
    {
      "title": "Modern Light Clothes",
      "subtitle": "T-Shirt",
      "price": 212.99,
      "rating": 5.0,
      "img":
          "https://images.unsplash.com/photo-1517841905240-472988babdf9?q=80&w=800",
      "fav": true
    },
    {
      "title": "Light Dress Bless",
      "subtitle": "Dress modern",
      "price": 162.99,
      "rating": 5.0,
      "img":
          "https://images.unsplash.com/photo-1490481651871-ab68de25d43d?q=80&w=800",
      "fav": false
    },
    {
      "title": "Casual Street Outfit",
      "subtitle": "Hoodie",
      "price": 189.50,
      "rating": 4.8,
      "img":
          "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?q=80&w=800",
      "fav": false
    },
    {
      "title": "Classic White Shirt",
      "subtitle": "Shirt",
      "price": 120.00,
      "rating": 4.9,
      "img":
          "https://images.unsplash.com/photo-1520975930473-6c5c11b2f6d4?q=80&w=800",
      "fav": false
    },
    {
      "title": "Elegant Office Dress",
      "subtitle": "Dress",
      "price": 250.00,
      "rating": 5.0,
      "img":
          "https://images.unsplash.com/photo-1532453288672-3a27e9be9efd?q=80&w=800",
      "fav": true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello, Welcome 👋",
                          style: TextStyle(color: Colors.black54)),
                      SizedBox(height: 4),
                      Text("Albert Stevano",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w800)),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1527980965255-d3b416303d12?q=80&w=200"),
                  )
                ],
              ),
            ),

            // Search bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.search),
                          hintText: "Search clothes...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14)),
                    child: IconButton(
                      icon: Icon(Icons.tune_rounded),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 14),

            // Filter row
            Container(
              height: 44,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  var active = selectedFilter == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: index == 0 ? 20 : 10),
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: active ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Color(0xffe6e6e6)),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        filters[index],
                        style: TextStyle(
                            color: active ? Colors.white : Colors.black87),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 10),

            // Product grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 0.6,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: products.map((product) {
                  return buildProductCard(
                    product["title"],
                    product["subtitle"],
                    product["price"],
                    product["img"],
                    product["fav"],
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildProductCard(title, subtitle, price, imgUrl, fav) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                Image.network(
                  imgUrl,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 220,
                      color: Colors.grey[300],
                      child: Icon(Icons.broken_image,
                          size: 50, color: Colors.grey[600]),
                    );
                  },
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Icon(
                    fav ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.w800)),
                Text(subtitle, style: TextStyle(color: Colors.black54)),
                Row(
                  children: [
                    Text("\$$price",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    Icon(Icons.star, size: 16),
                    SizedBox(width: 4),
                    Text("5.0", style: TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
