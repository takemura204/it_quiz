import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_24 {
  final quizItems = [
    QuizItem(
      word: 'コンテンツフィルタリング',
      question: '不適切なコンテンツの閲覧を防ぐために使用される技術は何か？',
      ans: 'コンテンツフィルタリング',
      choices: ["コンテンツフィルタリング", "MACアドレスフィルタリング", "コールバック", "アクセス制御"],
      comment: "コンテンツフィルタリングは、インターネット上の不適切なコンテンツや有害なサイトの閲覧を防ぐために使用される技術。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'MACアドレスフィルタリング',
      question: 'ネットワーク機器にアクセスできるデバイスを制限するために使用される技術は何か？',
      ans: 'MACアドレスフィルタリング',
      choices: ["MACアドレスフィルタリング", "コンテンツフィルタリング", "コールバック", "アクセス制御"],
      comment: "MACアドレスフィルタリングは、特定のMACアドレスを持つデバイスのみネットワークへのアクセスを許可する技術。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'コールバック',
      question: 'リモートアクセス時にセキュリティを強化するために、あらかじめ登録された電話番号にのみ折り返し接続を行う方法は何か？',
      ans: 'コールバック',
      choices: ["コールバック", "MACアドレスフィルタリング", "コンテンツフィルタリング", "アクセス制御"],
      comment:
          "コールバックは、リモートアクセスセッションのセキュリティを強化するために、あらかじめ登録された電話番号にのみ折り返し接続を行う方法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'アクセス制御',
      question: 'ユーザーやデバイスがリソースにアクセスする際の権限を管理するプロセスは何か？',
      ans: 'アクセス制御',
      choices: ["アクセス制御", "コールバック", "MACアドレスフィルタリング", "コンテンツフィルタリング"],
      comment: "アクセス制御は、ユーザーやデバイスが情報リソースにアクセスする際の権限を管理・制限するセキュリティプロセス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ファイアウォール',
      question: 'ネットワークにおいて，外部からの不正アクセスを防ぐために内部ネットワークと外部ネットワークの間に置かれるものはどれか。',
      ans: 'ファイアウォール',
      choices: ["DNSサーバ", "サーチエンジン", "スイッチングハブ", "ファイアウォール"],
      comment:
          "ファイアウォールは、パケットフィルタリング機能を持ち、主に外部から内部のネットワークに接続しようとするパケットの送信元と送信先をチェックし、通過を許可するかどうかを判断するソフトウェア。",
      source: '平成22年春期 問68',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'WAF（Web Application Firewall）',
      question: 'ウェブアプリケーションを対象とした攻撃から保護するためのセキュリティシステムは何か？',
      ans: 'WAF',
      choices: ["WAF", "ファイアウォール", "IDS", "IPS"],
      comment:
          "WAF（Web Application Firewall）は、ウェブアプリケーションを対象とした攻撃（例えば、SQLインジェクションやクロスサイトスクリプティング）から保護するためのセキュリティシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'IDS（Intrusion Detection System）',
      question: 'ネットワーク上の不審な活動や攻撃の兆候を検出するシステムは何か？',
      ans: 'IDS',
      choices: ["IDS", "WAF", "ファイアウォール", "IPS"],
      comment:
          "IDS（Intrusion Detection System）は、ネットワーク上の不審な活動や攻撃の兆候を検出し、警告を発するシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'IPS（Intrusion Prevention System）',
      question: '攻撃を検出し、それを阻止または軽減するためのシステムは何か？',
      ans: 'IPS',
      choices: ["IPS", "IDS", "WAF", "ファイアウォール"],
      comment:
          "IPS（Intrusion Prevention System）は、攻撃を検出し、自動的にそれを阻止または軽減するためのセキュリティシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'SIEM（Security Information and Event Management）',
      question: 'セキュリティ関連のデータを収集、分析し、セキュリティインシデントの監視・管理を行うシステムは何か？',
      ans: 'SIEM',
      choices: ["SIEM", "IPS", "IDS", "WAF"],
      comment:
          "SIEM（Security Information and Event Management）は、セキュリティ関連のデータをリアルタイムで収集・分析し、セキュリティインシデントの監視・管理を行うシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'DLP（Data Loss Prevention）',
      question: '機密情報の漏洩を防ぐためにデータの流れを監視し、制御する技術は何か？',
      ans: 'DLP',
      choices: ["DLP", "SIEM", "IPS", "IDS"],
      comment:
          "DLP（Data Loss Prevention）は、機密情報が組織の外部に漏洩するのを防ぐために、データの流れを監視し、必要に応じて制御する技術。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '検疫ネットワーク',
      question:
          'セキュリティに問題があるPCを社内ネットワークなどに接続させないことを目的とした仕組みであり，外出先で使用したPCを会社に持ち帰った際に，ウイルスに感染していないことなどを確認するために利用するものはどれか。',
      ans: '検疫ネットワーク',
      choices: ["DMZ", "IDS", "検疫ネットワーク", "ファイアウォール"],
      comment:
          "検疫ネットワークは、社外から持ち込まれたノートPCなど、ウィルス感染の可能性がある端末が社内のネットワークに接続しようとするときに、一旦、社内のネットワークとは別の検査専用ネットワークに接続させ、そこで安全を確認してから社内のネットワークへの接続を許可する仕組み。",
      source: '平成26年秋期 問54',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'DMZ(非武装地帯)',
      question: '企業のネットワークにおけるDMZの設置目的として，最も適切なものはどれか。',
      ans: 'Webサーバやメールサーバなど，社外に公開したいサーバを，社内のネットワークから隔離する。',
      choices: [
        "Webサーバやメールサーバなど，社外に公開したいサーバを，社内のネットワークから隔離する。",
        "グローバルIPアドレスをプライベートIPアドレスに変換する。",
        "通信経路上にあるウイルスを除去する。",
        "通信経路を暗号化して，仮想的に専用回線で接続されている状態を作り出す。"
      ],
      comment:
          "DMZ(非武装地帯)とは、社内ネットワークと社外ネットワークの中間的な場所に位置し、外部からアクセスされることを前提としたWebサーバやメールサーバなどの公開サーバを設置するネットワークセグメント",
      source: '平成23年特別 問55',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'SSL(Secure Sockets Layer)',
      question: 'SSLに関する記述のうち，適切なものはどれか。',
      ans: '通信の暗号化を行うことによって，通信経路上での通信内容の漏えいを防ぐ。',
      choices: [
        "Webサイトを運営している事業者がプライバシーマークを取得していることを保証する。",
        "サーバのなりすましを防ぐために，公的認証機関が通信を中継する。",
        "通信の暗号化を行うことによって，通信経路上での通信内容の漏えいを防ぐ。",
        "通信の途中でデータが改ざんされたとき，元のデータに復元する。"
      ],
      comment:
          "SSL(Secure Sockets Layer)は、通信の暗号化，デジタル証明書を利用した改ざん検出，ノード認証を含む統合セキュアプロトコルで、OSI基本参照モデルのトランスポート層で動作するので, 新規にソフトウェアをインストールすることなく上位のアプリケーション層プログラムからも意識せずに利用することが可能。",
      source: '平成23年秋期 問71',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'サニタイジング',
      question:
          'SQLインジェクションの対策などで用いられ，処理の誤動作を招かないように，利用者がWebサイトに入力した内容に含まれる有害な文字列を無害な文字列に置き換えることを何と呼ぶか。',
      ans: 'サニタイジング',
      choices: ["サニタイジング", "ストリーミング", "テザリング", "リバースエンジニアリング"],
      comment:
          "サニタイジングは、ユーザーの入力値を受け取り処理するWebアプリケーションにおいて、入力データ中のスクリプトやコマンドとして特別な意味を持つ文字があった場合、HTML出力やコマンド発行の直前でエスケープ処理し無害化する操作のこと",
      source: '平成28年春期 問64',
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'VPN(Virtual Private Network)',
      question:
          '社外からインターネット経由でPCを職場のネットワークに接続するときなどに利用するVPN(Virtual Private Network) に関する記述のうち，最も適切なものはどれか。',
      ans: '認証と通信データの暗号化によって，セキュリティの高い通信を行う。',
      choices: [
        "インターネットとの接続回線を複数用意し，可用性を向上させる。",
        "送信タイミングを制御することによって，最大の遅延時間を保証する。",
        "通信データを圧縮することによって，最小の通信帯域を保証する。",
        "認証と通信データの暗号化によって，セキュリティの高い通信を行う。"
      ],
      source: '平成23年秋期 問70',
      comment:
          "VPN(Virtual Private Network)は、多数の加入者が共用する公衆回線で接続された拠点間の通信において、認証及び暗号化と復号によって仮想的な専用回線を構築し、セキュリティを確保する技術。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'MDM（Mobile Device Management）',
      question: 'モバイルデバイスのセキュリティ管理を一元化するためのソリューションは何か？',
      ans: 'MDM',
      choices: ["MDM", "VPN", "サニタイジング", "SSL/TLS"],
      comment:
          "MDM（Mobile Device Management）は、企業や組織におけるモバイルデバイスのセキュリティポリシーやアプリケーションの管理を一元化するためのソリューション。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '電子透かし',
      question: '電子透かし技術によってできることとして，最も適切なものはどれか。',
      ans: '元のデータからの変化が一見して分からないように作成日や著作権情報などを埋め込むことができる。',
      choices: [
        "解読鍵がなければデータが利用できなくなる。",
        "作成日や著作権情報などを，透けて見える画像として元の画像に重ねて表示できる。",
        "データのコピー回数を制限できる。",
        "元のデータからの変化が一見して分からないように作成日や著作権情報などを埋め込むことができる。"
      ],
      comment:
          "電子透かし技術とは、デジタルコンテンツに作者名・課金情報・コピー可能回数など著作権情報を目で確認するのが困難な状態で埋め込む技術。",
      source: '平成22年春期 問74',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'ディジタルフォレンジックス',
      question: 'デジタルデータの犯罪調査のために行われる分析プロセスは何か？',
      ans: 'ディジタルフォレンジックス',
      choices: ["ディジタルフォレンジックス", "電子透かし", "ペネトレーションテスト", "ブロックチェーン"],
      comment: "ディジタルフォレンジックスは、犯罪や不正行為に関連するデジタルデータの収集、保存、分析を行う科学的な調査プロセス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ペネトレーションテスト',
      question: 'ペネトレーションテストの説明として，適切なものはどれか。',
      ans: 'システムに対して，実際に攻撃して侵入を試みることで，セキュリティ上の弱点を発見する。',
      choices: [
        "システムに対して，実際に攻撃して侵入を試みることで，セキュリティ上の弱点を発見する。",
        "システムに対して，通常以上の高い負荷をかけて，正常に機能するかどうかを確認する。",
        "プログラムを変更したときに，その変更によって想定外の影響が現れていないかどうかを確認する。",
        "利用者にシステムを実際に使ってもらうことで，使いやすさを確認する。"
      ],
      comment:
          "ペネトレーションテスト(侵入テスト)は、ネットワークに接続されているシステムに対して、実際に様々な方法で侵入を試みることで脆弱性の有無を検査するテスト。",
      source: '平成26年秋期 問62',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'ブロックチェーン',
      question: '改ざんや偽造を防ぐために分散型台帳技術を使用する技術は何か？',
      ans: 'ブロックチェーン',
      choices: ["ブロックチェーン", "ペネトレーションテスト", "ディジタルフォレンジックス", "電子透かし"],
      comment: "ブロックチェーンは、改ざんや偽造を防ぐために分散型台帳技術を使用し、トランザクションの記録を保持する技術。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '耐タンパ性',
      question: '物理的または論理的な改ざんから保護されたシステムの特性は何か？',
      ans: '耐タンパ性',
      choices: ["耐タンパ性", "セキュアブート", "TPM", "PCI DSS"],
      comment: "耐タンパ性は、物理的または論理的な改ざんからデバイスやシステムを保護するための特性または能力。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'セキュアブート',
      question: 'システムが信頼できるソフトウェアからのみ起動することを保証するプロセスは何か？',
      ans: 'セキュアブート',
      choices: ["セキュアブート", "耐タンパ性", "TPM", "PCI DSS"],
      comment:
          "セキュアブートは、コンピュータが信頼できるソフトウェア、例えば正規のオペレーティングシステムからのみ起動することを保証するセキュリティプロセス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'TPM（Trusted Platform Module）',
      question: 'ハードウェアベースのセキュリティ機能を提供するマイクロコントローラは何か？',
      ans: 'TPM',
      choices: ["TPM", "セキュアブート", "耐タンパ性", "PCI DSS"],
      comment:
          "TPM（Trusted Platform Module）は、パスワード、証明書、暗号キーなどのセキュリティ関連の情報を安全に保存し、ハードウェアベースのセキュリティ機能を提供するマイクロコントローラ。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'PCI DSS（Payment Card Industry Data Security Standard）',
      question: 'クレジットカード情報の安全な取り扱いを定める国際的なセキュリティ基準は何か？',
      ans: 'PCI DSS',
      choices: ["PCI DSS", "TPM", "セキュアブート", "耐タンパ性"],
      comment:
          "PCI DSS（Payment Card Industry Data Security Standard）は、クレジットカード情報の安全な取り扱いを定める国際的なセキュリティ基準。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'クリアデスク',
      question: '未使用の文書やメディアを机の上に放置しないことを奨励するポリシーは何か？',
      ans: 'クリアデスク',
      choices: ["クリアデスク", "クリアスクリーン", "共通鍵暗号方式", "公開鍵暗号方式"],
      comment: "クリアデスクポリシーは、機密性の高い文書やメディアを机の上に放置せず、適切に保管することを奨励するセキュリティポリシー。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'クリアスクリーン',
      question: '退席時にコンピュータの画面をロックするなど、情報漏洩を防ぐためのポリシーは何か？',
      ans: 'クリアスクリーン',
      choices: ["クリアスクリーン", "クリアデスク", "共通鍵暗号方式", "公開鍵暗号方式"],
      comment:
          "クリアスクリーンポリシーは、退席時にコンピュータの画面をロックするなどして、画面上の情報が他人に見られることを防ぐためのセキュリティポリシー。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '共通鍵暗号方式',
      question: '共通鍵暗号方式の説明として，適切なものはどれか。',
      ans: 'WPA2',
      choices: ["共通鍵暗号方式", "公開鍵暗号方式", "ハイブリッド暗号方式", "WPA2"],
      comment:
          "共通鍵暗号方式は、秘密鍵暗号方式とも呼ばれ、暗号化と復号に同一の鍵を用いる方式で、代表的なアルゴリズムに、DESやAESがある。",
      source: '平成27年春期 問73',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: '公開鍵暗号方式',
      question: '暗号化には公開鍵、復号には秘密鍵を使用する暗号方式は何か？',
      ans: '公開鍵暗号方式',
      choices: ["公開鍵暗号方式", "共通鍵暗号方式", "ハイブリッド暗号方式", "WPA2"],
      comment:
          "公開鍵暗号方式（非対称鍵暗号方式）は、暗号化に公開鍵を、復号には対応する秘密鍵を使用する暗号方式。公開鍵は公開され、秘密鍵は所有者のみが保持する。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ハイブリッド暗号方式',
      question: '共通鍵暗号方式と公開鍵暗号方式を組み合わせて使用する暗号方式は何か？',
      ans: 'ハイブリッド暗号方式',
      choices: ["ハイブリッド暗号方式", "公開鍵暗号方式", "共通鍵暗号方式", "WPA2"],
      comment:
          "ハイブリッド暗号方式は、共通鍵暗号方式の効率性と公開鍵暗号方式の鍵配送の安全性を組み合わせた暗号方式。実際にデータを暗号化する共通鍵を公開鍵暗号方式で安全に交換する。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'WPA2（Wi-Fi Protected Access 2）',
      question: '無線LANにおいて，端末とアクセスポイント間で伝送されているデータの盗聴を防止するために利用されるものはどれか。',
      ans: 'WPA2',
      choices: ["ANY接続拒否", "ESSIDステルス", "MACアドレスフィルタリング", "WPA2"],
      comment:
          "WPA2（Wi-Fi Protected Access 2）は、無線LANにおける端末とアクセスポイント間の通信を暗号化するセキュリティプロトコルで、解読攻撃に対する耐性が高められている。",
      source: '平成27年春期 問74',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'WPA3（Wi-Fi Protected Access 3）',
      question: 'WPA2の後継として開発された、さらに強化されたWi-Fiセキュリティプロトコルは何か？',
      ans: 'WPA3',
      choices: ["WPA3", "WPA2", "S/MIME", "ディジタル署名"],
      comment:
          "WPA3（Wi-Fi Protected Access 3）は、WPA2の後継として開発された、さらに強化されたWi-Fiセキュリティプロトコル。パーソナルおよびエンタープライズネットワークの両方でのセキュリティを向上させる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'S/MIME',
      question:
          '送信する電子メールの本文と添付ファイルを暗号化し，宛先に指定した受信者だけが内容を読むことができるようにしたい。このとき使用する技術として，最も適切なものはどれか。',
      ans: 'S/MIME',
      choices: ["APOP", "IMAP", "S/MIME", "SSL"],
      comment:
          "S/MIME(Secure/Multipurpose Internet Mail Extensions)は、電子メールを盗聴や改ざんなどから守るために開発された技術で、公開鍵暗号技術を使用して「認証」「改ざん検出」「暗号化」などの機能を電子メールソフトに提供するもの。",
      source: '平成26年春期 問79',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'ディジタル署名',
      question: '受け取ったデータが改ざんされていることを検知するのに使われる技術はどれか。',
      ans: 'ディジタル署名',
      choices: ["圧縮", "ディジタル署名", "パスワード認証", "フィルタリング"],
      comment:
          "ディジタル署名は、公開鍵暗号技術を応用してデジタル文書の正当性を保証する技術で、この技術を利用すると「発信元が正当であるか」と「改ざんの有無」の2点が確認される。",
      source: '平成27年春期 問78',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'タイムスタンプ',
      question: 'ドキュメントが署名された正確な時刻を証明するために使用されるものは何か？',
      ans: 'タイムスタンプ',
      choices: ["タイムスタンプ", "ディジタル署名", "S/MIME", "ワンタイムパスワード"],
      comment:
          "タイムスタンプは、ドキュメントやデータが特定の時点で存在していたことを証明するために使用される、信頼できる第三者によって提供されるサービス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ワンタイムパスワード',
      question: 'ワンタイムパスワードを用いることによって防げることはどれか。',
      ans: '漏えいしたパスワードによる不正侵入',
      choices: [
        "通信経路上におけるパスワードの盗聴",
        "不正侵入された場合の機密ファイルの改ざん",
        "不正プログラムによるウイルス感染",
        "漏えいしたパスワードによる不正侵入"
      ],
      comment:
          "ワンタイムパスワード(OTP)は、一回しか利用しない使い捨てのパスワードで利用者を認証する方式で、通信経路上でパスワードが盗聴されても、同じパスワードを使用しての不正アクセスはできないためセキュリティに優れている。",
      source: '平成27年春期 問61',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: '多要素認証',
      question: 'セキュリティを強化するために複数の認証要素を組み合わせて使用する認証方法は何か？',
      ans: '多要素認証',
      choices: ["多要素認証", "ワンタイムパスワSSLード", "シングルサインオン", "SMS認証"],
      comment:
          "多要素認証は、パスワード（知識要素）とスマートカード（所持要素）、指紋認証（生体要素）など、複数の異なる認証要素を組み合わせて使用することでセキュリティを強化する認証方法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'シングルサインオン',
      question: 'シングルサインオンの説明として，適切なものはどれか。',
      ans: '最初に認証に成功すると，その後は許可された複数のサービスに対して，利用者が都度認証の手続をしなくとも利用できるようにする仕組み',
      choices: [
        "あるPCからサーバにログインしている間は，他のPCから同じユーザーIDでログインできないようにする仕組み",
        "最初に認証に成功すると，その後は許可された複数のサービスに対して，利用者が都度認証の手続をしなくとも利用できるようにする仕組み",
        "利用者が認証局(CA)から発行された電子証明書を一度PCに登録しておけば，PCへのログインの際に電子証明書によって本人認証をする仕組み",
        "利用者が認証の際に使用するパスワードに，一度しか使えない使い捨てのパスワードを使うことで，不正アクセスを防止する仕組み"
      ],
      comment:
          "シングルサインオン(SSO)は、ユーザー認証を一度受けるだけで許可された複数のサーバやアプリケーションへのアクセスについても認証する仕組みで、利用するアプリケーションごとに設定されているID・パスワードなどを覚えたり、その都度入力を行う手間がなくなるため、エンドユーザーの利便性の向上が期待できる。",
      source: '平成28年春期 問93',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'SMS認証',
      question: '認証の際にSMSを通じてコードを送信する方法は何か？',
      ans: 'SMS認証',
      choices: ["SMS認証", "シングルサインオン", "多要素認証", "ワンタイムパスワード"],
      comment:
          "SMS認証は、ログインやトランザクションの確認のために、ユーザーの携帯電話にSMSメッセージを通じて一時的な認証コードを送信する認証方法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'CAPTCHA',
      question: '自動化されたプログラムによる不正アクセスを防ぐためにユーザーに認証課題を提示する技術は何か？',
      ans: 'CAPTCHA',
      choices: ["CAPTCHA", "SMS認証", "シングルサインオン", "多要素認証"],
      comment:
          "CAPTCHAは、自動化されたプログラム（ボット）による不正アクセスを防ぐために、ユーザーに認証課題（例えば、 distorted textの読み取り）を提示する技術。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      word: '生体認証(バイオメトリクス認証)',
      question: '生体認証の仕組みとして，静脈パターンを利用するものはどれか。',
      ans: '掌(てのひら)認証',
      choices: ["顔認証", "虹(こう)彩認証", "声紋認証", "掌(てのひら)認証"],
      comment:
          "生体認証(バイオメトリクス認証)は、人間の身体的な特徴や行動の特性など個人に固有の情報を用いて本人の認証を行う方式で、身体的特徴を鍵として用いる方式では、指紋や顔・虹彩または声紋・DNAなど長期間にわたり変化しない部分の特徴が使用される。",
      source: '平成23年特別 問68',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: '本人拒否率',
      question: '生体認証システムで、正規ユーザーが誤って拒否される割合は何か？',
      ans: '本人拒否率',
      choices: ["本人拒否率", "他人受入率", "PKI", "CA"],
      comment:
          "本人拒否率（False Rejection Rate, FRR）は、生体認証システムにおいて、正規のユーザーが誤って拒否される割合。低い本人拒否率は、ユーザビリティの高さを示す。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '他人受入率',
      question: '生体認証システムで、不正なユーザーが誤って受け入れられる割合は何か？',
      ans: '他人受入率',
      choices: ["他人受入率", "本人拒否率", "PKI", "CA"],
      comment:
          "他人受入率（False Acceptance Rate, FAR）は、生体認証システムにおいて、不正なユーザーが誤って受け入れられる割合。低い他人受入率は、セキュリティの強さを示す。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'PKI（Public Key Infrastructure）',
      question: '情報セキュリティにおけるPKIに必要不可欠な構成要素はどれか。',
      ans: '認証局',
      choices: ["VPN", "認証局", "バイオメトリクス認証", "ファイアウォール"],
      comment:
          "PKI（Public Key Infrastructure）は、公開鍵が真の所有者のものであるかを第三者機関である認証局が審査し、申請者の公開鍵に対してディジタル証明書を発行することで保証を実現するための仕組み。",
      source: '平成28年春期 問57',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: '認証局(CA)',
      question: '公開鍵基盤(PKI)において認証局(CA)が果たす役割はどれか。',
      ans: '公開鍵が被認証者のものであることを示す証明書を発行する。',
      choices: [
        "SSLを利用した暗号化通信で，利用する認証プログラムを提供する。",
        "Webサーバに不正な仕組みがないことを示す証明書を発行する。",
        "公開鍵が被認証者のものであることを示す証明書を発行する。",
        "被認証者のデジタル署名を安全に送付する。"
      ],
      comment:
          "認証局(CA)は、公開鍵暗号方式を用いたデータ通信において、利用者の公開鍵の正当性を保証するためのデジタル証明書を発行する機関。",
      source: '平成21年秋期 問85',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'CRL（Certificate Revocation List）',
      question: '無効になったデジタル証明書のリストは何か？',
      ans: 'CRL',
      choices: ["CRL", "CA", "PKI", "他人受入率"],
      comment:
          "CRL（Certificate Revocation List）は、無効になったデジタル証明書のリスト。CAによって発行・管理され、証明書の有効性を検証する際に参照される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'セキュリティバイデザイン',
      question: '製品やシステムの設計初期段階からセキュリティを考慮するアプローチは何か？',
      ans: 'セキュリティバイデザイン',
      choices: ["セキュリティバイデザイン", "プライバシーバイデザイン", "CRL", "CA"],
      comment:
          "セキュリティバイデザインは、製品やシステムの設計初期段階からセキュリティを組み込むことを重視するアプローチ。予防的なセキュリティ対策を促進する。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'プライバシーバイデザイン',
      question: '製品やシステムの設計において、ユーザーのプライバシーを保護することを重視するアプローチは何か？',
      ans: 'プライバシーバイデザイン',
      choices: ["プライバシーバイデザイン", "セキュリティバイデザイン", "CRL", "CA"],
      comment:
          "プライバシーバイデザインは、製品やシステムの設計において、初期段階からプライバシー保護の原則を組み込むことを重視するアプローチ。ユーザーのプライバシーとデータ保護を強化する。",
      importance: QuizImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category3Index + 2401);
  });
}
