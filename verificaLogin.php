
<?php
session_start();

$hostname = "127.0.0.1";
$user     = "root";
$password = "";
$database = "mecanica";

$conexao  = new mysqli($hostname,$user,$password,$database);

if($conexao -> connect_errno){
  echo "deu nao paizao" . $conexao -> connect_error;
}else{
  $nome  = $conexao -> real_escape_string($_POST['nome']);
  $senha = $conexao -> real_escape_string($_POST['senha']);

  $sql   = "SELECT `id`,`nome`, `senha` FROM `funcionario` where `nome` = '".$nome."' and `senha` = '".$senha."';";

  $resultado = $conexao->query($sql);

  if($resultado -> num_rows != 0){
    $row = $resultado ->fetch_row();
    $_SESSION['nome'] = $row[1];
    $_SESSION['idFuncionario'] = $row[0];

    $conexao ->close();
    header('Location: site.php',true, 301);
    exit();
  }else{
    $conexao->close();
    header('Location: index.php',true, 301);
    exit();
  }
}


?>
