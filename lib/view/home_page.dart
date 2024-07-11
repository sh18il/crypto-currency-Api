import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strem_riverpod/controller/controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool iss = true;

    final cryptoPrice = ref.watch(coinPriceProvider);
    final ethercoin = ref.watch(ethercoinPriceProvider);
    final monero = ref.watch(monerocoinPriceProvider);

    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 87, 67, 67),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              width: width,
              child: cryptoPrice.when(
                data: (data) {
                  final currency = data.keys.first;
                  final price = data[currency];
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            image: NetworkImage(
                                "https://static.vecteezy.com/system/resources/previews/008/822/064/non_2x/3d-design-bitcoin-cryptocurrency-white-background-free-png.png")),
                        Text(
                          currency.toUpperCase(),
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "${price} USD",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
                loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Container(
              width: width,
              child: ethercoin.when(
                data: (data) {
                  final currency = data.keys.first;
                  final price = data[currency];
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            image: NetworkImage(
                                "https://drakemall-files-new.s3.eu-central-1.amazonaws.com/Ethereum-ckmwgdvb000su01ow1rpi3tne.png")),
                        Text(
                          currency.toUpperCase(),
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "${price} USD",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
                loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Container(
              width: width,
              child: monero.when(
                data: (data) {
                  final currency = data.keys.first;
                  final price = data[currency];
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            image: NetworkImage(
                                "https://static.vecteezy.com/system/resources/previews/024/093/121/non_2x/monero-xmr-glass-crypto-coin-3d-illustration-free-png.png")),
                        Text(
                          currency.toUpperCase(),
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "${price} USD",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
                loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
