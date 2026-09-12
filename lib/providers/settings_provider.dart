import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Currency {
  final String code;
  final String symbol;
  final double multiplier; // Multiplier from base currency (PKR)

  const Currency(this.code, this.symbol, this.multiplier);
}

class SettingsProvider extends ChangeNotifier {
  static const List<Currency> availableCurrencies = [
    Currency('PKR', 'Rs', 1.0),
    Currency('USD', '\$', 0.0036),
    Currency('EUR', '€', 0.0033),
    Currency('GBP', '£', 0.0028),
    Currency('AED', 'د.إ', 0.013),
  ];

  Currency _selectedCurrency = availableCurrencies.firstWhere((c) => c.code == 'USD'); // Defaulting to USD as per previous request

  Currency get selectedCurrency => _selectedCurrency;

  SettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCode = prefs.getString('currency_code');
    if (savedCode != null) {
      _selectedCurrency = availableCurrencies.firstWhere(
        (c) => c.code == savedCode,
        orElse: () => availableCurrencies.firstWhere((c) => c.code == 'USD'),
      );
      notifyListeners();
    }
  }

  Future<void> setCurrency(Currency currency) async {
    _selectedCurrency = currency;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currency_code', currency.code);
  }

  /// Formats a base cost (in PKR) into the selected currency.
  String formatCost(double baseCost) {
    final convertedCost = baseCost * _selectedCurrency.multiplier;
    
    // Formatting logic to add commas
    String formattedNumber;
    if (convertedCost >= 100000) {
      formattedNumber = '${(convertedCost / 1000).toStringAsFixed(0)},000';
    } else {
      formattedNumber = convertedCost.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (m) => '${m[1]},',
      );
    }
    
    return '${_selectedCurrency.symbol} $formattedNumber';
  }
}
