import 'package:invoiceninja/models/credit.dart';
import 'package:invoiceninja/utils/web_client.dart';

import '../invoiceninja.dart';

/// Credit Admin Repository
class CreditAdminRepository {
  /// Load list of credits
  Future<List<Credit>> load() async {
    final response = await WebClient().get(
        '${InvoiceNinjaAdmin.url}/api/v1/credits',
        token: InvoiceNinjaAdmin.token);

    return CreditList.fromJson(response).data;
  }

  /// Persist credit to the server
  Future<Credit> save(Credit credit) async {
    dynamic response;

    if (credit.id.isEmpty) {
      response = await WebClient().post(
          '${InvoiceNinjaAdmin.url}/api/v1/credits',
          token: InvoiceNinjaAdmin.token,
          data: credit.toJson());
    } else {
      response = await WebClient().put(
          '${InvoiceNinjaAdmin.url}/api/v1/credits/${credit.id}',
          token: InvoiceNinjaAdmin.token,
          data: credit.toJson());
    }

    return CreditItem.fromJson(response).data;
  }

  /// Find an credit by its id
  Future<Credit> findById(String id) async {
    final response = await WebClient().get(
        '${InvoiceNinjaAdmin.url}/api/v1/credits/$id',
        token: InvoiceNinjaAdmin.token);

    return CreditItem.fromJson(response).data;
  }

  /// Find an credit by its number
  Future<Credit> findByNumber(String number) async {
    final response = await WebClient().get(
        '${InvoiceNinjaAdmin.url}/api/v1/credits?number=$number',
        token: InvoiceNinjaAdmin.token);

    final data = CreditList.fromJson(response).data;

    return data.isEmpty ? null : data.first;
  }
}
