<?php 

$array = array();

function populateArray(&$array){
	for ($i=0; $i < 7; $i++) { 
		$array[$i] = rand(0,20);
	}
}
populateArray($array);

echo $array[2];
echo "<br>";

$stringFromArray = implode(",", $array);

function arrayfromString($string)
{
	$newArray = explode(",", $string);
	foreach ($newArray as $key => $value) {
		$newArray[$key] = intval($value);
	}
	return $newArray;
}
$newArray = arrayfromString($stringFromArray);
unset($array);


if (in_array(14, $newArray)) {
	echo "Existe 14.";
}else{
	echo "Não existe 14.";
}
echo "<br>";

function removeLessers(&$array){
	for ($i=1; $i < sizeof($array); $i++) { 
		if ($array[$i] < $array[$i-1]) {
			array_splice($array,$i,1);
			$i--;
		}
	}
}
removeLessers($newArray);

unset($newArray[sizeof($newArray)-1]);
echo sizeof($newArray);

$newArray = array_reverse($newArray);

?>