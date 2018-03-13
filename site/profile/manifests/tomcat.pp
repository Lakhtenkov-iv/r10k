class profile::tomcat (

) {
  tomcat::install { '/opt/tomcat8':
    source_url => 'http://ftp.byfly.by/pub/apache.org/tomcat/tomcat-8/v8.5.29/bin/apache-tomcat-8.5.29.tar.gz'
  }
  tomcat::instance { 'current':
    catalina_home => '/opt/tomcat8',
    catalina_base => '/opt/tomcat8/current',
  }
  
}
