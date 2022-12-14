class Videos {
  final int id;
  final String categories;
  final String image;
  final String video;

  Videos({
    required this.id,
    required this.categories,
    required this.image,
    required this.video,
  });
}

List<Videos> videos = <Videos>[
  Videos(
      id: 1,
      categories: 'Funny Video',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyRQ3IEDyVNZRttk9RJH97JIg4rakfIwMyhA&usqp=CAUhttps://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyRQ3IEDyVNZRttk9RJH97JIg4rakfIwMyhA&usqp=CAU',
      video: 'assets/images/krishnaflute.mp4'),
  Videos(
      id: 2,
      categories: 'Motivational Video',
      image:
          'https://cdn.lifehack.org/wp-content/uploads/2016/08/29055841/teamcoaching2.jpg',
      video: 'assets/images/krishnaflute.mp4'),
  Videos(
      id: 3,
      categories: 'Gaming Video',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-QaAQ8z8s7DOk4MFUyxQpACYZ6svabVl5DQ&usqp=CAU',
      video: 'assets/images/krishnaflute.mp4'),
  Videos(
      id: 4,
      categories: 'Animals Vides',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfwvzROSA7A6_8onBw2XtrO-tmHFFdTlFKiQ&usqp=CAU',
      video: 'assets/images/krishnaflute.mp4'),
  Videos(
      id: 4,
      categories: 'Travelling Video',
      image:
          'https://i0.wp.com/competitivegujarat.in/wp-content/uploads/2022/07/Competitive-Post-2022-07-02T081517.539.webp?fit=1024%2C573&ssl=1',
      video: 'assets/images/krishnaflute.mp4'),
  Videos(
      id: 4,
      categories: 'News Video',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo9UKo4MrvSXbbFCI2g_w4g-hGxSb0fRSRaw&usqp=CAU',
      video: 'assets/images/krishnaflute.mp4'),
];
String? videoLink;
String? CateName;
String? git;
