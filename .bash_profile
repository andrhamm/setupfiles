export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
export PATH=$PATH:/etc/pear/bin:/etc/pear/share/pear:/etc/pear/bin
export PATH=$PATH:~/EverTrue/dev/devops/evertools/prebuilt/evertools-1.0-SNAPSHOT/bin
export PATH=$PATH:/usr/local/scala/bin
export PATH=$PATH:/usr/local/mysql/bin


export ET_SCRIPT_PATH=~/EverTrue/dev/core/script:~/EverTrue/dev/core/include
export ET_INCLUDE_PATH_1_0=~/EverTrue/dev/core/include

export GIT_EDITOR="mate --name 'Git Commit Message' -w -l 1"
export EDITOR="/usr/local/bin/mate -w"

# Setup Amazon EC2 Command-Line Tools
export EC2_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home