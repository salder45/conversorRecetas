dataSource {
    pooled = true
    driverClassName = "org.postgresql.Driver"
    username = "admin"
    password = "admin"
    url="jdbc:postgresql:sisconversor"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
    dialect='org.hibernate.dialect.PostgreSQLDialect'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
        }
    }
    test {
        dataSource {
            dbCreate = "update"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
        }
    }
}
