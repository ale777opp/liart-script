<?php
    $dbhost='localhost:3306';// хост базы
    $dbuser='root';// пользователь базы
    $dbpass='root';//пароль входа в БД
    $dbname='user117';//имя БД

    $mysqli=new mysqli($dbhost,$dbuser,$dbpass,$dbname);
    $mysqli-> set_charset("utf8");

$result=$mysqli->query("SELECT MAX(news_news.id), MIN(news_news.id) FROM news_news");
$row = $result->fetch_assoc();
//echo "<pre>";print_r($row);echo "</pre>";

for($i=$row['MIN(news_news.id)']; $i<=$row['MAX(news_news.id)']; $i++){ //$row['MAX(news_news.id)']
//print_r($i);

$result=$mysqli->query("SELECT DATE_FORMAT(create_date,'%d.%m.%Y'), content FROM `news_news` WHERE id=$i");
if (!empty($result)) {

$result = $result->fetch_assoc();

$new_date ='<p class="note">Дата: '.$result["DATE_FORMAT(create_date,'%d.%m.%Y')"].'. </p>';

$html_content = htmlspecialchars($result['content']);
$html_date = htmlspecialchars($new_date);

$new_content = html_entity_decode($html_date.$html_content);

try {
	$query = "UPDATE news_news SET CONTENT = '".$new_content."' WHERE id =".$i;
$result = $mysqli->query($query);
}
catch (Exception $e) {
	print_r($i." Произошла ошибка. = ".$e);
}
}
//($i%2 == 0) ? print_r('-'): print_r('|');

}
?>