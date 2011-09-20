<div id="header_image"></div>
{if $smarty.session.admin.id != ''}
<div id="header_menu">
  <ul class="sf-menu">
    <li class="current">
      <a target="_blank" href="/home"><font color="lightgreen"><strong>Shop</strong></font></a>
    </li>
    <li class="current">
      <a href="/admin/dashboard">Dashboard</a>
    </li>
    <li>
      <a href="/admin/categories">Sản phẩm</a>
    </li>
    <li>
      <a href="/admin/orders/list"{if $pendingOrderCount > 0} style="text-decoration: blink;color: #ffff00;font-weight: bold"{/if}>Đơn hàng</a>
    </li>
    <li>
      <a href="#">Khuyến mãi</a>
    </li>
    <li>
      <a href="/admin/specialcat">Danh mục đặc biệt</a>
    </li>
    <li>
      <a href="/admin/chat">Chia sẻ KN</a>
    </li>
    <li>
      <a href="/admin/shop/config">Cấu hình</a>
    </li>
  </ul>
</div>
{/if}