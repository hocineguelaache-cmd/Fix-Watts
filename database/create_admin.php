<?php
declare(strict_types=1);

/**
 * Crée (ou met à jour) un compte « professionnel » (accès au tableau de bord).
 *
 * À lancer en ligne de commande, depuis la racine du projet :
 *     php database/create_admin.php
 *
 * Le mot de passe est demandé au clavier : il n'est écrit nulle part
 * (seul son hash bcrypt est enregistré en base).
 */
if (PHP_SAPI !== 'cli') {
    http_response_code(403);
    exit('Ce script se lance uniquement en ligne de commande.');
}

require_once __DIR__ . '/../config/db.php';

function ask(string $label, bool $hidden = false): string
{
    echo $label;

    $canHide = $hidden
        && stripos(PHP_OS, 'WIN') !== 0
        && function_exists('shell_exec');

    if ($canHide) {
        shell_exec('stty -echo');
        $value = trim((string) fgets(STDIN));
        shell_exec('stty echo');
        echo PHP_EOL;
        return $value;
    }

    return trim((string) fgets(STDIN));
}

function fail(string $message): never
{
    fwrite(STDERR, $message . PHP_EOL);
    exit(1);
}

$pdo = getPDO();

$email = strtolower(ask('Email de connexion : '));
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    fail('Adresse email invalide.');
}

$stmt = $pdo->prepare('SELECT idUtili FROM utilisateur WHERE email = ? LIMIT 1');
$stmt->execute([$email]);
$existingId = $stmt->fetchColumn();

if ($existingId !== false) {
    $answer = strtolower(ask('Ce compte existe déjà. Changer son mot de passe et le passer en professionnel ? (o/n) : '));
    if ($answer !== 'o') {
        fail('Aucune modification.');
    }
} else {
    $prenom = ask('Prénom : ');
    $nom    = ask('Nom : ');
    $phone  = ask('Téléphone (9 ou 10 chiffres, facultatif) : ');

    if ($prenom === '' || $nom === '') {
        fail('Le prénom et le nom sont obligatoires.');
    }
    if ($phone !== '' && !preg_match('/^[0-9]{9,10}$/', $phone)) {
        fail('Numéro de téléphone invalide (9 ou 10 chiffres).');
    }
}

$password  = ask('Mot de passe (12 caractères ou plus conseillés) : ', true);
$password2 = ask('Confirme le mot de passe : ', true);

if ($password !== $password2) {
    fail('Les deux mots de passe sont différents.');
}
if (strlen($password) < 6) {
    fail('Le mot de passe doit contenir au moins 6 caractères.');
}

$hash = password_hash($password, PASSWORD_BCRYPT, ['cost' => 12]);

if ($existingId !== false) {
    $pdo->prepare("UPDATE utilisateur SET mdp = ?, type = 'professionnel' WHERE idUtili = ?")
        ->execute([$hash, $existingId]);
    echo "Compte mis à jour : {$email} (professionnel)." . PHP_EOL;
} else {
    $pdo->prepare(
        "INSERT INTO utilisateur (nom, prenom, email, numTel, mdp, type, created_at)
         VALUES (?, ?, ?, ?, ?, 'professionnel', NOW())"
    )->execute([$nom, $prenom, $email, $phone !== '' ? $phone : null, $hash]);
    echo "Compte créé : {$email} (professionnel)." . PHP_EOL;
}
