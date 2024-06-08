import 'package:api_newsapp/data/news_data.dart';
import 'package:flutter_test/flutter_test.dart';

main(){
  test('test fetch news api', () async{
    var result = await NewsData.getNews();
    expect(result[0].title,
        'Oil edges higher on OPEC+ reassurances but set for third weekly loss - Reuters'    );
  } );
}