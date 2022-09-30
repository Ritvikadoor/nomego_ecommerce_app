import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/splash_screen/view/get_started_two.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          Container(
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/dd425f8e-a0e3-47cc-917c-d4affdb8b7bf-removebg-preview.png'),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Swift Delivery',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w800),
              ),
              const Text(
                'Get all your orders delivered to you at the \nfastest time possible with our dedicated\n dispatch company',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const Text(
                          ".",
                          style: TextStyle(fontSize: 100, color: Colors.purple),
                        ),
                        Text(
                          ".",
                          style: TextStyle(
                              fontSize: 100, color: Colors.purple.shade100),
                        ),
                        Text(
                          ".",
                          style: TextStyle(
                              fontSize: 100, color: Colors.purple.shade100),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ElevatedButton(
                        onPressed: () => const GetStartedTwo(),
                        child: const Text(
                          'Next',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
