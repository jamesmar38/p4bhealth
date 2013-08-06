<?php
/************************************************************/
/*	BrilliantRetail 										*/
/*															*/
/*	@package	BrilliantRetail								*/
/*	@Author		David Dexter  								*/
/* 	@copyright	Copyright (c) 2010-2012						*/
/* 	@license	http://brilliantretail.com/license.html		*/
/* 	@link		http://brilliantretail.com 					*/
/*															*/
/************************************************************/
/* NOTICE													*/
/*															*/
/* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF 	*/
/* ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED	*/
/* TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 		*/
/* PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT 		*/
/* SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY */
/* CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION	*/
/* OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR 	*/
/* IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 		*/
/* DEALINGS IN THE SOFTWARE. 								*/	
/************************************************************/

	echo $br_header;

	echo form_open('&D=cp&C=addons_modules&M=show_module_cp&module=brilliant_retail&method=report_detail&report='.$report,
					array(	'method' 	=> 'POST', 
							'id' 		=> 'report_'.$parent, 
							'encrypt' 	=> 'multipart/form-data'));
?>
		<input type="hidden" id="export" name="export" value="0" />

		<table class="product_edit" width="100%" cellpadding="0" cellspacing="0">
			<thead>
				<tr>
					<th>
						<?=lang('br_report_detail')?></th>
				</tr>
			</thead>
			<tr>
				<td>
					<table id="report-detail">
						<tr>
							<td width="75">
								<strong><?=lang('title')?></strong></td>
							<td>
								<?=$title?></td>
						</tr>
						
						<?php
							if($input != '')
							{
						?>
							<tr>
								<td>
									<strong><?=lang('br_report_range')?></strong></td>
								<td>
									<div id="popin-container">
										<img src="<?=$theme?>images/popin-arrow.png" class="popin-arrow" />
										<div class="popin-top">
											<img src="<?=$theme?>images/close.png" />
											<div><?=lang('br_report_edit')?></div>
										</div>
										<div class="popin-body">
											<div id="report-input-body">
												<?=$input?>
												<input type="submit" class="submit" id="report_submit" name="submit" value="<?=lang('submit')?>" />
												<div class="b2r_clearboth"><!-- --></div>
											</div>
										</div>
										<div class="popin-bottom"></div>
									</div>
									<span id="report-range">
										<?php
											echo date("F j, Y",strtotime($detail["range"]["start"]))." - ".date("F j, Y",strtotime($detail["range"]["end"]));
										?>
									</span></td>
							</tr>
						<?php
							}
						?>
						<tr>
							<td>
								<strong><?=lang('br_report_export')?></strong></td>
							<td>
								<div id="report_export">
									<a href="<?=$_SERVER["REQUEST_URI"]?>&export=csv" class="submit" target="_blank"><b><?=lang('br_export_csv')?></b></a></div>
								<div class="b2r_clearboth"><!-- --></div></td>
						</tr>
					</table></td>
			</tr>
		</table>

		<?php
			if($detail["graph"] != ''){
				echo '<div align="center" id="report_graph" style="border:1px #ccc solid;padding:10px;width:90%"><img src="'.$detail["graph"].'" width="100%"  /></div>';
			}
		?>
		
		<table width="100%" class="product_edit" cellpadding="0" cellspacing="0">
			<thead>
				<tr>
					<?php
						foreach($detail["header"] as $row){
							echo '<th>'.$row.'</th>';
						}
					?>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<?php
						foreach($detail["footer"] as $row){
							echo '<th>'.$row.'</th>';
						}
					?>
				</tr>
			</tfoot>
			<tbody>
				<?php
					if(count($detail["results"]) == 0){
						echo '	<tr>
									<td colspan="'.count($detail["header"]).'">'.lang('br_no_results').'</td>
								</tr>';
					}
					foreach($detail["results"] as $row){
						echo '<tr>';
						foreach($row as $td){
							echo '<td>'.$td.'</td>';
						}
						echo '</tr>';
					}
				?>
			</tbody>
		</table>
		            	
	</form>                     
        
<?=$br_footer?>
<style type="text/css">
	#popin-container 
	{
		display:none;
		width: 207px;
		position: absolute;
		margin-top: -30px;
	}
	table#report-detail td {
		border: none;
	}
	#report-range 
	{
		cursor: pointer;
		padding: 4px 20px 4px 4px;
		background: url(<?=$theme?>images/config.png) right 3px no-repeat #F7F7F7;
		border-radius: 5px;
		-moz-border-radius: 5px;
		-webkit-border-radius: 5px;
		border: 1px #EEE solid;
		color: #777;
	}
	#report-input-body
	{
		padding: 10px 30px 10px 20px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$(".datepicker").datepicker();
		
		$('table.b2r_product_tbl tr:even').addClass('even');
		
		$('#report_export a').bind('click',function(){
			$('#export').val(1);
			$('#report_submit').trigger('click');
			return false;
		});
		
		$('#report-range').bind('click',
								function(){
									var a = $('#popin-container');
									$('#export').val(0);
									if(a.is(':visible')){
										a.hide();
									}else{
										a.css('marginLeft',$(this).width()+40).show();
									}
									return false;
								});
		$('div.popin-top img').bind('click',function(){
										$('#popin-container').hide();
									});
	});
</script>