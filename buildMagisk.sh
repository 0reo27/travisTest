# Build Magisk
cd $HOME
git config --global user.name "John Appleseed"
git config --global user.email "email@example.com"
rm -rf Magisk
repo init -u https://github.com/0reo27/travisTest --depth=1
repo sync
cp -f release_signature.jks $HOME/Magisk
cd $HOME/Magisk
time python3.6 build.py --release all 16.4 1640 > result.txt