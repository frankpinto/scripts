<?
require_once('twitteroauth.php');

$oauth_token = '214197493-bnfxPub101obl3nhEyrDjhRWJZfuqo9wtkGWEdGH';
$oauth_token_secret = 'DtNtNQaEcowxr8U5faNSqZ9LgubLLJ1WnJWjpLpe8';
$connection = new TwitterOAuth('5p5rmNROB97RdDkiMZ2uKA', '2PifWxLODCx69tRNpVdccFMun4rqGX5Uj8c792Paxs', $oauth_token, $oauth_token_secret);
//$content = $connection->post("statuses/update", array('status' => 'Testing!'));

print_r($content);
?>
