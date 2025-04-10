<?php
        // put your code here
//        $fp = fopen("input.txt", "r");
        $fp = fopen("php://stdin", "r");
        while(true) {
            $n = fgets($fp);
            if($n == 0) break;
            
            $data = new Data();
            for($i = 0; $i < $n; $i++) {
                $buf = fgets($fp);
                $splited = explode(" ", $buf);
                $data->update($splited[0], $splited[1]*$splited[2]);
            }
            $data->countGoodEmployee();
        }
        
        Class Data {
            private $_employee;
            
            public function __construct() {
                $this->_employee = array();
            }
            
            public function update($id, $sales) {
                for($i = 0; $i < count($this->_employee); $i++) {
                    if( $this->_employee[$i]->getId() == $id ) {
                        $this->_employee[$i]->addSales($sales);
                        return;
                    }
                }
                $new_employee = new Employee($id, $sales);
                array_push($this->_employee, $new_employee);
            }
            
            public function countGoodEmployee() {
                $flg = true;
                for($i = 0; $i < count($this->_employee); $i++) {
                    if( $this->_employee[$i]->getSales() >= 1000000 ) {
                        echo $this->_employee[$i]->getId()."\n";
                        $flg = false;
                    }
                }
                if($flg) echo "NA\n";
            }
        }
        
        Class Employee {
            private $_id;
            private $_sales;
            
            public function __construct($id, $sales) {
                $this->_id = $id;
                $this->_sales = $sales;
            }
            
            public function addSales($sales) {
                $this->_sales += $sales;
            }
            
            public function getId() {
                return $this->_id;
            }  
            
            public function getSales() {
                return $this->_sales;
            }  
            
            public function printEmployee() {
                echo "id: ".$this->_id.", sales: ".$this->_sales."\n";
            }
        }
        ?>