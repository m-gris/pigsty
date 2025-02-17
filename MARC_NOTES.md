# working META node

git clone git@github.com:m-gris/pigsty.git

git switch fix-mirrors

git pull # just in case...

./fix_llvm_version.sh
./fix_mirrors.sh

./bootstrap --region europe
./configure --region europe
./install.yml

