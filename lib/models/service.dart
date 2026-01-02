class Service {
  final String id;
  final String title;
  final String description;
  final String icon;
  final List<String> badges;

  Service({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.badges,
  });

  static List<Service> getServices() {
    return [
      Service(
        id: '1',
        title: 'Bridal & Groom Entrances',
        description:
            'Dramatic entrance effects using cold pyro, fog tunnels, and synchronized lighting for that unforgettable first appearance.',
        icon: 'people',
        badges: ['Cold Pyro', 'Fog Curtains', 'Rose Petals'],
      ),
      Service(
        id: '2',
        title: 'Stage & Dance Effects',
        description:
            'Elevate performances with atmospheric fog, smoke machines, and cold pyro synchronized to music for first dances and shows.',
        icon: 'magic',
        badges: ['Stage Fog', 'Cold Sparks', 'Haze Machines'],
      ),
      Service(
        id: '3',
        title: 'Atmospheric Effects',
        description:
            'Create magical environments with floor fog, low-lying mist, fog markers, and custom atmospheric settings throughout your venue.',
        icon: 'tree',
        badges: ['Floor Fog', 'Fog Markers', 'Low Fog'],
      ),
      Service(
        id: '4',
        title: 'Full Event Management',
        description:
            'Complete coordination of all special effects, from planning and safety checks to execution and cleanup.',
        icon: 'gear',
        badges: ['Planning', 'Safety Checks', 'Coordination'],
      ),
      Service(
        id: '5',
        title: 'Rose Petal & Confetti',
        description:
            'Beautiful rose petal showers, confetti bursts, and floral effects synchronized with your special moments.',
        icon: 'flower',
        badges: ['Rose Petals', 'Confetti Cannons', 'Floral Effects'],
      ),
      Service(
        id: '6',
        title: 'Custom Effect Design',
        description:
            'Tailored special effects designed specifically for your event theme, venue, and personal preferences.',
        icon: 'stars',
        badges: ['Custom Designs', 'Theme Integration', 'Personalization'],
      ),
    ];
  }
}
