1����glaf-baseĿ¼�µ�glaf-base.jar���Ƶ�glaf-web\WebContent\WEB-INF\libĿ¼��
   ��glaf-frameworkĿ¼�µ�glaf-framework.jar���Ƶ�glaf-web\WebContent\WEB-INF\libĿ¼��

2) �޸�server\conf\context.xml,�޸����ݿ⣬�û���������
JNDI���ƣ�jdbc/glafdb,ȫ��:java:comp/env/jdbc/glafdb

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
