  <div class="wrapper" style="width: 715px; margin-left: 1px;"><!-- New product -->
    {TitleBox title="&nbsp;Sản phẩm mới nhất"}
    {foreach from=$NewProducts item=newProduct}
    <div class="product">
      <table width="100%" cellpadding="0" cellspacing="0" boder="0">
        <td style="background-color: black;padding: 10px 0 10px 10px;width:120px">
          <table width="100%" cellpadding="0" cellspacing="0" boder="1">
            <tr><td align="center"><a href="/sanpham/{$newProduct.products_id}/chitiet"><img src="/product_thumb.php?f={$newProduct.products_image}&w=auto&h=180&ma=120&cx=120&cy=180" border="0" alt="{$newProduct.products_name}"></a></td></tr>
            <tr><td style="color: #00ff00;padding: 5px 0" align="center"><strong>{number_format number=$newProduct.products_price}</strong></td></tr>
          </table>
        </td>
        <td valign="top" style="padding: 10px 10px;">
          <table width="100%" cellpadding="0" cellspacing="0" boder="0">
            <tr><td style="padding: 0 5px;height:38px" valign="top" align="left"><a href="/sanpham/{$newProduct.products_id}/chitiet"><strong>{$newProduct.products_name}</strong></a></td></tr>
            <tr><td style="padding: 5px 5px 5px 10px;color: #a8dcdf" valign="top" align="left">Thông tin sản phẩm</td></tr>
          </table>
        </td>
      </table>
    </div>
    {/foreach}
  </div>