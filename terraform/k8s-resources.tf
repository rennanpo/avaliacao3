resource "kubernetes_deployment" "todo-app" {
  metadata {
    name = "todo-deployment"
    labels = {
      app = "todo-app"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "todo-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "todo-app"
        }
      }

      spec {
        container {
          image = "325583868777.dkr.ecr.eu-central-1.amazonaws.com/rennanpc1/todo-app:1.0.1"
          name  = "todo-app"

          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "todo" {
  metadata {
    name = "todo-service"
  }

  spec {
    selector = {
      app = kubernetes_deployment.todo-app.metadata[0].labels.app
    }

    port {
      port        = 80
      target_port = 3000
    }

    type = "LoadBalancer"
  }
}
