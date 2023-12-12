<?php
// Démarrez la session
session_start();

// Vérifiez si l'utilisateur est connecté
if (!isset($_SESSION['UserID'])) {
    // Si l'utilisateur n'est pas connecté, redirigez-le vers la page de connexion (index.php dans ce cas)
    header("Location: index.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Menu Utilisateur</title>
</head>
<body>
    <div class="menu">
        <h2>Menu Utilisateur</h2>
        <p>Bienvenue, Utilisateur !</p>
        <ul>
            <li><a href="Utilisateur.php">Accueil</a></li>
            <!-- Ajoutez d'autres liens du menu ici -->
            <li><a href="Index.php">Déconnexion</a></li>
        </ul>
    </div>
</body>
</html>
