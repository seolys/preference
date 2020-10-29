alias g="git"
alias g-="git checkout -"

#######################################################################################################################
# NVM으로 node 버전세팅
# 특정node버전 설치: nvm install v버전명
# ex) nvm install v14.13
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm use 14.13.0
#######################################################################################################################
# Java Version Switch
# Switch to different Java version
jhome_usage() {
    echo "jhome - switch to different JDK version"
    echo "Usage: jhome [-h] [-v VERSION]"
    echo
    echo " -h     : display usage"
        echo " -v     : specific JDK version to switch"
    echo
    echo "Examples: "
    echo "># jhome -v 1.8 : switches to JDK8"
    echo "># jhome -v 11  : switches to JDK"
    echo "># jhome        : display all installed JDK and display current JDK"
}
jhome () {
    if [ "$1" = "-h" ] ; then
        jhome_usage
    fi
    if [ "$#" -eq 0 ] ; then
        /usr/libexec/java_home -V
    fi

    if [ "$#" -eq 2 ] && [ "$1" = "-v" ] ; then
        export JAVA_HOME=`/usr/libexec/java_home $@`
        echo "Setting JAVA_HOME:" $JAVA_HOME
        echo
        echo "Added JAVA_HOME/bin to PATH"
        PATH=$PATH:$JAVA_HOME/bin
        echo $PATH
        echo
        java -version
    fi
}
#######################################################################################################################