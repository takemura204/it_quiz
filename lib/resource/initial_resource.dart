class I18n {
  static I18n? _instance;

  I18n._();

  factory I18n() => _instance ??= I18n._();

  String get appName => "検定Quiz";

  String get campaignPostFooter => "投稿の最後に貼り付ける内容";

  String get offer => "やりとり";

  String get todoList => "やることリスト";

  String get influencer => "あなた";

  String get adv => "担当者";

  String get staff => "運営事務局";

  String get campaign => "キャンペーン";

  String get offerCoupon => "チケット";

  String get offerCancel => "取引キャンセル";

  String get instagram => "Instagram";

  ///#region よく使う文言
  String get commonShowMore => "もっと見る";
}
