<?php
        for($loop_cnt = 0; $loop_cnt < 5; $loop_cnt++)
        {

                $data_set = array();
                $data = array();

                // 変換表数設定
                $input_n = trim(fgets(STDIN));
                if( 0 == $input_n)
                {
                        break;
                }

                // 変換表設定
                for($loop_n = 0; $loop_n < $input_n; $loop_n++)
                {
                        $input_conv = explode( " " , trim(fgets(STDIN)) );

                        $data_set = $data_set + array( $input_conv[0] => $input_conv[1]) ;
                }

                // データ数設定
                $input_m = trim(fgets(STDIN));

                // データ設定
                for($loop_m = 0; $loop_m < $input_m; $loop_m++)
                {
                        $input_data = trim(fgets(STDIN));
                        $data[$loop_m] = $input_data;
                }

                // 変換後出力
                $work = [];
                for($loop_m = 0; $loop_m < $input_m; $loop_m++)
                {
                        if( isset( $data_set[$data[$loop_m]] ) )

                        {
                                $work[] = $data_set[ $data[$loop_m] ];
                        }
                        else
                        {
                                $work[] = $data[$loop_m];
                        }
                }
                echo implode('' , $work);
                echo "\n";
        };
?>
