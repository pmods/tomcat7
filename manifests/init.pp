
class tomcat7 (
    $svrconfsrc = "/root/etc/tomcat/server.xml"
){

    include pkgng

    $tomcat_home = '/usr/local/apache-tomcat-7.0'

    package{ 'tomcat7':
        ensure => installed,
    }

    file { 'serverxml':
        path    => "$tomcat_home/conf/server.xml",
        ensure  => file,
        owner   => 'www',
        group   => 'www',
        source  => $svrconfsrc,
        require => Package['tomcat7'],
        notify  => Service['tomcat7']
    }

    file { 'jenkappdir':
        path    => "$tomcat_home/jenkins",
        ensure  => directory,
        owner   => 'www',
        group   => 'www',
        require => Package['tomcat7'],
        notify  => Service['nginx']
    }

    service{ 'tomcat7':
        ensure => running,
        enable => true,
        require => [
            File['serverxml'],
            File['jenkappdir']
        ]
    }
}
