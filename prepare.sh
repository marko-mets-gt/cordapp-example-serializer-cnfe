#!/usr/bin/env bash


./gradlew -Dsigning.enabled=false clean workflows-kotlin:dN

nodes=("Notary" "PartyA" "PartyB")
rootDir=~/code/samples/cordapp-example/
for node in ${nodes[@]}
do
    cp confs/${node}/node.conf workflows-kotlin/build/nodes/${node}/
    rm -rf workflows-kotlin/build/nodes/${node}/additional-node-infos
    rm -rf workflows-kotlin/build/nodes/${node}/certificates
    rm workflows-kotlin/build/nodes/${node}/network-parameters
    rm workflows-kotlin/build/nodes/${node}/nodeinfo-*

    cd "workflows-kotlin/build/nodes/${node}/"
    java -jar corda.jar --initial-registration --network-root-truststore ../../../../../../marine-insurance-ledger/certificates/truststore.jks --network-root-truststore-password trustpass
    cd "$rootDir"
done

#for node in ${nodes[@]}
#do
#     cd "workflows-kotlin/build/nodes/${node}/"
#     (xterm -title "$node" -e "java -jar corda.jar") &
#     cd "$rootDir"
#done