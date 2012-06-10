<?php
/**
 * Script to gather up all native functions, classes, and interfaces from any release of
 * PHP for the purposes of updating the VIM syntax file.
 *
 * @author Paul Garvin <paul@paulgarvin.net>
 * @copyright Copyright 2009 Paul Garvin
 * @license http://www.opensource.org/licenses/mit-license.php MIT License
 */

/**
 * This script works by loading up PHP extensions and using reflection to pull
 * the functions, classes, and constants out of those extesions. The list of extensions
 * below are ones included with PHP 5.3 source code. The ones commented out depend on
 * an external library being installed, are Unix specific, or just not commonly used.
 *
 * Add, comment, or uncomment to fit your needs or particular PHP installation.
 * Remember that some of these extensions are likely shared extensions and must be
 * enabled in your php.ini file.
 *
 * NOTE: mysqlnd is not included because it exposes no functions, classes, or constants.
 * The pdo_* extensions are not included in the list because they do not expose any
 * functions, classes, or constants themselves. The constants and methods specific
 * to that driver are exposed though the PDO extension itself. The pdo_* extensions
 * must still be enabled (compiled in or loaded as shared) for these constants to show up.
 */ 
$extensions = array(
	'core',	'bcmath', 'bz2', 'calendar', 'com_dotnet',
	'ctype', 'curl', 'date', /*'dba',*/	'dom',
	'enchant', 'ereg', 'exif', 'fileinfo', 'filter',
	'ftp', 'gd', 'gettext',	'gmp', 'hash',
	'iconv', 'imap', /*'interbase',*/ 'intl', 'json',
	'ldap',	'libxml', 'mbstring', 'mcrypt',	'mhash',
	/*'mssql',*/ 'mysql', 'mysqli',	/*'oci8', 'oci8_11g',*/
	'odbc',	'openssl', 'pcntl',	'pcre',	'pdo',
	'pgsql', 'phar', /*'posix', 'pspell', 'readline',*/
	/*'recode',*/ 'reflection',	'session', 'shmop',	'simplexml',
	/*'snmp',*/	'soap',	'sockets', 'spl', 'standard',
	'sqlite', 'sqlite3', /*'sybase_ct', 'sysvmsg', 'sysvsem', 'sysvshm',*/
	'tidy', 'tokenizer', 'xml', 'xmlreader', 'xmlwriter',
	'xmlrpc', 'xsl', /*'wddx',*/ 'zip', 'zlib'
	);

$out_file = '~/php_vimgen_out.vim'; // Pick your output file & location.
$out_str = '';
$store = array();
$errors = array();

foreach ($extensions as $ext) {
	echo "Processing extension '$ext'." . PHP_EOL;
	try {
		$extension  = new ReflectionExtension($ext);  
		$ext_info = array();
		$ext_info['name'] = $extension->getName();

		$ext_functions = array_keys($extension->getFunctions());
		$ext_constants = array_keys($extension->getConstants());

		$classes = $extension->getClasses();
		$ext_classes = array();

		foreach ($classes as $class) {
			$ext_classes[] = $class->getName();
			$ext_constants = array_merge($ext_constants, array_keys($class->getConstants()));
		}

		$ext_constants = array_unique($ext_constants);

		if (count($ext_functions)) {
			$ext_info['functions'] = implode(' ', $ext_functions);
		}
		if (count($ext_constants)) {
			$ext_info['constants'] = implode(' ', $ext_constants);
		}
		if (count($ext_classes)) {
			$ext_info['classes'] = implode(' ', $ext_classes);
		}

	} catch (Exception $e) {
		$errors[] = "\"Error: '$ext' " . $e->getMessage() . "\n";
		echo 'Error Encountered.' . PHP_EOL;
	}

	$store[$ext] = $ext_info;
}

$out_str .= "syn case match\n\n";

foreach ($store as $ext) {
	if (isset($ext['constants'])) {
		$out_str .= '" ' . $ext['name'] . "\n";
		$out_str .= 'syn keyword phpConstants ' . $ext['constants'] . " contained\n\n";
	}
}

$out_str .= "syn case ignore\n\n";

foreach ($store as $ext) {
	$out_str .= '" ' . $ext['name'] . "\n";
	if (isset($ext['functions'])) {
		$out_str .= 'syn keyword phpFunctions ' . $ext['functions'] . " contained\n";
	}
	if (isset($ext['classes'])) {
		$out_str .= 'syn keyword phpClasses ' . $ext['classes'] . " contained\n\n";
	}
}

foreach ($errors as $error) {
	$out_str .= "$error\n";
}

file_put_contents($out_file, $out_str);

?>
