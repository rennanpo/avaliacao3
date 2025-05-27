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
          name  = "todo-app"
          image = var.todo_image

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
