
resource "aws_ecs_cluster" "this" {
  name = var.cluster_name
}


resource "aws_ecs_task_definition" "my_task" {
  family                   = "${var.cluster_name}-tdf"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name      = var.image_name #"my-container"
      image     = var.image_uri #"nginx:latest"
      essential = true
      portMappings = [
        {
          containerPort = var.container_port #80
          hostPort      = var.host_port #80
          protocol      = "tcp"
        }
      ]
    }
  ])
}
