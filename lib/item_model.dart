// ignore_for_file: public_member_api_docs, sort_constructors_first
class Item {
  final String sangho;
  final String? carnumber;
  final String? memo;
  final int? price;
  final DateTime? date;
  Item({
    required this.sangho,
    this.carnumber,
    this.memo,
    this.price,
    this.date,
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    final properties = map['properties'] as Map<String, dynamic>;
    final dateStr = properties['date']?['date']?['start'];
    return Item(
      sangho: properties['sangho']?['title']?[0]?['plain_text'] ?? '?',
      carnumber:
          properties['carnumber']?['rich_text']?[0]?['plain_text'] ?? '?',
      memo: properties['memo']?['rich_text']?[0]?['plain_text'] ?? '?',
      price: properties['price']?['number'] ?? 0,
      date: dateStr != null ? DateTime.parse(dateStr) : DateTime.now(),
    );
  }
}
