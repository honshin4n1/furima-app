$(document).on('turbolinks:load', function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML){
    const childSelectHtml = `<select class="listing-select-wrapper__box--select" id="child_category" name="item[category_id]">
                              <option value>選択してください</option>
                              ${insertHTML}
                            <select>`;
    $('.listing-select-wrapper').append(childSelectHtml);
  }

  // 親カテゴリー変更後のイベント
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
    // 子カテゴリーが存在する場合は一度削除する
    if ($('#child_category').length == 1) {
      $('#child_category').remove();//親が変更された時、子以下を削除するする
    }
    if (parentCategory != "選択してください"){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
  });
});