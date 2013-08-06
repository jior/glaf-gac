1）将glaf-base目录下的glaf-base.jar复制到glaf-web\WebContent\WEB-INF\lib目录下
   将glaf-framework目录下的glaf-framework.jar复制到glaf-web\WebContent\WEB-INF\lib目录下

2) 修改server\conf\context.xml,修改数据库，用户名及密码
JNDI名称：jdbc/glafdb,全名:java:comp/env/jdbc/glafdb

<Resource name="jdbc/glafdb"
          auth="Container"
          type="javax.sql.DataSource"
          factory="org.apache.tomcat.jdbc.pool.DataSourceFactory"
          testWhileIdle="true"
          testOnBorrow="true"
          testOnReturn="false"
          validationQuery="SELECT 1"
          validationInterval="30000"
          timeBetweenEvictionRunsMillis="30000"
          maxActive="100"
          minIdle="10"
          maxWait="10000"
          initialSize="10"
          removeAbandonedTimeout="60"
          removeAbandoned="true"
          logAbandoned="true"
          minEvictableIdleTimeMillis="30000"
          jmxEnabled="false"
          jdbcInterceptors="org.apache.tomcat.jdbc.pool.interceptor.ConnectionState;
            org.apache.tomcat.jdbc.pool.interceptor.StatementFinalizer"
          username="sa"
          password="654321"
          driverClassName="com.microsoft.sqlserver.jdbc.SQLServerDriver"
          url="jdbc:sqlserver://127.0.0.1:1433;databaseName=glafdb"/>
