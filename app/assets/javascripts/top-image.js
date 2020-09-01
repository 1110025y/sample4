$(document).on('turbolinks:load', function(){
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
        },8000);
    }
    //（７）～秒間隔でイメージ切換の停止設定
    function stopTimer(){
    clearInterval(Timer);
    }
    
    //（８）タイマースタート
    startTimer();
    
    /*オプションを足す場合はここへ記載*/
    
  });


  
  $(function() {
    //マウスを乗せたら発動
    $('.itemsNew__content__box--details').hover(function() {
      // このthisは、複数有るどの画像をクリックしたか特定する
      var index = $(this).data('index');
      //マウスを乗せたら色が変わる
      $(`.itemsNew__content__box--details[data-index="${index}"]`).css('opacity', '0');

    //ここにはマウスを離したときの動作を記述
    }, function() {

      //色指定を空欄にすれば元の色に戻る
      $('.itemsNew__content__box--details').css('opacity', '0.7');
    });
  });

});


