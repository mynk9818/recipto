import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          title: const Text(''),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 17, 159, 184),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        "Mangolia",
                        style: TextStyle(fontSize: 8),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Magnolia Bakery',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '3% cashback • ₹250 Welcome Bonus',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Claim Deals',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDealCard(
                    imagePath: 'assets/Pay at store.png',
                    context,
                    title: 'Pay using my',
                    coins: 'Balance 500',
                    buttonText: 'Pay Bill',
                    color: Colors.lightBlue[50],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  _buildDealCard(
                    imagePath: 'assets/Buy Coins.png',
                    context,
                    title: 'Buy 500 ',
                    coins: 'for just ₹450',
                    buttonText: 'Get for ₹450',
                    color: Colors.purple[50],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDealCard(
                    imagePath: 'assets/Offers.png',
                    context,
                    title: 'Shop above ₹899 ',
                    coins: '& get 50',
                    buttonText: 'get 50',
                    color: const Color.fromRGBO(255, 243, 224, 1),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  _buildDealCard(
                    imagePath: 'assets/Store Cashback.png',
                    context,
                    title: 'Purchase at store ',
                    coins: '& get 5% back',
                    buttonText: 'get 5%',
                    color: Colors.blue[50],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Expanded(
                              child: SimpleDialog(
                                insetPadding: const EdgeInsets.all(10),
                                children: [
                                  const Text(
                                    'Proof of transaction',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Scan receipt/ share payment screenshot to earn',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  Column(
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(Icons.image),
                                        label:
                                            const Text('Share Payment Image'),
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.black,
                                          backgroundColor: Colors.white,
                                          side: const BorderSide(
                                              color: Colors.grey),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: Colors.purple,
                                        ),
                                        child: const Text('Scan Receipt'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: const Text("Payment")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDealCard(BuildContext context,
      {required String title,
      required String coins,
      required String buttonText,
      required Color? color,
      required String imagePath}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imagePath, height: 40),
              ],
            ), // Display the image using the asset path
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  coins.isNotEmpty ? '$coins coins' : '',
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: DottedLine(),
            ),

            if (buttonText.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(buttonText),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class DottedLine extends StatelessWidget {
  final double width;
  final double height;
  final double spacing;
  final Color color;

  const DottedLine({
    super.key,
    this.width = 5.0,
    this.height = 1.0,
    this.spacing = 3.0,
    this.color = Colors.black38,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(20, (index) {
        return Container(
          width: width,
          height: height,
          color: color,
        );
      }).toList(),
    );
  }
}
