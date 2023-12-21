final class UpdateModel<T> {
  UpdateModel({
    this.propName,
    this.value,
  });

  UpdateModel.fromJson(Map<String, dynamic> json) {
    propName = json['propName'] as T?;
    value = json['value'] as String?;
  }

  T? propName;
  String? value;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['propName'] = propName;
    data['value'] = value;
    return data;
  }

  @override
  String toString() {
    return 'UpdateModel(propName: $propName, value: $value)';
  }
}
