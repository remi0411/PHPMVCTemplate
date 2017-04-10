<div class ="erreur">
    <ul>
        <?php
        foreach($_REQUEST['erreurs'] as $erreur)
        {
            ?>
            <div class="row">
                <div class="col-md-7 col-md-offset-1">
                    <div class="alert alert-danger" style="text-align: center">
                        <?= $erreur ?>
                    </div>
                </div>
            </div>
            <?php
        }
        ?>
    </ul></div>
