provider "google" {

credentials = file("PATH_TO_THE_CREDENTIALS_FILE")

project = "googleproject"
 region  = "us-central1"
 zone    = "us-central1-c"
}


resource "google_compute_instance" "apache_GCP" {
    name = "apacheserver"
    machine_type = "f1-micro"
    tags = ["http-server"]
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-9"
        }
    }
    metadata_startup_script =  file("PATH_TO_THE_apache2.sh")
scheduling {
        preemptible = true
        automatic_restart = false
    }

    network_interface {
        network ="default"
        access_config {

        }
    }

}
