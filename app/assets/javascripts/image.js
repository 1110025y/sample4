$(document).on('turbolinks:load', function(){
  $(function() {
  
    // アップロードするファイルを選択
    $('#file-sample').change(function() {
      var file = $(this).prop('files')[0];
  
      // 画像表示
      var reader = new FileReader();
      reader.onload = function() {
        var src = reader.result
        var img_src = `<div class='item-image' >
                        <div class=' item-image__content'>
                          <div class='item-image__content--icon'>
                            <img src=${src} width="200" height="150" class='picture'>
                          </div>
                        </div>
                        <div class='item-image__operetion'>
                          <div class='item-image__operetion--delete' >削除</div>
                        </div>
                      </div>`
        $('#image-boxer').html(img_src);
      }
      reader.readAsDataURL(file);
    });
  });
});




$(function(){


  //（１）ページの概念・初期ページを設定
  var page=0;
  
  //（２）イメージの数を最後のページ数として変数化
  var lastPage =parseInt($("#slide img").length-1);
  
  //（３）最初に全部のイメージを一旦非表示にします
      $("#slide img").css("display","none");
  
  //（４）初期ページを表示
            $("#slide img").eq(page).css("display","block");
  
  //（５）ページ切換用、自作関数作成
  function changePage(){
                          $("#slide img").fadeOut(1000);
                          $("#slide img").eq(page).fadeIn(1000);
  };
  
  //（６）～秒間隔でイメージ切換の発火設定
  var Timer;
  function startTimer(){
  Timer =setInterval(function(){
            if(page === lastPage){
                          page = 0;
                          changePage();
            }else{
                          page ++;
                          changePage();
            };
      },7000);
  }
  //（７）～秒間隔でイメージ切換の停止設定
  function stopTimer(){
  clearInterval(Timer);
  }
  
  //（８）タイマースタート
  startTimer();
  
  /*オプションを足す場合はここへ記載*/
  
});


