<div id="contenu">
<!--<link rel="stylesheet" type="text/css" href="styles/style_login.css">-->
  <div class="login">
      <h1>Connexion</h1>
      <form method="POST" action="index.php?uc=connexion&action=valideConnexion">
        <input type="text" name="login"  size="30" maxlength="45" placeholder="Nom d'utilisateur" required="required" autocomplete="false" autofocus="true"/>
        <input id="mdp"  type="password"  name="mdp" size="30" maxlength="45" placeholder="Mot de passe" required="required" />
        <button type="submit" class="btn btn-primary btn-block btn-large">Se connecter</button>
      </form>
      <br>
  </div>
</div>