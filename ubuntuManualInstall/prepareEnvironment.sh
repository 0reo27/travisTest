# Run everything as root.
sudo -i
# Install GIT
apt-get install git
# Java JDK
# apt-get install libc6-dev-i386 lib32z1 default-jdk
add-apt-repository ppa:openjdk-r/ppa
apt-get update
apt-get install openjdk-8-jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/bin
export PATH=$PATH:/usr/lib/jvm/java-8-openjdk-amd64/bin
update-java-alternatives --set /usr/lib/jvm/java-1.8.0-openjdk-amd64
# This needs to be answered manually.
echo 2 | update-alternatives --config javac
# Android SDK
# Download sdk-tools-linux-3859397
export ANDROID_HOME='/home/linuxvm/sdk/'
export PATH=$ANDROID_HOME/tools/:$PATH
# Make sure everything is executable.
# chmod +x $ANDROID_HOME/**/*
chmod -R 777 $ANDROID_HOME
# SDK Tools
export PATH=$ANDROID_HOME/tools/bin:$PATH
# Update tools.
sdkmanager --update
# NDK
cd "$ANDROID_HOME"
mkdir -p "ndk-bundle"
cd ndk-bundle
curl -L http://dl.google.com/android/ndk/android-ndk-r10e-linux-x86_64.bin -O
chmod u+x android-ndk-r10e-linux-x86_64.bin
./android-ndk-r10e-linux-x86_64.bin > /dev/null
# Set permissions.
chmod -R 777 $ANDROID_HOME
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk-bundle/android-ndk-r10e
export LOCAL_ANDROID_NDK_HOME="$ANDROID_NDK_HOME"
export LOCAL_ANDROID_NDK_HOST_PLATFORM="linux-x86_64"
export PATH=$PATH:${ANDROID_NDK_HOME}
export ANDROID_NDK=$ANDROID_NDK_HOME
# Repo for cloning
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
# Python is required by Magisk
echo | add-apt-repository ppa:deadsnakes/ppa
apt-get update
apt-get upgrade
# Acutal installation
apt-get install -y python3.6
