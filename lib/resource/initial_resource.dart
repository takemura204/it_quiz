class I18n {
  static I18n? _instance;

  I18n._();

  factory I18n() => _instance ??= I18n._();

  String get appName => "toridori base";
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

  ///#region エラーメッセージ

  String get errorInvalidUri => "通信に失敗しました。無効なパラメータです";
  String get errorInvalidRequest => "通信に失敗しました。無効なリクエストです";
  String get errorTimeout => "通信に失敗しました。ネットワーク環境を確認のうえ、もう一度お試しください";
  String get errorUnknown => "通信に失敗しました";
  String get errorLineIdentifyFailed => "LINE認証に失敗しました";
  String get errorAppleIdentifyFailed => "Apple認証に失敗しました";
  String get errorAppleIdentifyUnavailable => "Apple認証を利用できません";
  String get errorAppleAuthorizationFailed => "Appleアカウントを確認できませんでした。";
  String get errorAppleCredentialsFailed => "Appleアカウントとの連携に失敗しました";
  String get errorAppleNotSupported => "Appleログインがサポートされていません";
  String get errorAppleUnknown => "Appleログインに失敗しました";
  String get errorAuthFailed => "認証に失敗しました";
  String get errorSignUpFailed => "アカウントの作成に失敗しました";
  String get errorFormIdCopyFailed => "コピーに失敗しました";
  String get errorGenresLoadFailed => "ジャンルを取得できませんでした";
  String get errorUrlHandlingFailed => "画面を開けませんでした";
  String get errorRouteNotFound => "お探しのページは見つかりませんでした";
  String get errorOfferLoadFaild => "オファーの読み込みに失敗しました";
  String get errorClipUpdateFailed => "お気に入りの更新に失敗しました";
  String get errorClipsGetFailed => "お気に入りの読み込みに失敗しました";
  String get errorOfferReportLoadFaild => "報告の読み込みに失敗しました";
  String get errorOfferReportNotFound => "報告が見つかりませんでした";
  String get errorCampaignLoadFailed => "キャンペーンの読み込みに失敗しました";
  String get errorCampaignApplyFailed => "キャンペーンへの応募に失敗しました";
  String get errorPaymentsLoadFailed => "振り込み予定の読み込みに失敗しました";
  String get errorOfferAcceptProposeEmpty => "来店日時が選択されていません";
  String get errorMapApplicationsAreEmpty => "マップアプリが見つかりませんでした";
  String get errorMapApplicationsOpenFailed => "マップアプリの起動に失敗しました";
  String get errorNotificationLoadFailed => "告知の読み込みに失敗しました";
  String get errorAnnouncementLoadFailed => "告知の読み込みに失敗しました";
  String get errorInformationsLoadFailed => "お知らせの読み込みに失敗しました";
  String get errorOfferInformationsLoadFailed => "履歴の読み込みに失敗しました";
  String get errorBanksLoadFailed => "銀行の読み込みに失敗しました";
  String get errorBankBranchsLoadFailed => "支店の読み込みに失敗しました";
  String get errorOfferInformationsEmpty => "履歴はありません";
  String get errorOfferMessageEmpty => "メッセージを入力してください";
  String get errorCampaignUnApplicableByThisReason =>
      "このキャンペーンには応募できません。理由は次のとおりです";
  String get errorCampaignUnApplicableBySnsConnects =>
      "このキャンペーンに応募するには%sのアカウントを連携させる必要があります。SNSの連携に移りますか?";
  String get errorCampaignUnApplicableByProfileInvalidAddress =>
      "本人確認のため、このキャンペーンに応募するには住所登録が必要です。住所の入力に移りますか？";
  String get errorCampaignUnApplicableByProductInvalidAddress =>
      "このキャンペーンに応募するには、商品を受け取るための住所を入力する必要があります。住所の入力に移りますか？";
  String get errorCampaignUnApplicableByInvalidBank =>
      "このキャンペーンに応募するには、報酬を受け取るための銀行情報を入力する必要があります。銀行情報の入力に移りますか？";
  String get errorOfferScheduleProposeDateTooMany => "提案できる日時は%dつまでです";
  String get errorOfferScheduleProposeDateDuplicated => "同じ日時を追加済みです";
  String get errorOfferScheduleProposeDateTooLess => "1つ以上の日程を提案してください";
  String get errorOfferReportPostFailed => "完了報告の提出に失敗しました";
  String get errorOfferReportPostUrlRequired => "投稿のURLを入力してください";
  String get errorOfferReportPostUrlMustHttp => "投稿のURLにはhttpから始まるURLを入力してください";
  String get errorOfferReportPosturlInvalid =>
      "投稿のURLがURL形式ではありません。入力内容を確認してください";
  String get errorOfferReportPostCommentRequired => "担当者へのコメントを入力してください";
  String get errorOfferReportPostImagesEmpty => "投稿に使用した画像は1枚以上添付してください";
  String get errorOfferReportCheckRequired => "スクロールして全ての項目にチェックしてください。";
  String get errorOfferMessagePostFailed => "メッセージの送信に失敗しました";
  String get errorSnsContentsAreEmpty =>
      "最近の投稿が見つかりませんでした。\n投稿のURLと写真を自分で入力し、報告を続けてください";
  String get errorMediaUrlOpenFailed => "PRしてほしいアカウントを開けませんでした";
  String get errorSnsConnectUrlOpenFailed => "SNSアカウントを開けませんでした";
  String get errorSnsConnectUrlNotFound => "SNSアカウントが連携されていません";
  String get errorShareImageGenerateFailed => "共有用の画像を生成できませんでした";
  String get errorDynamicLinkCopyFailed => "共有用のリンクを生成できませんでした";
  String get errorOfferReportEditSnsContentImageLoadFailed =>
      "残りの写真を読み込めませんでした。写真を自分で入力する画面に移ります";
  String get errorOpenUrlFailed => "URLを開けませんでした";
  String get errorOfferReportImageAddFailed => "画像を追加できませんでした";
  String get errorFilePickNotSingle => "選択できるファイルは1つまでです";
  String get errorOfferReportImageMax => "添付できる画像は3枚までです";
  String get errorContactFailed => "お問い合わせの送信に失敗しました";
  String get errorPermissionPhotosIos => "アルバムから選択できません。";
  String get errorPermissionPhotosBodyIos =>
      "アルバムから写真を選択するために、設定で写真へのアクセスを許可してください";
  String get errorPermissionCamera => "カメラを使用できません";
  String get errorPermissionCameraBodyIos => "写真を撮影するために、設定でカメラへのアクセスを許可してください";
  String get errorFirebaseAppInitializeFailed =>
      "アプリの起動に失敗しました（Code: 1）。時間をおいてもう一度お試しください";
  String get errorOfferScheduleProposeFailed => "日程の提案に失敗しました";
  String get errorInfluencerGetFailed => "インフルエンサー情報の読み込みに失敗しました";
  String get errorMessageUnavaible => "終了したやりとりにメッセージを送信することはできません";
  String get errorInfluencerIssueUpdateFailed => "対応完了の報告に失敗しました";
  String get errorAppVersionsGetFailed => "バージョン情報の読み込みに失敗しました";
  String get errorOfferDetailAbortRequestFailed => "取引キャンセルの申請に失敗しました";
  String get errorOfferScheduleAcceptPostFailed => "日程の確定に失敗しました";
  String get errorOfferScheduleProposePostFailed => "日程の提案に失敗しました";
  String get errorOfferScheduleProposeAskPostFailed => "日程のおまかせに失敗しました";
  String get errorOfferVisitInformPostFailed => "来店の報告に失敗しました";
  String get errorOfferAcceptCancelPostFailed => "取引キャンセルへの同意に失敗しました";
  String get errorOfferDeclineCancelPostFailed => "取引キャンセルの報告に失敗しました";
  String get errorOfferWithdrawCancelPostFailed => "取引キャンセルの取り下げに失敗しました";
  String get errorOfferDetailMessageLoadingImage => "画像の読み込み中です";
  String get errorOfferDetailImageAttachFailed =>
      "画像の読み込みに失敗しました。時間をおいてもう一度お試しください";
  String get errorSettingsSnsConnectReleaseFailed1 =>
      "SNS連携の解除に失敗しました（Code: 1）";
  String get errorSettingsSnsConnectReleaseFailed2 =>
      "SNS連携の解除に失敗しました（Code: 2）";
  String get errorOpenTermsFailed => "利用規約は読み込み中です";
  String get errorOpenPrivacyPolicyFailed => "プライバシーポリシーは読み込み中です";
  String get errorSettingsSnsTwitterConnectFailed1 =>
      "Twitter連携に失敗しました（Code: 1）";
  String get errorSettingsSnsTwitterConnectFailed2 =>
      "Twitter連携に失敗しました（Code: 2）";
  String get errorSettingsSnsTwitterConnectFailed3 =>
      "Twitter連携に失敗しました（Code: 3）";
  String get errorSettingsSnsTwitterConnectFailed4 =>
      "Twitter連携に失敗しました（Code: 4）";
  String get errorSettingsSnsTwitterConnectFailed5 =>
      "Twitter連携に失敗しました（Code: 5）";
  String get errorSettingsSnsYoutubeConnectFailed1 =>
      "Youtube連携に失敗しました（Code: 1）";
  String get errorSettingsSnsYoutubeConnectFailed2 =>
      "Youtube連携に失敗しました（Code: 2）";
  String get errorSettingsSnsYoutubeConnectFailed3 =>
      "Youtube連携に失敗しました（Code: 3）";
  String get errorSettingsSnsYoutubeConnectFailed4 =>
      "Youtube連携に失敗しました（Code: 4）";
  String get errorApplyInstagramFailed => "$instagramの申請に失敗しました";
  String get errorApplyInstagramApprovalRequestingNow =>
      "この$instagramアカウントはすでに審査提出済みです。審査完了をお待ち下さい";
  String get errorFacebookPickupAccountUpdateFailed =>
      "Facebookの再認証に失敗しました。\n\n問題が続く場合は$staffへお問い合わせください。";
  String get errorFacebookErrorNoInstagram => "$instagramを認識できません";
  String get errorFacebookAccountPickupNoInstagram =>
      "$appName はこのFacebookページにリンクされている$instagramを認識できません。Facebookページと$instagramアカウントのリンク状況を確認してください";
  String get errorFacebookLoginLackedPermission =>
      "$appName で$instagramを利用するには次のアクセス許可が必要です。\n\n%s";
  String get errorFacebookAccountPickupNotSelected =>
      "$instagramアカウントが選択されていません";
  String get errorFacebookLoginDownloadMovieFailed => "動画をダウンロードできませんでした";
  String get errorLeaveRequestNeedReason => "退会理由が必要です";
  String get errorLeaveRequestPostFailed => "申請に失敗しました";
  String get errorLeaveAvailableGetFailed => "退会可能かの確認に失敗しました";
  String get errorAddressGetFailed => "住所の自動入力に失敗しました。";

  ///#endregion

  ///#region メッセージ

  String get messageOfferWillDeadIn => "あと%d日以内に対応してください";
  String get messageOfferNeedsScheduling => "日程を提案してください";
  String get messageOfferMessageHint => "なにか聞きたいことがあれば質問してみましょう";
  String get messageCampaignsNotFound => "ここでは閲覧したキャンペーンの履歴を確認できます";
  String get messageNotificationNotFound => "お知らせが見つかりませんでした";
  String get messageOfferHistoriesNotFound => "オファーの履歴を取得できませんでした";
  String get messageSettingsCaution =>
      "未入力の情報が%d件あります。情報を入力することで、キャンペーンに採用されやすくなります";
  String get messageSettingsProfileCaution =>
      "以下の情報は企業の方々が目にします。積極的に自分のことをアピールすることでキャンペーンに採用されやすくなります";
  String get messageSettingsAddressCaution => "商品発送時に利用する住所です。正確な入力にご協力ください";
  String get messageSignoutConfirm => "ログアウトしてもよろしいですか？";
  String get messageLoginEmailRequired => "メールアドレスまたはパスワードが入力されていません";
  String get messageSettingsNeedsBank => "先に銀行を選択してください";
  String get messageSettingsSnsRequiredProfile =>
      "SNS連携申請には氏名・フリガナ／プロフィール画像／生年月日の設定が必須です。プロフィールを設定後に、申請をお願いします。";
  String get messageOthersContactComplete =>
      "お問い合わせいただきありがとうございます。\n\nご指定のアドレスへ3営業日以内に運営よりご返答いたします。";
  String get messageOthersRequestComplete =>
      "ご協力いただき誠にありがとうございます。引き続き$appNameをご利用ください";
  String get messageCopiedCampaignHashtags => "$campaignPostFooterをコピーしました";
  String get messageNoCampaignHashtags => "設定されていません";
  String get messageCopiedCampaginRequestUrl => "PR希望アカウントをコピーしました";
  String get messageCopiedCampaginAddress => "住所をコピーしました";
  String get messageCopiedOfferMessage => "メッセージをコピーしました";
  String get messageCopiedMyOfferLink => "マイオファーリンクをコピーしました";
  String get messageCopiedAddress => "住所をコピーしました";
  String get messageMakeSureVisit => "日程調整後は必ず来店してください";
  String get messageMakeSureUnreachable => "ご自身の体験が難しいエリアへの応募はお控えください";
  String get messageMakeSurePreMessage => "採用前のメッセージでのやり取りは禁止です";
  String get messageMakeSureRunAway =>
      "ご自身で設定された応募辞退の期限までに採用された場合は、必ず進行をお願いします。";
  String get messageMakeSurePost => "SNSには必ず投稿するようにしてください";
  String get messageMakeSurePersist => "PR投稿は消したり、アーカイブしたり絶対にしないでください";
  String get messageMakeSureMercari => "当サービス経由で受け取った商品を転売することは禁止です";
  String get messageMakeSureItemAddress => "次の宛先に商品を発送します。間違いがないかどうか確認してください";
  String get messageMakeSureRewardBank => "次の口座に報酬を振り込みます。間違いがないかどうか確認してください";
  String get messageMakeSureRewardNoBank =>
      "銀行情報が登録されていません。報酬を受け取るには銀行情報を登録する必要があります";
  String get messageMakeSurePenalty => "下記を守れない場合、アカウントロックなどのペナルティが発生します";
  String get messagePleaseCheckTerm => "利用規約・プライバシーポリシーへの同意が必要です";
  String get messageAccountLocked =>
      "アカウントの利用が制限されています。このアカウントでは以下のことをできません。\n\n・キャンペーンへの応募\n\n詳しくは通知欄か、運営からのメッセージをご確認ください";
  String get messageProposeSchedule => "来店可能な日時を3個程度提案してください";
  String get messageSelectTime => "時間を選択";
  String get messageAcceptSchedule => "来店日時を1つ選択してください";
  String get messageOfferReportTimeline => "報告する投稿を選択してください";
  String get messageOfferReportComment => "報告の内容を入力してください";
  String get messageTimelineNotFound => "最近の投稿を取得できませんでした";
  String get messageOfferReportWasDinied =>
      "SNS投稿の報告が承認されませんでした。\n担当者からのコメントを確認してもう一度報告してください";
  String get messageMakeSureDeleteOfferReportImage => "写真を削除しますか？";
  String get messageOfferReportConfirmMercari => "当サービス経由で受け取った商品を転売することは禁止です";
  String get messageOfferReportConfirmPersist => "PR投稿の削除、アーカイブへの移動は禁止です";
  String get messageOfferReportConfirmConnectAccount =>
      "PR投稿は必ず当サービスに連携されているアカウントで行ってください";
  String get messageOfferReportConfirmSnsType => "投稿したSNSは%sで間違いありませんか？";
  String get messageOfferReportConfirmMediaTypeMovie => "投稿は画像ではなく動画で行いましたか？";
  String get messageOfferReportConfirmHashtags =>
      "$campaignPostFooterをすべて含めましたか？";
  String get messageOfferReportConfirmCampaign => "報告するキャンペーンに間違いはありませんか？";
  String get messageOfferReportConfirmPrPost =>
      "対象の商品・サービスに関係の無い内容を投稿に含めることは禁止です";
  String get messageOfferReportCautionCampaignName => "%sを体験した方へ";
  String get messageOfferTodoAlert =>
      "対応を怠ると信頼度が下がり、次回以降キャンペーンに応募できなくなることがあります";
  String get messageApplied => "応募しました";
  String get messagePaymentsAreEmpty =>
      "報酬がもらえるキャンペーンを完了させると、振り込みの金額や予定日を確認できるようになります";
  String get messagePaymentHistoriesAreEmpty =>
      "振り込みが完了すると、その履歴をここで確認することができます";
  String get messageDirectOfferArrived1 => "%sからオファーが届いています";
  String get messageDirectOfferArrived2 =>
      "この報酬額でオファーを受ける場合は「$labelOfferDirectAccept」を選択してください。辞退したいときは「$labelOfferDirectDecline」を選択してください";
  String get messageChooseMapApp => "マップアプリを選択してください";
  String get messageMatchedOffersEmpty =>
      "キャンペーンへの応募が採用されると、以降のやりとりをここで行えるようになります";
  String get messageUnMatchedOffersEmpty => "キャンペーンに応募すると、採用の結果をここで確認することができます";
  String get messageTodoOffersEmpty => "対応が必要なオファーはありません";
  String get messageValidateRequire => "入力してください";
  String get messageValidateMultiByteChatacter =>
      "ユーザネームには日本語が含まれません。ユーザネームではなく名前を入力していませんか？";
  String get messageValidateRealName => "スペースなしで入力してください";
  String get messageValidateRealNameFurigana => "スペースなしのカタカナで入力してください";
  String get messageValidationPostalcode => "7桁で入力してください";
  String get messageValidationTel => "10桁または11桁で入力してください";
  String get messageValidationBankAccountHolder => "カタカナで入力してください";
  String get messageValidationBankAccountNumber => "7桁もしくは8桁で入力してください";
  String get messageOfferScheduleAskConfirm => "日程提案を$advにおまかせします。よろしいですか？";
  String get messageOfferScheduleProposeConfirm => "次の来店日時を$advに提案します。よろしいですか？";
  String get messageOfferScheduleAcceptConfirm => "次の日時に来店します。よろしいですか？";
  String get messageOfferDirectDeclineConfirm => "オファーを辞退します。よろしいですか？";
  String get messageOfferDirectAcceptConfirm => "オファーを承諾します。よろしいですか？";
  String get messageOfferDirectDeclineCompleted => "オファーを辞退しました";
  String get messageOfferDirectAcceptCompleted => "オファーを承諾しました";
  String get messageOfferReportPostCompleted => "完了報告を提出しました";
  String get messageImageUploading => "写真をアップロードしています。この処理には時間がかかることがあります";
  String get messageDynamicLinkGenerating => "共有用のリンクを生成しています";
  String get messageDynamicLinkCopied => "共有用のリンクをコピーしました";
  String get messageShareImageGenerating =>
      "共有用の画像を生成しています。この処理には時間がかかることがあります";
  String get messageOfferReportEditSnsContentImageLoading => "残りの写真を読み込んでいます";
  String get messageHowToUseExcludeUnapplicable =>
      """あなたの情報とキャンペーンの設定を比較して、応募できないキャンペーンを表示しないようにします。
  
・性別が指定されている
・未成年の応募が禁止されている
・既に応募済みである
・指定のSNSを連携していない""";
  String get messageMaintenanceNow => "只今メンテナンスを行っております。ご不便をおかけしますが、しばらくお待ち下さい";
  String get messageValidateRequireContactEmail => "お問い合わせの返信を受け取るために必要です";
  String get messageValidateInCollectEmailFormat => "メールアドレスの形式が正しくありません";
  String get messageValidateRequireContactBody => "お問い合わせの内容を入力してください";
  String get messageDiscardEditingData => "編集中のデータがあります。破棄して戻りますか？";
  String get messageSearchFilterPlaceInHome => "自宅で商品を体験してPRします";
  String get messageSearchFilterPlaceOnSpot => "店舗やイベント会場に行き、現地での体験をPRします";
  String get messageOthersNotificationStatusSuccess =>
      "通知は有効です。応募の結果が出たときや、担当者からメッセージが届いたときにPush通知でお知らせします";
  String get messageOthersNotificationStatusWarn =>
      "応募の結果や、担当者からのメッセージを素早く知るために、Push通知を許可してください";
  String get messageOthersContactGoOfferDetail =>
      "やりとりの情報が必要です。\n\nメッセージ画面を開き、画面右上のメニューから「お問い合わせ」を選んで、次に進んでください";
  String get messageOthersContactGoIssueDetail =>
      "警告の情報が必要です。\n\n警告に心当たりが無い方は、「その他のお問い合わせ」からお問い合わせをお願いします。";
  String get messageOthersContactGoOfferReportDetail =>
      "やりとりの情報が必要です。\n\n心当たりのない方は、「その他のお問い合わせ」からお問い合わせをお願いします。";
  String get messageOthersContactCampaignGoCampaignDetail =>
      "キャンペーンの情報が必要です。\n\nキャンペーンの画面を開き、画面右上のメニューから「お問い合わせ」を選んで、次に進んでください";
  String get messageConsentNewTermUpdated =>
      "利用規約とプライバシーポリシーが更新されました。アプリの利用を続けるにはこれらに同意する必要があります";
  String get messageTutorial1 => "プロフィールとSNSを設定して、キャンペーンに応募する準備をしましょう";
  String get messageInfluencerLoading => "ユーザ情報を読み込んでいます";
  String get messageInfluencerIssueRosolveRequested =>
      "対応完了の報告を受け付けました。運営事務局の確認後、警告が解除されます。警告が解除されたときにPush通知でお知らせします";
  String get messageInfluencerIssueUnfair =>
      "対応できない理由がある場合は、お問い合わせでその内容をご連絡ください。お問い合わせに進みますか？";
  String get messageInfluencerIssueUpdateConfirm => "対応が完了したことを報告します。よろしいですか？";
  String get messageInformationsEmpty => "お知らせはありません";
  String get messageAnnouncementsEmpty => "運営からの告知はありません";
  String get messageInfluencerProfileImagePostSending =>
      "プロフィール画像をアップロードしています。この処理には時間がかかることがあります";
  String get messageMakeSureFollowOurInstagram =>
      "$appName のInstagramアカウントをフォローしましたか？";
  String get messageMakeSureYourInstagramName =>
      "Instagramアカウントはこちらで間違いありませんか？";
  String get messageMakeSureRejectUnlessFollowed =>
      "$appName のInstagramアカウントをフォローしていない場合、SNS審査は不合格となります。予めご了承ください";
  String get messageReviewNavigation =>
      "ご利用ありがとうございます！\nレビューで星をつけていただけると、サービス改善の励みになります！";
  String get messageMessageWillUnavailable =>
      "完了報告提出後、$advが完了報告を承認すると、お互いにメッセージを送信できなくなります。予めご了承ください";
  String get messageAppVersionExpired =>
      "お使いのバージョンは%sをもって利用できなくなりました。最新バージョンにアップデートをお願いします";
  String get messageAppVersionRestartAfterUpdate =>
      "※アップデート後も画面が切り替わらない場合はこちらをタップしてください";
  String get messageAppVersionRestartAfterUpdateHighlight => "こちら";
  String get messageFacebookIntroduceGuide1 => "下記案内に従ってご進行ください。";
  String get messageFacebookIntroduceGuide2 =>
      "Facebookアカウントをお持ちでない方はまずご自身のFacebookアカウントをご作成ください。\nhttps://apps.apple.com/jp/app/facebook/id284882215\n\n※既にFacebookアカウントをお持ちの方は「次へ」からお進み下さい。";
  String get messageFacebookIntroduceGuide3 =>
      "Instagramの設定からプロアカウント（クリエイターアカウントまたはビジネスアカウント）に変更します。\n\n詳細はこちら: https://sites.google.com/collatech.co.jp/facebook/%E3%83%97%E3%83%AD%E3%82%A2%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88%E5%A4%89%E6%9B%B4%E6%96%B9%E6%B3%95?authuser=0\n\n※既にInstagramアカウントがプロアカウントの方は「次へ」からお進み下さい。";
  String get messageFacebookIntroduceGuide4 =>
      "ご自身のInstagramとFacebookページの連携をお願いします。\n\n詳細はこちら: https://sites.google.com/collatech.co.jp/facebook/facebook%E3%83%9A%E3%83%BC%E3%82%B8%E9%80%A3%E6%90%BA%E6%89%8B%E9%A0%86?authuser=0";
  String get messageFacebookIntroduceGuide5 =>
      "上記手順を全て終えた方は$appNameアプリとご自身のFacebookページの連携行ってください。";
  String get messageFacebookLoginGuideDescription =>
      "Facebookページと連携したInstagramアカウントと$appNameを認証してください。";
  String get messageFacebookLoginGuideTop => "Facebook認証の流れ";
  String get messageFacebookLoginGuide1 => "Facebook認証を開始してください";
  String get messageFacebookLoginGuide2 =>
      "ご自身の連携したいInstagramアカウントが選択されているか確認し「次へ」";
  String get messageFacebookLoginGuide3 =>
      "連携したいInstagramアカウントと連携されているFacebookページを選択し「次へ」";
  String get messageFacebookLoginGuide4 => "全ての項目でアクセスを許可して下さい。";
  String get messageFacebookLoginCanceled => "ログインがキャンセルされました。";
  String get messageFacebookLoginFacebookFailed =>
      "Facebook認証に失敗しました。Facebookで一時的な障害が発生している可能性があります。時間をおいてもう一度お試しください";
  String get messageFacebookLoginGraphApiFailed =>
      "Instagramアカウントの読み込みに失敗しました。問題が続く場合は$staffへお問い合わせください";
  String get messageFacebookConnectedReAuthAccount =>
      "ありがとうございます！\n\nFacebookの再認証が完了しました！";
  String get messageAppliedInstagram =>
      "Instagramの申請を受け付けました。審査完了までお待ちください。審査には1週間ほどお時間をいただきます";
  String get messageSelectEntryApprovalDeadline => "応募辞退期限を設定：%s";
  String get messageCampaignEntryConfirmDecline => "辞退しますか？";
  String get messageCampaignEntryCompleteDecline => "辞退が完了しました。";
  String get messageOfferNextActionsAreEmpty => "あなたに行える操作がある場合、ここに表示されます";
  String get messageOfferDetailTransitionCancel =>
      "※認識の相違で申請されてしまった場合は、$advにメッセージで取引キャンセル申請の取り下げを連絡してください";
  String get messageOfferDetailNoMessage => "メッセージはありません";
  String get messageOfferCancelDescription1 =>
      "$advに取引キャンセルを申請できます。申請可能な条件はこちらをご確認ください。";
  String get messageOfferCancelDescription1Highlight => "申請可能な条件はこちら";
  String get messageOfferCancelDescription2 =>
      "キャンセル時は事前にキャンセルの旨をメッセージで連絡してください。";
  String get messageOfferCancelDescription2Highlight => "事前にキャンセルの旨をメッセージで連絡";
  String get messageOfferCancelDescription3 =>
      "申請後、$advがキャンセルに同意すると取引キャンセルが完了します。";
  String get messageOfferAbortRequestedNew => "取引キャンセルを申請しました";
  String get messageOfferInformVisitConfirm =>
      "来店を報告し、PR投稿の準備に移ります。この状態では$offerCouponの提示や日程調整のやり直しが行なえません。よろしいですか？";
  String get messageOfferInformVisitAddConfirm =>
      "確定した来店日時より早い報告となります。本当によろしいですか？";
  String get messageOfferRescheduleDescription1 =>
      "やむを得ない事情で当日の対応が出来なくなった場合、別の日程を再提案することができます。";
  String get messageOfferRescheduleDescription2 =>
      "必ず$advにメッセージで説明した上で、再提案にお進み下さい。";
  String get messageOfferRescheduleDescription2Highlight => "メッセージで説明";
  String get messageOfferRescheduleDescription3 =>
      "事前説明なしの一方的な再提案は、ペナルティ対象になる場合があります。";
  String get messageOfferAcceptCancelConfirm => "キャンセルに同意し、取引を終了させます。よろしいですか？";
  String get messageOfferDeclineCancelConfirm =>
      "注意事項に従っていない取引キャンセルを運営に報告します。運営事務局による確認が終わり次第、取引は終了します。よろしいですか？";
  String get messageOfferWithdrawCancelConfirm =>
      "取引キャンセルを取り下げ、元の状態に戻します。よろしいですか？";
  String get messageOfferDetailMessageImageDeleteConfirm =>
      "添付画像を削除します。よろしいですか？";
  String get messageOfferScheduleAcceptConfirm2 => "来店日時を %s で確定させます。よろしいですか？";
  String get messageOfferSubmitReportConfirm =>
      "入力した内容で完了報告を提出します。よろしいですか？\n\n※完了報告提出後、$advが完了報告を承認すると、お互いにメッセージを送信できなくなります。予めご了承ください";
  String get messageOfferTicketForShopStaff =>
      "この画面は、来店者が toridori marketing で採用されたインフルエンサーであることを確認するためのチケットです。%sさんにサービス提供をお願いします。";
  String get messageOfferMessageItemLongTap => "※長押しするとキャンペーンを直接開けます";
  String get messageOfferDetailNoTicket =>
      "※このキャンペーンにチケットはありません。来店時は、$advの指示に従って本人確認を行ってください";
  String get messageSettingsSnsLineRequired1 =>
      "$appName の利用には公式LINEのお友達追加が必要です。お済みでない方は、お友達追加をしてからSNS連携へとお進みください。";
  String get messageSettingsSnsLineRequired2 =>
      "公式LINEでは、よくある質問や、インフルエンサー活動に役立つ情報を受け取ることが出来ます。";
  String get messageClipCampaignsEmpty =>
      "表示できるキャンペーンがありません\n※公開期間の終了したキャンペーンは表示されません";
  String get messageFacebookErrorNotIntegrated =>
      "$appName で$instagramを利用するには、Facebook認証が必須になりました。早めのFacebook認証をお願いします。";
  String get messageFacebookErrorExpired =>
      "Facebook認証の有効期間（約3ヶ月）が終了しました。$appName で$instagramの利用を続けるために、Facebookの再認証をお願いします。";
  String get messageInsightsPermissionRequest =>
      "最新バージョンにアップグレードする場合は、「Facebook再認証に進む」を押してください。";
  String get messageFacebookErrorNoPages1 =>
      "$appName はあなたのFacebookページにアクセスできません。$instagramの利用を続けるために、修復が必要です。";
  String get messageFacebookErrorNoPages2 =>
      "■Facebookページを削除していませんか？ $appName で $instagramの利用にはFacebookページが必要です。";
  String get messageFacebookErrorNoPages3 =>
      "■$appName へのアクセス許可を変更しましたか？ $instagramを利用するためには「管理しているページリストを表示」と「ページに投稿されたコンテンツを読む」のアクセス許可が必要です。";
  String get messageFacebookErrorLackedInstagramProAccounts1 =>
      "$appName はあなたの$instagramにアクセスできません。$instagramの利用を続けるために、修復が必要です。";
  String get messageFacebookErrorLackedInstagramProAccounts2 =>
      "■$instagram を個人用アカウントに切り替えましたか？ $appName で利用する $instagramはプロアカウントである必要があります。";
  String get messageFacebookErrorLackedInstagramProAccounts3 =>
      "■$appName へのアクセス許可を変更しましたか？ $instagramの利用には「Instagramプロフィール情報と投稿にアクセス」のアクセス許可が必要です。";
  String get messageFacebookErrorLackedInstagramProAccounts4 =>
      "■Facebookページと$instagramのリンクを解除しましたか？$appName で利用する$instagramはFacebookページとリンクしておく必要があります。";
  String get messageFacebookErrorAppNotInstalled1 =>
      "$appName はあなたのFacebookページにアクセスできません。$instagramの利用を続けるために、修復が必要です。";
  String get messageFacebookErrorAppNotInstalled2 =>
      "■Facebookアカウントと$appNameのビジネス統合を削除していませんか？ 削除した場合は、Facebookの再認証に進むことで修復することができます。";
  String get messageFacebookErrorPasswordChanged1 =>
      "$appName はあなたのFacebookページにアクセスできません。";
  String get messageFacebookErrorPasswordChanged2 =>
      "■Facebook認証の状態が初期化されました。お手数ですが再認証をお願いします。";
  String get messageFacebookErrorUnconfirmedUser1 =>
      "$appName はあなたのFacebookページにアクセスできません。$instagramの利用を続けるために、修復が必要です。";
  String get messageFacebookErrorUnconfirmedUser2 =>
      "■Facebookアカウント状態は正常ですか？ Facebookアカウントの状態を確認するページに進むと、修復できる可能性があります。";
  String get messageFacebookErrorFacebookError1 =>
      "$appName はあなたの$instagramにアクセスできません。";
  String get messageFacebookErrorFacebookError2 =>
      "Facebookに一時的な障害が発生している可能性があります。問題が続く場合は、お手数ですが$staffまでお問い合わせください。";
  String get messageFacebookErrorToridoriError1 =>
      "$appName はあなたの$instagramにアクセスできません。";
  String get messageFacebookErrorToridoriError2 =>
      "想定外のエラーが発生しました。問題が続く場合は、お手数ですが$staffまでお問い合わせください。";
  String get messageCampaignDetailFacebookErrorDescription =>
      "Facebook認証の済んでいない$instagramアカウントでは応募ができなくなりました";
  String get messageOfferReportEditFacebookErrorDescription =>
      "Facebook認証が有効でない$instagramアカウントでは、投稿の一覧を表示できなくなりました。";
  String get messageFacebookLoginAnotherFacebookAccount =>
      "Facebookアカウントの変更方法を確認する";
  String get messageFacebookPickupAccountCurrentInstagram =>
      "次の$instagramアカウントが$appName に登録されています。登録とは異なる$instagramアカウントを選ぶとエラーが発生しますのでご注意ください。";
  String get messageSettingsSnsFacebookNotIntegrated =>
      "Facebook認証していない$instagramアカウントは利用できなくなりました。早めの認証をお願いします。";
  String get messageSettingsSnsFacebookInvalid =>
      "$appName はあなたの$instagramアカウントにアクセスできません。詳細を確認して、問題を修復してください。";
  String get messageSettingsSnsInsightsPermissionError =>
      "再認証を行い、最新バージョンにアップグレードをお願いします。アップグレードすると応募できるキャンペーンが増えます。";
  String get messageSettingsSnsApprovalRequest =>
      "SNSアカウントを審査に提出しました。審査完了をお待ち下さい。";
  String get messageFacebookPickupAccountNoPages1 =>
      "$appName からアクセス可能なFacebookページが0件なため、$instagramアカウントを表示できません。";
  String get messageFacebookPickupAccountAccessDenied =>
      "$instagramアカウントを認識できません";
  String get messageFacebookLoginUrlCopied => "動画URLをコピーしました";
  String get messageFacebookLoginMovieAvailable => "認証手順を\n動画で確認できます";
  String get messageFacebookLoginPleaseDownload =>
      "※ダウンロードしてから再生するとアプリ操作と並行して再生できます";
  String get messageCampaignBrowsedHistoryInfo =>
      "※アプリをアンインストールするとリセットされます\n※公開期間の終了したキャンペーンは表示されません";
  String get messageHomeNotificationAnnouncementEmpty => "告知はありません";
  String get messageHomeNotificationNotificationEmpty => "お知らせはありません";
  String get messageOfferReportEditFacebookLaterAvailable =>
      "Facebook認証必須化以前に応募した$offerに関しては、画像とURLを自分で入力して完了報告を提出できます。完了報告の提出に進みますか？\n\n※通常の$offerで先に進むとエラーが発生します";
  String get messageCampaignDetailYoutubePromotion => "※PR表記の方法は注意事項を参照してください";
  String get messageLeaveRequestDesc => """【注意事項】
・二度とアカウント復元はできません。
・同一SNSアカウントによる新規アカウントの作成はできません。""";
  String get messageLeaveRequestFinalConfirmDialog => "退会申請を送信します";
  String get messageLeaveRequestPostSuccess => "退会を受け付けました。ご利用ありがとうございました";
  String get messageLeaveRequestLeaveNotAvailable =>
      "退会申請にあたり問題があります。問題を解決後再度お試しください。";
  String get messageInstagramInsightItem => "%s数 %s";
  String get messageFollowerCount => "%sフォロワー";
  String get messageCampaignPostFooterNotice =>
      "「PR」という文字が含まれている場合、これを編集・削除しないでください。完了報告時にエラーが発生し、投稿の修正が必要となります";
  String get messageOfferReportEditFailedPr1 =>
      "PR表記を確認できなかったため、完了報告を提出できませんでした。";
  String get messageOfferReportEditFailedPr2 => "PR表記が小文字になっていませんか？";
  String get messageOfferReportEditFailedPr3 => "PR表記の前後に別の文字が含まれていませんか？";
  String get messageOfferReportEditFailedPr4 =>
      "PR表記のルールを確認の上、投稿を修正してからもう一度お試しください。";
  String get messageOfferReportEditTimelineInstagramMissing =>
      "投稿が表示されませんか？詳しくは$labelKotiraをご確認ください";
  String get messageOfferReportEditTimelineInstagramMissingDetail1 =>
      "次の形式の投稿は一覧に表示されません。";
  String get messageOfferReportEditTimelineInstagramMissingDetail2 => "リール投稿";
  String get messageOfferReportEditTimelineInstagramMissingDetail3 => "IGTV投稿";
  String get messageOfferReportEditTimelineInstagramMissingDetail4 =>
      "著作権で保護されている画像が含まれている投稿";
  String get messageOfferReportEditTimelineInstagramMissingDetail5 =>
      "次の形式の投稿は一覧に表示されません。";
  String get messageOfferReportEditTimelineInstagramMissingDetail6 =>
      "これらの投稿で完了報告を行いたい場合は、お問い合わせより$labelOfferReportUrlと$labelOfferReportCommentをご連絡ください。";
  String get messageOfferReportEditTimelineInstagramMissingDetailGoContact =>
      "お問い合わせに進む";
  String get messageOtherContactOfferReportBodyCaution =>
      "※$labelOfferReportUrlと$labelOfferReportCommentを問い合わせ内容に含めてください。";
  String get messageFacebookIntroduceLineSupport => "LINEでのオンラインサポートも受け付けています";

  //ハッシュタグ検索
  String get searchTagAppBarTextFieldHint => "キャンペーンを検索";
  String get searchRecommendedTag => "おすすめから探す";
  String get searchHistory => "検索履歴";
  String get searchKeyword => "キーワードから探す";
  String get containNotExistTag => "存在しないタグが含まれています";

  String get searchResult => "検索結果";
  String get notFoundCampaign => "該当するキャンペーンが見つかりませんでした";

  ///#endregion メッセージ

  ///#region ラベル

  String get labelKotira => "こちら";
  String get labelRetry => "リトライ";
  String get labelUnknown => "不明";
  String get labelOk => "OK";
  String get labelDecision => "決定";
  String get labelCancel => "キャンセル";
  String get labelConfirm => "確認";
  String get labelWarning => "確認";
  String get labelError => "エラー";
  String get labelYes => "はい";
  String get labelNext => "次へ";
  String get labelBack => "戻る";
  String get labelLater => "あとで";
  String get labelCaution => "注意事項";
  String get labelOfferReportUrl => "投稿URL";
  String get labelOfferReportComment => "担当者へのコメント";
  String get labelMoreOfferMessage => "過去のメッセージを表示";
  String get labelNoMoreOfferMessage => "最初のメッセージを表示しています";
  String get labelCampaignDetailWithThisOffer => "やりとり中のキャンペーン";
  String get labelSubmit => "送信する";
  String get labelHomeCampaigns => "ホーム";
  String get labelHomeSearch => "探す";
  String get labelHomeOffers => "オファー";
  String get labelHomeClips => "お気に入り";
  String get labelHomeNotification => "お知らせ";
  String get labelNonReardCampaigns => "無料で楽しむ";
  String get labelRewardCampaigns => "報酬をもらう";
  String get labelFiltering => "条件を変更する";
  String get searchCampaignByHashTag => "#タグで検索";
  String get labelFollowerLimit => "%s人以上";
  String get labelCampaignPeriod => "%sまで";
  String get labelHomeFilterSns => "SNS";
  String get labelHomeFilterGenre => "ジャンル";
  String get labelHomeFilterArea => "体験する場所";
  String get labelHomeFilterNotSelected => "すべて";
  String get labelHomeFilterTopic => "おすすめ\nポイント";
  String get labelHomeFilterTopic2 => "おすすめポイント";
  String get labelHomeFilterApplicable => "応募できないキャンペーンを表示しない";
  String get labelHomeFilterHasReward => "報酬がもらえるキャンペーンだけ表示する";
  String get labelClear => "クリア";
  String get labelSubmitFilter => "探す";
  String get labelExpiredLineOneYear => "1年後";
  String get labelExpiredLineHalfYear => "半年後";
  String get labelExpiredLineThreeMonths => "3ヶ月後";
  String get labelExpiredLineOneMonths => "1ヶ月後";
  String get labelExpiredLineTwoWeeks => "2週間後";
  String get labelExpiredLineTenDays => "10日後";
  String get labelCampaignEntryExpiredRemain => "採用期限: 残り%s日";
  String get labelSelectExpiredLineTitle =>
      "【応募辞退期限の設定】\n自動で応募辞退する期限を設定してください。";
  String get labelProfileProgress => "プロフィール充実度%.0f%%";
  String get labelHomeMenuProfileSettings => "プロフィール設定";
  String get labelHomeMenuSnsConnectSettings => "SNSアカウント連携";
  String get labelHomeMenuSnsCampaignEntries => "応募したキャンペーン";
  String get labelHomeMenuRewards => "振り込み予定の確認";
  String get labelHomeMenuMyOfferLink => "マイオファーリンク";
  String get labelHomeMenuOthers => "その他";
  String get labelHomeMenuFacebookCampaign => "フォーム入力IDはこちら";
  String get labelHomeMenuInformation => "お知らせ";
  String get labelRequiredSettingsProfileImage => "プロフィール画像の入力";
  String get labelRequiredSettingsBirthday => "生年月日の入力";
  String get labelRequiredSettingsRealName => "氏名の入力";
  String get labelSettingsProfile => "プロフィール情報";
  String get labelSettingsName => "名前・生年月日";
  String get labelSettingsAddress => "住所・電話番号";
  String get labelSettingsBank => "振込先";
  String get labelSettingsProfileImage => "プロフィール画像";
  String get labelSettingsProfileImageButton => "変更する";
  String get labelSettingsProfileCropFinish => "完了";
  String get labelSettingsProfileCropCancel => "キャンセル";
  String get labelSettingsProfileImageActionSheetMessage => "選択してください";
  String get labelSettingsProfileImageActionSheetCancel => "キャンセル";
  String get labelSettingsProfileImageActionSheetLibrary => "ライブラリから選ぶ";
  String get labelSettingsProfileImageActionSheetCamer => "カメラで撮る";
  String get labelSettingsProfileName => "ニックネーム";
  String get labelSettingsProfileActiveArea => "主な活動エリア";
  String get labelSettingsProfileComment => "プロフィール文";
  String get labelSettingsProfileCommentHint =>
      "興味関心、好きなことや、SNSを使う上で心がけていることなど、あなたのことをできる限り教えてください";
  String get labelSettingsProfileTag => "マイタグ";
  String get labelSettingsProfileTagDescription => "あなたを表すハッシュタグを自由に設定してください";
  String get labelSettingsProfileTagHint => "ファッション";
  String get labelSettingsAddressSubtitle => "住所";
  String get labelSettingsAddressPostalcode => "郵便番号";
  String get labelSettingsAddressPrefecture => "都道府県";
  String get labelSettingsAddressCity => "市区町村";
  String get labelSettingsAddressCityTokyo => "23区またはその他の市区町村";
  String get labelSettingsAddressAddress1 => "住所";
  String get labelSettingsAddressAddress2 => "建物名・部屋番号";
  String get labelSettingsAddressSubtitle2 => "電話番号";
  String get labelSettingsAddressTel => "電話番号";
  String get labelSettingsSubmit => "変更を保存する";
  String get labelSettingsNameRealname => "氏名";
  String get labelSettingsNameRealnameFuriana => "フリガナ";
  String get labelSettingsNameGender => "性別";
  String get labelSettingsNameBirthday => "生年月日";
  String get labelSettingsSnsConfirmTitle => "連携にあたって";
  String get labelSettingsSnsConfirmSubmit => "連携する";
  String get labelSettingsSnsLink => "連携する";
  String get labelSettingsSnsLinkInProgress => "%s（審査中）";
  String get labelSettingsSnsLinkComplete =>
      "申請を受け付けました。審査完了までお待ちください。審査には1週間ほどお時間をいただきます";
  String get labelSettingsSnsNoChannelsError => "Youtubeチャンネルのあるアカウントを選択してください";
  String get labelSettingsSnsUnlink => "解除する";
  String get labelSettingsSnsUnlinkConfirm => "SNS連携を解除します。よろしいですか？";
  String get labelSettingsSnsUnlinkComplete => "連携を解除しました";
  String get labelSettingsSnsLinkInProgressMessage => "現在審査中です。審査完了までお待ちください";
  String get labelSettingsInstagramSubtitle => "Instagram連携の方法";
  String get labelSettingsInstagramCaution =>
      "審査はフォロワー数に限らず、総合的に判断させていただいております。審査基準、および不合格理由につきましてはお問い合わせいただいても一切お答えすることができませんので予めご了承ください";
  String get labelSettingsInstagramDescription1 =>
      "SNS審査期間中は、本人確認のため$appName公式Instagramアカウントをフォローして下さい。※審査終了後のアカウントフォローは任意となります。";
  String get labelSettingsInstagramDescription2 =>
      "あなたのInstagramのユーザネームを教えて下さい";
  String get labelSettingsInstagramDescription3 =>
      "1, 2が完了したら、以下のボタンを押してアカウント審査申請を行ってください";
  String get labelSettingsInstagramSubmit => "審査申請する";
  String get labelSettingsInstagramOpenApp => "$appNameのアカウントを開く";
  String get labelSettingsInstagramNameHint => "@toridoribase";
  String get labelSettingsInstagramHelperHint => "@toridoribase";
  String get labelSettingsBankSubtitle => "振込先の情報";
  String get labelSettingsBankName => "銀行";
  String get labelSettingsBankAccountType => "口座種別";
  String get labelSettingsBankBranch => "支店";
  String get labelSettingsBankAccountHolder => "口座名義";
  String get labelSettingsBankAccountNumber => "口座番号";
  String get labelSettingsBankCautionTitle => "注意事項";
  String get labelSettingsBankCautionBody =>
      "・報酬はあなたの口座に株式会社トリドリから支払います\n・報酬が支払われるのは、キャンペーンの依頼会社が承認した月の月末から翌々月の15日です\n(例 : 7月13日に承認→7月31日に確定→9月15日にお振込)\n・報酬が振り込まれるのは累計5,000円以上となります\n・2019年4月1日以降に完了した投稿報酬のお支払いは税別600円の振込手数料が発生いたします";
  String get labelSettingsBankAccountNumberHint => "【例】1234567(数字7桁)";
  String get labelSettingsBankAccountHolderHint => "【例】ヤマダハナコ";
  String get labelSettingsBankBranchSearchHint => "支店番号または支店名で検索";
  String get labelInfluencerLinkSubtitle => "あなたのマイオファーリンク";
  String get labelInfluencerLinkSubtitle2 => "マイオファーリンクとは";
  String get labelInfluencerLinkCopyUrl => "リンクをコピーする";
  String get labelInfluencerLinkDescription => "あなた専用のお仕事依頼フォームです";
  String get labelInfluencerLinkDescription2 =>
      "マイオファーリンクをSNSのプロフィール欄に貼るだけで、お仕事の依頼を$appNameで管理できるようになります";
  String get labelInfluencerLinkDescription3 => "SNSのプロフィールにリンクを設置する";
  String get labelInfluencerLinkDescription4 => "企業からのオファーが届きます";
  String get labelOfferMessageSend => "送信する";
  String get labelOthersMenuNotification => "通知設定";
  String get labelOthersMenuContact => "お問い合わせ";
  String get labelOthersMenuRequest => "アプリへの要望";
  String get labelOthersMenuFAQLine => "FAQ（公式LINE）";
  String get labelOthersMenuTerms => "利用規約";
  String get labelOthersMenuPrivacyPolicy => "プライバシーポリシー";
  String get labelOthersMenuOSSLicense => "ライセンスを表示";
  String get labelOthersMenuCrashlytics => "（デバッグ用）Crashlytics確認";
  String get labelOthersMenuRemoteConfig => "（デバッグ用）Remote Config確認";
  String get labelOthersMenuSignout => "（デバッグ用）ログアウト";
  String get labelOthersNotificationChangeStatus => "通知をオンにする";
  String get labelOthersContactLink => "よくある質問";
  String get labelOthersContactCaution1 => "お問い合わせの前に";
  String get labelOthersContactCaution2 => "をご確認ください";
  String get labelOthersContactHelper => """具体的な内容を記入するとやりとりをスムーズに進められます。
  
例: 6月に採用された焼き肉コラボ@渋谷の件について、2週間前から返信がありません
""";
  String get labelOthersContactEmail => "メールアドレス";
  String get labelOthersContactBody => "お問い合わせ内容";
  String get labelOthersContactType => "お問い合わせの種類";
  String get labelOthersContactOffer => "キャンペーン";
  String get labelOthersContactIssue => "警告";
  String get labelOthersContactCampaign => "キャンペーン";
  String get labelOthersContactSubmit => "送信する";
  String get labelOthersContactBodyHint => "お問い合わせ内容をお書きください";
  String get labelOthersContactComplete => "お問い合わせを受け付けました";
  String get labelOthersContactTypeHint => "お問い合わせの種類を選んでください";
  String get labelOthersRequestBody => "内容";
  String get labelOthersRequestBodyHint =>
      "$appNameをご利用いただき誠にありがとうございます。アプリの改善・機能追加要望がございましたら、お気軽にご回答ください。いただいたご意見を参考にさせていただきます。ご返信が必要な場合には機能要望からではなく、お問い合わせページより送信ください";
  String get labelOthersRequestSubmit => "送信する";
  String get labelOthersRequestComplete =>
      "ご協力いただき誠にありがとうございます。引き続き$appNameをご利用ください";
  String get labelWantInfluencer => "あなたにやってほしいこと";
  String get labelPostProcess => "SNS投稿までの手順";
  String get labelAttention => "PRに関する注意事項";
  String get labelPrDetails => "PRの概要";
  String get labelCampaignFollowerLimitFormat => "フォロワー%s人以上";
  String get labelCampaignOfferEndedFormat => "%sまで";
  String get labelApplyThisCampaignLong => "このキャンペーンに応募する";
  String get labelApplyThisCampaign => "応募する";
  String get labelCanNotApplyThisCampaignLong => "このキャンペーンには応募できません";
  String get labelCanNotApplyThisCampaign => "応募できません";
  String get labelCampaignDetailAppliedLong => "応募しました";
  String get labelCampaignDetailApplied => "応募しました";
  String get labelCampaignDetailDeclineLong => "辞退する";
  String get labelCampaignDetailDecline => "辞退する";
  String get labelCampaignDetailApprovedLong => "採用されました";
  String get labelCampaignDetailApproved => "採用されました";
  String get labelCampaignReward => "このキャンペーンの報酬額";
  String get labelSponsorService => "サービスの内容";
  String get labelSponsorServicePrice => "本来の提供価格";
  String get labelSponsorServiceUrl => "参考リンク";
  String get labelCampaignTarget => "ご協力いただきたい方";
  String get labelCampaignWithCompanion => "同伴者";
  String get labelCampaignOfferPeriod => "募集期間";
  String get labelCampaignAddress => "住所";
  String get labelOpenCampaginAddress => "地図アプリで開く";
  String get labelCamapginPrOwner => "会社名";
  String get labelCamapginShare => "PRについて";
  String get labelCampaignMediaType => "PR方法の指定";
  String get labelCampaginPostFooter => campaignPostFooter;
  String get labelCampaignMediaUrl => "PR指定アカウント";
  String get labelCampaignMediaDesignation => "必ず投稿に含める内容";
  String get labelCampaignReservationHeader => "日程調整と本人確認の方法";
  String get labelCampaignApplyConfirmSecondSubmit => "確認しました";
  String get labelRecommendedCampaigns => "おすすめのキャンペーン";
  String get labelEnsureConfirmAndPrivacyPolicy1 => "利用規約";
  String get labelEnsureConfirmAndPrivacyPolicy2 => "プライバシーポリシー";
  String get labelEnsureConfirmAndPrivacyPolicy3 => "に同意します";
  String get labelLineLogin => "LINEで登録・ログイン";
  String get labelEmailLogin => "メールアドレスでログイン";
  String get labelCatchPhrase => "インフルエンサーと企業がつながるサービス";
  String get labelLoginEmailEmail => "メールアドレス";
  String get labelLoginEmailPassword => "パスワード";
  String get labelLoginEmailSubmit => "ログインする";
  String get labelSignupName => "インフルエンサー名";
  String get labelSignupNameRealname => "氏名";
  String get labelSignupNameRealnameFuriana => "フリガナ";
  String get labelSignupNameGender => "性別";
  String get labelSignupNameBirthday => "生年月日";
  String get labelSignUp => "アカウントを作成する";
  String get labelOfferScheduleProposeSubmit => "提案する";
  String get labelOfferScheduleAsk => "相手におまかせ";
  String get labelOfferScheduleAnothorPropose => "別の日程を提案する";
  String get labelOfferScheduleAccept => "この日時に来店する";
  String get labelOfferReportImageNext => "確認して次へ";
  String get labelOfferReportCommentNext => "確認画面へ";
  String get labelOfferReportConfirmNext => "報告する";
  String get labelOfferReportCaution => "PRする前に必ず確認してください";
  String get labelUpdate => "更新";
  String get labelOfferReReportReReportComment => "担当者からのコメント（長押しで全文確認）";
  String get labelOfferReportImage => "投稿に使用した画像を3枚まで添付してください";
  String get labelOfferReportEditUrl => "投稿のURLを入力してください";
  String get labelOfferReportEditComment => "担当者へのコメントを入力してください";
  String get labelOfferReportCommentHint =>
      "（例）部屋の窓際に光が当たるように配置して綺麗に見せました。この度は採用していただきありがとうございました";
  String get labelOfferReportFinalCheck => "最終チェック";
  String get labelOfferReportConfirmSubmit => "報告する";
  String get labelShowOfferReport => "報告内容を確認する";
  String get labelOfferReportPosted => "報告日時";
  String get labelSearchCount => "%d件の検索結果";
  String get labelOfferReportTutorialShareInstagram => "InstagramでURLをコピーする方法";
  String get labelOfferReportTutorialShareInstagram1 => "投稿の「...」ボタンを押す";
  String get labelOfferReportTutorialShareInstagram2 => "メニューからリンクをコピーを選択";
  String get labelOfferReportTutorialShareStoriesInstagram =>
      "ハイライトのURLをコピーする方法";
  String get labelOfferReportTutorialShareStoriesInstagram1 =>
      "ハイライトを開いて、右下の「...」ボタンを押す";
  String get labelOfferReportTutorialShareStoriesInstagram2 =>
      "メニューからリンクをコピーを選択";

  String get labelCopy => "コピーする";
  String get labelPaymentsTotal => "振り込み予定の合計";
  String get labelPaymentsTotalTaxIncluded => "振り込み金額は税別です";
  String get labelPaymentsTotalNotice => "この金額から手数料が引かれた額が振り込まれます";
  String get labelPaymentHistories => "過去の振り込みを確認する";
  String get labelPaymentsOnThisMonth => "%sに振り込み予定";
  String get labelPaymentsOnPastMonth => "%sに振り込まれました";
  String get labelShowPaymentOffer => "確認する";
  String get labelPaymentOccurredDate => "振り込み確定日";
  String get labelPaymentReward => "金額";
  String get labelPaymentOffer => "やりとり";
  String get labelOfferScheduleProposeAdd => "日程の候補を追加する";
  String get labelAdv => "担当者";
  String get labelOfferDirectReward => "提案された報酬額";
  String get labelOfferDirectAccept => "承諾する";
  String get labelOfferDirectDecline => "辞退する";
  String get labelOfferVisitDate => "来店日時";
  String get labelOfferVisitAddress => "来店場所";
  String get labelCampaignItemAvailable => "次の商品を無償で体験することができます";
  String get labelCampaignItemAvailableCaution => "商品の発送には住所の入力が必要です";
  String get labelCamppaignEntryCount => "過去に%d回採用されました";
  String get labelTodoOffersFound => "対応の必要なやりとりが%s件あります";
  String get labelShowTodoOffers => "確認する";
  String get labelOfferUnreadCount => "%s件の未読メッセージがあります";
  String get labelOfferScheduleAskSubmit => "担当者におまかせする";
  String get labelOfferScheduleAcceptSubmit => "この日時に来店する";
  String get labelOfferScheduleProposeCompleted => "来店日時を提案しました";
  String get labelOfferScheduleAskCompleted => "$advに日程提案をおまかせしました";
  String get labelOfferScheduleAcceptCompleted => "来店日時を確定させました";
  String get labelOfferDirectShowCampaign => "キャンペーンを確認する";
  String get labelOfferMessageDeleteImageConfirm => "添付画像を削除しますか？";
  String get labelOpenWithSns => "%sで開く";
  String get labelOfferMenuReport => "SNS投稿の報告を見る";
  String get labelOfferMenuCampaign => "キャンペーンを開く";
  String get labelOfferMenuInformation => "進行の履歴を確認する";
  String get labelContactEmailHint => "collabobase@gmail.com";
  String get labelSearchFilterPlaceInHome => "自宅で体験";
  String get labelSearchFilterPlaceOnSpot => "現地で体験";
  String get labelCampaignApplyConfirmEditAddress => "住所を修正する";
  String get labelCampaignApplyConfirmEditBank => "銀行情報を修正する";
  String get labelCampaignApplyAnnotationPaymentMonth =>
      "※お振り込みは、完了報告承認月の翌々月の15日(営業日)となります";
  String get labelPermissionSetting => "設定画面へ";
  String get labelOfferMenuContact => "お問い合わせ";
  String get labelOfferMenuCopyAddress => "自分の住所情報をコピーする";
  String get labelCampaignMenuContact => "お問い合わせ";
  String get labelCampaignMenuDecline => "辞退する";
  String get labelConsentSubmit => "同意して続ける";
  String get labelTutorialSubmit => "$appNameを始める";
  String get labelInfluencerGoToIssues => "確認する";
  String get labelInfluencerIssuesCount => "%d件の警告があります。至急対応してください";
  String get labelInfluencerIssuesEmpty => "警告はありません";
  String get labelInfluencerIssuesHint => "この警告についてお問い合わせする";
  String get labelInformationInformation => "あなたへのお知らせ";
  String get labelInformationAnnouncements => "運営からの告知";
  String get labelLoginAppleSignInButtonTips => "LINEを持っていない方はこちら";
  String get labelReviewNavigationAccept => "星をつけて応援する";
  String get labelReviewNavigationLater => "あとで";
  String get labelReviewNavigationDeny => "断る";
  String get labelAppVersionGoStore => "アップデートはこちらから";
  String get labelDoNotShowAgain => "次回以降表示しない";
  String get labelFacebookLoginGuide1 =>
      "$appNameにInstagramを連携するにはFacebook認証が必要です。";
  String get labelFacebookLoginGuide2 => "Facebookアカウントを作成する";
  String get labelFacebookLoginGuide3 => "Instagramアカウントをプロアカウントに変更する";
  String get labelFacebookLoginGuide4 => "Facebookページを作成・ご自身のInstagramアカウントと連携";
  String get labelFacebookLoginGuide5 => "$appNameアプリとFacebookページを連携する";
  String get labelFacebookPickupThisAccount => "選択したアカウントで連携する";
  String get labelCopyFormId => "フォーム入力Idをコピーする";
  String get labelUnread => "未読";
  String get labelOfferDetailShowDetail => "詳細を確認する";
  String get labelOfferDetailOtherActions => "その他の操作";
  String get labelOfferTransitionSubActions => "その他%s件の操作があります";
  String get labelOfferDetailTransitionCancel => "取引キャンセルに関する注意事項";
  String get labelOfferReportRewriteComment => "$advからの修正依頼";
  String get labelOfferReportInfluencerComment => "$influencerのコメント";
  String get labelOfferDetailTransition => "PR投稿までの手順";
  String get labelOfferDetailLatestMessage => "メッセージ";
  String get labelOfferDetailShowAllMessage => "詳細を見る";
  String get labelOfferDetailShowNoMessage => "メッセージを送る";
  String get labelOfferTransitionShowInfluencerCancelCaution =>
      "担当者視点の注意事項を確認する";
  String get labelOfferAbortRequestSubmit => "申請する";
  String get labelOfferVisitInformCompleted => "来店を報告しました";
  String get labelOfferRescheduleSubmit => "再提案に進む";
  String get labelOfferAcceptCancelCompleted => "取引キャンセルに同意しました";
  String get labelOfferDeclineCancelCompleted =>
      "取引キャンセルを報告しました。運営事務局による確認をお待ち下さい";
  String get labelOfferWithdrawCancelCompleted => "取引キャンセルを取り下げました";
  String get labelOfferDetailShowTicket => "チケットを表示する";
  String get labelOfferTicketForShopStaff => "店舗の担当者の方へ";
  String get labelOfferTicketLastRefreshed => "チケットを開いた日時: %s";
  String get labelOfferDetailOpenReportSns => "%s を開く";
  String get labelOfferWorking => "進行中";
  String get labelCampaignDetailWorkingOffer => "進行中のオファー";
  String get labelSettingsSnsLineRequired => "公式LINEを友だち追加";
  String get labelFacebookErrorNextNotIntegrated => "Facebook認証のやり方を見る";
  String get labelFacebookErrorNextExpired => "Facebook再認証に進む";
  String get labelInsightsPermissionRequestNext => "Facebook再認証に進む";
  String get labelFacebookErrorNextNoPages => "Facebook認証の方法を再確認する";
  String get labelFacebookErrorLater => "画像とURLを自分で入力する";
  String get labelFacebookPickupAccountPageName => "Facebookページ";
  String get labelFacebookPickupAccountInstagramName => "$instagramアカウント";
  String get labelFacebookPickupAccountInstagramFollowers => "$instagramフォロワー数";
  String get labelFacebookErrorCurrentInstagram => "アクセスできない$instagramアカウント";
  String get labelFacebookErrorShowFacebookAccountStatus =>
      "Facebookアカウントの状態を確認する";
  String get labelFacebookErrorShowFacebookAccountStatusHint =>
      "※ブラウザでのログインが必要です";
  String get labelPromoteSNSConnectionDialogTile => "SNS連携して応募しよう！";
  String get labelPromoteSNSConnectionDialogOkButton => "SNS連携画面に行く";
  String get labelPromoteSNSConnectionDialogCancelButton => "後で";
  String get labelSettingsSnsFacebookLoading => "Facebook認証を確認しています";
  String get labelSettingsSnsFacebookValid => "Facebook認証は有効です";
  String get labelSettingsSnsFacebookNotIntegrated => "Facebook認証が必要です";
  String get labelSettingsSnsFacebookNotIntegratedShowMore => "認証の流れを見る";
  String get labelSettingsSnsFacebookInvalid => "Facebook認証に問題があります";
  String get labelSettingsSnsFacebookInvalidShowMore => "詳細を確認する";
  String get labelSettingsSnsInsightsPermissionError =>
      "Facebook認証のバージョンが古い状態のようです。";
  String get labelSettingsSnsInsightsPermissionErrorShowMore => "詳細を確認する";
  String get labelFacebookPermissionInstagramBasic =>
      "Instagramプロフィール情報と投稿にアクセス";
  String get labelFacebookPermissionPageShowList => "管理しているページリストを表示";
  String get labelFacebookPermissionPagesReadEngagement => "ページに投稿されたコンテンツを読む";
  String get labelFacebookPermissionInstagramManageInsights =>
      "ページにリンクされているInstagramアカウントのインサイトにアクセスできます";
  String get labelFacebookPermissionPagesManageMetadata =>
      "ページのアカウント、設定、Webhooksを管理します";
  String get labelFacebookLoginShowHowToMovie => "やり方を動画で確認する";
  String get labelFacebookLoginDownloadFaqMovie => "動画をダウンロードする";
  String get labelFacebookErrorExpiredOtherReason => "有効期間終了の他の理由について";
  String get labelFacebookLoginNetworkLostErrorTips =>
      "「ネットワーク接続が切れました」というエラーについて";
  String get labelFacebookErrorExpiredTips => "再認証の手順について";
  String get labelInsightsPermissionRequestTips => "再認証の手順について";
  String get labelCampaignBrowsedHistory => "閲覧したキャンペーン";
  String get labelHomeNotificationAnnouncementSection => "運営からの告知";
  String get labelHomeNotificationNotificationSection => "あなたへのお知らせ";
  String get labelHomeNotificationLegacyNotificationButton => "以前のお知らせはこちら";
  String get labelHomeNotificationUnreadDivider => "新着ここまで";
  String get labelOfferReportEditFacebookLaterAvailable =>
      "Facebook必須化以前の$offerについて";
  String get labelOfferReportInstagramStoriesEditImageTitle =>
      "投稿のスクリーションショットを3枚まで添付してください";
  String get labelOfferReportEditInstagramStoriesUrlTitle =>
      "投稿を含むハイライトのURLを入力してください";
  String get labelOfferReportEditInstagramStoriesUrlTitleNotice =>
      "※ブラウザでコピーしたURLは使用できません";
  String get labelCampaignApplyDoneGuideButton => "今後の流れについてはこちらをクリック！";
  String get labelAdGuidelineButton => appName + "広告ガイドライン";
  String get labelOthersMenuLeaveRequest => "退会申請";
  String get labelLeaveRequestLeaveReason => "退会理由";
  String get labelLeaveRequestSubmitButton => "申請する";
  String get labelSupportFacebookLogin => "サポートはこちら";
  String get labelOfferReportEditShowPrRule => "PR表記のルールを確認する";
  String get labelOfferReportEditUrlDisabled => "編集不可";
  String get labelOfferReportEditUrlPaste => "長押しで貼り付け";

  ///#endregion

  ///#region 画面タイトル

  String get titleOfferDetail => "やりとりを進める";
  String get titleHomeSearch => "キャンペーンを探す";
  String get titleHomeClip => "お気に入り";
  String get titleHomeNotification => "お知らせ";
  String get titleHomeFilter => "条件を指定して探す";
  String get titleCampaignEntries => "応募したキャンペーン";
  String get titleInformations => "お知らせを確認する";
  String get titleOfferInformations => "進行の履歴を確認する";
  String get titleSettings => "設定";
  String get titleCampaignApplyConfirm => "応募前にご確認ください";
  String get titleSettingsProfile => "プロフィールを設定する";
  String get titleSettingsActiveArea => "活動エリアを設定する";
  String get titleSettingsName => "名前・生年月日を設定する";
  String get titleSettingsAddress => "住所・電話番号を設定する";
  String get titleSettingsEmail => "メールアドレスを設定する";
  String get titleSettingsSns => "SNSを連携する";
  String get titleSettingsInstagram => "Instagramを連携する";
  String get titleMyOfferLink => "マイオファーリンクを確認する";
  String get titleSettingsBank => "銀行口座を設定する";
  String get titleSettingsBankSearch => "銀行を選択する";
  String get titleOthers => "その他";
  String get titleOthersNotification => "通知の設定";
  String get titleOthersContact => "お問い合わせ";
  String get titleOthersRequest => "アプリへの要望";
  String get titleSignUp => "アカウントを作成する";
  String get titleLoginEmail => "メールアドレスでログイン";
  String get titleOfferSchedulePropose => "日程を提案する";
  String get titleOfferScheduleAccept => "日程を選択する";
  String get titleOfferReport => "PR投稿を報告する";
  String get titleOfferReReport => "SNS投稿の修正を報告する";
  String get titleOfferReportRubbing => "SNS投稿の報告を確認する";
  String get titleOfferReportCaution => "SNS投稿の注意事項";
  String get titleOfferReservation => "来店の際の確認事項";
  String get titleGenreCampaigns => "キャンペーン一覧";
  String get titleOffers => "やりとりの管理";
  String get titleTodoOffers => "対応が必要なオファー";
  String get titlePayments => "振り込みの予定を確認する";
  String get titlePaymentsHistories => "過去の振り込みを確認する";
  String get titleDirectOfferEdit => "オファーの内容を確認する";
  String get titleOfferScheduleProposeConfirm => "来店日時を提案します";
  String get titlePickerDialog => "操作を選択してください";
  String get titleImagePickerDialog => "画像を選択してください";
  String get titleImagePickerDialogWithMax => "画像を%d枚まで選択してください";
  String get titlePickupCampaigns => "キャンペーン一覧";
  String get titleInfluencerIssues => "警告を確認する";
  String get titleSnsApplyConfirm => "申請前にご確認ください";
  String get titleConfirm => "確認";
  String get titlePick => "選択してください";
  String get titleFacebookIntroduce => "$appNameのご利用にあたって";
  String get titleFacebookLogin => "Facebook認証";
  String get titleFacebookPickupAccount => "連携アカウントの選択";
  String get titleFacebookCampaign => "Facebook認証キャンペーン";
  String get titleSnsPickYoutubeChannel => "Youtubeチャンネルを選択";
  String get titleOfferTransitionHistory => "やりとりの履歴";
  String get titleOfferCancelConfirm => "取引キャンセルについて";
  String get titleOfferRescheduleConfirm => "日程調整のやり直しについて";
  String get titleOfferReportEdit1 => "報告する投稿を選ぶ";
  String get titleOfferReportEdit2 => "担当者へのコメントを書く";
  String get titleOfferReportEdit3 => "最終確認（%d/%d）";
  String get titleOfferReportEdit4 => "完了報告を提出する";
  String get titleFacebookErrorNotIntegrated => "Facebook認証が必要です";
  String get titleFacebookErrorNotExpired => "Facebookの再認証が必要です";
  String get titleInsightsPermissionRequest => "Facebookの再認証が必要です";
  String get titleFacebookErrorNoPages => "Facebookページに\nアクセスできません";
  String get titleFacebookErrorLackedInstagramProAccounts =>
      "$instagramに\nアクセスできません";
  String get titleCampaignBrowsedHistory => "閲覧したキャンペーン";
  String get titleAnnouncement => "運営からの告知";
  String get titleLeaveRequest => "退会申請";
  String get titleLeaveRequestFinalConfirmDialog => "最終確認";
  String get titleInstagramLatestInsight => "%sのインサイト";

  ///#endregion
}
