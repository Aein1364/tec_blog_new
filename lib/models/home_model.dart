class HomeModel {
  late Poster poster;
  late List<TopVisited> topVisited;
  late List<TopPodcasts> topPodcasts;
  late List<Tags> tags;
  late List<Categories> categories;
  HomeModel();
  HomeModel.fromJson(Map<String, dynamic> element) {
    poster = Poster.fromJson(element['poster']);
    topVisited = [];
    if (element['top_visited'] != null) {
      element['top_visited'].forEach((element) {
        topVisited.add(TopVisited.fromJson(element));
      });
    }
    topPodcasts = [];
    if (element['top_podcasts'] != null) {
      element['top_podcasts'].forEach((element) {
        topPodcasts.add(TopPodcasts.fromJson(element));
      });
    }
    tags = [];
    if (element['tags'] != null) {
      element['tags'].forEach((element) {
        tags.add(Tags.fromJson(element));
      });
    }
    categories = [];
    if (element['categories'] != null) {
      element['categories'].forEach((element) {
        categories.add(Categories.fromJson(element));
      });
    }
  }
}

class Poster {
  late String id;
  late String title;
  late String image;
  Poster();
  Poster.fromJson(Map<String, dynamic> element) {
    id = element['id'] ?? 'null';
    title = element['title'] ?? 'null';
    image = element['image'] != null
        ? 'https://techblog.sasansafari.com${element['image']}'
        : 'https://www.uptownprinters.ca/assets/no_image_placeholder.png';
  }
}

class TopVisited {
  late String id;
  late String title;
  late String image;
  late String catId;
  late String catName;
  late String author;
  late String view;
  late String status;
  late String createdAt;
  TopVisited();
  TopVisited.fromJson(Map<String, dynamic> element) {
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
    createdAt = element['created_at'] ?? 'null';
  }
}

class TopPodcasts {
  late String id;
  late String title;
  late String poster;
  late String catName;
  late String author;
  late String view;
  late String status;
  late String createdAt;
  TopPodcasts();
  TopPodcasts.fromJson(Map<String, dynamic> element) {
    id = element['id'] ?? 'null';
    title = element['title'] ?? 'null';
    poster = element['poster'] != "''"
        ? 'https://techblog.sasansafari.com${element['poster']}'
        : 'https://www.uptownprinters.ca/assets/no_image_placeholder.png';
    catName = element['cat_name'] ?? 'null';
    author = element['author'] ?? 'null';
    view = element['view'] ?? 'null';
    status = element['status'] ?? 'null';
    createdAt = element['created_at'] ?? 'null';
  }
}

class Tags {
  late String id;
  late String title;
  Tags();
  Tags.fromJson(Map<String, dynamic> element) {
    id = element['id'] ?? 'null';
    title = element['title'] ?? 'null';
  }
}

class Categories {
  late String id;
  late String title;
  Categories();
  Categories.fromJson(Map<String, dynamic> element) {
    id = element['id'] ?? 'null';
    title = element['title'] ?? 'null';
  }
}

