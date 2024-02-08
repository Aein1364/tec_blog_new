class NewArticleModel {
  late String id;
  late String title;
  late String image;
  late String catId;
  late String catName;
  late String author;
  late String view;
  late String status;
  late bool isFavorite;
  late String createdAt;
  NewArticleModel();
  NewArticleModel.fromJson(Map<String, dynamic> element) {
    id = element['id'] ?? 'null';
    title = element['title'] ?? 'null';
    image = element['image'] != null
        ? 'https://techblog.sasansafari.com${element['image']}'
        : 'https://www.uptownprinters.ca/assets/no_image_placeholder.png';
    catId = element['cat_id'] ?? 'null';
    catName = element['cat_name'] ?? 'null';
    author = element['author'] ?? 'null';
    view = element['view'] ?? 'null';
    status = element['status'] ?? 'null';
    isFavorite = element['isFavorite'] ?? false;
    createdAt = element['created_at'] ?? 'null';
  }
}

// "id": "16",
//         "title": "اطلاعات جدیدی از بازی Assassin's Creed Mirage فاش شد",
//         "image": "/Techblog/assets/upload/images/article/20220904181457.jpg",
//         "cat_id": "3",
//         "cat_name": "اخبار بازی",
//         "author": "محسن چگینی",
//         "view": "3824",
//         "status": "1",
//         "isFavorite": false,
//         "created_at": "۱۴۰۱/۶/۱۲"