<?php
	//Source : http://bavotasan.com/2011/convert-hex-color-to-rgb-using-php/ 
	//deux fonction pour convertir du hex color en RVB et dans l'autre sens

	//retourne un chaine de caractère ave cun delimiter , contenant les 3 couleur RVB
	function hex2rgb($hex) {
		if(!empty($hex)){
			$hex = str_replace("#", "", $hex);
		   	if(strlen($hex) == 3) {
		      	$r = hexdec(substr($hex,0,1).substr($hex,0,1));
		      	$g = hexdec(substr($hex,1,1).substr($hex,1,1));
		      	$b = hexdec(substr($hex,2,1).substr($hex,2,1));
		   	} else {
		      	$r = hexdec(substr($hex,0,2));
		      	$g = hexdec(substr($hex,2,2));
		      	$b = hexdec(substr($hex,4,2));
		   	}
		   	$rgb = $r.",".$g.",".$b;
		   	return $rgb;
		}else
			return "";
	}

	//inversement convertie en hex les couleur rvb
	function rgb2hex($rgb) {
		if(!empty($rgb)){
			$array = explode(',', $rgb); 
			$hex = "#";
	   		$hex .= str_pad(dechex($array[0]), 2, "0", STR_PAD_LEFT);
	   		$hex .= str_pad(dechex($array[1]), 2, "0", STR_PAD_LEFT);
	   		$hex .= str_pad(dechex($array[2]), 2, "0", STR_PAD_LEFT);
	   		return $hex; // returns the hex value including the number sign (#)
		}else
			return "";
	   	
	}
?>