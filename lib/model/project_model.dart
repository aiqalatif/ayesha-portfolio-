class Project {
  final String name;
  final String description;
  final String image;
  final String link;
  Project(this.name, this.description, this.image, this.link);
}

List<Project> projectList = [
  Project(
     'Law Consultation App',
    'This application helps users to get legal advice and consultations easily. It features lawyer listings, booking appointments, and a chat system — all built with Flutter and Firebase integration.',
    'assets/images/lawapp.jpeg',
    'https://github.com/aiqalatif/law_app',
  ),
  Project(
    'Billing Check App',
    'A smart utility app designed to check electricity, gas, and other utility bills in one place. Built with a clean UI and real-time data fetching capability.',
    
    'assets/images/powerTracker.png',
    'https://play.google.com/store/apps/details?id=com.billingcheck.app&hl=en',
  ),
  Project(
      'Mini Location Upload App',
    'A Flutter-Firebase based app developed for WASA Pakistan, allowing field workers to log in via email and upload their live location and data through a backend API for monitoring and reporting purposes',
    
      'assets/images/wasapp.png',
      'https://github.com/aiqalatif/andriod_app'),
  Project(
       'Multi-Food Vendor App (PPP)',
    'A large-scale food delivery application with multiple vendor support, online payments, category management, and order tracking. Developed using Flutter, Firebase, and Node.js backend.',
      'assets/images/multifood.png',
      'https://github.com/aiqalatif/restuant-qunatum'),
  Project(
       'VPN App with Google Ads & Stripe',
  'An advanced Flutter VPN app that includes multiple country options for connection, clean animations, and modern UI. Integrated with Google Ads for monetization, Stripe for in-app purchases, and supports social login (Google/Facebook). The app provides smooth connection management and user subscription tracking.',
      'assets/images/vpnapp.png',
      'https://github.com/aiqalatif/vpn_app'),
 
  
 
 
];
