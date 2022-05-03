#!/bin/bash

export baseDir=$1
export currentDir=$(pwd)


if [[ $baseDir = '' ]]; then
  read -p 'what base directory do you want to use? ' baseDir

fi

mkdir -p $baseDir/
cd /$currentDir/$baseDir

ddev config  --project-type=typo3 --docroot=public --create-docroot
ddev start
ddev composer create "typo3/cms-base-distribution:^11" << EOF
yes

EOF

echo '# installed with ddev easy cms install by Sam Maas' >> ./README.md
echo '# check it out add https://github.com/halt23/ddev-scripts' >> ./README.md

cd /$currentDir/$baseDir
currentDir=$(pwd)
cd $currentDir/public
touch FIRST_INSTALL

echo 'setup completed'
echo 'good luck with your cms'
