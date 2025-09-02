/*{
    "name": "Mohamed Fahmy",
    "details": "Home details",
    "phone": "01010700700",
    "city": "samanud"
}*/
class AddressRequest {
  const AddressRequest({
    this.name,
    this.details,
    this.phone,
    this.city,
  });

  final String? name;
  final String? details;
  final String? phone;
  final String? city;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'details': details,
      'phone': phone,
      'city': city,
    };
  }
}

