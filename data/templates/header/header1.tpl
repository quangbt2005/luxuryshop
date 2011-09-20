<table width="100%" cellpadding="0" cellspacing="0" class="tbl_top_h_l">
  <tr>
    <td class="tbl_top_h_r"><table width="100%" cellpadding="0" cellspacing="0" border="0">
      <tr><td>&nbsp;</td></tr>
      <tr>
        <td style="vertical-align: top;height: 47px;padding-left: 30px">
          <a class="href_h_1" href="/home"><img src="/images/transparent.png" border="0" width="136" height="42"></a>
          <a class="href_h_2" href="/tintuc"><img src="/images/transparent.png" border="0" width="136" height="42"></a>
          <a class="href_h_3" href="/chat"><img src="/images/transparent.png" border="0" width="156" height="42"></a>
          <a class="href_h_4" href="/huongdanmuahang"><img src="/images/transparent.png" border="0" width="170" height="42"></a>
          <a class="href_h_5" href="/lienhe"><img src="/images/transparent.png" border="0" width="136" height="42"></a>
        </td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td>
      <div id="marquee_wrapper">
            <marquee>{$_MARQUEE}</marquee>
        </div>

      <div class="navigation2_icon">
            {if $smarty.session.logon.id != ''}
        <a href="/dangxuat" class="headerNavigation2" style="background-image: url(/images/logoff_30x30.gif);">Thoát</a>&nbsp;&nbsp;
        {/if}
        <a href="/taikhoan" class="headerNavigation2" style="background-image: url(/images/header_account.gif);">Tài khoản</a>&nbsp;&nbsp;
        <a href="/giohang/xem" class="headerNavigation2" style="background-image: url(/images/header_cart.gif);">Giỏ hàng</a> &nbsp;&nbsp;
        <a href="/thanhtoan" class="headerNavigation2" style="background-image: url(/images/header_checkout.gif);">Thanh Toán</a>
      </div>
    </td>
  </tr>
</table>