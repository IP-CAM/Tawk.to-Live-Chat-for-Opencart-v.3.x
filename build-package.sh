#!/bin/sh

release_version=$(jq -r '.version' ./composer.json);

echo "Creating temporary directory"
rm -rf ./tmp/admin;
rm -rf ./tmp/catalog;
rm -rf ./tmp/upload;
mkdir -p ./tmp/upload;
mkdir -p ./tmp/admin/controller/extension/module/tawkto;
mkdir -p ./tmp/catalog/controller/extension/module/tawkto;


echo "Copying files"
cp README.md ./tmp;
cp -r admin ./tmp;
cp -r catalog ./tmp;
cp -r upgrades ./tmp/admin/controller/extension/module/tawkto;
cp -r vendor ./tmp/admin/controller/extension/module/tawkto;
cp -r vendor ./tmp/catalog/controller/extension/module/tawkto;
cp -r ./tmp/admin ./tmp/upload;
cp -r ./tmp/catalog ./tmp/upload;

echo "Creating opencart 3 zip files"
$(cd ./tmp && zip -9 -rq tawk-oc3-$release_version.ocmod.zip upload README.md);
$(cd ./tmp && zip -9 -rq tawk-oc3-$release_version.zip admin catalog README.md);

echo "Done!"
