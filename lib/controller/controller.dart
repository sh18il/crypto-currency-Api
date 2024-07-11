import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

coinName(name) {
  final api = "wss://ws.coincap.io/prices?assets=${name}";
  return api;
}

final fetchCurrency = Provider<WebSocketChannel>((ref) {
  final webSocket = IOWebSocketChannel.connect(coinName("bitcoin"));
  return webSocket;
});

final coinPriceProvider = StreamProvider<Map<String, dynamic>>((ref) {
  try {
    final webSoket = ref.watch(fetchCurrency);
    return webSoket.stream.map((event) {
      final Map<String, dynamic> data = json.decode(event);
      return data.map((key, value) => MapEntry(key, value));
    });
  } catch (e) {
    throw Exception(e);
  }
});

final fetchEthereum = Provider((reff) {
  final webSoket = IOWebSocketChannel.connect(coinName("ethereum"));
  return webSoket;
});
final ethercoinPriceProvider = StreamProvider<Map<String, dynamic>>((ref) {
  try {
    final webSoket = ref.watch(fetchEthereum);
    return webSoket.stream.map((event) {
      final Map<String, dynamic> data = json.decode(event);
      return data.map((key, value) => MapEntry(key, value));
    });
  } catch (e) {
    throw Exception(e);
  }
});
final moneroCoin = Provider<WebSocketChannel>((ref) {
  final webSocket = IOWebSocketChannel.connect(coinName("monero"));
  return webSocket;
});

final monerocoinPriceProvider = StreamProvider<Map<String, dynamic>>((ref) {
  try {
    final webSoket = ref.watch(moneroCoin);
    return webSoket.stream.map((event) {
      final Map<String, dynamic> data = json.decode(event);
      return data.map((key, value) => MapEntry(key, value));
    });
  } catch (e) {
    throw Exception(e);
  }
});