class MyOrderModel {
  int? orderId;
  String? cartId;
  double? totalPrice;
  double? userPayPrice;
  double? discountPrice;
  double? deliverPrice;
  int? deliverType;
  int? paymentType;
  int? paymentStatus;
  int? orderStatus;
  int? status;
  String? createdDate;
  String? names;
  List<String>? images;
  String? userName;
  String? phone;
  String? address;
  String? city;
  String? state;
  String? postalCode;

  MyOrderModel(
      {this.orderId,
        this.cartId,
        this.totalPrice,
        this.userPayPrice,
        this.discountPrice,
        this.deliverPrice,
        this.deliverType,
        this.paymentType,
        this.paymentStatus,
        this.orderStatus,
        this.status,
        this.createdDate,
        this.names,
        this.images,
        this.userName,
        this.phone,
        this.address,
        this.city,
        this.state,
        this.postalCode});

  MyOrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    cartId = json['cart_id'];
    totalPrice = double.tryParse("${json['total_price']}");
    userPayPrice = double.tryParse("${json['user_pay_price']}");
    discountPrice = double.tryParse("${json['discount_price']}");
    deliverPrice = double.tryParse("${json['deliver_price']}");
    deliverType = json['deliver_type'];
    paymentType = json['payment_type'];
    paymentStatus = json['payment_status'];
    orderStatus = json['order_status'];
    status = json['status'];
    createdDate = json['created_date'];
    names = json['names'];
    images = (json['images'] as String? ?? "").split(",");
    userName = json['user_name'];
    phone = json['phone'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postal_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['order_id'] = orderId;
    data['cart_id'] = cartId;
    data['total_price'] = totalPrice;
    data['user_pay_price'] = userPayPrice;
    data['discount_price'] = discountPrice;
    data['deliver_price'] = deliverPrice;
    data['deliver_type'] = deliverType;
    data['payment_type'] = paymentType;
    data['payment_status'] = paymentStatus;
    data['order_status'] = orderStatus;
    data['status'] = status;
    data['created_date'] = createdDate;
    data['names'] = names;
    data['images'] = images?.join(",") ?? "";
    data['user_name'] = userName;
    data['phone'] = phone;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['postal_code'] = postalCode;
    return data;
  }
}