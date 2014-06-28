include pkgng

class tomcat7 {

    package{ 'tomcat7':
        ensure => installed,
    }

    service{ 'tomcat7':
        ensure => running,
        enable => true
    }
}
