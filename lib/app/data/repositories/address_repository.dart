import 'dart:convert';
import 'package:pay7test/app/configs/utils/utils.dart';
import 'package:pay7test/app/data/models/via_cep_address_model.dart';
import 'package:pay7test/app/data/providers/http/http_client.dart';

abstract class AddressRepository {
  Future<ViaCepAddressModel> getAddressByCep(String cep);
  Future<List<ViaCepAddressModel>> getAddressesByPlace(String uf, String city, String place);
}

class AddressRepositoryImpl implements AddressRepository {
  late HttpClient _client;

  AddressRepositoryImpl() {
    _client = HttpClient();
  }

  @override
  Future<ViaCepAddressModel> getAddressByCep(String cep) async {
    final res = await _client.get(
      Uri.parse('${Utils.viaCepBaseUrl}/$cep/json'),
    );

    return ViaCepAddressModel.fromJson(res.body);
  }

  @override
  Future<List<ViaCepAddressModel>> getAddressesByPlace(String uf, String city, String place) async {
    final res = await _client.get(
      Uri.parse('${Utils.viaCepBaseUrl}/$uf/$city/$place/json/'),
    );

    final resList = json.decode(res.body) as List;
    return resList.map((e) => ViaCepAddressModel.fromMap(e)).toList();
  }
}
