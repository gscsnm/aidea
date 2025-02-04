/// 服务器支持的能力信息
class Capabilities {
  /// 是否支持 Apple Pay
  final bool applePayEnabled;

  /// 是否支持支付宝
  final bool alipayEnabled;

  /// 是否支持翻译
  final bool translateEnabled;

  /// 是否支持邮箱
  final bool mailEnabled;

  /// 是否支持 OpenAI
  final bool openaiEnabled;

  /// 首页显示的模型信息
  final List<HomeModel> homeModels;

  /// 是否显示首页模型描述
  final bool showHomeModelDescription;

  /// 首页路由
  final String homeRoute;

  /// 是否支持 Websocket
  final bool supportWebsocket;

  /// 是否显示绘玩
  final bool disableGallery;

  /// 是否支持创作岛
  final bool disableCreationIsland;

  /// 是否禁用数字人
  final bool disableDigitalHuman;

  /// 是否禁用聊天
  final bool disableChat;

  Capabilities({
    required this.applePayEnabled,
    required this.alipayEnabled,
    required this.translateEnabled,
    required this.mailEnabled,
    required this.openaiEnabled,
    required this.homeModels,
    this.homeRoute = '/chat-chat',
    this.showHomeModelDescription = true,
    this.supportWebsocket = false,
    this.disableGallery = false,
    this.disableCreationIsland = false,
    this.disableDigitalHuman = false,
    this.disableChat = false,
  });

  factory Capabilities.fromJson(Map<String, dynamic> json) {
    return Capabilities(
      applePayEnabled: json['apple_pay_enabled'] ?? false,
      alipayEnabled: json['alipay_enabled'] ?? false,
      translateEnabled: json['translate_enabled'] ?? false,
      mailEnabled: json['mail_enabled'] ?? false,
      openaiEnabled: json['openai_enabled'] ?? false,
      homeModels: ((json['home_models'] ?? []) as List<dynamic>)
          .map((e) => HomeModel.fromJson(e))
          .toList(),
      homeRoute: json['home_route'] ?? '/chat-chat',
      showHomeModelDescription: json['show_home_model_description'] ?? true,
      supportWebsocket: json['support_websocket'] ?? false,
      disableGallery: json['disable_gallery'] ?? false,
      disableCreationIsland: json['disable_creation_island'] ?? false,
      disableDigitalHuman: json['disable_digital_human'] ?? false,
      disableChat: json['disable_chat'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'apple_pay_enabled': applePayEnabled,
      'alipay_enabled': alipayEnabled,
      'translate_enabled': translateEnabled,
      'mail_enabled': mailEnabled,
      'openai_enabled': openaiEnabled,
      'home_models': homeModels.map((e) => e.toJson()).toList(),
      'home_route': homeRoute,
      'show_home_model_description': showHomeModelDescription,
      'support_websocket': supportWebsocket,
      'disable_gallery': disableGallery,
      'disable_creation_island': disableCreationIsland,
      'disable_digital_human': disableDigitalHuman,
      'disable_chat': disableChat,
    };
  }
}

/// 首页显示的模型信息
class HomeModel {
  /// 模型名称
  final String name;

  /// 模型 ID
  final String modelId;

  /// 模型描述
  final String desc;

  /// 模型代表色
  final String color;

  /// 是否是强大的模型
  final bool powerful;

  HomeModel({
    required this.name,
    required this.modelId,
    required this.desc,
    required this.color,
    this.powerful = false,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        name: json["name"],
        modelId: json["model_id"],
        desc: json["desc"] ?? '',
        color: json["color"] ?? 'FF67AC5C',
        powerful: json['powerful'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "model_id": modelId,
        "desc": desc,
        "color": color,
        "powerful": powerful,
      };
}
