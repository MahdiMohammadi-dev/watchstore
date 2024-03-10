class Property {
  String? property;
  String? value;

  Property({this.property, this.value});

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        property: json['property'] as String?,
        value: json['value'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'property': property,
        'value': value,
      };
}
