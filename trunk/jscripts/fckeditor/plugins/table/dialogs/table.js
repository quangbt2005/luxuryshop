/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

(function(){
  var a=CKEDITOR.tools.cssLength,
      b=function(d){
        var e=this.id;
        if(!d.info)d.info={};
        d.info[e]=this.getValue();
      };
      function c(d,e){
        var f=function(h){
          return new CKEDITOR.dom.element(h,d.document);
        },
        g=d.plugins.dialogadvtab;
        return{
          title:d.lang.table.title,
          minWidth:310,
          minHeight:CKEDITOR.env.ie?310:280,
          onLoad:function(){
            var h=this,
            i=h.getContentElement('advanced','advStyles');
            if(i)i.on('change',function(j){
                                 var k=this.getStyle('width',''),
                                 l=h.getContentElement('info','txtWidth');
                                 l&&l.setValue(k,true);
                                 var m=this.getStyle('height',''),
                                 n=h.getContentElement('info','txtHeight');
                                 n&&n.setValue(m,true);
                               }
                     );
          },
          onShow:function(){
            var p=this;
            var h=d.getSelection(),
            i=h.getRanges(),
            j=null,
            k=p.getContentElement('info','txtRows'),
            l=p.getContentElement('info','txtCols'),
            m=p.getContentElement('info','txtWidth'),
            n=p.getContentElement('info','txtHeight');
            if(e=='tableProperties'){
              if(j=h.getSelectedElement())j=j.getAscendant('table',true);
                else if(i.length>0){
                  if(CKEDITOR.env.webkit)i[0].shrink(CKEDITOR.NODE_ELEMENT);
                    var o=i[0].getCommonAncestor(true);
                    j=o.getAscendant('table',true);
                }
                p._.selectedElement=j;
            }
            if(j){
              p.setupContent(j);
              k&&k.disable();
              l&&l.disable();
            } else {
              k&&k.enable();
              l&&l.enable();
            }
            m&&m.onChange();
            n&&n.onChange();
          },
          onOk:function(){
            var h=d.getSelection(),
            i=this._.selectedElement&&h.createBookmarks(),
            j=this._.selectedElement||f('table'),
            k=this,
            l={};
            this.commitContent(l,j);
            if(l.info){
              var m=l.info;
              if(!this._.selectedElement){
                var n=j.append(f('tbody')),
                o=parseInt(m.txtRows,10)||0,
                p=parseInt(m.txtCols,10)||0;
                for(var q=0;q<o;q++){
                  var r=n.append(f('tr'));
                  for(var s=0;s<p;s++){
                    var t=r.append(f('td'));
                    if(!CKEDITOR.env.ie)t.append(f('br'));
                  }
                }
              }
              var u=m.selHeaders;
              if(!j.$.tHead&&(u=='row'||u=='both')){
                var v=new CKEDITOR.dom.element(j.$.createTHead());
                n=j.getElementsByTag('tbody').getItem(0);
                var w=n.getElementsByTag('tr').getItem(0);
                for(q=0;q<w.getChildCount();q++){
                  var x=w.getChild(q);
                  if(x.type==CKEDITOR.NODE_ELEMENT&&!x.data('cke-bookmark')){
                    x.renameNode('th');
                    x.setAttribute('scope','col');
                  }
                }
                v.append(w.remove());
              }
              if(j.$.tHead!==null&&!(u=='row'||u=='both')){
                v=new CKEDITOR.dom.element(j.$.tHead);
                n=j.getElementsByTag('tbody').getItem(0);
                var y=n.getFirst();
                while(v.getChildCount()>0){
                  w=v.getFirst();
                  for(q=0;q<w.getChildCount();q++){
                    var z=w.getChild(q);
                    if(z.type==CKEDITOR.NODE_ELEMENT){
                      z.renameNode('td');
                      z.removeAttribute('scope');
                    }
                  }
                  w.insertBefore(y);
                }
                v.remove();
              }
              if(!this.hasColumnHeaders&&(u=='col'||u=='both'))
                for(r=0;r<j.$.rows.length;r++){
                  z=new CKEDITOR.dom.element(j.$.rows[r].cells[0]);
                  z.renameNode('th');
                  z.setAttribute('scope','row');
                }
              if(this.hasColumnHeaders&&!(u=='col'||u=='both'))
                for(q=0;q<j.$.rows.length;q++){
                  r=new CKEDITOR.dom.element(j.$.rows[q]);
                  if(r.getParent().getName()=='tbody'){
                    z=new CKEDITOR.dom.element(r.$.cells[0]);
                    z.renameNode('td');
                    z.removeAttribute('scope');
                  }
                }
              m.txtHeight?j.setStyle('height',m.txtHeight):j.removeStyle('height');
              m.txtWidth?j.setStyle('width',m.txtWidth):j.removeStyle('width');
              if(!j.getAttribute('style'))j.removeAttribute('style');
            }
            if(!this._.selectedElement){
              d.insertElement(j);
              setTimeout(function(){
                var A=new CKEDITOR.dom.element(j.$.rows[0].cells[0]),
                B=new CKEDITOR.dom.range(d.document);
                B.moveToPosition(A,CKEDITOR.POSITION_AFTER_START);
                B.select(1);
              },0);
            } else try {
              h.selectBookmarks(i);
            }catch(A){}
          },contents:[{id:'info',label:d.lang.table.title,elements:[{type:'hbox',widths:[null,null],styles:['vertical-align:top'],children:[{type:'vbox',padding:0,children:[{type:'text',id:'txtRows','default':3,label:d.lang.table.rows,required:true,controlStyle:'width:5em',validate:function(){var h=true,i=this.getValue();h=h&&CKEDITOR.dialog.validate.integer()(i)&&i>0;if(!h){alert(d.lang.table.invalidRows);this.select();}return h;},setup:function(h){this.setValue(h.$.rows.length);},commit:b},{type:'text',id:'txtCols','default':2,label:d.lang.table.columns,required:true,controlStyle:'width:5em',validate:function(){var h=true,i=this.getValue();h=h&&CKEDITOR.dialog.validate.integer()(i)&&i>0;if(!h){alert(d.lang.table.invalidCols);this.select();}return h;},setup:function(h){this.setValue(h.$.rows[0].cells.length);},commit:b},{type:'html',html:'&nbsp;'},{type:'select',id:'selHeaders','default':'',label:d.lang.table.headers,items:[[d.lang.table.headersNone,''],[d.lang.table.headersRow,'row'],[d.lang.table.headersColumn,'col'],[d.lang.table.headersBoth,'both']],setup:function(h){var i=this.getDialog();i.hasColumnHeaders=true;for(var j=0;j<h.$.rows.length;j++){if(h.$.rows[j].cells[0].nodeName.toLowerCase()!='th'){i.hasColumnHeaders=false;break;}}if(h.$.tHead!==null)this.setValue(i.hasColumnHeaders?'both':'row');else this.setValue(i.hasColumnHeaders?'col':'');},commit:b},{type:'text',id:'txtBorder','default':1,label:d.lang.table.border,controlStyle:'width:3em',validate:CKEDITOR.dialog.validate.number(d.lang.table.invalidBorder),setup:function(h){this.setValue(h.getAttribute('border')||'');},commit:function(h,i){if(this.getValue())i.setAttribute('border',this.getValue());else i.removeAttribute('border');}},{id:'cmbAlign',type:'select','default':'',label:d.lang.common.align,items:[[d.lang.common.notSet,''],[d.lang.common.alignLeft,'left'],[d.lang.common.alignCenter,'center'],[d.lang.common.alignRight,'right']],setup:function(h){this.setValue(h.getAttribute('align')||'');
},commit:function(h,i){if(this.getValue())i.setAttribute('align',this.getValue());else i.removeAttribute('align');}}]},{type:'vbox',padding:0,children:[{type:'hbox',widths:['5em'],children:[{type:'text',id:'txtWidth',controlStyle:'width:5em',label:d.lang.common.width,'default':500,getValue:a,validate:CKEDITOR.dialog.validate.cssLength(d.lang.common.invalidCssLength.replace('%1',d.lang.common.width)),onChange:function(){var h=this.getDialog().getContentElement('advanced','advStyles');h&&h.updateStyle('width',this.getValue());},setup:function(h){var i=h.getStyle('width');i&&this.setValue(i);},commit:b}]},{type:'hbox',widths:['5em'],children:[{type:'text',id:'txtHeight',controlStyle:'width:5em',label:d.lang.common.height,'default':'',getValue:a,validate:CKEDITOR.dialog.validate.cssLength(d.lang.common.invalidCssLength.replace('%1',d.lang.common.height)),onChange:function(){var h=this.getDialog().getContentElement('advanced','advStyles');h&&h.updateStyle('height',this.getValue());},setup:function(h){var i=h.getStyle('width');i&&this.setValue(i);},commit:b}]},{type:'html',html:'&nbsp;'},{type:'text',id:'txtCellSpace',controlStyle:'width:3em',label:d.lang.table.cellSpace,'default':1,validate:CKEDITOR.dialog.validate.number(d.lang.table.invalidCellSpacing),setup:function(h){this.setValue(h.getAttribute('cellSpacing')||'');},commit:function(h,i){if(this.getValue())i.setAttribute('cellSpacing',this.getValue());else i.removeAttribute('cellSpacing');}},{type:'text',id:'txtCellPad',controlStyle:'width:3em',label:d.lang.table.cellPad,'default':1,validate:CKEDITOR.dialog.validate.number(d.lang.table.invalidCellPadding),setup:function(h){this.setValue(h.getAttribute('cellPadding')||'');},commit:function(h,i){if(this.getValue())i.setAttribute('cellPadding',this.getValue());else i.removeAttribute('cellPadding');}}]}]},{type:'html',align:'right',html:''},{type:'vbox',padding:0,children:[{type:'text',id:'txtCaption',label:d.lang.table.caption,setup:function(h){var l=this;l.enable();var i=h.getElementsByTag('caption');if(i.count()>0){var j=i.getItem(0),k=j.getFirst(CKEDITOR.dom.walker.nodeType(CKEDITOR.NODE_ELEMENT));if(k&&!k.equals(j.getBogus())){l.disable();l.setValue(j.getText());return;}j=CKEDITOR.tools.trim(j.getText());l.setValue(j);}},commit:function(h,i){if(!this.isEnabled())return;var j=this.getValue(),k=i.getElementsByTag('caption');if(j){if(k.count()>0){k=k.getItem(0);k.setHtml('');}else{k=new CKEDITOR.dom.element('caption',d.document);if(i.getChildCount())k.insertBefore(i.getFirst());
else k.appendTo(i);}k.append(new CKEDITOR.dom.text(j,d.document));}else if(k.count()>0)for(var l=k.count()-1;l>=0;l--)k.getItem(l).remove();}},{type:'text',id:'txtSummary',label:d.lang.table.summary,setup:function(h){this.setValue(h.getAttribute('summary')||'');},commit:function(h,i){if(this.getValue())i.setAttribute('summary',this.getValue());else i.removeAttribute('summary');}}]}]},g&&g.createAdvancedTab(d)]};};CKEDITOR.dialog.add('table',function(d){return c(d,'table');});CKEDITOR.dialog.add('tableProperties',function(d){return c(d,'tableProperties');});})();
