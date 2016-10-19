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
Map nodelist = JSON.decode(request.responseText);
print(nodelist);
print(nodelist["01"]);

nodeShow.children.add(new LIElement()..text = nodelist["01"]);

  } else {
    nodeShow.children.add(new LIElement()
      ..text = 'Request failed, status=${request.status}');
  }
}
