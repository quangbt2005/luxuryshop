  <div class="wrapper" style="width: 715px; margin-left: 1px;"><!-- New product -->
    {TitleBox title="&nbsp;Sản phẩm mới nhất"}
    {foreach from=$NewProducts item=newProduct}
    <div class="product">
      <table width="356" cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td style="padding: 10px 0 10px 10px;width:120px">
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
              <tr><td align="center"><a title="{$newProduct.products_name}" href="/sanpham/{$newProduct.products_id}/chitiet"><img src="/product_thumb.php?f={$newProduct.products_image}&w=auto&h=180&ma=120&cx=120&cy=180" border="0" alt="{$newProduct.products_name}"></a></td></tr>
            </table>
          </td>
          <td valign="top" style="padding: 0;">
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
              <tr><td style="padding-top: 5px;height:38px" valign="top" align="left"><a class="f12" href="/sanpham/{$newProduct.products_id}/chitiet"><strong>{$newProduct.products_name}</strong></a></td></tr>
              <tr><td style="padding: 5px 3px 5px 5px;height:130px;overflow: hidden" valign="top" align="left">{$newProduct.products_intro}</td></tr>
            </table>
          </td>
        </tr>
        <tr>
          <td style="padding: 0 10px;width:120px;color: #00ff00;font-size: 18px" valign="top" align="center"><strong>{number_format number=$newProduct.products_price}</strong></td>
          <td align="right" style="padding: 0 20px;"><a href="/sanpham/{$newProduct.products_id}/chitiet"><img src="/images/btn_detail.gif" border="0" alt="Chi tiết sản phẩm"></a></td>
        </tr>
      </table>
    </div>
    {/foreach}
  </div>