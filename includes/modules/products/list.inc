<?php
/**************************************************************************************************/
/* Created on Nov 30, 2008                                                                        */
/**************************************************************************************************/
require_once( FUNCTIONS_PATH . "Paging.inc" );
require_once( FUNCTIONS_PATH . "products/products_db.inc" );
require_once( FUNCTIONS_PATH . "categories/categories_db.inc" );

$cat_id = $Request['parameters'][':catid'];
$current_page = $Request['parameters'][':page'];
// ---------------------------------------------------------------------------------------------- //
// Load products
// ---------------------------------------------------------------------------------------------- //
$limit         = DEFAULT_PAGER_LIMIT;
$total_records = Count_Products( $cat_id );
$total_pages   = Compute_Total_Page( $total_records, $limit );
$current_page  = Validatize_Current_Page( $current_page, $total_pages );

$offset        = ($current_page - 1) * $limit;
$List          = List_Product_By_Category( $cat_id, $offset, $limit );

// ---------------------------------------------------------------------------------------------- //
// Paging
// ---------------------------------------------------------------------------------------------- //
$Paging_info["TOTAL_PAGE"]   = $total_pages;
$Paging_info["CURRENT_PAGE"] = $current_page;
$Paging_info["LIMIT"]        = $limit;
$Paging_info["URL"]          = "/sanpham/danhsach/$cat_id/:page";

$pager = Paginate( $Paging_info );

$list_pad = 0;
$product_count = count($List);

if($product_count <= 2) $list_pad = 2;
elseif($product_count <= 4) $list_pad = 4;
elseif($product_count <= 6) $list_pad = 6;
elseif($product_count <= 8) $list_pad = 8;
elseif($product_count <= 10) $list_pad = 10;
elseif($product_count <= 12) $list_pad = 12;
$List = array_pad($List, $list_pad, array('empty'=>'true'));

$smarty->assign( "product_from", $offset + 1 );
$smarty->assign( "product_to", $offset + $product_count );
$smarty->assign( "product_count", $product_count );
$smarty->assign( "total_products", $total_records );
$smarty->assign( "Product_List", $List );
$smarty->assign( "pager", $pager );
$smarty->assign( "cat_name", Category_Name($cat_id) );

$center_col = $smarty->fetch( "products/list.tpl" );
?>
