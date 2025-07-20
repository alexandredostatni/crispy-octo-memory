terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "app" {
  metadata {
    name = "myapp"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "myapp"
      }
    }
    template {
      metadata {
        labels = {
          app = "myapp"
        }
      }
      spec {
        container {
          image = "myapp:latest"
          name  = "myapp"
          port {
            container_port = 5000
          }
          port {
            container_port = 8000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "app" {
  metadata {
    name = "myapp"
  }
  spec {
    selector = {
      app = "myapp"
    }
    port {
      port        = 80
      target_port = 5000
    }
    type = "NodePort"
  }
}