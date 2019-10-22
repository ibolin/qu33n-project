<?php

// Step 1: Get a datase connection from our help class
$db = DbConnection::getConnection();

// Step 2: Create & run the query
$stmt = $db->prepare(
  'INSERT INTO personCert
    (personId, certId, renewDate, expireDate)
  VALUES (?, ?, ?, ?)'
);

$stmt->execute([
  $_POST['personId'],
  $_POST['certId'],
  $_POST['renewDate'],
  $_POST['expireDate']
]);

// Step 4: Output
header('HTTP/1.1 303 See Other');
header('Location: ../records/');
// header('Location: ../records/?personId='.$personId);
