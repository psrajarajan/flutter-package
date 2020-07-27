library invoice_ninja;

import 'package:invoice_ninja/utils/web_client.dart';

class InvoiceNinja {
  static String _url = 'https://app.invoiceninja.com';
  static String _token;
  static bool _isDebug = false;

  static void initialize(String token, {bool isDebug = false, String url}) {
    _token = token;
    _isDebug = isDebug;

    if (url != null) {
      _url = url;
    }
  }

  static void setURL(String value) => _url = value;

  static void setToken(String value) => _token = value;

  static void setDebug(bool value) => _isDebug = true;

  dynamic loadProducts() async {
    print('Working... $_url $_token $_isDebug');

    final response = await WebClient().get('$_url/api/v1/products', _token);

    print('RESPONSE: $response');

    return response;
  }
}
