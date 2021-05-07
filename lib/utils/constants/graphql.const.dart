const String FETCH_HOMEPAGE = r'''
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

const String FETCH_DETAILS = r'''
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
