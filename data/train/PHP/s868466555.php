<?php
/**
 * Created by PhpStorm.
 * User: ramia
 * Date: 2016/08/31
 * Time: 10:28
 */

/*
 * http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0201
 */


class Item{
	public $name;
	public $price;
	public $minimumPrice;

	public $material_items = [];

	public function __construct( $name , $price ){
		$this->name  = $name;
		$this->price = intval($price);
		$this->minimumPrice = intval($price);
	}

	public function materialItems($material_items){
		$this->material_items = $material_items;
	}

	public function getMaterials(){
		return $this->material_items;
	}

	public function setMinimumPrice( $minimumPrice ){
		$this->minimumPrice = intval($minimumPrice);
	}

	public function getMinimumPrice(){
		return $this->minimumPrice;
	}
}

while(true){
	$items = [];

	$n = fgets(STDIN);
	if( $n == 0 ){
		exit;
	}
	for( $i=0;$i<$n;$i++ ){
		$line = trim(fgets(STDIN));
		list( $name , $price ) = explode(' ',$line);
		$items[$name] = new Item( $name, $price );
	}

	$n = fgets(STDIN);
	for( $i=0;$i<$n;$i++ ){
		$line = trim(fgets(STDIN));
		$recipe_arr = explode(' ',$line);
		$generate_item = '';
		$material_items = [];
		for ( $j=0;$j<count($recipe_arr);$j++ ){
			if( $j == 0 ){
				$generate_item = $recipe_arr[$j];
			}
			if( $j >= 2 ){
				$material_items[] = $recipe_arr[$j];//$items[$recipe_arr[$j]];
			}
		}
		$items[$generate_item]->materialItems($material_items);
	}
	$emulateItem = trim(fgets(STDIN));

	$loop = true;
	while( $loop ){
		$loop = false;
		foreach ( $items as $item_key => $item_value ){
			$materials = $item_value->getMaterials();
			if( count($item_value->getMaterials()) > 0 ){
				$create_value = 0;
				foreach ( $materials as $material_value ){
					$create_value += $items[$material_value]->getMinimumPrice();
				}
				if( $item_value->getMinimumPrice() > $create_value ){
					$item_value->setMinimumPrice($create_value);
					$loop = true;
				}
			}
		}
	}
	echo $items[$emulateItem]->getMinimumPrice()."\n";
}

?>