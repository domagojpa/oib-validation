<?php
function CheckOIB($oib) {

	if (strlen($oib) != 11 || !is_numeric($oib)) {
		return false;
	}

	$a = 10;

	for ($i = 0; $i < 10; $i++) {

		$a = $a + intval(substr($oib, $i, 1), 10);
		$a = $a % 10;

		if ( $a == 0 ) { $a = 10; }

		$a *= 2;
		$a = $a % 11;

	}

	$kontrolni = 11 - $a;

	if ( $kontrolni == 10 ) { $kontrolni = 0; }

	return $kontrolni == intval(substr($oib, 10, 1), 10);
}
