<?php 

$simple_s3_uploader_replacement_variables = '
<div class="s3_uploader_replacements" style="font-size: 90%; font-family: Menlo, Monaco, Courier, monospace; margin: 10px;">
%t : current unix timestamp<br />
%Y : current year (4 digits)<br />
%M : current month (2 digits)<br />
%D : current day (2 digits)<br />
%f : filename (no extension)<br />
%e : filename extension (no period)<br />
%m : member ID<br />
%u : member\'s username<br />
%s : member\'s screenname<br />
%g : name of the group member is a part of<br />
%w : name of the current weblog<br />
%c : name of the current channel
</div>
';

$lang = array(

'simple_s3_uploader_s3_key' => 'S3 Key',
'simple_s3_uploader_s3_secret' => 'S3 Secret',
'simple_s3_uploader_s3_bucket' => 'S3 Bucket',
'simple_s3_uploader_s3_bucket_region' => 'S3 Bucket Region',
'simple_s3_uploader_acl_public_read' => 'Public Can View Files?',
'simple_s3_uploader_cache_control' => 'Cache Files for # of Days',
'simple_s3_uploader_max_filesize' => 'Max Filesize',
'simple_s3_uploader_filename' => 'Format for S3 Filenames' . $simple_s3_uploader_replacement_variables,

'simple_s3_uploader_image_width' => 'Image Width',
'simple_s3_uploader_image_height' => 'Image Height',
'simple_s3_uploader_image_quality' => 'Image Quality',
'simple_s3_uploader_image_resize_method' => 'Image Resize Method',
'simple_s3_uploader_image_upscale' => 'Upscale Images?',

'simple_s3_uploader_thumbname' => 'Format for S3 Thumbnail Filenames' . $simple_s3_uploader_replacement_variables,
'simple_s3_uploader_thumb_width' => 'Thumbnail Width',
'simple_s3_uploader_thumb_height' => 'Thumbnail Height',
'simple_s3_uploader_thumb_quality' => 'Thumbnail Quality',
'simple_s3_uploader_thumb_resize_method' => 'Thumbnail Resize Method',
'simple_s3_uploader_thumb_upscale' => 'Upscale Thumbnails?',

'' => '');
?>