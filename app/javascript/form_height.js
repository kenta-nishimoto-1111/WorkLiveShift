window.onload = function() {
  if (document.getElementById("area")) {
    // 現在の縦スクロール位置
    var scrollPosition = document.getElementById("area").scrollTop;
    // スクロール要素の高さ
    var scrollHeight = document.getElementById("area").scrollHeight;

    document.getElementById("area").scrollTop = scrollHeight;
  }
}