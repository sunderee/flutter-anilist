const String fetchHomepageQuery = r'''
query(
    $page: Int!,
    $perPage: Int!
) {
    Page(page: $page, perPage: $perPage) {
        media(sort: SCORE) {
            id
            title { romaji english }
            description
            coverImage { large }
        }
    }
}''';

const String fetchDetailsQuery = r'''
query($id: Int!) {
    Media(id: $id) {
        title { romaji english }
        description
        coverImage { large }

        genres

        type
        format

        episodes
        duration
    }
}''';
