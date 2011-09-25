(function(){
  //Section 1 : Code to execute when the toolbar button is pressed
  var a= {
    exec:function(editor){
      editor.insertHtml('<table width="200" class="product_intro" cellpadding="0" cellspacing="0"><tr><th align="left"></th><td></td></tr><tr><th align="left"></th><td></td></tr><tr><th align="left"></th><td></td></tr><tr><th align="left"></th><td></td></tr><tr><th align="left"></th><td></td></tr></table>');
    }
  },

  //Section 2 : Create the button and add the functionality to it
  b='mytable';
  CKEDITOR.plugins.add(b,{
    init:function(editor){
      editor.addCommand(b,a);
      editor.ui.addButton("mytable",{
        label:'Thêm bảng thông tin tóm tắt của sản phẩm',
        icon:this.path+"addTag.gif",
        command:b
      });
    }
  });
})();