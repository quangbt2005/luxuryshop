<?php
/**************************************************************************************************/
/* Created on May 30, 2010                                                                        */
/**************************************************************************************************/
require_once( FUNCTIONS_PATH . "DB.inc" );
require_once( FUNCTIONS_PATH . "bankaccounts/bankaccounts_db.inc" );
// ---------------------------------------------------------------------------------------------- //
Check_Admin();
$BankList = ListBankAccountForAdmin();

if($_SERVER['REQUEST_METHOD'] == 'POST'){
//pd($_POST);
  DB_Update('configuration', array('configuration_key' => 'ADMIN_EMAIL'),
                             array('configuration_value' => P_SQL_Quote($_POST['txtEmail2'])));
  DB_Update('configuration', array('configuration_key' => 'STORE_ADDRESS'),
                             array('configuration_value' => P_SQL_Quote($_POST['txtAddress'])));
  DB_Update('configuration', array('configuration_key' => 'STORE_EMAIL'),
                             array('configuration_value' => P_SQL_Quote($_POST['txtEmail1'])));
  DB_Update('configuration', array('configuration_key' => 'SUPPORT_EMAIL'),
                             array('configuration_value' => P_SQL_Quote($_POST['txtEmail3'])));
  DB_Update('configuration', array('configuration_key' => 'PHONE_1'),
                             array('configuration_value' => P_SQL_Quote($_POST['txtPhone1'])));
  DB_Update('configuration', array('configuration_key' => 'PHONE_2'),
                             array('configuration_value' => P_SQL_Quote($_POST['txtPhone2'])));
  DB_Update('configuration', array('configuration_key' => 'CHAT_1'),
                             array('configuration_value' => P_SQL_Quote($_POST['txtChat1'])));
  DB_Update('configuration', array('configuration_key' => 'CHATTITLE_1'),
                             array('configuration_value' => P_SQL_Quote($_POST['txtChat1Title'])));
//  DB_Update('configuration', array('configuration_key' => 'CHAT_2'),
//                             array('configuration_value' => P_SQL_Quote($_POST['txtChat2'])));
//  DB_Update('configuration', array('configuration_key' => 'CHATTITLE_2'),
//                             array('configuration_value' => P_SQL_Quote($_POST['txtChat2Title'])));
  DB_Update('bank_account', array(), array('active' => '0'));
  if(isset($_POST['bank_active']) && !empty($_POST['bank_active'])){
    foreach($_POST['bank_active'] as $bankActive){
      DB_Update('bank_account', array('id' => $bankActive), array('active' => '1'));
    }
  }
  foreach($_POST['txtAccountNo'] as $bankID=>$value){
    DB_Update('bank_account', array('id' => $bankID), array('account_no'   => $value,
                                'account_name' => $_POST['txtAccountName'][$bankID])
  );
  }

  $buyingHelp = $_POST['txtBuyingHelp'];
  if(get_magic_quotes_gpc() == 1) $buyingHelp = stripslashes($buyingHelp);
  DB_Update('configuration', array('configuration_key' => 'BUYINGHELP'),
                             array('configuration_value' => $buyingHelp));

  DB_Update('configuration', array('configuration_key' => 'YM_RECEIVER'),
                             array('configuration_value' => $_POST['txtYMReceiver']));

  $topMarquee = $_POST['txtTopMarquee'];
  if(get_magic_quotes_gpc() == 1) $topMarquee = stripslashes($topMarquee);
// pd($topMarquee);
  DB_Update('configuration', array('configuration_key' => 'TOP_MARQUEE'),
                             array('configuration_value' => $topMarquee));

  $_SESSION['flash']['update_configuration_ok'] = '1';
  header("Location: /admin/shop/config/" . $category_id);
} else {
  if($_SESSION['flash']['update_configuration_ok'] == '1'){
    $smarty->assign('update_configuration_ok', '1');
    unset($_SESSION['flash']['update_configuration_ok']);
  }
}
$smarty->assign('BankList', $BankList);
$center_col = $smarty->fetch( "admin/shop/configuration.tpl" );
?>
