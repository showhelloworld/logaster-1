<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'partnership_dev' );

/** MySQL database username */
define( 'DB_USER', 'partnership_dev' );

/** MySQL database password */
define( 'DB_PASSWORD', 'ASD612y3894115_a111' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define('WP_HOME', 'http://dev.logaster.pro/partnership/');
define('WP_SITEURL', 'http://dev.logaster.pro/partnership/');
$_SERVER['REQUEST_URI'] = str_replace("/wp-admin/", "/partnership/wp-admin/",  $_SERVER['REQUEST_URI']);


/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'SfJFAkIUR3|mtTjPQKyuYF;a3x-TzQMwG}$zbsasVSAhAn~}V^uXwH)G++%ynyJW');
define('SECURE_AUTH_KEY',  'Yei9%3h8f;Dc%g+!|AH#qB$qB`!8r%a1)t|m[WArq}LqsZ7pD4|mjPO2s)spKkAB');
define('LOGGED_IN_KEY',    'C$p`;fuH.*O:d?Y9V}5H,m+nnmU|;Yk hZ_LS.hRcdSC|UH<=QW#$%Q|p_/%<H.a');
define('NONCE_KEY',        'zT(i.Dhdn*dm(e?el5~!M-Meh}#ZpCF;hSj1nXIrAF/<-XT+ pu^zFVdLz;@!wZL');
define('AUTH_SALT',        ':*fgSM<-xVK_5wi!5b3{yPSKZtOgR5Wd[-g*j2h;]YyDw!S+O*78+QV-sn1U38ea');
define('SECURE_AUTH_SALT', 'e-7M6>jgI?k+-B)]K~(`HCO9zSnD(Tg+~1LZED%GgRWM+^K]T^7<0zem^[p*ie6^');
define('LOGGED_IN_SALT',   'j+C+lFkn`$p|Y|E; -sXg5<;{xZl ?j8mG$` pe`a(o$(O4% `5U D&m0HMYDWCY');
define('NONCE_SALT',       'Zwf][Sx34KT{@[X}!|N;-<E,NaIjnNPZASK-}UmY:wD~TV+4^=Nv`r#&%5s[J{22');
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );

define('WP_CONTENT_DIR', '/var/www/devcopy/partnership/wp-content');

define('FS_METHOD', 'direct');

#$_SERVER['REQUEST_URI'] = str_replace("/wp-admin/", "/partnership/wp-admin/",  $_SERVER['REQUEST_URI']);
#$_SERVER[‘REQUEST_URI’] = ‘/partnership . $_SERVER[‘REQUEST_URI’];
#$_SERVER[‘SCRIPT_NAME’] = ‘/partnership . $_SERVER[‘SCRIPT_NAME’];
#$_SERVER[‘PHP_SELF’] = ‘/partnership . $_SERVER[‘PHP_SELF’];

