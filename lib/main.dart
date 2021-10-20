import 'package:flutter/material.dart';
import 'package:xml2json/xml2json.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget {
  const HttpApp({Key? key}) : super(key: key);

  @override
  _HttpAppState createState() => _HttpAppState();
}

class _HttpAppState extends State<HttpApp> {

  String result = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Example'),
      ),
      body: Container(
        child: Center(
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getJSONData();
        },
        child: Icon(Icons.search),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = 'https://unipass.customs.go.kr:38010/ext/rest/cargCsclPrgsInfoQry/retrieveCargCsclPrgsInfo?crkyCn=s200v271w100q115q010v000q0&hblNo=FEZS2110069&blYy=2021';
    var response = await http.get(Uri.parse(url));

    final Xml2Json xml2json = Xml2Json(); //객체 생성
    xml2json.parse(response.body); // 간단한 xml문자열로 파싱
    var jsonString = xml2json.toParker(); // Parker를 사용하여 Json으로 변환
    return response.body;


    }
  }