// {
//   "poster": {
//         "id": "16",
//         "title": "اطلاعات جدیدی از بازی Assassin's Creed Mirage فاش شد",
//         "image": "/Techblog/assets/upload/images/article/20220904181457.jpg"
//     },
//     "top_visited": [
//         {
//             "id": "1",
//             "title": "۵ بازی مشابه Assassin’s Creed Valhalla که باید بازی کنید",
//             "image": "/Techblog/assets/upload/images/article/valhalla.jpg",
//             "cat_id": "1",
//             "cat_name": "اخبار و مقالات",
//             "author": "بهرام امینی",
//             "view": "4164",
//             "status": "1",
//             "created_at": "۱۴۰۱/۲/۱۶"
//         },
//         {
//             "id": "16",
//             "title": "اطلاعات جدیدی از بازی Assassin's Creed Mirage فاش شد",
//             "image": "/Techblog/assets/upload/images/article/20220904181457.jpg",
//             "cat_id": "3",
//             "cat_name": "اخبار بازی",
//             "author": "محسن چگینی",
//             "view": "3816",
//             "status": "1",
//             "created_at": "۱۴۰۱/۶/۱۲"
//         },
//         {
//             "id": "14",
//             "title": "وجود مرحله انحصاری در نسخه پلی استیشن بازی Hogwarts Legacy",
//             "image": "/Techblog/assets/upload/images/article/20220826174831.jpg",
//             "cat_id": "3",
//             "cat_name": "اخبار بازی",
//             "author": "بهرام امینی",
//             "view": "1607",
//             "status": "1",
//             "created_at": "۱۴۰۱/۶/۳"
//         },
//         {
//             "id": "15",
//             "title": "وجود قابلیت های فراوان در The Last of Us Part 1 برای گیمرهای دار",
//             "image": "/Techblog/assets/upload/images/article/20220828173549.jpg",
//             "cat_id": "3",
//             "cat_name": "اخبار بازی",
//             "author": "ساسان صفری",
//             "view": "1589",
//             "status": "1",
//             "created_at": "۱۴۰۱/۶/۶"
//         },
//         {
//             "id": "13",
//             "title": "توسعه The Lords of the Fallen روی آنریل انجین 5",
//             "image": "/Techblog/assets/upload/images/article/20220826174937.jpg",
//             "cat_id": "3",
//             "cat_name": "اخبار بازی",
//             "author": "سینا جعفری",
//             "view": "1322",
//             "status": "1",
//             "created_at": "۱۴۰۱/۵/۲۵"
//         },
//         {
//             "id": "12",
//             "title": "سریال خاندان اژدها در اروپا برای HBO و HBO Max رکوردشکنی کرد",
//             "image": "/Techblog/assets/upload/images/article/20220826175907.jpg",
//             "cat_id": "6",
//             "cat_name": "فیلم و سریال",
//             "author": "پوریا میرخباز",
//             "view": "727",
//             "status": "1",
//             "created_at": "۱۴۰۱/۵/۱۶"
//         },
//         {
//             "id": "9",
//             "title": "سیستم مورد نیاز بازی Resident Evil 2 تغییر کرد",
//             "image": "/Techblog/assets/upload/images/article/20220707215623.jpg",
//             "cat_id": "2",
//             "cat_name": "بررسی محصول",
//             "author": "ساسان صفری",
//             "view": "726",
//             "status": "1",
//             "created_at": "۱۴۰۱/۲/۳۱"
//         },
//         {
//             "id": "10",
//             "title": "داستان فیلم Gran Turismo بسیار هیجان‌انگیز خواهد بود!",
//             "image": "/Techblog/assets/upload/images/article/20220707215854.jpg",
//             "cat_id": "1",
//             "cat_name": "اخبار و مقالات",
//             "author": "بهرام امینی",
//             "view": "726",
//             "status": "1",
//             "created_at": "۱۴۰۱/۲/۳۱"
//         },
//         {
//             "id": "8",
//             "title": "آیا آیفون 7 به روزرسانی iOS 16 را دریافت می‌کند؟",
//             "image": "/Techblog/assets/upload/images/article/20220707215340.jpg",
//             "cat_id": "1",
//             "cat_name": "اخبار و مقالات",
//             "author": "پوریا میرخباز",
//             "view": "712",
//             "status": "1",
//             "created_at": "۱۴۰۱/۲/۳۰"
//         },
//         {
//             "id": "3",
//             "title": "Call of Duty: Mobile بیش از ۶۵۰ میلیون بار دانلود شده است",
//             "image": "/Techblog/assets/upload/images/article/20220514212832.webp",
//             "cat_id": "1",
//             "cat_name": "اخبار و مقالات",
//             "author": "ساسان صفری",
//             "view": "601",
//             "status": "1",
//             "created_at": "۱۴۰۱/۲/۲۴"
//         }
//     ],
//     "top_podcasts": [
//         {
//             "id": "33",
//             "title": "رادیوگیک ۱۴۳ – عاشقتم",
//             "poster": "''",
//             "cat_name": "اخبار و مقالات",
//             "author": "ساسان صفری",
//             "view": "31",
//             "status": "0",
//             "created_at": "۱۴۰۲/۶/۲۷"
//         },
//         {
//             "id": "32",
//             "title": "تست۳",
//             "poster": "''",
//             "cat_name": "آموزشی",
//             "author": null,
//             "view": "36",
//             "status": "0",
//             "created_at": "۱۴۰۲/۱/۲۸"
//         },
//         {
//             "id": "31",
//             "title": "تست ۲",
//             "poster": "''",
//             "cat_name": "آموزشی",
//             "author": null,
//             "view": "17",
//             "status": "0",
//             "created_at": "۱۴۰۲/۱/۲۸"
//         },
//         {
//             "id": "30",
//             "title": "تست",
//             "poster": "''",
//             "cat_name": "آموزشی",
//             "author": null,
//             "view": "22",
//             "status": "0",
//             "created_at": "۱۴۰۲/۱/۲۸"
//         },
//         {
//             "id": "29",
//             "title": "رادیوگیگ-عاشقتم",
//             "poster": "/Techblog/assets/upload/images/podcast/images/20221205181800.jpg",
//             "cat_name": "اخبار و مقالات",
//             "author": "ساسان صفری",
//             "view": "185",
//             "status": "0",
//             "created_at": "۱۴۰۲/۱/۱۷"
//         },
//         {
//             "id": "28",
//             "title": "رادیوگیگ-عاشقتم",
//             "poster": "/Techblog/assets/upload/images/podcast/images/20221205181800.jpg",
//             "cat_name": "اخبار و مقالات",
//             "author": "ساسان صفری",
//             "view": "153",
//             "status": "0",
//             "created_at": "۱۴۰۲/۱/۱۵"
//         },
//         {
//             "id": "10",
//             "title": "تکچی",
//             "poster": "/Techblog/assets/upload/images/podcast/images/20221205182306.jpg",
//             "cat_name": "اخبار و مقالات",
//             "author": "سینا جعفری",
//             "view": "1452",
//             "status": "0",
//             "created_at": "۱۴۰۱/۹/۱۴"
//         },
//         {
//             "id": "9",
//             "title": "رادیو گیک",
//             "poster": "/Techblog/assets/upload/images/podcast/images/20221205181800.jpg",
//             "cat_name": "اخبار و مقالات",
//             "author": "پوریا میرخباز",
//             "view": "1826",
//             "status": "0",
//             "created_at": "۱۴۰۱/۹/۱۴"
//         },
//         {
//             "id": "2",
//             "title": "پادکست خانه ترید",
//             "poster": "/Techblog/assets/upload/images/podcast/images/20221201163156.jpg",
//             "cat_name": "بررسی محصول",
//             "author": "ساسان صفری",
//             "view": "953",
//             "status": "1",
//             "created_at": "۱۴۰۱/۲/۱۶"
//         }
//     ],
//     "tags": [
//         {
//             "id": "7",
//             "title": "آیفون"
//         },
//         {
//             "id": "6",
//             "title": "اخبار فیلم و سریال"
//         },
//         {
//             "id": "5",
//             "title": "بررسی محصول"
//         },
//         {
//             "id": "4",
//             "title": "آموزشی"
//         },
//         {
//             "id": "3",
//             "title": "بازی"
//         },
//         {
//             "id": "2",
//             "title": "اخبار"
//         },
//         {
//             "id": "1",
//             "title": "مقاله"
//         }
//     ],
//     "categories": [
//         {
//             "id": "6",
//             "title": "فیلم و سریال"
//         },
//         {
//             "id": "5",
//             "title": "آموزشی"
//         },
//         {
//             "id": "4",
//             "title": "سخت افزار"
//         },
//         {
//             "id": "3",
//             "title": "اخبار بازی"
//         },
//         {
//             "id": "2",
//             "title": "بررسی محصول"
//         },
//         {
//             "id": "1",
//             "title": "اخبار و مقالات"
//         }
//     ]
// }