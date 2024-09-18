extension StringExtensions on String? {
  bool get isNullOrEmpty {
    return this == null || (this?.isEmpty ?? true);
  }

  bool get isNotNullOrNotEmpty {
    return !isNullOrEmpty;
  }
}

extension ListExtensions on List? {
  bool get isNullOrEmpty {
    return this == null || (this?.isEmpty ?? true);
  }

  bool get isNotNullOrNotEmpty {
    return !isNullOrEmpty;
  }
}
