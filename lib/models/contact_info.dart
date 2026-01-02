class ContactInfo {
  final String type;
  final String title;
  final String value;
  final String icon;
  final String? url;

  ContactInfo({
    required this.type,
    required this.title,
    required this.value,
    required this.icon,
    this.url,
  });

  static List<ContactInfo> getContactInfo() {
    return [
      ContactInfo(
        type: 'address',
        title: 'Jaygurudev Bridal and Groom Entry',
        value: 'Nai Bazar, Bhaisoni Sarnath, Varanasi\nPin Code: 221007',
        icon: 'geo-alt',
      ),
      ContactInfo(
        type: 'person',
        title: 'Contact Person',
        value: 'Pradeep Maurya\n(Er. RB Maurya)',
        icon: 'person',
      ),
      ContactInfo(
        type: 'phone',
        title: 'Phone Number',
        value: '7651972973',
        icon: 'telephone',
        url: 'tel:+917651972973',
      ),
      ContactInfo(
        type: 'whatsapp',
        title: 'WhatsApp',
        value: '7651972973',
        icon: 'whatsapp',
        url: 'https://wa.me/917651972973',
      ),
    ];
  }
}
