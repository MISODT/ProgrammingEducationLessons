<?php
session_start();

header('Content-Type: application/json');

require 'connect.php';

$q = $_GET['q'];
$params = explode('/', $q);

$type = $params[0];
$id = $params[1];

if($type === 'theory'){
    
    if(isset($id)){
        $theory = mysqli_query($connect, "SELECT * FROM `Theory` WHERE `TheoryId` = '$id'");
        $theory = mysqli_fetch_assoc($theory);
        echo json_encode($theory, JSON_UNESCAPED_UNICODE);
    }else{
        $theories = mysqli_query($connect, "SELECT * FROM `Theory`");
        
         $theoriesList = [];
        
        while($theory = mysqli_fetch_assoc($theories)){
            $theoriesList[] = $theory;
        }
        
        echo json_encode($theoriesList, JSON_UNESCAPED_UNICODE);
    }
}

if($type === 'themes'){
    
    if(isset($id)){
        $theme = mysqli_query($connect, "SELECT * FROM `Themes` WHERE `ThemeId` = '$id'");
        $theme = mysqli_fetch_assoc($theme);
        echo json_encode($theme, JSON_UNESCAPED_UNICODE);
    }else{
        $themes = mysqli_query($connect, "SELECT * FROM `Themes`");
        
        $themesList = [];
        
        while($theme = mysqli_fetch_assoc($themes)){
            $themesList[] = $theme;
        }
        
        echo json_encode($themesList, JSON_UNESCAPED_UNICODE);
    }
}

if($type === 'questions'){
    
    if(isset($id)){
        $question = mysqli_query($connect, "SELECT * FROM `Question` WHERE `QuestionId` = '$id'");
        $question = mysqli_fetch_assoc($question);
        echo json_encode($question, JSON_UNESCAPED_UNICODE);
    }else{
        $questions = mysqli_query($connect, "SELECT * FROM `Question`");
        
         $questionsList = [];
        
        while($question = mysqli_fetch_assoc($questions)){
            $questionsList[] = $question;
        }
    
        echo json_encode($questionsList, JSON_UNESCAPED_UNICODE);
    }
}

?>