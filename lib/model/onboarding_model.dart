class OnboardingModel {
  final String title;
  final String description;
  final String image;

  OnboardingModel(
      {required this.title, required this.description, required this.image});

  static final List<OnboardingModel> onboardingList = [
    OnboardingModel(
      title: 'Welcome',
      description: 'Welcome to our app, let’s get started!',
      image:
          'https://buildfire.com/wp-content/themes/buildfire/assets/images/vertical-ecommerce.png',
    ),
    OnboardingModel(
      title: 'Discover',
      description: 'Discover new features and functionalities.',
      image:
          'https://buildfire.com/wp-content/themes/buildfire/assets/images/vertical-ecommerce.png',
    ),
    OnboardingModel(
      title: 'Get Started',
      description: 'Get started with our awesome app today!',
      image:
          'https://buildfire.com/wp-content/themes/buildfire/assets/images/vertical-ecommerce.png',
    ),
  ];
}

///C:\projct\4348380.jpg
