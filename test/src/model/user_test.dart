import 'package:test/test.dart';
import 'package:unsplash_client/src/model/model.dart';

void main() {
  group('fromJson', () {
    test('should parse user', () {
      final user = User.fromJson(_userJson);
      expect(user, isA<User>());
    });

    test('should parse user with null values', () {
      final user = User.fromJson(_userJson);
      expect(user, isA<User>());
      expect(user.email, isNull);
      expect(user.uploadsRemaining, isNull);
      expect(user.portfolioUrl, isNull);
      expect(user.bio, isNull);
      expect(user.location, isNull);
    });

    test('should parse user with null links values', () {
      final user = User.fromJson(_userJsonWithNullLinksValues());
      expect(user, isA<User>());
      expect(user.links, isA<UserLinks>());
      expect(user.links.self, isNull);
      expect(user.links.html, isNull);
      expect(user.links.photos, isNull);
      expect(user.links.likes, isNull);
      expect(user.links.portfolio, isNull);
      expect(user.links.following, isNull);
      expect(user.links.followers, isNull);
    });
  });
}

final _userJson = {
  'id': '3SD7qaXHJ0w',
  'updated_at': '2021-04-09T23:05:00-04:00',
  'username': 'lucreative',
  'name': 'Luigi Estuye, LUCREATIVE',
  'first_name': 'Luigi Estuye,',
  'last_name': 'LUCREATIVE',
  'email': null,
  'uploads_remaining': null,
  'portfolio_url': null,
  'bio': null,
  'location': null,
  'total_likes': 605,
  'total_photos': 141,
  'total_collections': 13,
  'followed_by_user': false,
  'follower_count': 138,
  'following_count': 19,
  'downloads': 99247,
  'instagram_username': 'lucreative__',
  'twitter_username': 'lucreative__',
  'badge': null,
  'profile_image': {
    'small':
        'https://images.unsplash.com/profile-1598807171150-83895aec39eaimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32',
    'medium':
        'https://images.unsplash.com/profile-1598807171150-83895aec39eaimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64',
    'large':
        'https://images.unsplash.com/profile-1598807171150-83895aec39eaimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128'
  },
  'links': {
    'self': 'https://api.unsplash.com/users/lucreative',
    'html': 'https://unsplash.com/@lucreative',
    'photos': 'https://api.unsplash.com/users/lucreative/photos',
    'likes': 'https://api.unsplash.com/users/lucreative/likes',
    'portfolio': 'https://api.unsplash.com/users/lucreative/portfolio',
    'following': 'https://api.unsplash.com/users/lucreative/following',
    'followers': 'https://api.unsplash.com/users/lucreative/followers'
  }
};

Map<String, dynamic> _userJsonWithNullLinksValues() {
  return _userJson.map((key, value) {
    if (key == 'links') {
      return MapEntry(key, {
        'self': null,
        'html': null,
        'photos': null,
        'likes': null,
        'portfolio': null,
        'following': null,
        'followers': null,
      });
    }
    return MapEntry(key, value);
  });
}
