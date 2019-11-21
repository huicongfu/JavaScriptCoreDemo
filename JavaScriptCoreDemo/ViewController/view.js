 (function() {
  return render();
  })();

//JS标签类
function Label(rect,text,color) {
    this.rect = rect;
    this.text = text;
    this.color = color;
    this.typeName = "LabelTest";
}

//JS Rect类
function Rect(x,y,width,height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
}

//渲染方法 界面的渲染写在这里
function render() {
    var rect = new Rect(20,100,280,30);
    var label = new Label(rect,"Hello World","0xff0000");
    return label;
}
