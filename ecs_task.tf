resource "aws_iam_role" "ecs_task_execution_role" {
  name        = "ecsTaskExecutionRole"
  description = "Allows ECS tasks to call AWS services on your behalf."

  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Principal = {
            Service = "ecs-tasks.amazonaws.com"
          }
          Effect = "Allow"
        },
      ]
      Version = "2012-10-17"
    }
  )
}

resource "aws_ecs_task_definition" "this" {
  container_definitions = jsonencode([{
    environment : [
      {
        name  = "NODE_ENV",
        value = "production"
      }
    ],
    essential = true,
    image     = local.container_image,
    name      = local.container_name,
    portMappings = [
      { containerPort = local.container_port }
    ],
  }])
  cpu                      = 256
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  family                   = "family-of-${local.cluster_name}-tasks"
  memory                   = 512
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  tags = local.tags
}
