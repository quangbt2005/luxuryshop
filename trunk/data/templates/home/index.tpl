  <div class="wrapper" style="width: 710px; margin-left: 1px;"><!-- New product -->
    {TitleBox title="&nbsp;Sản phẩm mới"}
    {foreach from=$NewProducts item=newProduct}
    <div class="product">
      <div style="height: 155px;padding-top: 5px">
        <a href="/sanpham/{$newProduct.products_id}/chitiet">{ImageThumb src=$newProduct.products_image width=auto height=$SMALL_IMAGE_HEIGHT ma=176 alt=$newProduct.products_name}<br>
        <a href="/sanpham/{$newProduct.products_id}/chitiet">{$newProduct.products_name}</a><br>
      </div>
      {if $newProduct.special_price != ''}<s>{number_format number=$newProduct.products_price}</s>&nbsp;<span class="fore-red">{number_format number=$newProduct.special_price}</span>{else}{number_format number=$newProduct.products_price}{/if}&nbsp;VND<br>
      <a href="/sanpham/{$newProduct.products_id}/order">{ImageButton image="button_buy_now.png" alt="Đặt hàng"}</a>
    </div>
    {/foreach}
  </div>