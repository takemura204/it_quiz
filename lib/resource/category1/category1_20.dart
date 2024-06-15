import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///ソリューションビジネス
List<QuizItem> get category1_20 {
  final quizItems = [
    QuizItem(
      word: 'アウトソーシング',
      question: 'アウトソーシング形態の一つであるオフショアアウトソーシングの事例として，適切なものはどれか。',
      ans: 'サービスデスク機能を海外のサービス提供者に委託する。',
      choices: [
        "研究開発の人的資源として高い専門性を有する派遣社員を確保する。",
        "サービスデスク機能を海外のサービス提供者に委託する。",
        "システム開発のプログラミング業務を国内のベンダー会社に委託する。",
        "商品の配送業務を異業種の会社との共同配送に変更する。"
      ],
      comment: "アウトソーシングは、コスト削減や専門性の高いサービスの利用を目的として、自社の業務の一部または全部を他社に委託すること。",
      source: '平成22年秋期 問3',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'システムインテグレーション',
      question: '複数の異なるシステムや技術を組み合わせて、一つの機能的な全体システムを構築することを何というか？',
      ans: 'システムインテグレーションサービス',
      choices: [
        "SaaS(Software as a Service)",
        "システムインテグレーションサービス",
        "ハウジングサービス",
        "ホスティングサービス"
      ],
      comment:
          "システムインテグレーションは、顧客の要望するコンピュータシステムの企画からシステム構築、運用、保守までに必要となる作業の一部、あるいはすべてを一貫して請け負う事業またはサービスのこと。",
      source: '平成28年春期 問6',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'クラウドコンピューティング',
      question: 'インターネットを通じてサーバー、ストレージなどのコンピューティングリソースを提供するサービスは何か？',
      ans: 'クラウドコンピューティング',
      choices: ["システムインテグレーション", "クラウドコンピューティング", "SaaS", "IaaS"],
      comment:
          "クラウドコンピューティングは、インターネットを通じて、サーバーやストレージなどのコンピューティングリソースをオンデマンドで提供するサービス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'SaaS（Software as a Service）',
      question: 'SaaSを説明したものはどれか。',
      ans: 'SaaS',
      choices: [
        "コンピュータ設備の利用をサービスとして提供し，使用料を課金する。",
        "情報システム部門の機能の一部を受託し，業務委託料を課金する。",
        "ソフトウェアの機能を複数の企業にインターネット経由でサービスとして提供し，使用料を課金する。",
        "ソフトウェアをダウンロードさせる対価としてライセンス料を課金する。"
      ],
      comment:
          "SaaS（Software as a Service）は、ソフトウェアをインターネット経由でサービスとして提供し、ユーザーがオンラインでアクセスして利用するモデル。",
      source: '平成21年春期 問6',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'PaaS（Platform as a Service）',
      question: '開発プラットフォームをインターネットを通じてサービスとして提供するモデルを何というか？',
      ans: 'PaaS',
      choices: ["SaaS", "PaaS", "IaaS", "DaaS"],
      comment:
          "PaaS（Platform as a Service）は、アプリケーションの開発に必要なプラットフォームをインターネットを通じて提供するサービスモデル。開発ツールやデータベース管理システムなどが含まれる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'IaaS（Infrastructure as a Service',
      question: 'インフラストラクチャ（サーバーやストレージなど）をインターネットを通じてサービスとして提供するモデルを何というか？',
      ans: 'IaaS',
      choices: ["PaaS", "IaaS", "DaaS", "ASP"],
      comment:
          "IaaS（Infrastructure as a Service）は、サーバーやストレージ、ネットワークなどのコンピューティングインフラストラクチャをインターネット経由で提供するサービスモデル。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'DaaS（Desktop as a Service）',
      question: 'デスクトップ環境をインターネットを通じてサービスとして提供するモデルを何というか？',
      ans: 'DaaS',
      choices: ["IaaS", "DaaS", "SaaS", "PaaS"],
      comment:
          "DaaS（Desktop as a Service）は、仮想化技術を用いてデスクトップ環境をインターネット経由で提供するサービスモデル。ユーザーは場所を選ばずに同じデスクトップ環境にアクセス可能。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ASP（Application Service Provider）',
      question: 'ASPの説明として，適切なものはどれか。',
      ans: 'サーバ上のアプリケーションソフトウェアを，インターネット経由でユーザーに提供する事業者，又はそのサービス形態',
      choices: [
        "インターネットに接続できる通信回線を提供する事業者，又はそのサービス形態",
        "会員になったユーザーが閲覧できる，閉じたコミュニティを形成するインターネットサービス",
        "サーバ上のアプリケーションソフトウェアを，インターネット経由でユーザーに提供する事業者，又はそのサービス形態",
        "情報システムをハードウェアやソフトウェアといった製品からの視点ではなく，ユーザーが利用するサービスという視点から構築していこうとする考え方"
      ],
      comment:
          "ASP（Application Service Provider）は、業務用のアプリケーションをインターネットを通じて、顧客にレンタルする事業者のことで、サービス利用側には、購入や新規開発よりもコストを低く抑えることができることやシステム管理の負担が少なくなる。",
      source: '平成22年春期 問13',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'ホスティングサービス',
      question: '専門業者の通信設備やサーバの一部を利用者が利用できるサービスはどれか。',
      ans: 'ホスティングサービス',
      choices: ["SaaS", "システム開発の受託", "ハウジングサービス", "ホスティングサービス"],
      comment:
          "ホスティングサービスは、ウェブサイトをインターネット上で公開するために必要なサーバーをレンタルし、その運用を代行するサービス。",
      source: '平成23年秋期 問5',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'ハウジングサービス',
      question: 'ハウジングサービスを利用することによって得られる効果として，最も適切なものはどれか。',
      ans: 'ハウジングサービス',
      choices: [
        "業務アプリケーションの利用，導入，更新に関する費用を低減することができる。",
        "サーバの購入費用や運営負荷，ネットワークに関する費用を低減することができる。",
        "サーバや社内のコンピュータのOSやオフィスソフトの更新作業を回避することができる。",
        "自社サーバによるサービス提供に必要なネットワークや施設に関する費用を低減することができる。"
      ],
      comment:
          "ハウジングサービスとは、顧客の通信機器や情報発信用のコンピュータ(サーバ)を、自社の回線設備の整った施設に設置するサービスで、通信業者やプロバイダが行っている。",
      source: '平成22年春期 問22',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'オンプレミス',
      question: '企業が自社のデータセンター内に物理的なサーバーとストレージを設置し、自己管理するIT運用モデルを何というか？',
      ans: 'オンプレミス',
      choices: ["クラウドコンピューティング", "オンプレミス", "SaaS", "IaaS"],
      comment:
          "オンプレミスは、企業が自社の物理的施設内にITインフラを持ち、自身で全てを管理する運用モデル。データのコントロールとセキュリティが必要な場合に選ばれる。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'PoC（Proof of Concept）',
      question: '新技術や製品の実現可能性を検証するために行う、初期の試験運用を何というか？',
      ans: 'PoC',
      choices: ["PoC", "プロトタイピング", "パイロットテスト", "ベータテスト"],
      comment:
          "PoC（Proof of Concept）は、新技術やサービスのコンセプトが実現可能であるかを確認するための初期段階のテスト。通常、大規模な投資を行う前に実施される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'SOA(Service Oriented Architecture)',
      question:
          'SOA(Service Oriented Architecture)とは，サービスの組合せでシステムを構築する考え方である。SOAを採用するメリットとして，適切なものはどれか。',
      ans: '柔軟性のあるシステム開発が可能となる。',
      choices: [
        "システムの処理スピードが向上する。",
        "システムのセキュリティが強化される。",
        "システム利用者への教育が不要となる。",
        "柔軟性のあるシステム開発が可能となる。"
      ],
      comment:
          "SOA(Service Oriented Architecture)は、業務上の一処理に相当するソフトウェアで実現されている機能や部品を独立したサービスとし、それらを組み合わせ連携させることで全体のシステムを構築するという設計手法。",
      source: '平成26年春期 問3',
      importance: QuizImportanceType.high,
    ),
  ];
  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category1Index + 2001);
  });
}
