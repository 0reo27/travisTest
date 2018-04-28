# Automated environmental variables in etc profile
echo 
echo export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 >>/etc/profile
echo export JAVA8_HOME=/usr/lib/jvm/java-8-openjdk-amd64 >>/etc/profile
echo export PATH=$PATH:/usr/lib/jvm/java-8-openjdk-amd64/bin >>/etc/profile
echo export ANDROID_HOME='/home/linuxvm/sdk/' >>/etc/profile
echo export PATH=$ANDROID_HOME/tools/:$PATH >>/etc/profile
echo export PATH=$ANDROID_HOME/tools/bin:$PATH >>/etc/profile
echo export ANDROID_NDK_HOME=$ANDROID_HOME/ndk-bundle/android-ndk-r10e >>/etc/profile
echo export LOCAL_ANDROID_NDK_HOME="$ANDROID_NDK_HOME" >>/etc/profile
echo export LOCAL_ANDROID_NDK_HOST_PLATFORM="linux-x86_64" >>/etc/profile
echo export PATH=$PATH:${ANDROID_NDK_HOME} >>/etc/profile
echo export ANDROID_NDK=$ANDROID_NDK_HOME >>/etc/profile
echo export PATH=~/bin:$PATH >>/etc/profile
echo 

# Add the same to .bashrcS of root and user
# Run as sudo and as regular
gedit /etc/profile
gedit ~/.bashrc

# Ready licenses
cd $JAVA_HOME/bin
rm -rf release_signature.jks
sudo keytool -genkey -v -keystore release_signature.jks -keyalg RSA -keysize 2048 -validity 10000 -alias my-alias