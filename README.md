## Flutter
### 장고 API 서버를 활용한 핫딜 크롤링 View 애플리케이션
장고 백엔드 API 서버 : [Click](https://github.com/ceool/Python/tree/master/crawler%20%2B%20telegram_bot%20(with%20django))

![KakaoTalk_20210513_011432124](https://user-images.githubusercontent.com/62891711/118009239-dbd49b80-b388-11eb-93a3-276a5a48645d.png)


#### StatefulWidget 기반
```
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
```

<br>

<br>

![KakaoTalk_20210513_011432124_01](https://user-images.githubusercontent.com/62891711/118009240-dd05c880-b388-11eb-9fba-4b887ad6e253.png)

#### 상단바 끌어당기기로 새로고침 구현
```
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
    ...
    
      home: Scaffold(
        appBar: AppBar(title: Text("hotdeal")),
        body: RefreshIndicator(
          key: refreshKey,
          
          ...
          
          onRefresh: refreshList,
        ),
      ),
    );
  }
```

