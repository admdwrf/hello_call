import 'dart:html';
import 'dart:convert';

var nodeShow;

void main() {
  querySelector('#getWords').onClick.listen(makeRequest);
  nodeShow = querySelector('#nodeShow');
}

void makeRequest(Event e) {
  var path = 'http://127.0.0.1:9090/details';
  var httpRequest = new HttpRequest();
  httpRequest
    ..open('GET', path)
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))
    ..send('');
}

requestComplete(HttpRequest request) {
  if (request.status == 200) {
//    List<String> nodelist = JSON.decode(request.responseText);
Map nodelist = JSON.decode(request.responseText);
    for (int i = 0; i < nodelist.length; i++) {
      nodeShow.children.add(new LIElement()..text = nodelist[i]);
    }
  } else {
    nodeShow.children.add(new LIElement()
      ..text = 'Request failed, status=${request.status}');
  }
}
