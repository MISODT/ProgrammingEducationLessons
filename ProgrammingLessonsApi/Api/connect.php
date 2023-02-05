<?php 
	$connect = new mysqli("localhost", "f0773505_DerrJe", "HuJl3TVO", "f0773505_ProgrammingLessons");
    if($connect->connect_error){
        die("Ошибка: " . $connect->connect_error);
    }
?>