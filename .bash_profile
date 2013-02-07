export PATH=/usr/local/share/python:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/opt/ruby/bin:$PATH
export PATH=/etc/pear/share/pear:/etc/pear/bin:/usr/local/lib/node_modules:$PATH
export PATH=~/EverTrue/dev/devops/evertools/prebuilt/evertools-1.0-SNAPSHOT/bin:$PATH
export PATH=/usr/local/scala/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH


export ET_SCRIPT_PATH=~/EverTrue/dev/core/script:~/EverTrue/dev/core/include
export ET_TEMPLATE_PATH=~/EverTrue/dev/core/nodescripts/templates
export ET_INCLUDE_PATH_1_0=~/EverTrue/dev/core/include

# export GIT_EDITOR="mate --name 'Git Commit Message' -w -l 1"

# Setup Amazon EC2 Command-Line Tools
export EC2_HOME=~/.ec2
export PATH=$EC2_HOME/bin:$PATH
export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home