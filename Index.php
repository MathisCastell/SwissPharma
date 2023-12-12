<?php
// Connexion à la base de données (à compléter avec vos propres informations)
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "swisspharma";

$conn = new mysqli($servername, $username, $password, $dbname);

// Vérification de la connexion
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Traitement du formulaire lorsqu'il est soumis
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $login = $_POST["login"];
    $motDePasse = $_POST["motDePasse"];

    // Utilisation de requête préparée pour éviter l'injection SQL
    $stmt = $conn->prepare("SELECT * FROM Utilisateurs WHERE Login = ? AND MotDePasse = ?");
    $stmt->bind_param("ss", $login, $motDePasse);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Utilisateur trouvé dans la base de données
        $row = $result->fetch_assoc();

        // Stocker l'identifiant de l'utilisateur dans une session
        session_start();
        $_SESSION['UserID'] = $row['UserID'];

        // Redirection en fonction du type d'utilisateur
        if ($row["TypeUtilisateur"] == "Comptable") {
            header("Location: menu_comptable.php");
            exit();
        } elseif ($row["TypeUtilisateur"] == "Utilisateur") {
            header("Location: menu_utilisateur.php");
            exit();
        }
    } else {
        $errorMessage = "Identifiant ou mot de passe incorrect";
    }

    $stmt->close();
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Connexion</title>
</head>
<body>

<section id="login_section">
    <div class="login-container">
        <img src="LogoSwissPharma.png" alt="Logo SwissPharma">
        <h2>Connexion</h2>
        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
            <input type="text" name="login" placeholder="Identifiant" required>
            <input type="password" name="motDePasse" placeholder="Mot de passe" required>
            <button type="submit">Se connecter</button>
        </form>
        <p id="error-message"><?php if (isset($errorMessage)) echo $errorMessage; ?></p>
    </div>
</section>
</body>
</html>