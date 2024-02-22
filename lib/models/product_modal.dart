import 'dart:convert';

class ProductModal {
  final int postId;
  final int price;
  final String name;
  String description;
  final String hashtag;
  final String videoUrl;
  final List<String> images;
  final CountryModal country;
  final UserProfileModal user;
  final ProductSocialInfo socialInfo;

  ProductModal({
    required this.postId,
    required this.price,
    required this.name,
    required this.videoUrl,
    required this.images,
    required this.description,
    required this.hashtag,
    required this.country,
    required this.user,
    required this.socialInfo,
  });

  factory ProductModal.fromJson(Map<String, dynamic> json) {
    String description = '';
    if (json['content'].runtimeType == String && json['content'].isNotEmpty) {
      if (jsonDecode(json['content']).runtimeType == List<dynamic>) {
        jsonDecode(json['content']).forEach((element) {
          if (element['name'] == 'Description') {
            description = element['value'];
          }
        });
      }
    }

    return ProductModal(
      postId: json['post_id'],
      images: (json['images'] as List<dynamic>)
          .skip(0)
          .map((data) => data['image'].toString())
          .toList(),
      videoUrl: json['post_video'],
      price: json['price'],
      name: json['post_title'],
      // description: json['description'],
      description: description,
      hashtag: json['hashtag_titles'],
      country: CountryModal(
        countryName: json['country'] ?? '',
        countryFlag: json['flag'] ?? '',
        countryId: json['country_id'],
      ),
      user: UserProfileModal(
        id: json['user_id'],
        image: json['profile_image'],
        name: json['name'],
      ),
      socialInfo: ProductSocialInfo(
        likes: json['likes'],
        comments: json['comments'],
        shares: json['shares'],
        offers: json['offers'],
        type: json['type'],
      ),
    );
  }
}

// Country Modal
class CountryModal {
  final String countryName;
  final String countryFlag;
  final int countryId;

  CountryModal({
    required this.countryName,
    required this.countryFlag,
    required this.countryId,
  });
}

// User Profile Modal
class UserProfileModal {
  final int id;
  final String name;
  final String image;

  UserProfileModal({
    required this.id,
    required this.name,
    required this.image,
  });
}

class ProductSocialInfo {
  final int likes;
  final int comments;
  final int shares;
  final int offers;
  final String type;

  ProductSocialInfo({
    required this.likes,
    required this.comments,
    required this.shares,
    required this.offers,
    required this.type,
  });
}
