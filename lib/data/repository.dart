import 'package:contentful/client.dart';
import 'package:tmdbmovies/models/movie.dart';

class Repository {
  Repository(this.contentful);
  final Client contentful;

  Future<MovieContent> findBySlug(String slug) async {
    final collection = await contentful.getEntries<MovieContent>({
      'content_type': 'tmdbModel',
      'fields.title': slug,
      'limit': '1',
      'include': '10',
    }, MovieContent.fromJson);

    return collection.items.first;
  }
}

Future<void> main() async {
  final repo = Repository(
    Client('SPACE_ID', 'API_TOKEN'),
  );
  final movie = await repo.findBySlug('title');
  print('Movie: ${movie.fields.title}');
}
