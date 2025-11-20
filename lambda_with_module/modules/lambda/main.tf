
# IAM Role
resource "aws_iam_role" "lambda_role" {
  name = "${var.function_name}-role" #"lambda_execution_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

#IAM Role Inline Policy
resource "aws_iam_role_policy" "lambda_role_policy" {
  name = "${aws_iam_role.lambda_role.name}-inline-policy" #"lambda-describe-delete-snapshots-policy"
  role = aws_iam_role.lambda_role.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:DescribeInstances",
          "ec2:DescribeSnapshots",
          "ec2:DescribeVolumes",
          "ec2:DeleteSnapshot"
        ]
        Resource = "*"
      }
    ]
  })
  depends_on = [ aws_iam_role.lambda_role ]
}

#Attaching Lambda basic policy to IAM Role
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  depends_on = [ aws_iam_role_policy.lambda_role_policy ]
}

# Create a lambda function
# In terraform ${path.module} is the current directory.
resource "aws_lambda_function" "terraform_lambda_func" {
  filename      = var.filename #"${path.module}/python/delete_stale_snapshots.zip"
  function_name = var.function_name #"Delete-Stale-Snapshots"
  role          = var.role
  handler       = var.handler #"delete_stale_snapshots.lambda_handler" #pythonfilename.function_name
  runtime       = var.runtime #"python3.8"
  timeout       = var.timeout #10
  depends_on = [ aws_iam_role_policy_attachment.lambda_basic_execution]
}
