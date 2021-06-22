#!/bin/bash

help(){
echo "to restart pods of particular namespace"
echo "Ex - sh restart.sh ns <namespace_name>"
echo 
echo "to restart pods in all the namespace"
echo "Ex - sh restart.sh all"
echo 
echo "to restart pods in multiple ns( send ns in comma seperated string )"
echo "Ex - sh restart.sh nsm <ns1>,<ns2>"
echo 
echo "to restart pods in all ns except few ns"
echo "Ex - sh restart.sh nse <ns1>,<ns2>"
}

if [ $# -eq 0 ]
  then 
    help
elif [ "$1" = "help" ]
  then
    help
elif [ "$1" = "all" ]
  then 
   list_of_namespace=$(kubectl get ns | tail -n +2 | awk '{print $1}')
   for ns in $list_of_namespace
   do
    list_of_pod_ns=$(kubectl get po -n $ns | tail -n +2 | awk '{print $1}')
    for pod in $list_of_pod_ns
    do
      echo $pod is restarting
    done 
   done
elif [[ "$1" = "ns" && $# -eq 2 ]]
  then
    list_of_pod=$(kubectl get po -n $2 | tail -n +2 | awk '{print $1}')
    for pod in $list_of_pod
    do
      echo "restarted $pod"
    done
elif [[ "$1" = "nsm" && $# -eq 2 ]]
  then 
  list_of_ns=$(echo $2 | sed "s/,/\n/g")
  for ns in $list_of_ns
  do
   list_of_pod_ns=$(kubectl get po -n $ns | tail -n +2 | awk '{print $1}')
    for pod in $list_of_pod_ns
    do
      echo $pod is restarting
    done
  done
elif [[ "$1" = "nse" && $# -eq 2 ]]
  then 
  list_of_namespace=$(kubectl get ns | tail -n +2 | awk '{print $1}')
  nsr_list=$(echo $2 | sed "s/,/\n/g")
  echo "$nsr_list"
  final_ns=""
  for nsr in $nsr_list
  do
    final_ns=$(echo $list_of_namespace | sed 's/${nsr}//g')
      echo "$final_ns"
  done
  echo "$final_ns"
else
  echo "there might be problem with parameters passed, please re-run script with valid params"
fi
