const String FETCH_HOMEPAGE = r'''
query(
    $page: Int!,
    $perPage: Int!
) {
    Page(page: $page, perPage: $perPage) {
        media(sort: SCORE) {
            id
            title {
                romaji
                english
            }
            description
            coverImage { large }
        }
    }
}''';
