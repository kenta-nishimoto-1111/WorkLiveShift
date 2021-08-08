$(function() {
  $('.slider').slick({
      arrows: false,  //ボタン非表示
      autoplay: true, //自動再生
      autoplaySpeed: 2000, //再生スピード
      slidesToShow: 3,
  });
});

$(function() {
  $('.slider_top').slick({
      arrows: false,  //ボタン非表示
      autoplay: true, //自動再生
      autoplaySpeed: 2000, //再生スピード
      centerMode: true,
      centerPadding: '14%',
  });
});