class role::app_server {

  include profile::base
  include profile::consul
  include profile::java
  include profile::tomcat
}
