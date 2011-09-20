<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td><table width="100%" cellpadding="0" cellspacing="0" bgcolor="#f8f8f8">
			<tr>
				<td><img src="/images/k-tl.gif" alt=""></td>
				<td class="tall-t" width="100%"><img src="/images/spacer.gif" width="1" height="1" alt=""></td>
				<td><img src="/images/k-tr.gif" alt=""></td>
			</tr>
			<tr>
				<td class="tall-l"><img src="/images/spacer.gif" width="1" height="1" alt=""></td>
				<td class="heading_text_1">
					<font color="#010101">CATEGORIES</font>
				</td>
				<td class="tall-r"><img src="/images/spacer.gif" width="1" height="1" alt=""></td>
			</tr>
		</table></td>
	</tr>
	<tr>
		<td><table width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td class="tall-l2" valign="top"><img src="/images/k-tl2.gif" alt=""></td>
				<td class="tall-t2" width="100%" align="left">
					<ul class="ul_1">
    					{foreach from=$Categories item=cat key=key}
    					<li {if $key==0}class="bg_list_un"{else}class="bg_list"{/if}style="margin-left:{math equation="x * y" x=$cat.level y=30}{if $cat.level>0};list-style-type: square{/if};"><a href="/sanpham/danhsach/{$cat.categories_id}" style="{if $cat.level==0}background-image:url(/images/cat/{$cat.icon});{else}padding-left:0;{/if}{if $cat.categories_id==$current_cat}color: red;{/if}">{$cat.categories_name}</a></li>
    					{/foreach}
					</ul>
				</td>
				<td class="tall-r2" valign="top"><img src="/images/k-tr2.gif" alt=""></td>
			</tr>
		</table></td>
	</tr>
	<tr>
		<td><table width="100%" cellpadding="0" cellspacing="0" bgcolor="#f8f8f8">
			<tr>
				<td><img src="/images/k-bl.gif" alt=""></td>
				<td class="tall-b" width="100%"><img src="/images/spacer.gif" width="1" height="1" alt=""></td>
				<td><img src="/images/k-br.gif" alt=""></td>
			</tr>
		</table></td>
	</tr>
</table>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
			<table width="100%" cellpadding="0" cellspacing="0" border="0" class="bsl_heading">
				<tr>
					<td class="bsl_left"><table width="100%" cellpadding="0" cellspacing="0" class="bsl_right">
						<tr>
							<td class="heading_text_2">
								<font color="#010101">BÁN CHẠY NHẤT</font>
							</td>
						</tr>
					</table></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td><table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#e1e92c">
			<tr>
				<td class="tall-l3"><img src="/images/spacer.gif" width="20" height="1" alt=""></td>
				<td width="100%" align="center" style="padding-bottom: 20px">
					<div id="slides" class="pics" style="width: 130px;height:130px">
						{foreach from=$best_seller item=best}
						<a href="/sanpham/{$best.products_id}/chitiet" title="{$best.products_name}"><img src="/product_thumb.php?f={$best.products_image}&w=auto&h=80&cx=130&cy=130" alt="{$best.products_name}" hspace="0" border="0" width="130" height="130"></a>
						{/foreach}
					</div>
				</td>
				<td class="tall-r3"><img src="/images/spacer.gif" width="20" height="1" alt=""></td>
			</tr>
		</table></td>
	</tr>
	<tr>
		<td><table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td><img src="/images/k-bl3.gif" alt=""></td>
				<td class="tall-b3" width="100%"><br style="line-height:10px"></td>
				<td><img src="/images/k-br3.gif" alt=""></td>
			</tr>
		</table></td>
	</tr>
</table><br>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
			<table width="100%" cellpadding="0" cellspacing="0" border="0" class="k-t4-heading">
				<tr>
					<td class="k-tl4"><img src="/images/spacer.gif" width="16" height="51" alt=""></td>
					<td class="k-tr4 heading_text_4" width="100%">HỖ TRỢ TRỰC TUYẾN</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="tall-l4"><img src="/images/spacer.gif" width="20" height="1" alt=""></td>
					<td class="tall-m4" width="100%">
						<div style="width: 100%">
						  <div class="side_container t-left">
						    <p class="phone_contact">{$PHONE_2}</p>
						    <a class="contact" href="ymsgr:sendIM?{$CHAT_1}"><p class="yahoo_contact">{$CHATTITLE_1}</p></a>
						  </div>
						</div>
					</td>
					<td class="tall-r4"><img src="/images/spacer.gif" width="20" height="1" alt=""></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td><table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td><img src="/images/k-bl5.gif" alt=""></td>
				<td class="tall-b4" width="100%"><br style="line-height:10px"></td>
				<td><img src="/images/k-br5.gif" alt=""></td>
			</tr>
		</table></td>
	</tr>
</table>