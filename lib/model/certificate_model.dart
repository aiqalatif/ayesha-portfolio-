class CertificateModel {
  final String name;
  final String organization;
  final String date;
  final String skills;
  final String credential;

  CertificateModel({
    required this.name,
    required this.organization,
    required this.date,
    required this.skills,
    required this.credential,
  });
}

List<CertificateModel> certificateList = [
  CertificateModel(
    name: 'Getting started with Flutter Development',
    organization: 'Coursera',
    date: 'AUG 2023',
    skills: 'Flutter . Dart',
    credential:  'https://udemy-certificate.s3.amazonaws.com/image/UC-fa61a806-37c9-48cd-abc3-7e25fb4d7cb0.jpg',
  ),
 
  CertificateModel(
    name: 'Complete Dart Learning',
    organization: 'Udemy',
    date: 'JUN 2023',
    skills: 'Flutter . Dart . Programming',
    credential:  'https://udemy-certificate.s3.amazonaws.com/image/UC-fa61a806-37c9-48cd-abc3-7e25fb4d7cb0.jpg',
  ),
  








];
