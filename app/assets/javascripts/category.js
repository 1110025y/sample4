$(document).on('turbolinks:load', function(){
  $(function(){
    // カテゴリーセレクトボックスのオプションを作成
    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
    // 子カテゴリーの表示作成
    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<div class='exhibitionPage__main__contents__detail__category__choose__added' id= 'children_wrapper'>
                          <div class='exhibitionPage__main__contents__detail__category__choose1'>
                            <select class="exhibitionPage__main__contents__detail__category__choose--select" id="child_category" name="item[category_id]">
                              <option value="---" data-category="---">---</option>
                              ${insertHTML}
                            <select>
                          </div>
                        </div>`;
      $('.category_choose').append(childSelectHtml);
    }

    // 孫カテゴリーの表示作成
    function appendGrandchidrenBox(insertHTML){
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `<div class='exhibitionPage__main__contents__detail__category__choose__added' id= 'grandchildren_wrapper'>
                                <div class='exhibitionPage__main__contents__detail__category__choose2'>
                                  <select class="exhibitionPage__main__contents__detail__category__choose__box--select" id="grandchild_category" name="item[category_id]">
                                    <option value="---" data-category="---">---</option>
                                    ${insertHTML}
                                  </select>
                                </div>
                              </div>`;
      $('.category_choose').append(grandchildSelectHtml);
    }

    // 親カテゴリー選択後のイベント
    $('#parent_category').on('change', function(){
      var parent_category_id = document.getElementById
      ('parent_category').value; //選択された親カテゴリーの名前を取得
      if (parent_category_id != "---"){ //親カテゴリーが初期値でないことを確認
        $.ajax({
          url: '/items/category/get_category_children',
          type: 'GET',
          data: { parent_id: parent_category_id },
          dataType: 'json'
        })
        .done(function(children){
          $('#children_wrapper').remove(); //親が変更された時、子以下を削除する
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChidrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除する
        $('#grandchildren_wrapper').remove();
      }
    });

    // 子カテゴリー選択後のイベント
    $('.exhibitionPage__main__contents__detail__category').on('change', '#child_category', function(){
      var child_category_id = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
      if (child_category_id != "---"){ //子カテゴリーが初期値でないことを確認
        $.ajax({
          url: '/items/category/get_category_grandchildren',
          type: 'GET',
          data: { child_id: child_category_id },
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除する
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            appendGrandchidrenBox(insertHTML);
          }
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      }
    });
  });


  //トップページのカテゴリ一覧
  $(function(){
    $('#parent_category1').click(function(){
      $("#parent_list1").slideToggle('1000');
    });
    $('#parent_category13').click( function(){
      $("#parent_list13").slideToggle('1000');
    });
    $( '#parent_category27').click(function(){
      $("#parent_list27").slideToggle('1000');
    });
    $( '#parent_category42').click(function(){
      $("#parent_list42").slideToggle('1000');
    });
    $('#parent_category50').click(function(){
      $("#parent_list50").slideToggle('slow');
    });
  });


  //個別ページのカテゴリ一覧
  $(function(){
    $('#category1').click(function(){
      $("#list1").slideToggle('1000');
    });
    $('#category13').click( function(){
      $("#list13").slideToggle('1000');
    });
    $( '#category27').click(function(){
      $("#list27").slideToggle('1000');
    });
    $( '#category42').click(function(){
      $("#list42").slideToggle('1000');
    });
    $('#category50').click(function(){
      $("#list50").slideToggle('1000');
    });
  });

});