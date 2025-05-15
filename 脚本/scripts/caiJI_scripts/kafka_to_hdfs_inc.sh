#!/bin/bash

case $1 in
"start"){
    echo " --------启动 hadoop102 采集flume-------"
    ssh hadoop102 "nohup /opt/module/apache-flume-1.10.1-bin/bin/flume-ng agent -n a1 -c /opt/module/apache-flume-1.10.1-bin/conf/ -f /opt/module/apache-flume-1.10.1-bin/job/kafkaToHdfsInc.conf >/dev/null 2>&1 &"
};; 
"stop"){
    echo " --------停止 hadoop102 采集flume-------"
    ssh hadoop102 "ps -ef | grep file_to_kafka | grep -v grep |awk  '{print \$2}' | xargs -n1 kill -9 "
};;
esac
