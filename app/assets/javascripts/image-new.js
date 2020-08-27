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

    // アップロードするファイルを選択
    $('#file-sample1').change(function() {
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
        $('#image-boxer1').html(img_src);
      }
      reader.readAsDataURL(file);
    });
    // アップロードするファイルを選択
    $('#file-sample2').change(function() {
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
        $('#image-boxer2').html(img_src);
      }
      reader.readAsDataURL(file);
    });
    // アップロードするファイルを選択
    $('#file-sample3').change(function() {
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
        $('#image-boxer3').html(img_src);
      }
      reader.readAsDataURL(file);
    });
  });
});












