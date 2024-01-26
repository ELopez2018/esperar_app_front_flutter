String get apiHost {
  bool idProd = const bool.fromEnvironment("dart.vm.product");
  if (idProd) {
    
    return "https://";
  }

  return "http://192.168.0.122:8080/api/v1";
}
