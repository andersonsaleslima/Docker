# STANDALONE.XML

1- Alterado porta 8080 para 8082.

2- Adicionada a seguinte linha no final do standalone.xml dentro da tag "drivers".

	<driver name="oracle" module="com.oracle">
		<driver-class>oracle.jdbc.driver.OracleDriver</driver-class>
	</driver>

3- Adicionada uma definição de fonte de dados dentro da tag "datasources".

	<datasource jndi-name="java:/[NAME]" pool-name="OracleDS" enabled="true">
		<connection-url>jdbc:oracle:thin:@[HOST_NAME]:1521:[SID]</connection-url>
		<driver>oracle[has to match the driver name]</driver>
		<pool>
			<min-pool-size>1</min-pool-size>
			<max-pool-size>5</max-pool-size>
			<prefill>true</prefill>
		</pool>
		<security>
			<user-name>[USER]</user-name>
			<password>[PWD]</password>
		</security>
	</datasource>
