#!/bin/bash

APP=gmall

if [ -n "$2" ] ;then
   do_date=$2
else 
   do_date=`date -d '-1 day' +%F`
fi

load_data(){
    sql=""
    for i in $*; do
        #判断路径是否存在
        hadoop fs -test -e /origin_data/$APP/db/${i:4}/$do_date
        #路径存在方可装载数据
        if [[ $? = 0 ]]; then
            sql=$sql"load data inpath '/origin_data/$APP/db/${i:4}/$do_date' OVERWRITE into table ${APP}.$i partition(dt='$do_date');"
        fi
    done
    hive -e "$sql"
}

case $1 in
    "ods_activity_info_full")
        load_data "ods_activity_info_full"
    ;;
    "ods_activity_rule_full")
        load_data "ods_activity_rule_full"
    ;;
    "ods_base_category1_full")
        load_data "ods_base_category1_full"
    ;;
    "ods_base_category2_full")
        load_data "ods_base_category2_full"
    ;;
    "ods_base_category3_full")
        load_data "ods_base_category3_full"
    ;;
    "ods_base_dic_full")
        load_data "ods_base_dic_full"
    ;;
    "ods_base_province_full")
        load_data "ods_base_province_full"
    ;;
    "ods_base_region_full")
        load_data "ods_base_region_full"
    ;;
    "ods_base_trademark_full")
        load_data "ods_base_trademark_full"
    ;;
    "ods_cart_info_full")
        load_data "ods_cart_info_full"
    ;;
    "ods_coupon_info_full")
        load_data "ods_coupon_info_full"
    ;;
    "ods_sku_attr_value_full")
        load_data "ods_sku_attr_value_full"
    ;;
    "ods_sku_info_full")
        load_data "ods_sku_info_full"
    ;;
    "ods_sku_sale_attr_value_full")
        load_data "ods_sku_sale_attr_value_full"
    ;;
    "ods_spu_info_full")
        load_data "ods_spu_info_full"
    ;;
    "ods_promotion_pos_full")
        load_data "ods_promotion_pos_full"
    ;;
    "ods_promotion_refer_full")
        load_data "ods_promotion_refer_full"
    ;;
"all")
        load_data "ods_activity_info_full" "ods_activity_rule_full" "ods_base_category1_full" "ods_base_category2_full" "ods_base_category3_full" "ods_base_dic_full" "ods_base_province_full" "ods_base_region_full" "ods_base_trademark_full" "ods_cart_info_full" "ods_coupon_info_full" "ods_sku_attr_value_full" "ods_sku_info_full" "ods_sku_sale_attr_value_full" "ods_spu_info_full" "ods_promotion_pos_full" "ods_promotion_refer_full"
    ;;
esac
