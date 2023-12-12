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

// Vérification de la session pour s'assurer que l'utilisateur est connecté
session_start();
if (!isset($_SESSION['UserID'])) {
    header("Location: index.php");
    exit();
}

// Récupération du nombre d'enregistrements actuels dans la table FichesDeFrais
$countQuery = $conn->query("SELECT COUNT(*) FROM FichesDeFrais");
$row = $countQuery->fetch_assoc();
$numRows = $row['COUNT(*)'];

// Nouvel identifiant auto-incrémenté
$FicheID = $numRows + 2;

// Traitement du formulaire d'ajout de frais lorsqu'il est soumis
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["ajouterFrais"])) {
    $userID = $_SESSION['UserID'];
    $typeFrais = $_POST["typeFrais"];
    $quantite = $_POST["quantite"];
    $montantUnitaire = $_POST["montantUnitaire"];

    // Insertion d'une nouvelle fiche avec le nouvel identifiant
    $etat = "En attente";
    $mois = date("F Y");

    $insertFicheStmt = $conn->prepare("INSERT INTO FichesDeFrais (FicheID, UserID, Mois, Etat) VALUES (?, ?, ?, ?)");
    $insertFicheStmt->bind_param("iiss", $FicheID, $userID, $mois, $etat);
    $insertFicheStmt->execute();
    $insertFicheStmt->close();

    // Insertion du nouveau frais dans la table FraisForfaitises
    $insertStmt = $conn->prepare("INSERT INTO FraisForfaitises (ficheID, TypeFrais, Quantite, MontantUnitaire, MontantTotal) VALUES (?, ?, ?, ?, ?)");
    $montantTotal = $quantite * $montantUnitaire;
    $insertStmt->bind_param("isddd", $FicheID, $typeFrais, $quantite, $montantUnitaire, $montantTotal);
    $insertStmt->execute();
    $insertStmt->close();

    // Vérification de l'existence des champs liés aux frais hors forfait avant l'insertion
    if (isset($_POST["dateHorsForfait"]) && isset($_POST["libelleHorsForfait"]) && isset($_POST["montantHorsForfait"])) {
        $dateHorsForfait = $_POST["dateHorsForfait"];
        $libelleHorsForfait = $_POST["libelleHorsForfait"];
        $montantHorsForfait = $_POST["montantHorsForfait"];

        // Insertion du nouveau hors forfait dans la table FraisHorsForfait
        $insertHorsForfaitStmt = $conn->prepare("INSERT INTO FraisHorsForfait (FicheID, Date, Libelle, Montant) VALUES (?, ?, ?, ?)");
        $insertHorsForfaitStmt->bind_param("issd", $FicheID, $mois, $libelleHorsForfait, $montantHorsForfait);
        $insertHorsForfaitStmt->execute();
        $insertHorsForfaitStmt->close();
    }
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Dashboard</title>
</head>
<body>
    <div class="content">
        <h2>Welcome to the Dashboard</h2>
        <p>This is the main content of your dashboard page.</p>

        <!-- Formulaire d'ajout de frais -->
        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
            <label for="typeFrais">Type de frais:</label>
            <input type="text" name="typeFrais" required>
            <label for="quantite">Quantité:</label>
            <input type="number" name="quantite" required>
            <label for="montantUnitaire">Montant unitaire:</label>
            <input type="number" name="montantUnitaire" step="0.01" required>

            <!-- Nouveaux champs pour les frais hors forfait (optionnels) -->
            <label for="libelleHorsForfait">Libellé hors forfait:</label>
            <input type="text" name="libelleHorsForfait">
            <label for="montantHorsForfait">Montant hors forfait:</label>
            <input type="number" name="montantHorsForfait" step="0.01">

            <button type="submit" name="ajouterFrais">Ajouter Frais</button>
        </form>
    </div>
</body>
</html>

<?php
$conn->close();
?>
