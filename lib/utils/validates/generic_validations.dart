import '/utils/extensions/string_extentions.dart';

class GenericValidations {
  GenericValidations._();

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nome é obrigatório';
    }
    if (value.length < 3) {
      return 'Nome deve ter pelo menos 3 caracteres.';
    }

    return null;
  }

  static String? isDouble(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }

    final regExp = RegExp(r'^\d+(\,\d+)?$');
    if (!regExp.hasMatch(value.trim())) {
      return 'Este campo deve ser um número.';
    }

    return null;
  }

  static String? notEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }
    if (value.length < 3) {
      return 'Este campo deve ter pelo menos 3 caracteres.';
    }

    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Telefone é obrigatório';
    }

    final numbers = value.onlyDigits();
    if ((numbers.length != 10 || numbers[2] == '9') &&
        (numbers.length != 11 || numbers[2] != '9')) {
      return 'Telefone inválido.';
    }

    return null;
  }

  static String? brDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Data de nascimento é obrigatória.';
    }

    if (!value.isPtBRDate()) {
      return 'Data de nascimento inválida.';
    }

    return null;
  }

  static String? enumField(Enum? value) {
    if (value == null) {
      return 'Este campo é obrigatório.';
    }

    return null;
  }
}
