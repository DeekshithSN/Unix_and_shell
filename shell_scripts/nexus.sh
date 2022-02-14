#! /bin/sh


help(){
    echo "the way you exected script is wrong "
    echo "the script options are count, hosted and proxy"
    echo "example to run this script sh nexus-report.sh count"
    exit 137
}

if [ "$1" = "count"  ]
then
curl -s -X  'GET' 'http://nexus-ip:8081/service/rest/v1/repositories' -H 'accept: application/json' | jq .[].name | wc -l
elif  [ "$1" = "hosted" ]
then
    echo "Repo Name"
    curl -s -X  'GET' 'http://nexus-ip:8081/service/rest/v1/repositories' -H 'accept: application/json'  | jq ' .[] | select ( .type == "hosted" ) | .name ' | sed 's/"//g'
elif [ "$1" = "proxy" ]
then
    echo "Repo Name, Remote URL"
    curl -s -X  'GET' 'http://nexus-ip:8081/service/rest/v1/repositories' -H 'accept: application/json' | jq ' .[] | select ( .type == "proxy" ) | .name + "," + .attributes.proxy.remoteUrl ' | sed 's/"//g'
elif [[ "$1" = "admin" && "$2" = "mrc" ]]
then
 echo "please enter maven repo name"
 read repo
 sed -i "s/REPONAME/$repo/g" maven.json
 curl -s -H "Content-Type: application/json" -u admin:admin -d @maven.json 'http://nexus-ip:8081/service/rest/v1/repositories/maven/hosted'
    if [ $? -eq 0 ]
    then 
        echo "the repo creation succesful "
    else
        echo "repo creation failed"
    fi
 sed -i "s/$repo/REPONAME/g" maven.json
else
 help  
fi
