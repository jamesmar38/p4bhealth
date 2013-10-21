<?php

$base_path                         = $_SERVER['DOCUMENT_ROOT'];
$inc_folder                         = $base_path . '/../inc/';

$passw = "partner4health"; //change this to a password of your choice.
if ($_POST) {
  require $inc_folder . 'DropboxUploader.php';
  try {
    // Rename uploaded file to reflect original name
    if ($_FILES['file']['error'] !== UPLOAD_ERR_OK)
        throw new Exception('File was not successfully uploaded from your computer.');

    $tmpDir = uniqid('/tmp/DropboxUploader-');
    if (!mkdir($tmpDir))
        throw new Exception('Cannot create temporary directory!');

    if ($_FILES['file']['name'] === "")
        throw new Exception('File name not supplied by the browser.');

    $tmpFile = $tmpDir.'/'.str_replace("/\0", '_', $_FILES['file']['name']);
    if (!move_uploaded_file($_FILES['file']['tmp_name'], $tmpFile))
        throw new Exception('Cannot rename uploaded file!');

		//if ($_POST['txtPassword'] != $passw)
    //        throw new Exception('Wrong Password');

    // Upload
		$uploader = new DropboxUploader('riekrause@gmail.com', 'acanada1');// enter dropbox credentials
    $uploader->upload($tmpFile, $_POST['dest']);

    echo '<span style="color: green;font-weight:bold;margin-left:393px;">File successfully uploaded to my Dropbox!</span>';
  } catch(Exception $e) {
    echo '<span style="color: red;font-weight:bold;margin-left:393px;">Error: ' . htmlspecialchars($e->getMessage()) . '</span>';
  }

  // Clean up
  if (isset($tmpFile) && file_exists($tmpFile))
    unlink($tmpFile);

  if (isset($tmpDir) && file_exists($tmpDir))
    rmdir($tmpDir);
}