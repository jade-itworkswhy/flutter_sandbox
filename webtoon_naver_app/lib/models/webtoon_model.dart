// [{"id":"814826","title":"울어 봐, 빌어도 좋고","thumb":"https://image-comic.pstatic.net/webtoon/814826/thumbnail/thumbnail_IMAG21_1de7535f-9088-4f21-8b16-413cb1e66307.jpg"},{"id":"814048","title":"마님이네 미국 시골집 이야기","thumb":"https://image-comic.pstatic.net/webtoon/814048/thumbnail/thumbnail_IMAG21_234ffc80-64de-4765-b059-6888ae0a9fae.jpg"}
class WebtoonModel {
  final String title, thumb, id;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
