$(document).on('turbolinks:load', function() {
  $('.image__list').click(function () {
    // このthisは、複数有るどの画像をクリックしたか特定する
    var $src = $(this).attr('src');
    // src属性 = $src を取得
    $('.main__image').attr('src', $src);
  });
});