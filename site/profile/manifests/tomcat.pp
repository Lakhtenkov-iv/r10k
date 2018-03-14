class profile::tomcat (
  String $tomcat_version = '8.5.29',
) {
  $tomcat_major_version = $tomcat_version.split('.')[0] 
  notify {"Test" :
      message =>  $tomcat_version.split('.'),
    }
  
  #tomcat::install { '/opt/tomcat8':
  #  source_url => "http://ftp.byfly.by/pub/apache.org/tomcat/tomcat-${tomcat_major_version}/v${tomcat_version}/bin/apache-tomcat-${tomcat_version}.tar.gz"
  #}
  #tomcat::instance { 'current':
  #  catalina_home => '/opt/tomcat8',
  #  catalina_base => '/opt/tomcat8/current',
  #}
  
  
}
