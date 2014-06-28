include pkgng

class tomcat7 {

    package{ 'tomcat7':
        ensure => installed,
    }
}
