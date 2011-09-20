<?php
chdir('..');
echo getcwd() . "\n";
echo date('Y-m-d H:i:s') . "\n";

@require_once('includes/init.inc');
@require_once(FUNCTIONS_PATH . 'orders/orders_db.inc');

@$pending_count = CountYMPendingOrder();
@$ymReceiver = GetYMReceiver();

echo ('pending_count: ' . "$pending_count\n");
echo ('Receive: ' . "$ymReceiver\n");

if($pending_count > 0){
  $arr = split(';', $ymReceiver);
	sendYM($arr, '[Thông báo tự động]Có ' . $pending_count . ' đơn hàng chưa được xử lý');
}
?>