Code to reproduce CNFE when a custom serializer is not found in transaction's attachment

Steps to reproduce:
1. Run nodes: `./gradlew :workflows-kotlin:dN` and `./workflows-kotlin/build/nodes/runnodes`
2. Run webserver for PartyA: `./gradlew runPartyAServer`
2. From PartyA webserver issue an IOU to any other party
3. Exception should be thrown in `ExampleFlow` on `txBuilder.verify(serviceHub)`

