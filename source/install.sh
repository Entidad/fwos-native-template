#!/bin/bash
SAY=echo
$SAY installing
cd ./prj
npm install --legacy-peer-deps && \
npm install hermes-engine && \
npm installl @credo-ts/react-native && \
npm install @credo-ts/askar@^0.5.2 && \
npm install @hyperledger/aries-askar-react-native@^0.1.0 && \
npm install react-native-fs && \
npm install @credo-ts/indy-vdr@^0.5.2 && \
npm install @hyperledger/indy-vdr-react-native@^0.1.0 && \
npm install @animo-id/react-native-ble-didcomm && \
npm install @credo-ts/transport-ble && \
npm install react-native-argon2 && \
npm install react-native-sensitive-info && \
npm install react-native-device-info && \
npm install react-native-get-random-values && \
npm install react-native-camera 
$SAY installation complete
