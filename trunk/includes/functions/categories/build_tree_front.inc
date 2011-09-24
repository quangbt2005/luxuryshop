<?php
/**************************************************************************************************/
/* Created on July 2, 2010                                                                        */
/**************************************************************************************************/
require_once( FUNCTIONS_PATH . "categories/categories_db.inc" );
// ---------------------------------------------------------------------------------------------- //
//
// ---------------------------------------------------------------------------------------------- //
function BuildCategoryTree()
{
  $overflow = false;

  $Tree = array();
  $List = List_All_Category();
  $ID_List = array();

  for($i=0;$i<count($List);$i++){
    $Tree[$List[$i]['categories_id']] = &$List[$i];
    $ID_List[] = $List[$i]['categories_id'];
  }

  for($i=0;$i<count($ID_List);$i++){
    $id = $ID_List[$i];
    $parent_of_id = $Tree[$id]['parent_id'];
    if(!empty($parent_of_id)){
      $Tree[$parent_of_id]['childs'][] = &$Tree[$id];
    }
  }

  for($i=0;$i<count($ID_List);$i++){
    $id = $ID_List[$i];
    $parent_of_id = $Tree[$id]['parent_id'];
    if(!empty($parent_of_id)){
      unset($Tree[$id]);
    }
  }
// pd($Tree);
  // reset($Tree);
  // $pointer = $Tree;
  // $stack   = array();
  $html = "<div class=\"arrowsidemenu\">\n";

  foreach($Tree as $cat){
    if(isset($cat['childs'])){
      $html .= sprintf("<div class=\"menuheaders\"><a href=\"/sanpham/danhsach/%s\">%s</a></div>\n<ul class=\"menucontents\">\n", $cat['categories_id'], $cat['categories_name']);
      $childs = $cat['childs'];
      foreach($childs as $child_cat){
      	$html .= sprintf("<li><a href=\"/sanpham/danhsach/%s\">%s</a></li>\n", $child_cat['categories_id'], $child_cat['categories_name']);
      }
      $html .= "</ul>";
    } else {
    	$html .= sprintf("<div><a href=\"/sanpham/danhsach/%s\">%s</a></div>\n", $cat['categories_id'], $cat['categories_name']);
    }
  }

  return $html;
}
// ---------------------------------------------------------------------------------------------- //
//
// ---------------------------------------------------------------------------------------------- //
?>