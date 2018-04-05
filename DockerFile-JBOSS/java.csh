if ( ${path} !~ */opt/jdk1.8.0_162/bin* ) then
	set path = ( /opt/jdk1.8.0_162/bin $path )
endif

if ( ${path} !~ */opt/jdk1.8.0_162/jre/bin* ) then
	set path = ( */opt/jdk1.8.0_162/jre/bin* $path )
endif

setenv JAVA_HOME optjdk1.8.0_162
setenv JRE_HOME optjdk1.8.0_162jre
setenv CLASSPATH .optjdk1.8.0_162libtools.jaroptjdk1.8.0_162jrelibrt.jar