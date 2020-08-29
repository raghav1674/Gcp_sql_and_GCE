resource "google_sql_database_instance" "mysql" {
    name             = "mysql-prod"
    database_version = "MYSQL_5_7"

    root_password = "password"

    region = "us-east1"


settings{


 tier = "db-f1-micro"

ip_configuration {



        ipv4_enabled= true
        authorized_networks{

            value="0.0.0.0/0"
        }


}

}

}

resource "google_sql_database" "database" {
  name     = "my-database"
  instance = google_sql_database_instance.mysql.name
}
