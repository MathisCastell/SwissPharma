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
    header("Location: Index.php");
    exit();
}

// Récupération des données depuis la table FraisForfaitises avec des jointures
$sql = "SELECT u.Nom AS NomUtilisateur, ff.TypeFrais, ff.Quantite, ff.MontantUnitaire, ff.MontantTotal, f.Mois
        FROM FraisForfaitises ff
        JOIN FichesDeFrais f ON ff.FicheID = f.FicheID
        JOIN Utilisateurs u ON f.UserID = u.UserID";

$result = $conn->query($sql);

?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Comptable</title>
</head>
<body>
    <div class="content">
        <h2>Welcome Comptable</h2>

        <!-- Affichage des frais forfaitisés dans un tableau -->
        <table border="1">
            <tr>
                <th>NomUtilisateur</th>
                <th>TypeFrais</th>
                <th>Quantite</th>
                <th>MontantUnitaire</th>
                <th>MontantTotal</th>
                <th>Mois</th>
            </tr>
            <?php
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $row["NomUtilisateur"] . "</td>";
                    echo "<td>" . $row["TypeFrais"] . "</td>";
                    echo "<td>" . $row["Quantite"] . "</td>";
                    echo "<td>" . $row["MontantUnitaire"] . "</td>";
                    echo "<td>" . $row["MontantTotal"] . "</td>";
                    echo "<td>" . $row["Mois"] . "</td>";
                    echo "</tr>";
                }
            } else {
                echo "<tr><td colspan='7'>Aucun frais forfaitisé trouvé.</td></tr>";
            }
            ?>
        </table>

    </div>
</body>
</html>

<?php
$conn->close();
?>
