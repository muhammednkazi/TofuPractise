provider "aws" {
  region = "ap-south-1"
}

#To zip python code
/*
data "archive_file" "zip_the_python_code" {
  type        = "zip"
  source_dir  = "${path.module}/python/"
  output_path = "${path.module}/python/delete_stale_snapshots.zip"
}
*/


module "lambda_function" {
  source        = "./modules/lambda"
  filename      = "${path.module}/python_script.zip"
  function_name = "delete_ebs_snapshots"
  handler       = "delete_stale_snapshots.lambda_handler" #pythonfilename.function_name
  role          = module.lambda_function.role_name
  runtime       = "python3.10"
}