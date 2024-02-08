class GetArticleInfoModel {
  late InfoArticleInfoModel info;
  late bool isFavorite;
  late List<RelatedArticleInfoModel> relatedList;
  late List<TagsArticleInfoModel> tagsList;
  GetArticleInfoModel();
  GetArticleInfoModel.fromJson(Map<String, dynamic> element) {
    info = InfoArticleInfoModel.fromJson(element['info']);
    isFavorite = element['isFavorite'];
    relatedList = [];
    for (var item in element['related']) {
      relatedList.add(RelatedArticleInfoModel.fromJson(item));
    }
    tagsList = [];
    for (var item in element['tags']) {
      tagsList.add(TagsArticleInfoModel.fromJson(item));
    }
  }
}

class RelatedArticleInfoModel {
  late String id;
  late String title;
  late String image;
  late String catId;
  late String catName;
  late String author;
  late String view;
  late String status;
  late String createdAt;

  RelatedArticleInfoModel();

  RelatedArticleInfoModel.fromJson(Map<String, dynamic> element) {
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

class InfoArticleInfoModel {
  late String id;
  late String title;
  late String content;
  late String image;
  late String catId;
  late String catName;
  late String author;
  late String view;
  late String status;
  late String createdAt;

  InfoArticleInfoModel();

  InfoArticleInfoModel.fromJson(Map<String, dynamic> element) {
    id = element['id'] ?? 'null';
    title = element['title'] ?? 'null';
    content = element['content'] ?? 'null';
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

class TagsArticleInfoModel {
  late String id;
  late String title;

  TagsArticleInfoModel();

  TagsArticleInfoModel.fromJson(Map<String, dynamic> element) {
    id = element['id'] ?? 'null';
    title = element['title'] ?? 'null';
  }
}

 
// {
//    "info": {
//         "id": "2",
//         "title": "بررسی لپ‌تاپ هواوی میت‌بوک D15 مدل ۲۰۲۱",
//         "content": "هواوی سری جدید لپ‌تاپ‌های اقتصادی میت‌بوک دی را وارد بازار کرده که اگرچه از نظر ظاهری شباهت زیادی با نسل قبلی دارند اما با پردازنده نسل یازدهم اینتل، عملکرد فوق‌العاده‌ای را ارائه می‌دهند. میت‌بوک D15 مدل ۲۰۲۱ اولین لپ‌تاپ از این خانواده است که می‌تواند یکی از بهترین اولترابوک‌های ۱۵ اینچی بازار لقب بگیرد. در این ویدیو ما به بررسی این لپ تاپ تازه‌ وارد پرداختیم و از ویژگی‌های مثبت و منفی آن برایتان گفتیم. همچنین به این سوال پاسخ دادیم که آیا هواوی میت‌بوک D15 مدل ۲۰۲۱ به درد تجربه بازی‌های ویدیویی می‌خورد یا نه؟ با ویجیاتو همراه باشید.",
//         "image": "/Techblog/assets/upload/images/article/matebook.jpg",
//         "cat_id": "2",
//         "cat_name": "بررسی محصول",
//         "author": "پوریا میرخباز",
//         "view": "357",
//         "status": "1",
//         "created_at": "۱۴۰۱/۲/۱۶"
//     },
//     "isFavorite": false,
//     "related": [
//         {
//             "id": "2",
//             "title": "بررسی لپ‌تاپ هواوی میت‌بوک D15 مدل ۲۰۲۱",
//             "image": "/Techblog/assets/upload/images/article/matebook.jpg",
//             "cat_id": "2",
//             "cat_name": "بررسی محصول",
//             "author": "پوریا میرخباز",
//             "view": "357",
//             "status": "1",
//             "created_at": "۱۴۰۱/۲/۱۶"
//         },
//         {
//             "id": "9",
//             "title": "سیستم مورد نیاز بازی Resident Evil 2 تغییر کرد",
//             "image": "/Techblog/assets/upload/images/article/20220707215623.jpg",
//             "cat_id": "2",
//             "cat_name": "بررسی محصول",
//             "author": "ساسان صفری",
//             "view": "727",
//             "status": "1",
//             "created_at": "۱۴۰۱/۲/۳۱"
//         },
//         {
//             "id": "54",
//             "title": "s",
//             "image": "/Techblog/assets/upload/images/article/20230116131219.jpeg",
//             "cat_id": "2",
//             "cat_name": "بررسی محصول",
//             "author": "",
//             "view": "7",
//             "status": "0",
//             "created_at": "۱۴۰۱/۱۰/۲۶"
//         },
//         {
//             "id": "55",
//             "title": "s",
//             "image": "/Techblog/assets/upload/images/article/20230116131241.jpeg",
//             "cat_id": "2",
//             "cat_name": "بررسی محصول",
//             "author": "",
//             "view": "4",
//             "status": "0",
//             "created_at": "۱۴۰۱/۱۰/۲۶"
//         },
//         {
//             "id": "58",
//             "title": "جواد عربی کیست؟",
//             "image": "/Techblog/assets/upload/images/article/20230129175523.jpg",
//             "cat_id": "2",
//             "cat_name": "بررسی محصول",
//             "author": null,
//             "view": "7",
//             "status": "0",
//             "created_at": "۱۴۰۱/۱۱/۹"
//         },
//         {
//             "id": "64",
//             "title": "fa",
//             "image": "/Techblog/assets/upload/images/article/20230221155603.jpg",
//             "cat_id": "2",
//             "cat_name": "بررسی محصول",
//             "author": null,
//             "view": "2",
//             "status": "0",
//             "created_at": "۱۴۰۱/۱۲/۲"
//         },
//         {
//             "id": "102",
//             "title": "حذف قفل دنوو از نسخه استیم بازی Resident Evil Village",
//             "image": "/Techblog/assets/upload/images/article/20230411144339.jpg",
//             "cat_id": "2",
//             "cat_name": "بررسی محصول",
//             "author": null,
//             "view": "5",
//             "status": "0",
//             "created_at": "۱۴۰۲/۱/۲۲"
//         },
//         {
//             "id": "112",
//             "title": "اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن",
//             "image": "/Techblog/assets/upload/images/article/20230510204928.jpeg",
//             "cat_id": "2",
//             "cat_name": "بررسی محصول",
//             "author": "''",
//             "view": "3",
//             "status": "0",
//             "created_at": "۱۴۰۲/۲/۲۱"
//         },
//         {
//             "id": "165",
//             "title": "pyfpyo",
//             "image": "/Techblog/assets/upload/images/article/20231001115514.jpg",
//             "cat_id": "2",
//             "cat_name": "بررسی محصول",
//             "author": "''",
//             "view": "1",
//             "status": "0",
//             "created_at": "۱۴۰۲/۷/۹"
//         },
//         {
//             "id": "166",
//             "title": "pyfpyo",
//             "image": "/Techblog/assets/upload/images/article/20231001115531.jpg",
//             "cat_id": "2",
//             "cat_name": "بررسی محصول",
//             "author": "''",
//             "view": "0",
//             "status": "0",
//             "created_at": "۱۴۰۲/۷/۹"
//         },
//         {
//             "id": "189",
//             "title": "y",
//             "image": "/Techblog/assets/upload/images/article/20231001125910.jpg",
//             "cat_id": "2",
//             "cat_name": "بررسی محصول",
//             "author": "''",
//             "view": "0",
//             "status": "0",
//             "created_at": "۱۴۰۲/۷/۹"
//         },
//         {
//             "id": "258",
//             "title": "کاکو هادی گُلو ????",
//             "image": "/Techblog/assets/upload/images/article/20231116122827.jpg",
//             "cat_id": "2",
//             "cat_name": "بررسی محصول",
//             "author": "''",
//             "view": "6",
//             "status": "0",
//             "created_at": "۱۴۰۲/۸/۲۵"
//         },
//         {
//             "id": "271",
//             "title": "جلو قاضی ملق بازی؟ :ی",
//             "image": "/Techblog/assets/upload/images/article/20231202061214.jpg",
//             "cat_id": "2",
//             "cat_name": "بررسی محصول",
//             "author": "''",
//             "view": "13",
//             "status": "0",
//             "created_at": "۱۴۰۲/۹/۱۱"
//         }
//     ],
//     "tags": [
//         {
//             "id": "2",
//             "title": "اخبار"
//         }
//     ]
// }