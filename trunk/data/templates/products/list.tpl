  {if $total_products > 0}
  <div class="wrapper" style="width: 715px; margin-left: 1px;">
  {TitleBox title=$cat_name}
    {foreach from=$Product_List item=product}
    <div class="product">
      {if $product.empty != 'true'}
      <table width="356" cellpadding="0" cellspacing="0" boder="0">
        <tr>
          <td style="padding: 10px 0 10px 10px;width:120px">
            <table width="100%" cellpadding="0" cellspacing="0" boder="0">
              <tr><td align="center"><a title="{$product.products_name}" href="/sanpham/{$product.products_id}/chitiet"><img src="/product_thumb.php?f={$product.products_image}&w=auto&h=180&ma=120&cx=120&cy=180" border="0" alt="{$product.products_name}"></a></td></tr>
            </table>
          </td>
          <td valign="top" style="padding: 0;">
            <table width="100%" cellpadding="0" cellspacing="0" boder="0">
              <tr><td style="padding-top: 5px;height:38px" valign="top" align="left"><a href="/sanpham/{$product.products_id}/chitiet"><strong>{$product.products_name}</strong></a></td></tr>
              <tr><td style="padding: 5px 3px 5px 5px;height:130px;overflow: hidden" valign="top" align="left">{$product.products_intro}</td></tr>
            </table>
          </td>
        </tr>
        <tr>
          <td style="padding: 0 10px;width:120px;color: #00ff00;font-size: 18px" align="center"><strong>{number_format number=$product.products_price}</strong></td>
          <td align="right" style="padding: 0 20px;"><a href="/sanpham/{$product.products_id}/chitiet"><img src="/images/btn_detail.gif" border="0" alt="Chi tiết sản phẩm"></a></td>
        </tr>
      </table>
      {/if}
    </div>
    {/foreach}
  </div>
  <div class="clear"></div>
  {$pager}<div class="clear"></div>
  <div class="t-right" style="width: 713px;"><span class="f10"><font color="white">Hiển thị {$product_count} sản phẩm từ {$product_from} đến {$product_to} trong tổng số {$total_products} sản phẩm</font></span></div>
  {else}
  <div style="width: 715px; margin-left: 1px;">
  {TitleBox title=$cat_name}
  <div style="padding: 10px;"><h3>Không tìm thấy sản phẩm nào</h3></div>
  </div>
  {/if}