import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
//import 'package:url_launcher/url_launcher.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  Widget appbarTit = const Text('네이버쇼핑');
  Icon appbarSearchIcon = const Icon(Icons.search);
  @override
  void initState() {
    super.initState();
    urlController.addListener(() => setState(() {}));
  }

  InAppWebViewController? webViewController;
  PullToRefreshController? refreshController;
  late var url;
  var initialUrl = "https://shopping.naver.com/home";
  double progress = 0;
  var urlController = TextEditingController();
  var isloading = false;

  final InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      cacheEnabled: true,
      clearCache: true,
      transparentBackground: true,
      useShouldOverrideUrlLoading: true,
      javaScriptEnabled: true,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
      mixedContentMode: AndroidMixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
    ),
    ios: IOSInAppWebViewOptions(
      useOnNavigationResponse: true,
      scrollsToTop: false,
      allowsInlineMediaPlayback: true,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final controller = webViewController;
        if (controller != null) {
          if (await controller.canGoBack()) {
            controller.goBack();
            return false;
          }
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: InkWell(
            onTap: () {
              webViewController!.loadUrl(
                urlRequest: URLRequest(
                  url: Uri.parse(initialUrl),
                ),
              );
            },
            splashColor: Colors.transparent,
            child: appbarTit,
          ),
          actions: [
            IconButton(
              splashColor: Colors.transparent,
              icon: appbarSearchIcon,
              onPressed: () {
                if (appbarSearchIcon.icon == Icons.search) {
                  appbarTit = TextField(
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    autofocus: true,
                    cursorColor: Colors.white,
                    //onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    //onTapOutside: (event) => appbarTit = const Text('네이버쇼핑'),
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    onSubmitted: (value) {
                      url = Uri.parse(value);
                      if (url.scheme.isEmpty) {
                        url = Uri.parse(
                            "msearch.shopping.naver.com/search/all?&query=$value");
                        appbarTit = const Text('네이버쇼핑');
                        appbarSearchIcon = const Icon(Icons.search);
                        urlController.clear();
                      }
                      webViewController!.loadUrl(
                        urlRequest: URLRequest(url: url),
                      );
                    },
                    controller: urlController,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 0.0),
                      border: InputBorder.none,
                      hintText: "네이버쇼핑검색ddd",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      //focusColor: Colors.transparent,
                      //hoverColor: Colors.transparent,
                      //filled: true,
                      //fillColor: Colors.transparent,
                    ),
                  );
                  appbarSearchIcon = const Icon(Icons.cancel);
                  setState(() {});
                } else {
                  appbarTit = const Text('네이버쇼핑');
                  appbarSearchIcon = const Icon(Icons.search);
                  urlController.clear();
                  setState(() {});
                }
              },
            ),
          ],
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                appbarSearchIcon = const Icon(Icons.search);
                urlController.clear();
                appbarTit = const Text('네이버쇼핑');
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.device_unknown,
              ),
            );
          }),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                colors: [Colors.amber, Colors.blue],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  InAppWebView(
                    onLoadStart: (controller, url) {
                      setState(() {
                        isloading = true;
                      });
                    },
                    onLoadStop: (controller, url) {
                      setState(() {
                        isloading = false;
                      });
                    },
                    onWebViewCreated: (controller) =>
                        webViewController = controller,
                    initialUrlRequest: URLRequest(
                      url: Uri.parse(initialUrl),
                    ),
                  ),
                  Visibility(
                    visible: isloading,
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                          Color.fromARGB(255, 62, 197, 57)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            children: const [
              UserAccountsDrawerHeader(
                currentAccountPictureSize: Size(66, 66),
                currentAccountPicture: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/faq-circular-filled-button.png'),
                  backgroundColor: Colors.transparent,
                ),
                accountName: Text('이 앱은 네이버쇼핑 공식 앱이 아닙니다.'),
                accountEmail:
                    Text('네이퍼페이 간편 결제를 이용하고 있는\n사용자를 위한 네이버쇼핑 웹앱입니다.'),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.amber, Colors.blue],
                  ),
                ),
              ),
              ListTile(
                title: Text('네이버 로그인'),
                subtitle: Text('직접 입력만 가능하며 앱로그인은 불가합니다.'),
              ),
              ListTile(
                title: Text('결제'),
                subtitle: Text('네이버페이 간편 결제만 지원되며\n다른 결제방식은 지원되지 않습니다.'),
              ),
              ListTile(
                title: Text('구매'),
                subtitle:
                    Text('네이버페이 간편 결제가 가능한 쇼핑몰만\n구매가 가능합니다. (기타 몰 구매 미지원)'),
              ),
              ListTile(
                title: Text('후기'),
                subtitle: Text('촬영 및 파일첨부등은 지원되지 않습니다.'),
              ),
              ListTile(
                title: Text('다른 앱 열기 또는 앱으로 보기 및 공유기능'),
                subtitle: Text('결제를 위한 카드사 앱 열기등 다른 앱을\n열수 있는 기능이 지원되지 않습니다.'),
              ),
              ListTile(
                title: Text('어디에서든 네이버쇼핑으로 이동 가능합니다'),
                subtitle: Text('최상단 네이버쇼핑 타이틀을 누르시면 됩니다.'),
              ),
              ListTile(
                title: Text('어디에서든 네이버쇼핑 검색이 가능합니다'),
                subtitle: Text('최상단 우측 돋보기 아이콘을 누르시면 됩니다.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
