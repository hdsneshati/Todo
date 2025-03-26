class Todo{
  final String title;//یک‌بار مقداردهی می‌شوند و تغییر نمی‌کنند
  final String subtitle;
  bool isDone;

  Todo({
    this.title="",
    this.subtitle="",
    this.isDone=false,

  });

  Todo copyWith({//نسخه‌ای جدید از یک شیء ایجاد کنیم بدون اینکه مقدار اصلی تغییر کند.
    String ?title,// می‌تواند مقدار null بگیرد
    String ?subtitle,
    bool?isDone,
  }) {
    return Todo(
      title: title?? this.title,//اگر مقدار جدید  ارسال شود، از آن استفاده می‌شود. اگر مقدار جدید نال باشد، مقدار قبلی  حفظ می‌شود.
      subtitle: subtitle?? this.subtitle,
      isDone: isDone?? this.isDone,
    );
  }
}
