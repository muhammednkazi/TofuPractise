provider "aws" {
  region = "ap-south-1"
}

# IAM Role
resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"

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
  name = "lambda-describe-delete-snapshots-policy"
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
}

#Attaching Lambda basic policy to IAM Role
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}


#To zip python code
data "archive_file" "zip_the_python_code" {
  type        = "zip"
  source_dir  = "${path.module}/python/"
  output_path = "${path.module}/python/delete_stale_sanspshots.zip"
}

# Create a lambda function
# In terraform ${path.module} is the current directory.
resource "aws_lambda_function" "terraform_lambda_func" {
  filename      = "${path.module}/python/delete_stale_sanspshots.zip"
  function_name = "Delete-Stale-Snapshots"
  role          = aws_iam_role.lambda_role.arn
  handler       = "delete_stale_snapshots.lambda_handler" #pythonfilename.function_name
  runtime       = "python3.8"
  timeout       = 10
  depends_on    = [aws_iam_role_policy_attachment.lambda_basic_execution]
}

output "teraform_aws_role_output" {
  value = aws_iam_role.lambda_role.name
}

output "teraform_aws_role_arn_output" {
  value = aws_iam_role.lambda_role.arn
}
