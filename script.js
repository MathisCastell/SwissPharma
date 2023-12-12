function submitForm() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;

    // Envoyer les données au serveur pour authentification
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "login.php", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                // Réponse du serveur
                var response = JSON.parse(xhr.responseText);

                if (response.success) {
                    // Authentification réussie, rediriger vers la page appropriée
                    document.location.href = "dashboard.html";
                } else {
                    // Afficher un message d'erreur
                    document.getElementById("error-message").innerText = "Nom d'utilisateur ou mot de passe incorrect.";
                }
            } else {
                // Gestion de l'erreur en cas de problème avec la requête
                console.error("Erreur de requête: " + xhr.status);
                document.getElementById("error-message").innerText = "Erreur de connexion au serveur.";
            }
        }
    };

    // Envoyer les données d'authentification au serveur en tant que formulaire
    var formData = "username=" + encodeURIComponent(username) + "&password=" + encodeURIComponent(password);
    xhr.send(formData);
}
