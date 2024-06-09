import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_24 {
  final quizItems = [
    QuizItem(
      question: '不適切なコンテンツの閲覧を防ぐために使用される技術は何か？',
      ans: 'コンテンツフィルタリング',
      choices: ["コンテンツフィルタリング", "MACアドレスフィルタリング", "コールバック", "アクセス制御"],
      comment: "コンテンツフィルタリングは、インターネット上の不適切なコンテンツや有害なサイトの閲覧を防ぐために使用される技術。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ネットワーク機器にアクセスできるデバイスを制限するために使用される技術は何か？',
      ans: 'MACアドレスフィルタリング',
      choices: ["MACアドレスフィルタリング", "コンテンツフィルタリング", "コールバック", "アクセス制御"],
      comment: "MACアドレスフィルタリングは、特定のMACアドレスを持つデバイスのみネットワークへのアクセスを許可する技術。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'リモートアクセス時にセキュリティを強化するために、あらかじめ登録された電話番号にのみ折り返し接続を行う方法は何か？',
      ans: 'コールバック',
      choices: ["コールバック", "MACアドレスフィルタリング", "コンテンツフィルタリング", "アクセス制御"],
      comment:
          "コールバックは、リモートアクセスセッションのセキュリティを強化するために、あらかじめ登録された電話番号にのみ折り返し接続を行う方法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ユーザーやデバイスがリソースにアクセスする際の権限を管理するプロセスは何か？',
      ans: 'アクセス制御',
      choices: ["アクセス制御", "コールバック", "MACアドレスフィルタリング", "コンテンツフィルタリング"],
      comment: "アクセス制御は、ユーザーやデバイスが情報リソースにアクセスする際の権限を管理・制限するセキュリティプロセス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '不正なアクセスや攻撃からネットワークを保護するためのシステムは何か？',
      ans: 'ファイアウォール',
      choices: ["ファイアウォール", "WAF", "IDS", "IPS"],
      comment: "ファイアウォールは、不正なアクセスや攻撃からネットワークを保護するために、入出力される通信を制御するシステム。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'ウェブアプリケーションを対象とした攻撃から保護するためのセキュリティシステムは何か？',
      ans: 'WAF',
      choices: ["WAF", "ファイアウォール", "IDS", "IPS"],
      comment:
          "WAF（Web Application Firewall）は、ウェブアプリケーションを対象とした攻撃（例えば、SQLインジェクションやクロスサイトスクリプティング）から保護するためのセキュリティシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ネットワーク上の不審な活動や攻撃の兆候を検出するシステムは何か？',
      ans: 'IDS',
      choices: ["IDS", "WAF", "ファイアウォール", "IPS"],
      comment:
          "IDS（Intrusion Detection System）は、ネットワーク上の不審な活動や攻撃の兆候を検出し、警告を発するシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '攻撃を検出し、それを阻止または軽減するためのシステムは何か？',
      ans: 'IPS',
      choices: ["IPS", "IDS", "WAF", "ファイアウォール"],
      comment:
          "IPS（Intrusion Prevention System）は、攻撃を検出し、自動的にそれを阻止または軽減するためのセキュリティシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'セキュリティ関連のデータを収集、分析し、セキュリティインシデントの監視・管理を行うシステムは何か？',
      ans: 'SIEM',
      choices: ["SIEM", "IPS", "IDS", "WAF"],
      comment:
          "SIEM（Security Information and Event Management）は、セキュリティ関連のデータをリアルタイムで収集・分析し、セキュリティインシデントの監視・管理を行うシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '機密情報の漏洩を防ぐためにデータの流れを監視し、制御する技術は何か？',
      ans: 'DLP',
      choices: ["DLP", "SIEM", "IPS", "IDS"],
      comment:
          "DLP（Data Loss Prevention）は、機密情報が組織の外部に漏洩するのを防ぐために、データの流れを監視し、必要に応じて制御する技術。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ネットワーク内で疑わしいデバイスやソフトウェアを隔離し、検査するための領域は何か？',
      ans: '検疫ネットワーク',
      choices: ["検疫ネットワーク", "DMZ", "SSL/TLS", "サニタイジング"],
      comment: "検疫ネットワークは、ネットワーク内で疑わしいデバイスやソフトウェアを隔離し、検査するための領域。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'インターネットと内部ネットワークの間に設置され、外部からのアクセスを受けるサーバを配置する領域は何か？',
      ans: 'DMZ',
      choices: ["DMZ", "検疫ネットワーク", "SSL/TLS", "サニタイジング"],
      comment:
          "DMZ（非武装地帯）は、インターネットと内部ネットワークの間に設置され、外部からのアクセスを受けるサーバを配置するセキュリティ強化のための領域。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'インターネット上でデータの安全な伝送を保証するために使用されるプロトコルは何か？',
      ans: 'SSL',
      choices: ["SSL", "DMZ", "検疫ネットワーク", "サニタイジング"],
      comment:
          "SSL（Secure Sockets Layer）およびTLS（Transport Layer Security）は、インターネット上でデータの安全な伝送を保証するために使用される暗号化プロトコル。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'データやデバイスを安全に保つために不要な情報を除去または無害化するプロセスは何か？',
      ans: 'サニタイジング',
      choices: ["サニタイジング", "SSL/TLS", "VPN", "MDM"],
      comment: "サニタイジングは、データやデバイスから機密性の高い情報を除去または無害化し、安全を保つためのプロセス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'リモートネットワーク間の安全な通信チャネルを確立するために使用される技術は何か？',
      ans: 'VPN',
      choices: ["VPN", "サニタイジング", "SSL/TLS", "MDM"],
      comment:
          "VPN（Virtual Private Network）は、インターネット上で仮想的なプライベートネットワークを構築し、リモートネットワーク間の安全な通信チャネルを確立するために使用される技術。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'モバイルデバイスのセキュリティ管理を一元化するためのソリューションは何か？',
      ans: 'MDM',
      choices: ["MDM", "VPN", "サニタイジング", "SSL/TLS"],
      comment:
          "MDM（Mobile Device Management）は、企業や組織におけるモバイルデバイスのセキュリティポリシーやアプリケーションの管理を一元化するためのソリューション。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '著作権保護や情報の流出防止のためにデジタルデータに埋め込むことができる識別情報は何か？',
      ans: '電子透かし',
      choices: ["電子透かし", "ディジタルフォレンジックス", "ペネトレーションテスト", "ブロックチェーン"],
      comment:
          "電子透かしは、著作権保護や情報の流出防止のために、画像や音声、ビデオなどのデジタルデータに不可視の形で埋め込むことができる識別情報。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'デジタルデータの犯罪調査のために行われる分析プロセスは何か？',
      ans: 'ディジタルフォレンジックス',
      choices: ["ディジタルフォレンジックス", "電子透かし", "ペネトレーションテスト", "ブロックチェーン"],
      comment: "ディジタルフォレンジックスは、犯罪や不正行為に関連するデジタルデータの収集、保存、分析を行う科学的な調査プロセス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'セキュリティの脆弱性を評価するために実施される模擬的な攻撃テストは何か？',
      ans: 'ペネトレーションテスト',
      choices: ["ペネトレーションテスト", "ディジタルフォレンジックス", "電子透かし", "ブロックチェーン"],
      comment: "ペネトレーションテスト（侵入テスト）は、セキュリティシステムの脆弱性を発見し、強化するために実施される模擬的な攻撃テスト。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '改ざんや偽造を防ぐために分散型台帳技術を使用する技術は何か？',
      ans: 'ブロックチェーン',
      choices: ["ブロックチェーン", "ペネトレーションテスト", "ディジタルフォレンジックス", "電子透かし"],
      comment: "ブロックチェーンは、改ざんや偽造を防ぐために分散型台帳技術を使用し、トランザクションの記録を保持する技術。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '物理的または論理的な改ざんから保護されたシステムの特性は何か？',
      ans: '耐タンパ性',
      choices: ["耐タンパ性", "セキュアブート", "TPM", "PCI DSS"],
      comment: "耐タンパ性は、物理的または論理的な改ざんからデバイスやシステムを保護するための特性または能力。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'システムが信頼できるソフトウェアからのみ起動することを保証するプロセスは何か？',
      ans: 'セキュアブート',
      choices: ["セキュアブート", "耐タンパ性", "TPM", "PCI DSS"],
      comment:
          "セキュアブートは、コンピュータが信頼できるソフトウェア、例えば正規のオペレーティングシステムからのみ起動することを保証するセキュリティプロセス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ハードウェアベースのセキュリティ機能を提供するマイクロコントローラは何か？',
      ans: 'TPM',
      choices: ["TPM", "セキュアブート", "耐タンパ性", "PCI DSS"],
      comment:
          "TPM（Trusted Platform Module）は、パスワード、証明書、暗号キーなどのセキュリティ関連の情報を安全に保存し、ハードウェアベースのセキュリティ機能を提供するマイクロコントローラ。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'クレジットカード情報の安全な取り扱いを定める国際的なセキュリティ基準は何か？',
      ans: 'PCI DSS',
      choices: ["PCI DSS", "TPM", "セキュアブート", "耐タンパ性"],
      comment:
          "PCI DSS（Payment Card Industry Data Security Standard）は、クレジットカード情報の安全な取り扱いを定める国際的なセキュリティ基準。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '未使用の文書やメディアを机の上に放置しないことを奨励するポリシーは何か？',
      ans: 'クリアデスク',
      choices: ["クリアデスク", "クリアスクリーン", "共通鍵暗号方式", "公開鍵暗号方式"],
      comment: "クリアデスクポリシーは、機密性の高い文書やメディアを机の上に放置せず、適切に保管することを奨励するセキュリティポリシー。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '退席時にコンピュータの画面をロックするなど、情報漏洩を防ぐためのポリシーは何か？',
      ans: 'クリアスクリーン',
      choices: ["クリアスクリーン", "クリアデスク", "共通鍵暗号方式", "公開鍵暗号方式"],
      comment:
          "クリアスクリーンポリシーは、退席時にコンピュータの画面をロックするなどして、画面上の情報が他人に見られることを防ぐためのセキュリティポリシー。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '暗号化と復号に同じ鍵を使用する暗号方式は何か？',
      ans: '共通鍵暗号方式',
      choices: ["共通鍵暗号方式", "公開鍵暗号方式", "ハイブリッド暗号方式", "WPA2"],
      comment: "共通鍵暗号方式（対称鍵暗号方式）は、暗号化と復号に同じ鍵を使用する暗号方式。鍵の配送と管理が課題となる。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '暗号化には公開鍵、復号には秘密鍵を使用する暗号方式は何か？',
      ans: '公開鍵暗号方式',
      choices: ["公開鍵暗号方式", "共通鍵暗号方式", "ハイブリッド暗号方式", "WPA2"],
      comment:
          "公開鍵暗号方式（非対称鍵暗号方式）は、暗号化に公開鍵を、復号には対応する秘密鍵を使用する暗号方式。公開鍵は公開され、秘密鍵は所有者のみが保持する。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '共通鍵暗号方式と公開鍵暗号方式を組み合わせて使用する暗号方式は何か？',
      ans: 'ハイブリッド暗号方式',
      choices: ["ハイブリッド暗号方式", "公開鍵暗号方式", "共通鍵暗号方式", "WPA2"],
      comment:
          "ハイブリッド暗号方式は、共通鍵暗号方式の効率性と公開鍵暗号方式の鍵配送の安全性を組み合わせた暗号方式。実際にデータを暗号化する共通鍵を公開鍵暗号方式で安全に交換する。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'Wi-Fiネットワークのセキュリティを強化したプロトコルの一つは何か？',
      ans: 'WPA2',
      choices: ["WPA2", "WPA3", "S/MIME", "ディジタル署名"],
      comment:
          "WPA2（Wi-Fi Protected Access 2）は、Wi-Fiネットワークのセキュリティを強化したプロトコルで、より強力な暗号化と認証を提供する。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'WPA2の後継として開発された、さらに強化されたWi-Fiセキュリティプロトコルは何か？',
      ans: 'WPA3',
      choices: ["WPA3", "WPA2", "S/MIME", "ディジタル署名"],
      comment:
          "WPA3（Wi-Fi Protected Access 3）は、WPA2の後継として開発された、さらに強化されたWi-Fiセキュリティプロトコル。パーソナルおよびエンタープライズネットワークの両方でのセキュリティを向上させる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '電子メールのセキュリティを強化するために使用される標準は何か？',
      ans: 'S/MIME',
      choices: ["S/MIME", "WPA3", "WPA2", "ディジタル署名"],
      comment:
          "S/MIME（Secure/Multipurpose Internet Mail Extensions）は、電子メールのセキュリティを強化するために使用される標準で、暗号化とデジタル署名を提供する。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '電子ドキュメントに真正性と改ざん防止の証明を提供するために使用されるものは何か？',
      ans: 'ディジタル署名',
      choices: ["ディジタル署名", "S/MIME", "タイムスタンプ", "ワンタイムパスワード"],
      comment: "ディジタル署名は、電子ドキュメントに対して真正性、改ざん防止、および署名者の否認防止の証明を提供するために使用される。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'ドキュメントが署名された正確な時刻を証明するために使用されるものは何か？',
      ans: 'タイムスタンプ',
      choices: ["タイムスタンプ", "ディジタル署名", "S/MIME", "ワンタイムパスワード"],
      comment:
          "タイムスタンプは、ドキュメントやデータが特定の時点で存在していたことを証明するために使用される、信頼できる第三者によって提供されるサービス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ログインやトランザクション確認のために一度だけ使用されるパスワードは何か？',
      ans: 'ワンタイムパスワード',
      choices: ["ワンタイムパスワード", "タイムスタンプ", "ディジタル署名", "S/MIME"],
      comment:
          "ワンタイムパスワード（OTP）は、ログインやトランザクションの確認のために一度だけ使用され、次回以降の使用ができない一時的なパスワード。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'セキュリティを強化するために複数の認証要素を組み合わせて使用する認証方法は何か？',
      ans: '多要素認証',
      choices: ["多要素認証", "ワンタイムパスワSSLード", "シングルサインオン", "SMS認証"],
      comment:
          "多要素認証は、パスワード（知識要素）とスマートカード（所持要素）、指紋認証（生体要素）など、複数の異なる認証要素を組み合わせて使用することでセキュリティを強化する認証方法。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'ユーザーが一度のログインで複数の関連システムやアプリケーションにアクセスできるようにする認証方法は何か？',
      ans: 'シングルサインオン',
      choices: ["シングルサインオン", "多要素認証", "ワンタイムパスワード", "SMS認証"],
      comment:
          "シングルサインオン（SSO）は、ユーザーが一度の認証で複数の関連システムやアプリケーションにアクセスできるようにする認証方法。ユーザビリティの向上と管理の効率化が期待できる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '認証の際にSMSを通じてコードを送信する方法は何か？',
      ans: 'SMS認証',
      choices: ["SMS認証", "シングルサインオン", "多要素認証", "ワンタイムパスワード"],
      comment:
          "SMS認証は、ログインやトランザクションの確認のために、ユーザーの携帯電話にSMSメッセージを通じて一時的な認証コードを送信する認証方法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '自動化されたプログラムによる不正アクセスを防ぐためにユーザーに認証課題を提示する技術は何か？',
      ans: 'CAPTCHA',
      choices: ["CAPTCHA", "SMS認証", "シングルサインオン", "多要素認証"],
      comment:
          "CAPTCHA（Completely Automated Public Turing test to tell Computers and Humans Apart）は、自動化されたプログラム（ボット）による不正アクセスを防ぐために、ユーザーに認証課題（例えば、 distorted textの読み取り）を提示する技術。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      question: '指紋や顔認証などの生理的特徴を用いてユーザーを識別する認証方法は何か？',
      ans: '生体認証',
      choices: ["生体認証", "CAPTCHA", "SMS認証", "シングルサインオン"],
      comment:
          "生体認証は、指紋、虹彩、顔認証など、個人の生理的または行動的特徴を用いてユーザーを識別する認証方法。高いセキュリティと利便性を提供する。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '生体認証システムで、正規ユーザーが誤って拒否される割合は何か？',
      ans: '本人拒否率',
      choices: ["本人拒否率", "他人受入率", "PKI", "CA"],
      comment:
          "本人拒否率（False Rejection Rate, FRR）は、生体認証システムにおいて、正規のユーザーが誤って拒否される割合。低い本人拒否率は、ユーザビリティの高さを示す。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '生体認証システムで、不正なユーザーが誤って受け入れられる割合は何か？',
      ans: '他人受入率',
      choices: ["他人受入率", "本人拒否率", "PKI", "CA"],
      comment:
          "他人受入率（False Acceptance Rate, FAR）は、生体認証システムにおいて、不正なユーザーが誤って受け入れられる割合。低い他人受入率は、セキュリティの強さを示す。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '公開鍵と秘密鍵を使用してデジタルアイデンティティとセキュリティを管理するインフラストラクチャは何か？',
      ans: 'PKI',
      choices: ["PKI", "他人受入率", "本人拒否率", "CA"],
      comment:
          "PKI（Public Key Infrastructure）は、公開鍵暗号方式とデジタル証明書を使用して、ユーザーやデバイスのデジタルアイデンティティを確立し、セキュリティを強化するためのフレームワーク。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'デジタル証明書を発行し、デジタルアイデンティティの真正性を保証する機関は何か？',
      ans: 'CA',
      choices: ["CA", "PKI", "本人拒否率", "他人受入率"],
      comment:
          "CA（Certificate Authority）は、デジタル証明書を発行し、個人や組織のデジタルアイデンティティの真正性を保証する機関。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '無効になったデジタル証明書のリストは何か？',
      ans: 'CRL',
      choices: ["CRL", "CA", "PKI", "他人受入率"],
      comment:
          "CRL（Certificate Revocation List）は、無効になったデジタル証明書のリスト。CAによって発行・管理され、証明書の有効性を検証する際に参照される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '製品やシステムの設計初期段階からセキュリティを考慮するアプローチは何か？',
      ans: 'セキュリティバイデザイン',
      choices: ["セキュリティバイデザイン", "プライバシーバイデザイン", "CRL", "CA"],
      comment:
          "セキュリティバイデザインは、製品やシステムの設計初期段階からセキュリティを組み込むことを重視するアプローチ。予防的なセキュリティ対策を促進する。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
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
