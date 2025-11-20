provider "aws" {
  region = "ap-south-1"  # Change to your preferred region
}

# Create a CloudWatch Log Group
resource "aws_cloudwatch_log_group" "ec2" {
  name              = "/demo-ec2/demo-ec2-log-group"
  retention_in_days = 7
}

# Create a CloudWatch Metric Alarm
resource "aws_cloudwatch_metric_alarm" "cpu_utilization_alarm" {
  alarm_name          = "high-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "This metric monitors high CPU usage"
  alarm_actions       = []  # Add SNS topic ARN here if needed
  dimensions = {
    InstanceId = "i-0c194a1ba372e85d7"  # Replace with your EC2 instance ID
  }
}