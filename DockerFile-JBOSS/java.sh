if ! echo ${PATH} | grep -q /opt/jdk1.8.0_162/bin
then
	export PATH=/opt/jdk1.8.0_162/bin:${PATH}
fi

if ! echo ${PATH} | grep -q /opt/jdk1.8.0_162/jre/bin
then
	export PATH=/opt/jdk1.8.0_162/jre/bin:${PATH}
fi

export JAVA_HOME=/opt/jdk1.8.0_162
export JRE_HOME=/opt/jdk1.8.0_162/jre
export CLASSPATH=.:/opt/jdk1.8.0_162/lib/tools.jar:/opt/jdk1.8.0_162/jre/lib/rt.jar
