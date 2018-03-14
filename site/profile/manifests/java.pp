class profile::java(
  String $version = '8',
  String $java_se = 'jdk',
  Optional[String] $type = 'oracle',
  Optional[String] $version_major = undef,
  Optional[String] $version_minor = undef,
  Optional[String] $url_hash = undef,
) {
  if $type == 'openjdk' {
    class { 'java':
      distribution => $java_se,
      #version => $version,
    }
  }
  elsif $type == 'oracle' { 
    java::oracle {  "${java_se}${version}":
      ensure        => 'present',
      version       => $version,
      version_major => $version_major,
      version_minor => $version_minor,
      java_se       => $java_se,
      url_hash      => $url_hash,
    }
  }
  else {
    notice ("Type ${type} not supported.")
  }
  #if $facts['os']['family'] == 'Debian' {
  #  alternatives { 'java':
  #    path => $java::oracle::,
  #  }
  #}
}
