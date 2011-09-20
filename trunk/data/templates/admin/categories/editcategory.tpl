<form method="post" enctype="multipart/form-data">
<div class="content" style="width: 600px;margin:0 auto;">
  <div class="header1">Sửa danh mục</div>
    <div class="blu-container" style="padding: 10px;text-align: center">
      {if $errors_count > 0}
      {foreach from=$errors item=error}
      <div class="w100p error_field t-left">&nbsp;&nbsp;<img height="10" border="0" width="10" title=" Lỗi " alt="Lỗi" src="/images/icons/error.gif">&nbsp;{$error}</div>
      {/foreach}
      <br />
      {/if}
      <table cellpadding="0" cellspacing="0" width="100%" class="vlist">
        <tr>
          <th align="right" style="padding-right: 5px">Tên Danh Mục</th>
          <td align="left" style="padding-left: 5px"><input name="txtCategoryName" type="text" class="w240" value="{if $smarty.post.txtProductName != ''}{$smarty.post.txtProductName}{else}{$category_name}{/if}"></td>
        </tr>
        <tr>
          <th align="right" style="padding-right: 5px">Danh Mục Cha</th>
          <td align="left" style="padding-left: 5px">{$html_select_categories}</td>
        </tr>
        <tr>
          <th align="right" style="padding-right: 5px">Biểu tượng</th>
          <td valign="middle" align="left" style="padding-left: 5px;height:50px;">
          	<img id="catIcon" src="/images/{if $category_icon != ''}cat/{$category_icon}{else}transparent.png{/if}" width="30" height="25" border="0" style="padding:0;margin:0;float: left">&nbsp;&nbsp;
          	<input type="button" onclick="openIconBoardPopup()" value="Chọn biểu tượng">
          	<input type="hidden" name="txtCategoryImage" id="txtCategoryImage" value="{$category_icon}">
          </td>
        </tr>
      </table><br />
      <input type="submit" class="w80" value="Cập nhật">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" value="Đóng" onclick="window.close();">
    </div>
  </div>
</div>
</form>
<script type="text/javascript" language="javascript">
{if $edit_category_ok > 0}
window.opener.editTreeCategory('{$new_category_name}');
alert('Đã sửa danh mục thành công');
window.close();
{/if}
{literal}
function openIconBoardPopup(){
	var popupWidth  = 640;
	var popupHeight = 400;

	var topPos = (getHeight()-popupHeight)/2;
	var leftPos = (getWidth()-popupWidth)/2;

	var url = '/admin/categories/iconboard';
	var popup = window.open(url, 'Icon_board',"resizable=no,menubar=no,toolbar=no,location=no,width=" + popupWidth + ",height=" + popupHeight + ",left="+leftPos+",top="+topPos);
}
function setIcon(iconName){
	var txt = document.getElementById('txtCategoryImage');
	var img = document.getElementById('catIcon');
	if(txt != null){
		txt.value = iconName;
	}
	if(img != null){
		img.src = '/images/cat/' + iconName;
	}
}
{/literal}
</script>