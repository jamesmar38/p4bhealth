$(document).ready(function() {
	$("div.simple_s3_uploader a.remove-file").live('click', function() {
		$base = $(this).parents(".simple_s3_uploader");
		$base.children("p").remove();
		$base.children("input[type=hidden]").each(function() {
			if($(this).attr('name').indexOf("[filename]") != -1) {
				$(this).val("");
			} else {
				$(this).remove();
			}
		});
		return false;
	});
});