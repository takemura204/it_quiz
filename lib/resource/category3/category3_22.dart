import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_22 {
  final quizItems = [
    QuizItem(
      question: '他人のプライベートなデータを無許可で見る行為を何というか？',
      ans: '盗み見',
      choices: ["盗み見", "クラッキング", "ソーシャルエンジニアリング", "ビジネスメール詐欺"],
      comment: "盗み見は、他人のプライベートな情報やデータを無許可で覗き見る行為を指す。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '不正な方法でコンピューターシステムに侵入し、データを盗んだり破壊したりする行為を何というか？',
      ans: 'クラッキング',
      choices: ["クラッキング", "盗み見", "ソーシャルエンジニアリング", "ビジネスメール詐欺"],
      comment: "クラッキングは、セキュリティを破って不正にコンピューターシステムに侵入し、データを盗んだり破壊したりする行為。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '人の心理や行動の弱点を利用して情報を盗み出す詐術は何というか？',
      ans: 'ソーシャルエンジニアリング',
      choices: ["ソーシャルエンジニアリング", "クラッキング", "盗み見", "ビジネスメール詐欺"],
      comment: "ソーシャルエンジニアリングは、人間の心理や行動の弱点を利用して、パスワードや機密情報を不正に入手する詐術。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '正規のビジネスメールを装って、詐欺行為を働く手法は何というか？',
      ans: 'ビジネスメール詐欺',
      choices: ["ビジネスメール詐欺", "ソーシャルエンジニアリング", "クラッキング", "盗み見"],
      comment: "ビジネスメール詐欺は、正規のビジネスメールを装って送り、受け取った人に金銭の振り込みなどを要求する詐欺行為。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'インターネットの隠された部分で、違法な活動が行われるエリアを何というか？',
      ans: 'ダークウェブ',
      choices: ["ダークウェブ", "マルウェア", "ボット", "スパイウェア"],
      comment: "ダークウェブは、通常の検索エンジンではアクセスできないインターネットの隠された部分で、違法な取引や情報交換が行われるエリア。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '悪意のあるソフトウェア全般を指す言葉は何か？',
      ans: 'マルウェア',
      choices: ["マルウェア", "ダークウェブ", "ボット", "スパイウェア"],
      comment: "マルウェア（Malware）は、コンピューターやネットワークに損害を与える目的で作られた悪意のあるソフトウェア全般を指す。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '自動的に他のコンピュータを攻撃するために制御される不正プログラムは何か？',
      ans: 'ボット',
      choices: ["ボット", "マルウェア", "ダークウェブ", "スパイウェア"],
      comment:
          "ボットは、自動的に他のコンピュータを攻撃するために遠隔操作される不正プログラムのことで、ボットネットの一部として機能することが多い。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'ユーザーの知らない間に情報を盗み出すマルウェアは何か？',
      ans: 'スパイウェア',
      choices: ["スパイウェア", "ボット", "マルウェア", "ダークウェブ"],
      comment: "スパイウェアは、ユーザーの個人情報や機密情報を盗み出す目的で設計されたマルウェアの一種。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'ファイルを暗号化し、解除のための身代金を要求するマルウェアは何か？',
      ans: 'ランサムウェア',
      choices: ["ランサムウェア", "スパイウェア", "ボット", "マルウェア"],
      comment: "ランサムウェアは、被害者のファイルを暗号化し、解除のための身代金を要求する悪意のあるソフトウェア。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'ファイルを使用せずにメモリ内で直接実行されるマルウェアは何か？',
      ans: 'ファイルレスマルウェア',
      choices: ["ファイルレスマルウェア", "ランサムウェア", "スパイウェア", "ボット"],
      comment: "ファイルレスマルウェアは、従来のファイルを使用せずにメモリ内で直接実行され、検出を避けることが可能なマルウェア。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '自己複製を行い、ネットワークを介して他のシステムに感染を広げるマルウェアは何か？',
      ans: 'ワーム',
      choices: ["ワーム", "トロイの木馬", "ランサムウェア", "ファイルレスマルウェア"],
      comment: "ワームは、自己複製を行い、ネットワークを介して他のコンピューターシステムに感染を広げるマルウェア。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '正規のソフトウェアに見せかけて悪意のある機能を持つマルウェアは何か？',
      ans: 'トロイの木馬',
      choices: ["トロイの木馬", "ワーム", "ランサムウェア", "ファイルレスマルウェア"],
      comment: "トロイの木馬は、正規のソフトウェアや有用な機能に見せかけて、背後で不正な活動を行うマルウェア。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '遠隔からコンピュータを制御するために使用されるマルウェアは何か？',
      ans: 'RAT',
      choices: ["RAT", "トロイの木馬", "ワーム", "スパイウェア"],
      comment:
          "RAT（Remote Access Trojan）は、遠隔からコンピュータを制御するために使用されるトロイの木馬型マルウェア。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'マクロを悪用して感染を広げるウイルスは何か？',
      ans: 'マクロウイルス',
      choices: ["マクロウイルス", "RAT", "トロイの木馬", "ワーム"],
      comment: "マクロウイルスは、マイクロソフトオフィスなどのアプリケーションに埋め込まれたマクロを悪用して感染を広げるウイルス。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'ウェブサイトを経由してマルウェアを配布するために使用されるツールは何か？',
      ans: 'ガンブラー',
      choices: ["ガンブラー", "キーロガー", "バックドア", "マクロウイルス"],
      comment: "ガンブラーは、ウェブサイトを経由して訪問者のコンピュータにマルウェアを自動的に配布するために使用されるツール。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ユーザーのキーストロークを記録し、個人情報を盗み出すマルウェアは何か？',
      ans: 'キーロガー',
      choices: ["キーロガー", "ガンブラー", "トロイの木馬", "RAT"],
      comment: "キーロガーは、ユーザーのキーストロークを密かに記録し、パスワードやその他の機密情報を盗み出すマルウェア。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '不正アクセス者がシステムに隠れて再侵入するために使用する手段は何か？',
      ans: 'バックドア',
      choices: ["バックドア", "キーロガー", "ガンブラー", "トロイの木馬"],
      comment: "バックドアは、不正アクセス者がセキュリティ対策を迂回してシステムに隠れて再侵入するために設ける秘密の手段。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'ファイルを共有する目的で使用されるが、マルウェアの感染経路となることもあるソフトウェアは何か？',
      ans: 'ファイル交換ソフトウェア',
      choices: ["ファイル交換ソフトウェア", "バックドア", "キーロガー", "ガンブラー"],
      comment:
          "ファイル交換ソフトウェアは、インターネット上でファイルを共有する目的で使用されるが、不正なファイルが混入してマルウェアの感染経路となることもある。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ソフトウェアの脆弱性や欠陥を指す言葉は何か？',
      ans: 'セキュリティホール',
      choices: ["セキュリティホール", "シャドーIT", "不正のトライアングル", "辞書攻撃"],
      comment: "セキュリティホールは、ソフトウェアの脆弱性や欠陥を指し、攻撃者によって悪用される可能性がある。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '組織の公式な承認や管理を経ずに使用されるITシステムやソフトウェアを指す言葉は何か？',
      ans: 'シャドーIT',
      choices: ["シャドーIT", "セキュリティホール", "キーロガー", "バックドア"],
      comment:
          "シャドーITは、組織の公式な承認や管理を経ずに従業員によって使用されるITシステムやソフトウェアを指し、セキュリティリスクを高めることがある。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '不正行為を行う際に必要とされる3つの要素（機会、動機、正当化）を示す理論は何か？',
      ans: '不正のトライアングル',
      choices: ["不正のトライアングル", "シャドーIT", "セキュリティホール", "クロスサイトスクリプティング"],
      comment: "不正のトライアングルは、不正行為を行う際に必要とされる3つの要素、すなわち機会、動機、正当化の理論。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '事前に収集した辞書リストを使ってパスワードを推測する攻撃方法は何か？',
      ans: '辞書攻撃',
      choices: ["辞書攻撃", "総当たり攻撃", "パスワードリスト攻撃", "クロスサイトリクエストフォージェリ"],
      comment: "辞書攻撃は、事前に収集した単語リスト（辞書ファイル）を使ってパスワードや暗号キーなどを推測しようとする攻撃方法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '可能な全ての文字列の組み合わせを試してパスワードを推測する攻撃方法は何か？',
      ans: '総当たり攻撃',
      choices: ["総当たり攻撃", "辞書攻撃", "パスワードリスト攻撃", "クロスサイトスクリプティング"],
      comment: "総当たり攻撃（ブルートフォース攻撃）は、可能な全ての文字列の組み合わせを試してパスワードや暗号キーを推測する攻撃方法。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '事前に収集されたパスワードのリストを使って認証を突破しようとする攻撃方法は何か？',
      ans: 'パスワードリスト攻撃',
      choices: ["パスワードリスト攻撃", "総当たり攻撃", "辞書攻撃", "クロスサイトスクリプティング"],
      comment: "パスワードリスト攻撃は、漏洩したパスワードのリストや以前の攻撃で得られたパスワードを使って認証を突破しようとする攻撃方法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ウェブアプリケーションにおいて、悪意のあるスクリプトを埋め込むことで他のユーザーを攻撃する手法は何か？',
      ans: 'クロスサイトスクリプティング',
      choices: [
        "クロスサイトスクリプティング",
        "クロスサイトリクエストフォージェリ",
        "クリックジャッキング",
        "ドライブバイダウンロード"
      ],
      comment:
          "クロスサイトスクリプティング（XSS）は、ウェブアプリケーションにおいて、悪意のあるスクリプトを埋め込むことで他のユーザーを攻撃する手法。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '攻撃者がユーザーのブラウザを悪用して、ユーザーの意図しないリクエストをウェQuestを送信させる攻撃手法は何か？',
      ans: 'クロスサイトリクエストフォージェリ',
      choices: [
        "クロスサイトリクエストフォージェリ",
        "クロスサイトスクリプティング",
        "クリックジャッキング",
        "ドライブバイダウンロード"
      ],
      comment:
          "クロスサイトリクエストフォージェリ（CSRF）は、攻撃者がユーザーのブラウザを悪用して、ユーザーの意図しないリクエストをウェブアプリケーションに送信させる攻撃手法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ユーザーが意図せずに他のアクションを実行してしまうような操作を促す攻撃手法は何か？',
      ans: 'クリックジャッキング',
      choices: [
        "クリックジャッキング",
        "クロスサイトリクエストフォージェリ",
        "クロスサイトスクリプティング",
        "ドライブバイダウンロード"
      ],
      comment:
          "クリックジャッキングは、ユーザーが意図せずに他のアクションを実行してしまうような操作を促す攻撃手法。これは、透明または見えないフレームを使って実現されることが多い。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ユーザーが悪意のあるウェブサイトを訪れるだけで自動的にマルウェアがダウンロードされる攻撃は何か？',
      ans: 'ドライブバイダウンロード',
      choices: [
        "ドライブバイダウンロード",
        "クリックジャッキング",
        "クロスサイトリクエストフォージェリ",
        "クロスサイトスクリプティング"
      ],
      comment:
          "ドライブバイダウンロードは、ユーザーが悪意のあるウェブサイトを訪れるだけで、何の警告もなく自動的にマルウェアがダウンロードされる攻撃。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ウェブアプリケーションが不正なSQLクエリを実行してしまうことを利用した攻撃は何か？',
      ans: 'SQLインジェクション',
      choices: [
        "SQLインジェクション",
        "ディレクトリトラバーサル",
        "クロスサイトスクリプティング",
        "ドライブバイダウンロード"
      ],
      comment:
          "SQLインジェクションは、ウェブアプリケーションが不正なSQLクエリを実行してしまうことを利用した攻撃。これにより、データベースから情報が漏洩する恐れがある。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ウェブアプリケーションのセキュリティが不十分な場合に、攻撃者がシステムファイルにアクセスする攻撃は何か？',
      ans: 'ディレクトリトラバーサル',
      choices: [
        "ディレクトリトラバーサル",
        "SQLインジェクション",
        "クロスサイトスクリプティング",
        "ドライブバイダウンロード"
      ],
      comment:
          "ディレクトリトラバーサルは、ウェブアプリケーションのセキュリティが不十分な場合に、攻撃者がシステムファイルに不正にアクセスする攻撃。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '攻撃者が通信中のデータを傍受し、情報を盗み出す攻撃は何か？',
      ans: '中間者攻撃',
      choices: ["中間者攻撃", "MITB攻撃", "第三者中継", "IPスプーフィング"],
      comment: "中間者攻撃（Man-in-the-Middle Attack）は、攻撃者が通信中のデータを傍受し、情報を盗み出す攻撃。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'オンラインバンキングなどで、ユーザーと銀行の間に攻撃者が入り込む攻撃は何か？',
      ans: 'MITB攻撃',
      choices: ["MITB攻撃", "中間者攻撃", "第三者中継", "IPスプーフィング"],
      comment:
          "MITB攻撃（Man-in-The-Browser Attack）は、オンラインバンキングなどで、ユーザーと銀行の間に攻撃者が入り込む攻撃。ブラウザの脆弱性を利用して行われる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'バッファを超過するデータを送り込み、システムに不正なコードを実行させる攻撃は何か？',
      ans: 'バッファオーバフロー攻撃',
      choices: ["バッファオーバフロー攻撃", "サラミ法", "ウォードライビング", "ポートスキャン"],
      comment:
          "バッファオーバフロー攻撃は、プログラムが予期しない大量のデータを受け取ることで、システムのメモリ領域を超えて不正なコードを実行させる攻撃。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'サービスを停止させるためにサーバーに過剰な通信を送りつける攻撃は何か？',
      ans: 'DoS攻撃',
      choices: ["DoS攻撃", "DDoS攻撃", "クリプトジャッキング", "標的型攻撃"],
      comment:
          "DoS攻撃（Denial of Service Attack）は、サービスを停止させるためにサーバーに過剰な通信を送りつける攻撃。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '複数のボットネットを使用してサービスを停止させる攻撃は何か？',
      ans: 'DDoS攻撃',
      choices: ["DDoS攻撃", "DoS攻撃", "クリプトジャッキング", "標的型攻撃"],
      comment:
          "DDoS攻撃（Distributed Denial of Service Attack）は、複数のボットネットを使用して大量の通信を送りつけ、サービスを停止させる攻撃。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '他人のコンピュータを無断で使用し、仮想通貨のマイニングを行う攻撃は何か？',
      ans: 'クリプトジャッキング',
      choices: ["クリプトジャッキング", "DDoS攻撃", "DoS攻撃", "標的型攻撃"],
      comment: "クリプトジャッキングは、他人のコンピュータを無断で使用し、仮想通貨のマイニングを行う攻撃。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '特定の組織や個人を狙ったサイバー攻撃は何と呼ばれるか？',
      ans: '標的型攻撃',
      choices: ["標的型攻撃", "クリプトジャッキング", "DDoS攻撃", "DoS攻撃"],
      comment: "標的型攻撃は、特定の組織や個人を狙って精密に計画されたサイバー攻撃。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '攻撃者が公共の場所でのWi-Fiネットワークなどを利用して攻撃を行う手法は何か？',
      ans: '水飲み場型攻撃',
      choices: ["水飲み場型攻撃", "やり取り型攻撃", "フィッシング", "ワンクリック詐欺"],
      comment:
          "水飲み場型攻撃は、攻撃者が公共の場所でのWi-Fiネットワークなどを利用して、その場所を訪れる人々を標的とした攻撃を行う手法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '攻撃者が対象とするユーザーとやり取りを行いながら攻撃を仕掛ける手法は何か？',
      ans: 'やり取り型攻撃',
      choices: ["やり取り型攻撃", "水飲み場型攻撃", "フィッシング", "ワンクリック詐欺"],
      comment: "やり取り型攻撃は、攻撃者が対象とするユーザーとメールやメッセージなどのやり取りを行いながら、信頼を得て攻撃を仕掛ける手法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'まだ公にされていないソフトウェアの脆弱性を悪用した攻撃は何か？',
      ans: 'ゼロデイ攻撃',
      choices: ["ゼロデイ攻撃", "ポートスキャン", "ウォードライビング", "サラミ法"],
      comment: "ゼロデイ攻撃は、ソフトウェアの脆弱性が公にされる前、つまり「ゼロデイ」に悪用される攻撃。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '攻撃者が合法的な参加者になりすまして通信を行う攻撃は何か？',
      ans: '第三者中継',
      choices: ["第三者中継", "中間者攻撃", "MITB攻撃", "IPスプーフィング"],
      comment: "第三者中継は、攻撃者が合法的な参加者になりすまして通信を行い、データを傍受または改ざんする攻撃。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '攻撃者が他のデバイスのIPアドレスを偽装する攻撃は何か？',
      ans: 'IPスプーフィング',
      choices: ["IPスプーフィング", "第三者中継", "中間者攻撃", "MITB攻撃"],
      comment: "IPスプーフィングは、攻撃者が他のデバイスのIPアドレスを偽装し、信頼関係を悪用する攻撃。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'DNS情報を改ざんし、ユーザーを偽のウェブサイトに誘導する攻撃は何か？',
      ans: 'キャッシュポイズニング',
      choices: ["キャッシュポイズニング", "IPスプーフィング", "中間者攻撃", "MITB攻撃"],
      comment:
          "キャッシュポイズニング（DNS Cache Poisoning）は、DNSサーバのキャッシュ情報を改ざんし、ユーザーを偽のウェブサイトに誘導する攻撃。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '正規のウェブサイトや電子メールを偽装して個人情報を盗み出そうとする詐欺は何か？',
      ans: 'フィッシング',
      choices: ["フィッシング", "やり取り型攻撃", "水飲み場型攻撃", "ワンクリック詐欺"],
      comment:
          "フィッシングは、正規のウェブサイトや電子メールを偽装し、ユーザーにログイン情報やクレジットカード情報などの個人情報の入力を促して盗み出そうとする詐欺。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ユーザーがリンクをクリックするだけで不正な契約や購入を強制する詐欺は何か？',
      ans: 'ワンクリック詐欺',
      choices: ["ワンクリック詐欺", "フィッシング", "やり取り型攻撃", "水飲み場型攻撃"],
      comment: "ワンクリック詐欺は、ユーザーが知らないうちにリンクをクリックするだけで、不正な契約や購入を強制させる詐欺。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '攻撃者が既存のセッションを乗っ取る攻撃は何か？',
      ans: 'セッションハイジャック',
      choices: ["セッションハイジャック", "キャッシュポイズニング", "IPスプーフィング", "中間者攻撃"],
      comment: "セッションハイジャックは、攻撃者が既存のセッションを乗っ取り、ユーザーになりすまして機密情報にアクセスする攻撃。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ネットワーク上の開いているポートを探すために行われる監視活動は何か？',
      ans: 'ポートスキャン',
      choices: ["ポートスキャン", "ゼロデイ攻撃", "ウォードライビング", "サラミ法"],
      comment: "ポートスキャンは、ネットワーク上の開いているポートを探し出し、脆弱性のあるサービスを特定するために行われる監視活動。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '攻撃者が車を使って無線LANのアクセスポイントを探し出す活動は何か？',
      ans: 'ウォードライビング',
      choices: ["ウォードライビング", "ポートスキャン", "ゼロデイ攻撃", "サラミ法"],
      comment: "ウォードライビングは、攻撃者が車を使って移動しながら、無線LANのアクセスポイントを探し出し、地図上に記録する活動。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      question: 'プログラムが用意している入力用のデータ領域を超えるサイズのデータを入力することで，想定外の動作をさせる現象を何というか？',
      ans: 'バッファオーバフロー攻撃',
      choices: ["バッファオーバフロー攻撃", "ウォードライビング", "ポートスキャン", "ゼロデイ攻撃"],
      comment:
          "バッファオーバフロー攻撃は、攻撃者が故意にプログラムが確保したメモリ領域(バッファ)よりも大きなデータを読み込ませることで、メモリ領域からあふれた部分に不正なデータを書き込ませ、システムへの侵入や管理者権限の取得を試みる攻撃。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category3Index + 2201);
  });
}
