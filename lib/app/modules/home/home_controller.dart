import 'package:flutter/material.dart';
import 'package:pay7test/app/configs/constants/cities_of_brazil.dart';
import 'package:pay7test/app/configs/constants/states_of_brazil.dart';
import 'package:pay7test/app/data/models/city_of_brazil_model.dart';
import 'package:pay7test/app/data/models/state_of_brazil_model.dart';
import 'package:pay7test/app/data/models/via_cep_address_model.dart';
import 'package:pay7test/app/data/repositories/address_repository.dart';

class HomeController extends ChangeNotifier {
  late AddressRepository _addressRepository;

  HomeController() {
    _addressRepository = AddressRepositoryImpl();
    init();
  }

  bool isLoading = false;

  List<StateOfBrazilModel>? _countryStates;
  List<StateOfBrazilModel>? get countryStates => _countryStates;

  List<CityOfBrazilModel>? _cities;
  List<CityOfBrazilModel>? get cities => _cities;

  List<String>? _neighborhood;
  List<String>? get neighborhood => _neighborhood;

  List<ViaCepAddressModel>? _addresses;
  List<ViaCepAddressModel>? _addressesFiltered;
  List<ViaCepAddressModel>? get addresses => _addressesFiltered;

  String? _stateSelected;
  String? _citySelected;
  String? _neighborhoodSelected;

  String? _placeText;
  String? _cepText;

  bool get isCep => _cepText != null && _cepText!.length >= 8;

  void init() {
    _countryStates = statesOfBrazil.map((e) => StateOfBrazilModel.fromMap(e)).toList();
    selectState(_countryStates?.first.id);
    selectCity(_cities?.first.id);
    notifyListeners();
  }

  void selectState(v) {
    _stateSelected = _countryStates?.singleWhere((e) => e.id == v).sigla;
    final allCities = citiesOfBrazil.map((e) => CityOfBrazilModel.fromMap(e)).toList();

    _cities = allCities.where((e) => e.estado == v).toList();
    notifyListeners();
  }

  void selectCity(v) {
    _citySelected = _cities?.singleWhere((e) => e.id == v).nome;
  }

  void onChangePlaceText(String? v) {
    _placeText = (v?.length ?? 0) > 0 ? v : null;
  }

  void onChangeCepText(String? v) {
    _cepText = (v?.length ?? 0) > 0 ? v : null;
  }

  void selectNeighborhood(v) {
    _neighborhoodSelected = v;
  }

  void getAddressByCep() {
    if (_cepText != null && _cepText!.length >= 8) {
      _cepText = removeSpecialChar(_cepText!);
      isLoading = true;
      notifyListeners();

      _addressRepository.getAddressByCep(_cepText!).then((value) {
        _addresses = [value];
        _addressesFiltered = _addresses;
      }).catchError((error) {
        // ignore: avoid_print
        print(error);
      }).whenComplete(() {
        isLoading = false;
        notifyListeners();
      });
    }
  }

  void getAddressesByPlace() {
    if (_stateSelected != null && _citySelected != null && _placeText != null) {
      isLoading = true;
      notifyListeners();

      _addressRepository.getAddressesByPlace(_stateSelected!, _citySelected!, _placeText!).then((value) {
        _addresses = value;
        _addressesFiltered = _addresses;
        getNeighborhood();
      }).catchError((error) {
        // ignore: avoid_print
        print(error);
      }).whenComplete(() {
        isLoading = false;
        notifyListeners();
      });
    }
  }

  void getNeighborhood() {
    if (_addressesFiltered != null) {
      List<String> uniqueNeighborhood = [];

      _addressesFiltered?.forEach((e) {
        if (!uniqueNeighborhood.contains(e.bairro)) {
          uniqueNeighborhood.add(e.bairro);
        }
      });

      _neighborhood = uniqueNeighborhood.isNotEmpty ? uniqueNeighborhood : null;
      notifyListeners();
    }
  }

  void filterNeighborhood() {
    _addressesFiltered = _addresses?.where((e) => e.bairro == _neighborhoodSelected).toList();
    notifyListeners();
  }

  void clearFilterNeighborhood() {
    _addressesFiltered = _addresses;
    notifyListeners();
  }

  String removeSpecialChar(String value) {
    final newValue = value.replaceAll('-', '');
    return newValue;
  }

  void clearAddresses() {
    _addresses = null;
    _addressesFiltered = null;
    _neighborhood = null;
    notifyListeners();
  }
}
