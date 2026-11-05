

SET NAMES utf8mb4;

-- ------------------------------------------------------------
--  Utilisateurs (clients et professionnels/admins)
--  type = 'professionnel' donne accès au tableau de bord.
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS utilisateur (
    idUtili     INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom         VARCHAR(100) NOT NULL,
    prenom      VARCHAR(100) NOT NULL,
    email       VARCHAR(190) NOT NULL,
    numTel      VARCHAR(20)  NULL,
    mdp         VARCHAR(255) NOT NULL,              -- hash bcrypt (password_hash)
    type        ENUM('client','professionnel') NOT NULL DEFAULT 'client',
    created_at  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_login  DATETIME NULL,
    PRIMARY KEY (idUtili),
    UNIQUE KEY uq_utilisateur_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
--  Catégories
--  Les noms doivent rester identiques à ceux utilisés dans le code
--  (public/includes/products.php et public/dashboard.php).
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS categorie (
    idCat        INT UNSIGNED NOT NULL AUTO_INCREMENT,
    intituleCat  VARCHAR(60) NOT NULL,
    PRIMARY KEY (idCat),
    UNIQUE KEY uq_categorie_intitule (intituleCat)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
--  Articles
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS article (
    idArt     INT UNSIGNED NOT NULL AUTO_INCREMENT,
    idCat     INT UNSIGNED NOT NULL,
    intitule  VARCHAR(150) NOT NULL,
    prix      INT UNSIGNED NOT NULL,                -- prix en DA
    nbDispo   INT UNSIGNED NOT NULL DEFAULT 0,      -- stock
    marque    VARCHAR(80)  NOT NULL,
    photo     VARCHAR(255) NOT NULL DEFAULT '',     -- ex : img/marteau.jpg
    PRIMARY KEY (idArt),
    KEY idx_article_intitule (intitule),            -- le code cherche par intitulé
    KEY idx_article_cat (idCat),
    CONSTRAINT fk_article_categorie
        FOREIGN KEY (idCat) REFERENCES categorie (idCat)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
--  Promotions (une seule promo par article : ON DUPLICATE KEY UPDATE)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS promo (
    idArt     INT UNSIGNED NOT NULL,
    oldPrice  INT UNSIGNED NOT NULL,
    newPrice  INT UNSIGNED NOT NULL,
    PRIMARY KEY (idArt),
    CONSTRAINT fk_promo_article
        FOREIGN KEY (idArt) REFERENCES article (idArt) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
--  Achats (commandes)
--  modeLivraison : 'home' (domicile) ou 'zrexpress'
--  wilaya : code de la wilaya (ex : '06'), NULL pour la livraison à domicile
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS achat (
    idAchat        INT UNSIGNED NOT NULL AUTO_INCREMENT,
    idClient       INT UNSIGNED NOT NULL,
    total          INT UNSIGNED NOT NULL,           -- frais de livraison inclus
    dateAchat      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modeLivraison  ENUM('home','zrexpress') NOT NULL DEFAULT 'home',
    wilaya         VARCHAR(10) NULL,
    PRIMARY KEY (idAchat),
    KEY idx_achat_client (idClient),
    KEY idx_achat_date (dateAchat),
    CONSTRAINT fk_achat_utilisateur
        FOREIGN KEY (idClient) REFERENCES utilisateur (idUtili)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
--  Lignes d'achat
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS article_achat (
    idAchat    INT UNSIGNED NOT NULL,
    idArticle  INT UNSIGNED NOT NULL,
    quantite   INT UNSIGNED NOT NULL DEFAULT 1,
    PRIMARY KEY (idAchat, idArticle),
    KEY idx_article_achat_article (idArticle),
    CONSTRAINT fk_article_achat_achat
        FOREIGN KEY (idAchat) REFERENCES achat (idAchat) ON DELETE CASCADE,
    CONSTRAINT fk_article_achat_article
        FOREIGN KEY (idArticle) REFERENCES article (idArt)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
--  Factures (une facture par achat)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS facture (
    idFac    INT UNSIGNED NOT NULL AUTO_INCREMENT,
    idAchat  INT UNSIGNED NOT NULL,
    etat     ENUM('non payée','payée') NOT NULL DEFAULT 'non payée',
    dateFac  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (idFac),
    UNIQUE KEY uq_facture_achat (idAchat),
    CONSTRAINT fk_facture_achat
        FOREIGN KEY (idAchat) REFERENCES achat (idAchat) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
--  Favoris (liste de souhaits) : INSERT IGNORE dans le code
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS favori (
    idClient   INT UNSIGNED NOT NULL,
    idArticle  INT UNSIGNED NOT NULL,
    PRIMARY KEY (idClient, idArticle),
    KEY idx_favori_article (idArticle),
    CONSTRAINT fk_favori_utilisateur
        FOREIGN KEY (idClient) REFERENCES utilisateur (idUtili) ON DELETE CASCADE,
    CONSTRAINT fk_favori_article
        FOREIGN KEY (idArticle) REFERENCES article (idArt) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
--  Notes des articles (de 0.0 à 10.0, une note par client et par article)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS note (
    idClient   INT UNSIGNED NOT NULL,
    idArticle  INT UNSIGNED NOT NULL,
    note       DECIMAL(3,1) NOT NULL,
    PRIMARY KEY (idClient, idArticle),
    KEY idx_note_article (idArticle),
    CONSTRAINT fk_note_utilisateur
        FOREIGN KEY (idClient) REFERENCES utilisateur (idUtili) ON DELETE CASCADE,
    CONSTRAINT fk_note_article
        FOREIGN KEY (idArticle) REFERENCES article (idArt) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
--  Messages du formulaire de contact
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS message (
    idMsg     INT UNSIGNED NOT NULL AUTO_INCREMENT,
    idClient  INT UNSIGNED NOT NULL,
    theme     VARCHAR(255) NOT NULL,
    contenu   TEXT NOT NULL,
    date_msg  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (idMsg),
    KEY idx_message_client (idClient),
    CONSTRAINT fk_message_utilisateur
        FOREIGN KEY (idClient) REFERENCES utilisateur (idUtili) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
--  Catégories utilisées par le site
--  (les 6 dernières sont classées « Électricité » par le code)
-- ------------------------------------------------------------
INSERT IGNORE INTO categorie (intituleCat) VALUES
    ('outillage'),
    ('visserie'),
    ('plomberie'),
    ('peinture'),
    ('jardinage'),
    ('serrurerie'),
    ('ampoules&eclairage'),
    ('cables&fils'),
    ('disjoncteurs'),
    ('prises&interrupteurs'),
    ('projecteurs'),
    ('comptage');
    
    SET NAMES utf8mb4;

INSERT INTO utilisateur (nom, prenom, email, numTel, mdp, type, created_at)
VALUES ('Admin', 'Hocine', 'hocineguelaache@gmail.com', NULL,
        '$2y$12$i9iU9tIBSPZ4TqY3igePhuoD.6RzT8XBfO/se1ip/3hq/m6mFodIG',
        'professionnel', NOW());
